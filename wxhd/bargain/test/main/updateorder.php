<?php
require_once("../../include/config.db.php");
require_once("../../include/db.class.php");
require_once("../../include/common.php");
require_once("../../include/log.php");
session_start();
header('Content-type:text/json;charset=utf-8');
$logHandler= new CLogFileHandler("../../logs/".date('Y-m-d').'.log');
$log = Log::Init($logHandler, 15);
$db=new db();
$action=$_POST['action'];
$openId=$_SESSION["openid"];
$bargainId=$_SESSION["bargain_id"];
if($action=="updateNonceStr"){
	$nonceStr=$_POST['nonceStr'];
	$prepay_id=$_POST['prepay_id'];
	$paySign=$_POST['paySign'];
	$data['nonceStr']=$nonceStr;
	$data['prepay_id']=$prepay_id;
	$data['paySign']=$paySign;
	$where['openid']=$openId;
	$where['bargainid']=$bargainId;
	$result=$db->table('order')->data($data)->where($where)->update();
	if($result){
		$result1=$db->table('order')->where($where)->find();
		Log::DEBUG("updateOrder_transaction_id->".$result['transaction_id']);
		if(!empty($result1['transaction_id'])){
			echo json_encode(array("status"=>2,"msg"=>"你已经支付过改订单了，不需要重复支付了"));
			exit();
		}else{
			echo json_encode(array("status"=>1,"msg"=>"更新成功"));
			exit();
		}
		
	}else{
		echo json_encode(array("status"=>0,"msg"=>"更新失败"));
		exit();
	}
}else if($action=="updatePay"){
	$where1['openid']=$openId;
	$where1['bargainid']=$bargainId;
	$data1['ispay']=1;
	$result1=$db->table('order')->data($data1)->where($where1)->update();
	if($result1){
		echo json_encode(array("status"=>1,"msg"=>"更新成功"));
		exit();
	}else{
		echo json_encode(array("status"=>0,"msg"=>"更新失败"));
		exit();
	}
}



?>