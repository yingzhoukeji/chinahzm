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
$check=$db->table('order')->where(array('openid'=>$_SESSION["openid"],'bargainid'=>$bargain_id))->find();
if($check){
	echo buildErrPage("你已经购买过该产品了，请到购物车查看");
	exit();
}
$data["name"]=$_POST['name'];
$data["phone"]=$_POST['phone'];
$data["company"]=$_POST['company'];
$data["bargainid"]=$_SESSION["bargain_id"];
$data["openid"]=$_SESSION["openid"];
$data["createtime"]=date('Y-m-d H:m:s', time());
$data["name"]=$_POST["name"];
$data["phone"]=$_POST["phone"];
$data["company"]=$_POST["company"];
$data["currprice"]=$_POST["currprice"];
$data["deposit"]=$_POST["deposit"];
$result=$db->table('order')->data($data)->insert();
if($result){
	Log::DEBUG("添加到购物车成功！:");
	$_SESSION["orderid"]=$result;
	$_SESSION["deposit"]=$_POST["deposit"];
	echo buildSuccessPage('添加到购物车成功！你需要支付'.$_POST["deposit"].'元订金,页面正在跳转...','pay.php');
}else{
	echo buildErrPage("添加到购物车失败！");
}

?>
