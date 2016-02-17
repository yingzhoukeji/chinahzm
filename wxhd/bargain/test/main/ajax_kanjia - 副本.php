<?php
require_once("../include/config.db.php");
require_once("../include/db.class.php");
require_once("rand.php");
session_start();
header('Content-type:text/json;charset=utf-8'); 

$id=$_POST['id'];
if(!isset($_SESSION["openid"])){
	echo json_encode(array("status"=>0,"msg"=>"对不起登陆超时"));
	exit();
}
//$openid=$_SESSION["openid"];
$joinid=$_POST['joinid'];
$friendopenid=$_SESSION["openid"];
$nickname=$_SESSION["nickname"];
$db=new db();
$check=$db->table('join')->where(array('joinid'=>$joinid,'friendopenid'=>$friendopenid))->find();
if($check){
	echo json_encode(array("status"=>0,"msg"=>"对不起你已经帮他砍过了"));
	exit();
}else{
	echo json_encode(array("status"=>0,"msg"=>"对不起你已经帮他砍过了1"));
	exit();
}
//获取报名
$join=$db->table('join')->where(array('id'=>$joinid))->find();
if(!$bargain){
	echo json_encode(array("status"=>0,"msg"=>"你的亲友未报名"));
	exit();
}
//计算概率
$bargain=$db->table('bargain')->where(array('id'=>$id))->find();
$checkprice1=$bargain['price']-$join['price'];
if($checkprice1>$bargain['price1']){
	echo json_encode(array("status"=>0,"msg"=>"已经砍到最低价了"));
	exit();
}
$v1=$bargain['price1']*0.5;
$v2=$bargain['price1']*0.2;
$v3=$bargain['price1']*0.195;
$v4=$bargain['price1']*0.1;
$v5=$bargain['price1']*0.005;
$prize_arr = array(
    '0' => array('id'=>1,'prize'=>$bargain['scale1'],'v'=>$v1),
    '1' => array('id'=>2,'prize'=>$bargain['scale2'],'v'=>$v2),
    '2' => array('id'=>3,'prize'=>$bargain['scale3'],'v'=>$v3),
    '3' => array('id'=>4,'prize'=>$bargain['scale4'],'v'=>$v4),
    '4' => array('id'=>5,'prize'=>$bargain['scale5'],'v'=>$v5)
);
$rand=get_bargain($prize_arr);
$checkprice2=$bargain['price']-$join['price']+(int)$rand;
if($checkprice2>$bargain['price1']){
	echo json_encode(array("status"=>0,"msg"=>"已经砍到最低价了"));
	exit();
}
$finalprice=$join['price']-(int)$rand;
$join=$db->table('join')>data(array("price"=>$finalprice))->where(array('id'=>$joinid))->update();
$frienddata['joinid']=$joinid;
$frienddata['friendopenid']=$openid;
$frienddata['total']=$join['price'];
$frienddata['price']=$rand;
$frienddata['after']=$finalprice;
$frienddata['nickname']=$nickname;
$db->table('join')>data($frienddata)->insert();
echo json_encode(array("status"=>1,"rand"=>$rand));
?>