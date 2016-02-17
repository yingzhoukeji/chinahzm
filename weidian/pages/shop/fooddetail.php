<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>商品简介</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="../../css/app.css">
<link rel="stylesheet" href="../../css/mui.min.css">
<style>
.app-img{ margin:0; padding:0; height:250px; width:100%; clear:both; overflow:hidden;}
.app-img img{width:100%; height:auto}

.app-jg{ margin:0; padding:0; width:100%; clear:both; overflow:hidden; background:rgba(255,255,255,1.00)}
.app-jg dl,.app-jg ul{line-height:30px; margin:0; padding:0 10px; width:100%; clear:both; overflow:hidden;}
.app-jg dl dt{ margin:0; padding:0; width:100%; clear:both; overflow:hidden; color:#262626; font-size:14px !important;}
.app-jg dl dd{ margin:0; padding:0; width:100%; clear:both; overflow:hidden;}
.app-jg dl dd em{ margin:0; padding:0; overflow:hidden; font-size:24px !important; color:#FF4F2E;line-height:35px; font-weight:bold; font-style:normal}
.app-jg dl dd em i{ color:#434343; font-style:normal; font-size:14px !important;}
.app-jg dl dd del{ margin:0 0 0 10px; font-size:14px;color:#C9C9C9;}
.app-jg ul li{float:left; width:33.3%; list-style-type:none;padding:0; margin:0 0 0 -1px; border-left:#E8E8E8 1px solid; border-top:#E8E8E8 1px solid;text-align:center; color:#C9C9C9; font-size:10px; }
.app-jg ul li:first-child {border-left:none;margin:0;}

.lxwm{ margin:20px 0 0 0; padding:0; width:100%; clear:both; overflow:hidden; background:rgba(255,255,255,1.00)}
.lxwm h1{line-height:30px; font-size:14px;  margin:0; padding:0 0 0 10px;  clear:both; overflow:hidden; border-left:#17CBFE 5px solid;}
.lxwm dl{margin:0; padding:0 10px; line-height:30px;  width:100%; clear:both; overflow:hidden; color:#262626; font-size:14px !important; border-top:#E8E8E8 1px solid;}
.lxwm dl dt{margin:0; padding:0; line-height:30px;  width:100%; clear:both; overflow:hidden; color:#262626; font-size:14px !important;  border-bottom:#E8E8E8 1px solid;}
.lxwm dl dd{margin:0; padding:0; line-height:30px;  width:100%; clear:both; overflow:hidden; color:#262626; font-size:14px !important;  border-bottom:#E8E8E8 1px solid;}
.lxwm h1{line-height:30px; font-size:14px;  margin:0; padding:0 0 0 10px;  clear:both; overflow:hidden; border-left:#17CBFE 5px solid;}
.lxwm span{width:80px !important; color:rgba(155,155,155,1.00); padding:0 10px 0 0}
.cpnr{ margin:10px 0 50px 0; padding:10px;  clear:both; overflow:hidden; background:rgba(255,255,255,1.00);  line-height:20px; color:#262626; font-size:14px !important;}
.cpnr img{width:100%; height:auto}
.cpnr p{ padding:10px 0;}
.cpnr table{width:100%; height:auto}
#content{margin:0; padding:0; width:100%; clear:both; overflow:hidden;}
.dish-plus-btn{  margin: 20px 5%;  background: #eb6100; width: 86%; text-align: center; padding: 15px 2%;border-radius: 3px;color: #fff;}
</style>
</head>

<body>
<div class="mui-content">
<div id="content"></div>

 <nav class="mui-bar mui-bar-tab">
<a class="mui-tab-item" id="appindex"> <span class="mui-icon iconfont">&#xe6b1;</span> <span class="mui-tab-label">首页</span> </a>
<a class="mui-tab-item mui-active" id="appscsc"> <span class="mui-icon iconfont">&#xe68b;</span> <span class="mui-tab-label">食材商城</span> </a>
<a class="mui-tab-item" id="appskjs"> <span class="mui-icon iconfont">&#xe653;</span> <span class="mui-tab-label">积分商城</span> </a>
<a class="mui-tab-item" id="applzwm"> <span class="mui-icon iconfont">&#xe63a;</span> <span class="mui-tab-label">加盟合作</span> </a>
<a class="mui-tab-item" id="apphyzx"> <span class="mui-icon iconfont">&#xe6b5;</span> <span class="mui-tab-label">会员中心</span> </a> </nav> 
<script src="../../js/mui.min.js"></script>
<script src="../../Public/script/zepto.min.js"></script>
	<script src="../../Public/script/api.js"></script>
	<script src="../../Public/script/common.js"></script>
	<script src="../../Public/script/showBo.js"></script>
	<script type="text/javascript" src="../../Public/script/shopcart.js"></script>
	<script>
		
		$(function(){
			var pid="<?php echo $_GET['id']?>";
			
			/*
			$(".mui-action-back").click(function(){
				history.back();
			});
			*/
			var url=BaseUrl+"/productDetail/id/"+pid;
			$.getJSON(url,function(json){
				var img=BasePath+json.savepath;
				var price1=toDecimal2(parseInt(json.price)*1.1);
				var html='<div class="app-img"><img src="'+img+'"></div>';
html+='<div class="app-jg"><dl>';
html+='<dt>'+json.title+'</dt>';
html+='<dd><i class="iconfont">&#xe66a;</i> <em>'+json.price+'<i> 元/'+json.unit+'</i></em><del>'+price1+'元/'+json.unit+'</del></dd></dl>';
html+='<ul><li><i class="iconfont">&#xe623;</i> 免运费</li><li><i class="iconfont">&#xe628;</i> 定时送货</li><li><i class="iconfont">&#xe6a1;</i> 浙江 台州</li></ul></div>';
html+='<div class="dish-plus-btn" onclick="addproduct('+json.id+',\''+json.title+'\',1,'+json.price+')">加入购物车</div>';
html+='<div class="lxwm">';
html+='<h1>客服中心</h1>';
html+='<dl><dt><span class="iconfont">&#xe658;</span>13706572779 (24小时服务热线)</dt><dd><span class="iconfont">&#xe69c;</span> 0576-89166065</dd><dd><span class="iconfont">&#xe638;</span> zybmwcn</dd><dd><span class="iconfont">&#xe61e;</span> 0576-89166065</dd><dd><span class="iconfont">&#xe69b;</span> 浙江台州黄岩江口工业食品开发园区内</dd></dl>';
html+='</div>';
html+='<div class="cpnr">'+json.content+'</div>';
				     console.log(html);
				 $("#content").html(html);
			});
		});
		
		function addproduct(id,name,num,price){
			var product ={'id': id,'name': name,'num':num,'price':price};
			cart.addproduct(product);
			Showbo.Msg.alert("成功添加到购物车!");
			setTimeout(function(){
				window.location.href="supplier.php";
			},1000);
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
<div style="display:none"><script src="http://s11.cnzz.com/stat.php?id=1257365777&web_id=1257365777" language="JavaScript"></script></div>
</body>
</html>