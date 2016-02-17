<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<title>企业简介</title>
<link rel="stylesheet" href="../../css/app.css">
<link rel="stylesheet" href="../../css/mui.min.css">
<style>
.tuwenls{ margin:0 0 50px 0; padding:0; width:100%; clear:both; overflow:hidden; background:#fff}
.tuwenls dl{ margin:0; padding:0; width:100%; clear:both; overflow:hidden; background:#147DF2;border-bottom:#000 1px solid;}
.tuwenls dl dt{ margin:0; padding:0; width:100%; max-width: 100%; height:80px; max-height:100px; clear:both; overflow:hidden;}
.tuwenls dl dt img{ width:100%; max-width: 100%; height:auto; max-height:auto; clear:both; overflow:hidden;}
.tuwenls dl dd{ background:#363636; font-size:12px !important; margin:0; padding:0 10px; max-width: 100%; height:20px; max-height:20px; line-height:20px; clear:both; overflow:hidden;}
.tuwenls dl dd samp{ float:right; font-size:10px !important; color:rgba(0,0,0,1.00) !important}
.tuwenls a{color:rgba(92,92,92,1.00) !important}	
</style>
	</head>

	<body>
<div class="mui-content">
<div class="tuwenls">
  <a href="javascript:openDetail('企业简介','qyjj')"><dl>
    <dt><img src="../../images/FL1.JPG"></dt>
    <dd><samp>WWW.CHINAHZM.CN</samp>COMPANY PROFILE</dd>
  </dl></a>
  <a href="javascript:openDetail('发展历程','fzlc')"><dl>
    <dt><img src="../../images/FL2.JPG"></dt>
    <dd><samp>WWW.CHINAHZM.CN</samp>
								 DEVELOPMENT PATH
							</dd>
  </dl></a>
  <a href="javascript:openDetail('下属公司','xsgs')"><dl>
    <dt><img src="../../images/FL3.JPG"></dt>
    <dd><samp>WWW.CHINAHZM.CN</samp>
								SUBSIDIARY COMPANY
							</dd>
  </dl></a>
  <a href="javascript:openDetail('企业文化','qywh')"><dl>
    <dt><img src="../../images/FL4.JPG"></dt>
    <dd><samp>WWW.CHINAHZM.CN</samp>
								COMPANY CULTURE
							</dd>
  </dl></a>
  <a href="javascript:openDetail('组织结构','zzjg')"><dl>
    <dt><img src="../../images/FL5.JPG"></dt>
    <dd><samp>WWW.CHINAHZM.CN</samp>
								ORGANIZATIONAL STRUCTURE
							</dd>
  </dl></a>
  </a>
  <a href="javascript:openDetail('集团面貌','jtmm')"><dl>
    <dt><img src="../../images/FL6.JPG"></dt>
    <dd><samp>WWW.CHINAHZM.CN</samp>
								GROUP OUTLOOK
							</dd>
  </dl></a>
  <a href="javascript:openDetail('权威认证','qwrz')"><dl>
    <dt><img src="../../images/FL7.JPG"></dt>
    <dd><samp>WWW.CHINAHZM.CN</samp>
								CERTIFICATION AUTHORITY
							</dd>
  </dl></a>
  <a href="javascript:openDetail('企业荣誉','qyry')"><dl>
    <dt><img src="../../images/FL8.JPG"></dt>
    <dd><samp>WWW.CHINAHZM.CN</samp>
								HONORS
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