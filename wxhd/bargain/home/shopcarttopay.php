<?php
header("Content-Type:text/html;charset=utf-8");
session_start();
$orderid=$_GET['orderid'];
$deposit=$_GET['deposit'];
$_SESSION["orderid"]=$orderid;
$_SESSION["deposit"]=$deposit;
echo '<script>window.location.href="pay.php"</script>';
exit();
?>
