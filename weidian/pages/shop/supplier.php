<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>食材商城</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="../../css/app.css">
<link rel="stylesheet" href="../../css/mui.min.css">
<style>
.mui-bar-tab .ts-bar-desc {
	width: 50%;
	background-color: #000;
	color: #fff!important
}
.mui-bar-tab .ts-bar-btn {
	width: 30%;
	background-color: #ff5d3a;
	color: #fff!important
}
.mui-bar-tab .ts-bar-scde{
	width: 20%;
	background-color: #000;
}
.ts-bar-btn .mui-badge {
    font-size: 10px;
    line-height: 1.4;
    position: absolute;
    top: -5px;
    left: 98%;
    margin-left: -10px;
    padding: 1px 5px;
    color: #fff;
    background: red;
}



.ts-col-main {
	float: left;
	width: 100%;
	min-height: 1px
}
.ts-col-sub {
	float: left
}
.ts-col-sub:after, .ts-layout:after, .ts-main-wrap:after {
	content: '\20';
	display: block;
	height: 0;
	clear: both
}
.ts-grid-m0s2 .ts-main-wrap {
	margin-left: 80px;
	position: relative
}
.ts-grid-m0s2 .ts-col-sub {
	width: 80px;
	margin-left: -100%;
	position: relative
}
.mui-bar-header-secondary {
	height: 30px;
	text-align: center;
	line-height: 30px
}
.mui-bar-header-secondary~.mui-content {
	padding-top: 74px
}
.mui-fullscreen .ts-col-main, .mui-fullscreen .ts-col-sub, .mui-fullscreen .ts-layout, .mui-fullscreen .ts-main-wrap {
	height: 100%
}
#category {
	margin: 0;
	padding: 0
}
#category li {
	list-style: none;
	position: relative;
	padding: 10px 5px;
	font-size: 16px;
	border-bottom: 1px solid #E8E8E8;
	margin-top: -1px
}
#category li .ts-count {
	position: absolute;
	right: 2px;
	bottom: 2px;
	color: #fff;
	background-color: #ff5d3a;
	padding: 1px 4px;
	font-size: 11px
}
#category li.mui-active {
	color: #ff5d3a;
	background-color: #fff
}
.mui-table-view .mui-media-object {
	width: 80px;
	height: 80px;
	max-width: 80px;
	line-height: 80px;
	border-radius: 10px;
}
.cplt{
	width:100%;
	padding:0;
	margin:0 0 10px 0;
	overflow:hidden;
}
.ts-main-wrap {
	/*border-left: 1px solid #b8b8b8*/
}
#ts_tip {
	font-size: 13px;
	border-bottom: 1px solid #b8b8b8;
	box-shadow: none;
	-webkit-box-shadow: none;
	background-color: #efeff4
}
.mui-media-body{
	font-size: 14px;
	line-height: 18px;
	font-weight:bold;
	color:#6C6C6C;
}
.mui-media-body p {
	font-size:16px; color:#FF4F2E; line-height:20px; margin:5px 0 0 0;
}
.mui-media-body p b{
	color:#000; font-weight:400;font-size:12px; color:#434343;
}

.mui-toast-container {
	top: 150px
}
.mui-toast-message {
	width: 200px;
	background-color: #000;
	color: #fff
}
#price {
	font-style: normal
}
#ts_cart_num {
	right: 5px;
	top: 10px;
	left: auto;
	line-height: 1;
	font-size: 13px;
	padding: 2px 4px 0 4px
}
.mui-scroll-wrapper {
	overflow: auto;
	-webkit-overflow-scrolling: touch
}
#ts_cart_num_animate {
	position: absolute;
	top: 5px;
	right: 5px;
	line-height: 1;
	font-size: 13px;
	padding: 2px 4px 0 4px;
	z-index: 1000;
	background-color: #ff5d3a;
	-webkit-transition-property: -webkit-transform;
	color: #fff
}
body.mui-plus.mui-ios-7 #ts_cart_num_animate, body.mui-plus.mui-ios-8 #ts_cart_num_animate {
	top: 25px
}
.animated {
	-webkit-animation-duration: 300ms;
	animation-duration: 300ms;
	-webkit-animation-fill-mode: both;
	animation-fill-mode: both
}
.pulse {
	-webkit-animation-name: pulse;
	animation-name: pulse
}
 @-webkit-keyframes pulse {
0% {
-webkit-transform:scale(1);
transform:scale(1)
}
 50% {
-webkit-transform:scale(1.2);
transform:scale(1.2)
}
 100% {
-webkit-transform:scale(1);
transform:scale(1)
}
}
 @keyframes pulse {
0% {
-webkit-transform:scale(1);
transform:scale(1)
}
 50% {
-webkit-transform:scale(1.2);
transform:scale(1.2)
}
 100% {
-webkit-transform:scale(1);
transform:scale(1)
}
}
.mui-icon .mui-badge {
	background: #fff;
	color: #000;
}
</style>
</head>

<body>




<div class="mui-content">
<div class="mui-content mui-fullscreen">
          <div class="ts-layout ts-grid-m0s2">
    <div class="ts-col-main">
              <div class="ts-main-wrap">
        <div id="product_scroll" class="mui-scroll-wrapper">
                  <div class="mui-scroll">
            <div id="product"></div>
          </div>
                </div>
      </div>
            </div>
    <div class="ts-col-sub">
              <div id="category_scroll" class="mui-scroll-wrapper">
        <div class="mui-scroll">
                  <ul id="category">
          </ul>
                </div>
      </div>
            </div>
  </div>
        </div>
