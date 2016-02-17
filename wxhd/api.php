<?php
error_reporting(E_ALL & ~E_WARNING & ~E_NOTICE );
header('Content-Type: application/json; charset=utf8');
header('Access-Control-Allow-Origin: *');
$url=$_POST['url'];
require_once "jssdk.php";
$jssdk = new JSSDK("wx6dddc292e71c1d00", "f1fd5dea6a68b162abfe935c91fdada6");
$signPackage = $jssdk->GetSignPackage($url);
$json=array('appId'=>$signPackage['appId'],'timestamp'=>$signPackage['timestamp'],'nonceStr'=>$signPackage['nonceStr'],'jsapi_ticket'=>'no','signature'=>$signPackage['signature'],"URL"=>$signPackage['url']);
echo json_encode($json);

?>
