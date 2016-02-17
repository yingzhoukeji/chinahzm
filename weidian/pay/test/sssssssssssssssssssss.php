<?php
if(!isset($_GET["oid"])){
	exit();
}
$oid=$_GET["oid"];
session_start();
//注册session变量，赋值为一个用户的名称
$_SESSION["oid"]=$oid;
echo '<script>window.location.href="pay.php"</script>';
?>
