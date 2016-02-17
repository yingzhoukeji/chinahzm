<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>栏目名称</title>
<link rel="stylesheet" href="../../css/app.css">
<link rel="stylesheet" href="../../css/mui.min.css">
	</head>

	<body>
<div class="mui-content">
  <ul class="mui-table-view" style="margin:0 0 50px 0;">
	 <li class="mui-table-view-cell"></li>
  </ul>
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
	<script type="text/javascript" src="../../Public/script/zepto.picLazyLoad.min.js"></script>
	<script>
		$(function(){
			var title="<?php echo $_GET['title'] ?>";
			var pagename="<?php echo $_GET['name'] ?>";
			$("title").text(title);
			$(".mui-title").text(title);
			$(".mui-action-back").click(function(){
				history.back();
			});
			var need="id,title";
			var url=BaseUrl+"/news/cid/"+pagename+"/need/"+need;
			$.getJSON(url,function(json){
				for(var i=0;i<json.length;i++){
					var html='<li class="mui-table-view-cell"><a class="mui-navigate-right" onclick="openDetail(this);" data-title="'+json[i].title+'" data-id="'+json[i].id+'">';
						html+=json[i].title;
					    html+='</a></li>';
					$(".mui-table-view").append(html);
				}
				$('.test-lazyload').picLazyLoad({
				    threshold: 100,
				    placeholder: '/weidian/images/blank.gif'
				});
				
			});
		});
		function openDetail(obj){
            window.location.href="detail.php?name="+$(obj).data('id')+"&title="+$(obj).data('title');
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