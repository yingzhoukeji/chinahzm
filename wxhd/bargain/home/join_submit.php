<?php
require_once("../include/config.db.php");
require_once("../include/db.class.php");
require_once("../include/common.php");
require_once("../include/log.php");
header("Content-Type:text/html;charset=utf-8");
error_reporting(0);
session_start();
$logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
$log = Log::Init($logHandler, 15);
//是否参加报名
$isjoin=false;
$bargain_id=$_SESSION["bargain_id"];
$from=$_SESSION["from"];
if(!isset($_SESSION["openid"])){
	echo '<script>window.location.href="login.php"</script>';
	exit();
}
$db=new db();
$checkjoindata["openid"]=$_SESSION["openid"];
$checkjoindata["bargainid"]=$_SESSION["bargain_id"];
$checkjoin=$db->table('join')->where($checkjoindata)->find();
//已经参加报名
if($checkjoin){
	echo buildErrPage("你已经参加了本次砍价活动,不能重复报名！");
}else{
	$data["name"]=$_POST['name'];
	$data["phone"]=$_POST['phone'];
	$data["company"]=$_POST['company'];
	$data["bargainid"]=$_SESSION["bargain_id"];
	$data["openid"]=$_SESSION["openid"];
	$data["creattime"]=date('Y-m-d H:m:s', time());
	$bargain=$db->table('bargain')->where(array('id'=>(int)$_SESSION["bargain_id"]))->find();
	Log::DEBUG("开始-查询价格-----------------------------------开始");
	Log::DEBUG("openid->".$_SESSION["openid"]);
	Log::DEBUG("bargainid->".$_SESSION["bargain_id"]);
	Log::DEBUG("price->".$bargain['price']);
	Log::DEBUG("结束-查询价格-----------------------------------结束");
	$data['price']=$bargain['price'];
	$result=$db->table('join')->data($data)->insert();
	if($result){
		Log::DEBUG("报名成功！:");
		echo buildSuccessPage('报名成功,请不要离开,页面正在跳转...','index.php?id='.$_SESSION["bargain_id"].'&userfrom='.$_SESSION["openid"].'&param=xxx');
	}else{
		echo buildErrPage("报名失败！");
	}
}

?>
