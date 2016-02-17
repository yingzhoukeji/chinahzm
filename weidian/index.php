<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>海之梦集团</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="css/app.css">
<link rel="stylesheet" href="css/mui.min.css">
<style>
#order{display:none;}
#my{display:none;}
#location{font-size: 18px;padding-top: 14px;padding-left: 10px;}
.swiper-container{
	  position: relative;
	  margin: 0 -5px;
	  height:200px;
}
.swiper-wrapper img{
	width:100%;
	height: 200px;
}
.wrap,.mui-content,top{padding:0;margin:0}
			
.app-sy{ margin:0; padding:0; width:100%; clear:both; overflow:hidden; background:rgba(255,255,255,1.00);}
.app-sy ul{ margin:0; padding:0; clear:both; width:100%;  overflow:hidden;}
.app-sy ul li{float:left; overflow:hidden;}
.app-sy ul li p{padding:10px 0 0 0; margin-bottom:0 !important; overflow:hidden;}
.app-sy ul li b{color:#262626; font-size:12px !important; padding:0 0 0 10px;}
.app-sy ul li img{ height:60px; width:auto;min-height: 60px; min-width:auto; padding:0; margin:0;}
.app-sy ul li samp{color:#FF4F2E; font-size:10px !important; display:inline; width:100%; padding:0 0 10px 10px;}
.app-sy ul li:nth-child(1){width:25%; margin:0; padding:0;  border-bottom:#E8E8E8 1px solid;}
.app-sy ul li:nth-child(2){width:25%; margin:0 0 0 -1px; padding:0;  border-left:#E8E8E8 1px solid;border-bottom:#E8E8E8 1px solid;}
.app-sy ul li:nth-child(3){width:25%; margin:0 0 0 -1px; padding:0;  border-left:#E8E8E8 1px solid;border-bottom:#E8E8E8 1px solid;}
.app-sy ul li:nth-child(4){width:25%; margin:0 0 0 -1px; padding:0;  border-left:#E8E8E8 1px solid;border-bottom:#E8E8E8 1px solid;}
.app-sy ul li:nth-child(5){width:25%; margin:0; padding:0; }
.app-sy ul li:nth-child(6){width:25%; margin:0 0 0 -1px; padding:0; border-left:#E8E8E8 1px solid;}
.app-sy ul li:nth-child(7){width:25%; margin:0 0 0 -1px; padding:0; border-left:#E8E8E8 1px solid;}
.app-sy ul li:nth-child(8){width:25%; margin:0 0 0 -1px; padding:0; border-left:#E8E8E8 1px solid;}

.merchants{ margin:10px 0 50px 0; padding:0; width:100%; clear:both; overflow:hidden; background:rgba(255,255,255,1.00);}
.merchants .main_bt{margin:0; padding:10px; clear:both; width:100%;  overflow:hidden;}
.merchants .main_bt a{margin:0; padding:0; font-size:12px; float:right}
.merchants ul{ margin:0; padding:0; clear:both; width:100%;  overflow:hidden;}
.merchants .merch_list{ margin:0; padding:0; clear:both; width:100%;  overflow:hidden;}
.merchants .merch_list li{ margin:0; padding:5px 10px; clear:both; overflow:hidden;border-bottom:#E8E8E8 1px solid;}
.merchants .merch_list li .merch_pic{ margin:0 5% 0 0; padding:0; width:35%;  overflow:hidden; float:left;}
.merchants .merch_list li .merch_pic .test-lazyload{ margin:0; padding:0; width:100%;}
.merchants .merch_list li .merch_main{ margin:0; padding:0; width:60%;  overflow:hidden; float:left;}
.merchants .merch_list li .merch_main h2{ margin:0 0 10px 0; padding:0;  overflow:hidden; font-size:14px; color:#000; line-height:20px;}
.merchants .merch_list li .merch_main .merch_info{ margin:0; padding:0;  overflow:hidden; font-size:12px; color:#434343;line-height:20px;}
.merchants .merch_list li .merch_main em{ margin:0; padding:0;  overflow:hidden; font-size:18px !important; color:#FF4F2E;line-height:35px; font-weight:bold; font-style:normal}
.merchants .merch_list li .merch_main em i{ color:#434343; font-style:normal; font-size:12px}
.merchants .merch_list li .merch_main del{ margin:0 0 0 10px;}
</style>
</head>

<body>
<div class="mui-content">
  <div class="mui-slider" >
    <div class="mui-slider-group mui-slider-loop">
      <div class="mui-slider-item mui-slider-item-duplicate"> <a href="/weidian/pages/shop/supplier.php"> <img src="images/yuantiao.jpg"> </a> </div>
      <div class="mui-slider-item"> <a href="/weidian/pages/shop/supplier.php"> <img src="images/shuijiao.jpg"> </a> </div>
      <div class="mui-slider-item"> <a href="/weidian/pages/shop/supplier.php"> <img src="images/muwu.jpg"> </a> </div>
      <div class="mui-slider-item"> <a href="/weidian/pages/shop/supplier.php"> <img src="images/cbd.jpg"> </a> </div>
      <div class="mui-slider-item"> <a href="/weidian/pages/shop/supplier.php"> <img src="images/yuantiao.jpg"> </a> </div>
      <div class="mui-slider-item mui-slider-item-duplicate"> <a href="/weidian/pages/shop/supplier.php"> <img src="images/shuijiao.jpg"> </a> </div>
    </div>
    <div class="mui-slider-indicator">
      <div class="mui-indicator mui-active"></div>
      <div class="mui-indicator"></div>
      <div class="mui-indicator"></div>
      <div class="mui-indicator"></div>
    </div>
  </div>
</div>


<div class="app-sy">
<ul>
<li><a href="javascript:openPage('zjtcbb/list.php')"><p><b>集团介绍</b><br><samp>ABOUT US</samp><br><img src="images/1-1.jpg"></p></a></li>
<li><a href="javascript:openNewsDetail('集团新闻','9')"><p><b>集团新闻</b><br><samp>GROUP</samp><br><img src="images/1-2.jpg"></p></a></li>
<li><a href="javascript:openNewsDetail('行业新闻','10')"><p><b>行业新闻</b><br><samp>INDUSTRY</samp><br><img src="images/1-3.jpg"></p></a></li>
<li><a href="javascript:openNewsDetail('展会信息','11')"><p><b>展会信息</b><br><samp>SHOW</samp><br><img src="images/1-4.jpg"></p></a></li>
<li><a href="javascript:openPage('pztx/list.php')"><p><b>品质体系</b><br><samp>QUALITY</samp><br><img src="images/1-5.jpg"></p></a></li>
<!-- li><a href="javascript:openPageDetail('经销商','gsjj')"><p><b>经销商</b><br><samp>DISTRIBUTOR</samp><br><img src="images/1-6.jpg"></p></a></li -->
<li><a id="jxsa"><p><b>经销商</b><br><samp>DISTRIBUTOR</samp><br><img src="images/1-6.jpg"></p></a></li>
<li><a href="javascript:openPage('jmwm/list.php')"><p><b>加盟合作</b><br><samp>JOIN IN</samp><br><img src="images/1-7.jpg"></p></a></li>
<li><a href="javascript:openPage('bzzx/list.php')"><p><b>帮助中心</b><br><samp>HELP</samp><br><img src="images/1-8.jpg"></p></a></li>
</ul>
</div>

<div class="merchants">
    <div class="main_bt">
     <a hrfe="/weidian/pages/shop/supplier.php">更多</a> 推荐食材
    </div>
    <ul class="merch_list">
    </ul>	
</div>


<nav class="mui-bar mui-bar-tab">
<a class="mui-tab-item mui-active" id="appindex"> <span class="mui-icon iconfont">&#xe6b1;</span> <span class="mui-tab-label">首页</span> </a>
<a class="mui-tab-item" id="appscsc"> <span class="mui-icon iconfont">&#xe68b;</span> <span class="mui-tab-label">食材商城</span> </a>
<a class="mui-tab-item" id="appskjs"> <span class="mui-icon iconfont">&#xe653;</span> <span class="mui-tab-label">积分商城</span> </a>
<a class="mui-tab-item" id="applzwm"> <span class="mui-icon iconfont">&#xe63a;</span> <span class="mui-tab-label">加盟合作</span> </a>
<a class="mui-tab-item" id="apphyzx"> <span class="mui-icon iconfont">&#xe6b5;</span> <span class="mui-tab-label">会员中心</span> </a> </nav>


<script src="js/mui.min.js"></script>
<script src="Public/script/zepto.min.js"></script>
	<script src="Public/script/api.js"></script>
	<script src="Public/script/common.js"></script>
	<script type="text/javascript" src="Public/script/swiper.min.js"></script>
	<script type="text/javascript" src="Public/script/zepto.picLazyLoad.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var swiper = new Swiper('.swiper-container', {
				lazyLoading : true,
				autoplay : 4000,
				paginationClickable : true,
			});
			getRandproduct();
		});

		function openPage(url){
			window.location.href="pages/"+url;
		}
		function openNewsDetail(name,id){
            window.location.href="pages/skjs/news.php?name="+id+"&title="+name;
		}
		function openPageDetail(name,id){
			window.location.href="pages/zjtcbb/detail.php?name="+id+"&title="+name;
		}
		function openShopCart(){
			window.location.href="pages/shop/supplier.php";
		}
		function openProduct(id){
			
			window.location.href="pages/shop/fooddetail.php?id="+id;
		}
		function openLogin(){
			var currUrl="<?php echo urlencode('http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);?>";
			window.location.href="win_login.php?from="+currUrl;
		}
		function getRandproduct(){
			var url=BaseUrl+"/randproduct";
			$.getJSON(url,function(json){
				for(var i=0;i<json.length;i++){
					var img=BasePath+json[i].savepath;
					var price1=toDecimal2(parseInt(json[i].price)*1.1);
					var html='<a href="javascript:openProduct('+json[i].id+');">';
						html+='<li>';
						html+='<div class="merch_pic"><img class="test-lazyload" src="Public/image/img_null.png" data-original="'+img+'"></div>';
						html+='<div class="merch_main">';
							html+='<h2>'+json[i].title+'</h2>';
							html+='<p class="merch_info">';
								html+=json[i].summary;
							html+='</p>';
							html+='<p class="price">';
								html+='<em>'+json[i].price+'<i>元/'+json[i].unit+'</i></em>';
								html+='<del>'+price1+'元/'+json[i].unit+'</del>';
							html+='</p>';
						html+='</div>';
					html+='</li> </a>';
					$(".merch_list").append(html);
				}
				$('.test-lazyload').picLazyLoad({
				    threshold: 100,
				    placeholder: '/weidian/img/blank.gif'
				});
			});
		}

document.getElementById('jxsa').addEventListener('tap', function() {
	window.location.href="/weidian/jxs.html";
});
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