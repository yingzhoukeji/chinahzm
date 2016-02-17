<?php
require_once("../include/config.db.php");
require_once("../include/db.class.php");
require_once("../include/common.php");
require_once("config.wx.php");
header("Content-Type:text/html;charset=utf-8");
session_start();
$isjoin=false;
$bargain_id=$_SESSION["bargain_id"];
$openid=$_SESSION["openid"];
$db=new db();
$order=$db->table('order')->where(array('openid'=>$openid,'bargainid'=>$bargain_id))->find();
$bargain=$db->table('bargain')->where(array('id'=>$bargain_id))->find();

?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<title>我的购物车-订单信息</title>
		<link rel="stylesheet" href="../css/mui.min.css">
		<link rel="stylesheet" href="../css/sweet-alert.css">
		<link rel="stylesheet" href="../css/index.css"> <link rel="stylesheet" href="../css/frozen.css" />
		<link rel="stylesheet" type="text/css" href="../css/path_menu.css"/>
	</head>
	<body>
		<div class="mui-content mui-scroll"><div style="height:50px !important; clear:bothl; overflow:hidden; background:#00763D">
			<div style="line-height:30px; padding:10px 20px 0 0 !important;  float:right;"><a href="http://www.chinahzm.cn/wx/html/product/search.html" style="color:rgba(255,255,255,1.00);"><samp class="mui-icon mui-icon-search"></samp></a></div>
			<a href="javascript:history.back();"><img src="http://www.chinahzm.cn/wx/images/logo.png" height="40"/></a>

		</div>
			<div class="welcome"><span style="color:red;"><?php echo $_SESSION["nickname"];  ?>的购物车</span></div>
			<div class="mui-card" style="margin-top:10px;">
				<ul class="mui-table-view" id="detail">
					<?php 
						if($order){
							echo '<li class="mui-table-view-cell">姓名：'.$order['name'].'</li>';
							echo '<li class="mui-table-view-cell">号码：'.$order['phone'].'</li>';
							echo '<li class="mui-table-view-cell">公司：'.$order['company'].'</li>';
							echo '<li class="mui-table-view-cell">砍后总价：'.$order['currprice'].'</li>';
							echo '<li class="mui-table-view-cell">原价：'.$bargain['price'].'</li>';
							if($order['ispay']==1){
								echo '<li class="mui-table-view-cell">是否支付：已支付</li>';
								if(!empty($order['transaction_id'])){
									echo '<li class="mui-table-view-cell">微信支付订单号：'.$order['transaction_id'].'</li>';
								}else{
									echo '<li class="mui-table-view-cell">微信支付订单号：暂无</li>';
								}
								if(!empty($order['out_trade_no'])){
									echo '<li class="mui-table-view-cell">商户订单号：'.$order['out_trade_no'].'</li>';
								}else{
									echo '<li class="mui-table-view-cell">商户订单号：暂无</li>';
								}
								if(!empty($order['out_trade_no'])){
									echo '<li class="mui-table-view-cell">支付金额'.($order['total_fee']/100).'元</li>';
								}else{
									echo '<li class="mui-table-view-cell">支付金额：暂无</li>';
								}
							}else{
								$url="shopcarttopay.php?orderid=".$order['id']."&deposit=".$order['deposit'];
								echo '<li class="mui-table-view-cell">是否支付：未支付 <a href="'.$url.'" class="mui-btn mui-btn-negative style="float:right">马上支付</a></li>';
							}
						}else{
							echo '<li class="mui-table-view-cell">无订单信息</li>';
						}
					?>
					
				</ul>
			</div>
			<div class="mui-button-row" style="margin:10px; clear:both; padding:0 0 200px 0">     
				
				<button class="mui-btn mui-btn-primary mui-btn-block" type="button" onclick="goindex();">返回我的活动页面</button>

			</div>
		</div>
<nav class="mui-bar mui-bar-tab">
    <a class="mui-tab-item " href="/wx/">
		<span class="mui-icon mui-icon-home"></span>
		<span class="mui-tab-label">大森官网</span>
	</a>
	<a class="mui-tab-item mui-active" href="bargainlist.php">
		<span class="mui-icon mui-icon-starhalf"></span>
		<span class="mui-tab-label">砍价活动</span>
	</a>
    <a class="mui-tab-item" href="orderlist.php">
		<span class="mui-icon mui-icon-list"></span>
		<span class="mui-tab-label">砍价销售榜</span>
	</a>
	<a class="mui-tab-item" href="http://www.chinahzm.cn/wxhd/list.html">
		<span class="mui-icon mui-icon-pengyouquan"></span>
		<span class="mui-tab-label">分享活动</span>
	</a>
	<a class="mui-tab-item" href="tel:13738578698">
		<span class="mui-icon mui-icon-phone"></span>
		<span class="mui-tab-label">咨询</span>
	</a>
</nav>  
	</body>
	<script type="text/javascript" src="../js/zepto.min.js" ></script>
	<script type="text/javascript" src="../js/sweet-alert.min.js" ></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script>
		$(function(){
			//alert($("html").html());
		});
		function goindex(){
			window.location.href="index.php?id=<?php echo $bargain_id;?>&userfrom=<?php echo $openid;?>&param=xxxx";
		}
	</script>
	
</html>