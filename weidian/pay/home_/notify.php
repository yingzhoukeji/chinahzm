<?php
ini_set('date.timezone','Asia/Shanghai');
error_reporting(E_ERROR);
require_once "../lib/WxPay.Api.php";
require_once '../lib/WxPay.Notify.php';
require_once("../../include/log.php");
require_once("../../include/config.db.php");
require_once("../../include/db.class.php");

//初始化日志
$logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'notify.log');
$log = Log::Init($logHandler, 15);

class PayNotifyCallBack extends WxPayNotify
{
	//查询订单
	public function Queryorder($transaction_id)
	{
		$input = new WxPayOrderQuery();
		$input->SetTransaction_id($transaction_id);
		$result = WxPayApi::orderQuery($input);
		Log::DEBUG("query:" . json_encode($result));
		if(array_key_exists("return_code", $result)
			&& array_key_exists("result_code", $result)
			&& $result["return_code"] == "SUCCESS"
			&& $result["result_code"] == "SUCCESS")
		{
			return true;
		}
		return false;
	}
	
	//重写回调处理函数
	public function NotifyProcess($data, &$msg)
	{
		//Log::DEBUG("call back test:" . json_encode($data));
		$notfiyOutput = array();
		
		if(!array_key_exists("transaction_id", $data)){
			$msg = "输入参数不正确";
			return false;
		}
		//查询订单，判断订单真实性
		if(!$this->Queryorder($data["transaction_id"])){
			$msg = "订单查询失败";
			return false;
		}else{
			//$rs= $conn->query('UPDATE pa_marathon SET ispay =1,ordercode="'.$orderid.'",openid="'.$openid.'" WHERE id ='.$id);
			Log::DEBUG("call back test:订单查询成功");
			Log::DEBUG(json_encode($data));
			$db=new db();
			$openid=$data['openid'];
			$mydata['transaction_id']=$data['transaction_id'];
			//$mydata['out_trade_no']=$data['out_trade_no'];
			$mydata['total_fee']=$data['total_fee'];
			$mydata['openid']=$openid;
			//$where["openid"]=$openid;
			$where["out_trade_no"]=$data['out_trade_no'];
			$check=$db->table("recharge")->where(array('transaction_id'=>$data['transaction_id']))->find();
			$recharge=$db->table("recharge")->where(array('out_trade_no'=>$data['out_trade_no']))->find();
			$uid=$recharge['uid'];
			if(!$check){
				$user=$db->table('user')->where(array('id'=>$uid))->find();
				$money=intval($user['money']);
				$totalmoney=$money+intval($data['total_fee']);
				$mydata['totalmoney']=$totalmoney;
				$result=$db->table("recharge")->data($mydata)->where($where)->update();
				$result1=$db->table('user')->data(array('money'=>$totalmoney))->where(array('id'=>$uid))->update();
				if($result){
					Log::DEBUG($uid."-->成功充值".$data['total_fee']."分");
				}else{
					Log::DEBUG($uid."-->充值失败，请联系他");
				}
				if($result1){
					Log::DEBUG($uid."-->成功累加充值".$data['total_fee']."分");
				}else{
					Log::DEBUG($uid."-->充值累加失败，请手动入库");
				}
			}else{
				Log::DEBUG($uid."-->已经入库，无需再入库");
			}
			
		}
		return true;
	}
}

Log::DEBUG("begin notify");
$notify = new PayNotifyCallBack();
$notify->Handle(false);
