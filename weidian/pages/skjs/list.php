<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<title>烧烤教师</title>
<link rel="stylesheet" href="../../css/app.css">
<link rel="stylesheet" href="../../css/mui.min.css">
<style>
		
.tuwenls{ margin:0 0 50px 0; padding:0; width:100%; clear:both; overflow:hidden; background:rgba(255,255,255,1.00)}
.tuwenls dl{ margin:0; padding:0; width:100%; clear:both; overflow:hidden; background:rgba(255,255,255,1.00);border-bottom:#E8E8E8 1px solid;}
.tuwenls dl dt{ margin:0; padding:0; width:100%; max-width: 100%; height:150px; max-height:150px; clear:both; overflow:hidden;}
.tuwenls dl dt img{ width:100%; max-width: 100%; height:auto; max-height:auto; clear:both; overflow:hidden;}
.tuwenls dl dd{ background:#efeff4; margin:0; padding:0 10px; max-width: 100%; height:40px; max-height:40px; line-height:40px; clear:both; overflow:hidden;}
.tuwenls dl dd samp{ float:right; font-size:10px; color:rgba(0,0,0,1.00) !important}
</style>
	</head>

	<body>
<div class="mui-content">
<div class="tuwenls">
  <a href="javascript:openDetail('小眼特色','1')"><dl>
    <dt><img src="../../images/FL1.JPG"></dt>
    <dd><samp>WWW.chinahzm.cn</samp>小眼特色</dd>
  </dl></a>
  <a href="javascript:openDetail('烹烤技巧 ','2')"><dl>
    <dt><img src="../../images/FL2.JPG"></dt>
    <dd><samp>WWW.chinahzm.cn</samp>
								 烹烤技巧 
							</dd>
  </dl></a>
  <a href="javascript:openDetail('调料配方','3')"><dl>
    <dt><img src="../../images/FL3.JPG"></dt>
    <dd><samp>WWW.chinahzm.cn</samp>
								调料配方
							</dd>
  </dl></a>
  <a href="javascript:openDetail('健康饮食','4')"><dl>
    <dt><img src="../../images/FL4.JPG"></dt>
    <dd><samp>WWW.chinahzm.cn</samp>
								健康饮食
							</dd>
  </dl></a>
  <a href="javascript:openDetail('烧烤攻略','5')"><dl>
    <dt><img src="../../images/FL5.JPG"></dt>
    <dd><samp>WWW.chinahzm.cn</samp>
								烧烤攻略
							</dd>
  </dl></a>
</div>

  
</div>
<nav class="mui-bar mui-bar-tab">
<a class="mui-tab-item mui-active" id="appindex"> <span class="mui-icon iconfont">&#xe6b1;</span> <span class="mui-tab-label">首页</span> </a>
<a class="mui-tab-item" id="appscsc"> <span class="mui-icon iconfont">&#xe68b;</span> <span class="mui-tab-label">食材商城</span> </a>
<a class="mui-tab-item" id="appskjs"> <span class="mui-icon iconfont">&#xe653;</span> <span class="mui-tab-label">积分商城</span> </a>
<a class="mui-tab-item" id="applzwm"> <span class="mui-icon iconfont">&#xe63a;</span> <span class="mui-tab-label">加盟合作</span> </a>
<a class="mui-tab-item" id="apphyzx"> <span class="mui-icon iconfont">&#xe6b5;</span> <span class="mui-tab-label">会员中心</span> </a> </nav>
		
	</body><script src="../../js/mui.min.js"></script>
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
			window.location.href="news.php?title="+title+"&name="+name;
		}
		document.getElementById('appindex').addEventListener('tap', function() {
	window.location.href="/weidian/index.php";
});
document.getElementById('appscsc').addEventListener('tap', function() {
	window.location.href="/weidian/pages/shop/supplier.php";
});
document.getElementById('appskjs').addEventListener('tap', function() {
	window.location.href="/weidian/pages/skjs/list.php";
});
document.getElementById('applzwm').addEventListener('tap', function() {
	window.location.href="/weidian/lxwm.html";
});
document.getElementById('apphyzx').addEventListener('tap', function() {
	window.location.href="/weidian/usercenter.php";
});
	</script>
</html>