<span id="ts_cart_num_animate" class="mui-badge mui-hidden">1</span>

<nav class="mui-bar mui-bar-tab">
<a class="mui-tab-item ts-bar-scde" style="background:#0E3A7C; color:#FFF;" id="appindex"><span class="mui-icon iconfont">&#xe6b1;</span><span class="mui-tab-label">首页</span></a>
<span class="mui-tab-item ts-bar-desc">总额：<i id="price">0</i>元</span>
<a onclick="openSubmit();" id="confirm" class="mui-tab-item ts-bar-btn">立即结算<span id="ts_cart_num" class="mui-badge">0</span></a>
</nav>

<script src="../../js/mui.min.js"></script>
<script src="../../Public/script/zepto.min.js"></script>
		<script src="../../Public/script/api.js"></script>
		<script src="../../Public/script/common.js"></script>
		<script type="text/javascript" src="../../Public/script/zepto.picLazyLoad.min.js"></script>
		<script type="text/javascript" src="../../Public/script/shopcart.js"></script>
		<script type="text/javascript" src="../../Public/script/supplier.js"></script>
		<script>
		var alljson=null;
		var currcid=0;
		$(function(){
			
			setTimeout(function(){getcategary(function(){getAll();});},1000);
		});
		
		function getcategary(f){
			var url=BaseUrl+"/getproductcategary";
			$.getJSON(url,function(json){
				for(var i=0;i<json.length;i++){
					var html="";
					if(i==0){
						currcid=json[i].cid;
						
						html='<li id="category_'+json[i].cid+'" data-id="'+json[i].cid+'" class="mui-active"> '+json[i].name+' <span id="category_"'+json[i].cid+'"_num" class="mui-badge ts-count mui-hidden">0</span> </li>';
					}else{
						html='<li id="category_'+json[i].cid+'" data-id="'+json[i].cid+'" class=""> '+json[i].name+' <span id="category_"'+json[i].cid+'"_num" class="mui-badge ts-count mui-hidden">0</span> </li>';
					}
					
					$("#category").append(html);
					
				}
				f();
				$("#category").find("li").each(function(idx,el){
					$(el).tap(function(){
						$("#category").find("li").removeClass("mui-active").eq(idx).addClass("mui-active");
						var cid=$(el).data('id');
						console.log(cid);
						var arr=getProductByCid(cid);
						buildProduct(arr,cid);
						updateCart(cid);
					});
					
				});
			});
		}
		function getAll(){
			var url=BaseUrl+"/getallproduct";
			$.getJSON(url,function(json){
				alljson=json;
				updateCategary();
				localStorage.setItem("products",JSON.stringify(alljson));
				
				var arr=getProductByCid(currcid);
				buildProduct(arr,currcid);
			});
		}
		
		function openProduct(id){
			
			window.location.href="fooddetail.php?id="+id;
		}
		function openSubmit(){
			window.location.href="submit_order.php";
		}
document.getElementById('confirm').addEventListener('tap', function() {
	window.location.href="submit_order.php";
});
		function buildProduct(arr,cid){
			var html='';
			html+='<div id="product_active" data-id="category_0">';
				html+='<ul class="mui-table-view" style="margin:0 0 50px 0">';
			for(var i=0;i<arr.length;i++){
				var img=BasePath+arr[i].savepath;
				html+='<li class="mui-table-view-cell mui-media">';
		          html+='<div class="cplt"><img onclick="openProduct('+arr[i].id+')" id="material_43325" class="mui-media-object mui-pull-left test-lazyload" data-original="'+img+'" src="../../image/img_null.png">';
		          html+='<div class="mui-media-body">';
		            html+=arr[i].title;
		            html+='<p>';
		              html+=arr[i].price+'<b> 元<br>'+arr[i].unit+'</b>';
		            html+='</p>';
		          html+='</div></div>';
		          html+='<div class="mui-numbox ts-numbox" ';
		          html+='data-price="0">';
		            html+='<button class="mui-btn mui-numbox-btn-minus" type="button" onclick="minusproduct('+arr[i].id+')">'; 
		              html+='-';
		            html+='</button>';
		            html+='<input id="material_'+arr[i].id+'_num" class="mui-numbox-input" type="number" ';
		            html+='value="0" readonly="">';
		            html+='<button class="mui-btn mui-numbox-btn-plus" type="button" onclick="addproduct('+arr[i].id+',\''+arr[i].title+'\',1,'+arr[i].price+')">';
		              html+='+';
		            html+='</button>';
		          html+='</div>';
		      html+='</li>';
			
			}
				html+='</ul>';
				html+='</div>';
				$("#product").html(html);
				updateCart(currcid);
				updateNum();
			$('.test-lazyload').picLazyLoad({
			    threshold: 100,
			    placeholder: 'http://image.yihaodianimg.com/front-homepage/global/images/blank.gif'
			});
		}
document.getElementById('appindex').addEventListener('tap', function() {
	window.location.href="/weidian/index.php";
});
	</script>
<div style="display:none"><script src="http://s11.cnzz.com/stat.php?id=1257365777&web_id=1257365777" language="JavaScript"></script></div>
</body>
</html>