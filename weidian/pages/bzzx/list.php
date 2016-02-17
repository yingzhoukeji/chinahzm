<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>客户帮助中心</title>
<link rel="stylesheet" href="../../css/app.css">
<link rel="stylesheet" href="../../css/mui.min.css"><style>
.content{margin:0; padding:0; width:100%; clear:both; overflow:hidden; background:rgba(255,255,255,1.00)}
.content img{ width:100%; clear:both; overflow:hidden;}
</style>
	</head>

	<body>
<div class="mui-content">
<div class="content"><img src="../../images/FL15.jpg"></div>
  <ul class="mui-table-view" style="margin:0 0 50px 0;">
	 <li class="mui-table-view-cell"><a class="mui-navigate-right" href="javascript:openDetail('礼品券说明','lpj')">
								 礼品券说明
							</a></li>
                            <li class="mui-table-view-cell"><a class="mui-navigate-right" href="javascript:openDetail('购物流程','gwlc')">
								 购物流程
							</a></li>
                            <li class="mui-table-view-cell"><a class="mui-navigate-right" href="javascript:openDetail('配送政策','pszc')">
								配送政策
							</a></li>
                            <li class="mui-table-view-cell"><a class="mui-navigate-right" href="javascript:openDetail('支付方式','zffs')">
								支付方式
							</a></li>
                            <li class="mui-table-view-cell"><a class="mui-navigate-right" href="javascript:openDetail('在线支付','zxzf')">
								在线支付
							</a></li>
                            <li class="mui-table-view-cell"><a class="mui-navigate-right" href="javascript:openDetail('货到付款','hdfk')">
								货到付款
							</a></li>
                            <li class="mui-table-view-cell"><a class="mui-navigate-right" href="javascript:openDetail('售后服务','shfw')">
								售后服务
							</a></li>
  </ul>
</div>
			
		
 <nav class="mui-bar mui-bar-tab">
<a class="mui-tab-item" id="appindex"> <span class="mui-icon iconfont">&#xe6b1;</span> <span class="mui-tab-label">首页</span> </a>
<a class="mui-tab-item" id="appscsc"> <span class="mui-icon iconfont">&#xe68b;</span> <span class="mui-tab-label">食材商城</span> </a>
<a class="mui-tab-item" id="appskjs"> <span class="mui-icon iconfont">&#xe653;</span> <span class="mui-tab-label">积分商城</span> </a>
<a class="mui-tab-item" id="applzwm"> <span class="mui-icon iconfont">&#xe63a;</span> <span class="mui-tab-label">加盟合作</span> </a>
<a class="mui-tab-item mui-active" id="apphyzx"> <span class="mui-icon iconfont">&#xe6b5;</span> <span class="mui-tab-label">会员中心</span> </a> </nav> 		
	</body>
	<script src="../../Public/script/zepto.min.js"></script>
	<script src="../../Public/script/api.js"></script>
	<script src="../../Public/script/common.js"></script>
	<script>
		$(function(){
			$(".mui-action-back").click(function(){
				history.back();
			});
		});
		function openDetail(title,name){
			window.location.href="detail.php?title="+title+"&name="+name;
		}
		
document.getElementById('appindex').addEventListener('tap', function() {
	window.location.href="/weidian/index.php";
});
document.getElementById('appscsc').addEventListener('tap', function() {
	window.location.href="/weidian/pages/shop/supplier.php";
});
document.getElementById('appskjs').addEventListener('tap', function() {
	window.location.href="/wxhd/list.html";
});
document.getElementById('applzwm').addEventListener('tap', function() {
	window.location.href="/weidian/pages/jmwm/list.php";
});
document.getElementById('apphyzx').addEventListener('tap', function() {
	window.location.href="/weidian/usercenter.php";
});
	</script>
</html>