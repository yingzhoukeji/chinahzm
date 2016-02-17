<?php
//微信接口
class WxhdAction extends Action {
    public function index(){
    	$this->display("check1");
    }
	public function hdlist(){
		$m=M("wxhd");
		$data['status']=0;
		$result=$m->where($data)->select();
		if($result){
			$this->ajaxReturn($result,'jsonp');
		}else{
			$this->ajaxReturn(0,'jsonp');
		}
	}
	public function detail(){
		$id=$_GET['id'];
		$m=M("wxhd");
		$data['id']=$id;
		$result=$m->where($data)->find();
		if($result){
			$this->ajaxReturn($result,'jsonp');
		}else{
			$this->ajaxReturn(0,'jsonp');
		}
	}
	public function addscore(){
		import('ORG.Util.Date');
		$id=$_GET['id'];
		$from=$_GET['from'];
		$m=M("member");
		$wxhd=M("wxhd");
		$data['id']=$id;
		$hd=$wxhd->field('endtime,srcoe,status')->where($data)->find();
		if($hd['status']==0){
			$now=strtotime(new Date());
			if($now<$hd['endtime']){
				$mdata['openid']=$from;
				$member=$m->where($mdata)->find();
				if($member){
					$srcoe=$member['srcoe']+$hd['srcoe'];
					$sdata['srcoe']=$srcoe;
					if($m->where('uid='.$member['uid'])->save($sdata)){
						$this->ajaxReturn(0,'jsonp');//活动已经过期
					}
				}else{
					$this->ajaxReturn(3,'jsonp');//不存在改用户
				}
			}else{
				$this->ajaxReturn(2,'jsonp');//活动已经过期
			}
		}else{
			$this->ajaxReturn(1,'jsonp');//未启用
		}
		
	}
	public function getscore(){
		$openid=$_GET['openid'];
		$m=M("member");
		$mdata['openid']=$openid;
		$member=$m->field('srcoe')->where($mdata)->find();
		if($member){
			$this->ajaxReturn($member,'jsonp');
		}else{
			$this->ajaxReturn(0,'jsonp');
		}
	}
	public function userlist(){
		$m=M("member");
		$page=0;
		$pagesize=10;
		if(!empty($_GET["page"])){
			$page=intval($_GET["page"]);
		}
		if(!empty($_GET['pagesize'])){
			$pagesize=intval($_GET['pagesize']);
		}
		$result=$m->field('srcoe,headimgurl,nickname')->order("srcoe desc")->limit($page,$pagesize)->select();
		if($result){
			$this->ajaxReturn($result,'jsonp');
		}else{
			$this->ajaxReturn(0,'jsonp');
		}
		//echo $m->getLastSql();
	}
	public function apply(){
		$m=M("apply");
		$uid=$_POST["uid"];
		$hdid=$_POST["hdid"];
		$name=$_POST["name"];
		$phone=$_POST["phone"];
		$adress=$_POST["adress"];
		if(empty($name)){
			$arr=array(
				status=>0,
				msg=>"请填写真实姓名"+$phone
			);
			$this->ajaxReturn($arr,'json');
		}
		if(empty($phone)&&strlen($phone)!=11){
			$arr=array(
				status=>0,
				msg=>"请填写正确的手机号码"
			);
			$this->ajaxReturn($arr,'json');
		}
		if(empty($adress)){
			$arr=array(
				status=>0,
				msg=>"请填写联系地址"+$adress
			);
			$this->ajaxReturn($arr,'json');
		}
		$check=$m->where(array("uid"=>$uid,"hdid"=>$hdid))->find();
		if(!$check){
			$m_member=M("member");
			$m_wxhd=M("wxhd");
			$member=$m_member->find(intval($uid));
			$wxhd=$m_wxhd->find(intval($hdid));
			if($member["srcoe"]>=$wxhd["limit"]){
				$_POST["createtime"]=date("Y-m-d H:i:s" ,time());
				if($m->add($_POST)){
						
					$member["srcoe"]=$member["srcoe"]-$wxhd["limit"];
					
					$m_member->save($member);
					$arr=array(
						status=>1,
						msg=>"申请成功！"
					);
					$this->ajaxReturn($arr,'json');
				}else{
					$arr=array(
						status=>1,
						msg=>"申请失败！"
					);
					$this->ajaxReturn($arr,'json');
				}
			}else{
				$arr=array(
					status=>0,
					msg=>"你的积分不够"
				);
				$this->ajaxReturn($arr,'json');
			}
		}else{
			$arr=array(
				status=>0,
				msg=>"你已经申请过了！"
			);
			$this->ajaxReturn($arr,'json');
		}
	}
	
}