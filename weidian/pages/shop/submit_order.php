<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>购物车</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="../../css/app.css">
<link rel="stylesheet" href="../../css/mui.min.css">
<link rel="stylesheet" href="../../Public/css/ts.css" />
		<link rel="stylesheet" href="../../Public/css/showBo.css" />
		<style>
		.beijys{background:#ff5d3a;color:#fff!important}
		#orderlist{  margin:0; padding:0; width:100%; clear:both; overflow:hidden; font-size:12px; background:#FFF}
		#orderlist dl{ line-height:35px;  margin:0; padding:0; width:100%; clear:both; overflow:hidden;border-bottom:#E8E8E8 1px solid; color:#000 !important}
		#orderlist dl dt{ text-align:center; margin:0;  padding:0; width:50%; float:left; overflow:hidden;list-style-type:none;
 text-overflow: ellipsis;
 white-space: nowrap;
}
		#orderlist dl dd{ margin:0; padding:0; width:25%; float:left; margin:0 0 0 -1px; border-left:1px solid #E8E8E8; overflow:hidden;list-style-type:none;}
		.cliao{ background:#E1E1E1; line-height:35px; margin:0 0 50px 0; padding:0; width:100%; clear:both; overflow:hidden;}
		.cliao dl{ margin:0; padding:0; width:100%; clear:both; overflow:hidden; border-bottom:#E8E8E8 1px solid; color:#FF4F2E}
		.cliao dl dt{ text-align:center; margin:0; padding:0; width:50%; float:left; overflow:hidden;list-style-type:none; text-overflow: ellipsis;
 white-space: nowrap;}
		.cliao dl dd{ margin:0 0 0 -1px; border-left:1px solid #FFF; text-align:center;  padding:0; width:25%; float:left; overflow:hidden;list-style-type:none;}
	.mui-active{ font-size:16px;}
		</style>
	</head>
<body>
<div class="mui-content">
<div class="cliao">
  <dl>
    <dt>食材名称</dt>
    <dd>单价</dd>
    <dd>数量</dd>
  </dl>
  <div id="orderlist"></div>
</div>
		
	</div>    
       

<nav class="mui-bar mui-bar-tab">
<a class="mui-tab-item mui-active"  id="num">数量：0</a>
<a class="mui-tab-item mui-active"  id="num">需：<i id="price">0</i>元</a>
<a class="mui-tab-item mui-active beijys" onclick="dosubmit();">结算</a>
</nav>


	</body>
	<script src="../../Public/script/zepto.min.js"></script>
	<script src="../../Public/script/api.js"></script>
	<script src="../../Public/script/common.js"></script>
	<script src="../../Public/script/showBo.js"></script>
	<script type="text/javascript" src="../../Public/script/swiper.min.js"></script>
	<script type="text/javascript" src="../../Public/script/zepto.picLazyLoad.min.js"></script>
	<script type="text/javascript" src="../../Public/script/shopcart.js"></script>
	<script type="text/javascript" src="../../Public/script/submit_order.js"></script>
	<script>
		$(function(){
			getProductlist();
			$(".mui-action-back").click(function(){
				history.back();
			});
		});
		function login(){
			var currUrl="<?php echo urlencode('http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);?>";
			window.location.href="../../win_login.php?from="+currUrl;
		}
	</script>
</html>