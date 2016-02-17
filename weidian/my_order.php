<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>我的订单</title>
<link rel="stylesheet" href="css/app.css">
<link rel="stylesheet" href="css/mui.min.css">
		<style>
			body,html{height:100%;background:#ECF0F1;}
			.mui-bar.mui-bar-header-secondary{box-shadow:none;-webkit-box-shadow:none;background-color:#fff}
			.mui-table-view-cell ul{margin:0;padding:0;list-style:none}
			.mui-table-view-cell .mui-btn-link{padding-right:0}
			.mui-table-view-cell-extra{position:relative;padding-top:6px;padding-left:15px;margin-top:-1px;margin-left:0;font-weight:500}
			.mui-table-view-cell-btns{position:relative;height:50px;padding:8px 15px;text-align:right}
			.mui-table-view-cell-btns:after{position:absolute;right:0;top:0;left:15px;height:1px;content:'';background-color:#c8c7cc;-webkit-transform:scaleY(.5);transform:scaleY(.5)}
			.mui-table-view{margin-bottom:10px}
			.ts-placeholder{display:none}
			#tpl .ts-placeholder{width:100%;padding:50px 0;text-align:center;display:block}
			.ts-placeholder .mui-btn.mui-fab{padding:8px;background-color:#b0b0b0;color:#fff}
			.ts-placeholder .mui-btn.mui-fab .mui-icon{font-size:40px;width:40px;height:40px;line-height:40px}
			.ts-placeholder h5{margin-bottom:20px;line-height:17px}
			.mui-pull-caption.mui-pull-caption-nomore{display:none}
			.ts-noorder .mui-pull-bottom-pocket{display:none!important}
			.mui-bar-header-secondary{top:0px;}
			.mui-table-view-cell:after {
			    position: absolute;
			    right: 0;
			    bottom: 0;
			    left: 0;
			    height: 20px;
			    content: '';
			    background-color: #ECF0F1;
			    -webkit-transform: scaleY(.5);
			    transform: scaleY(.5);
			}
			.blank{border:1px dashed #333;border-bottom:0;border-right:0;border-left:0;width:100%;}
			.ordertime{padding-top:10px;padding-bottom:10px;}
			.timename{color:#666;font-weight: bold;padding-right: 3px;}
			.orderview{float:right;color:#ff5d3a;font-weight: bold;}
			.ordercode{color:#666;font-weight: bold;padding-right: 5px;}
			#segmentedControl a, #segmentedControl a:hover, #segmentedControl a:visited{color:#fff !important;}
		</style>
	</head>

	<body>
		<div class="mui-bar mui-bar-header-secondary mui-plus-hidden">
			<div id="segmentedControl" style="margin-top: -3px;" class="mui-segmented-control mui-segmented-control-inverted mui-segmented-control-primary">
				<a id="ts_filter_all" class="mui-control-item mui-active">全部</a>
				<a id="ts_filter_uncompleted" class="mui-control-item">未完成</a>
				<a id="ts_filter_completed" class="mui-control-item">已完成</a>
			</div>
		</div>
		<div class="mui-scroll" style="transform: translate3d(0px, 0px, 0px) translateZ(0px); transition-duration: 300ms;padding-top:50px;">
			<div id="orderlist">
				<ul class="mui-table-view" style=" margin:0 0 50px 0">
		
			         
 					
				</ul>
			</div>
		    <div id="tpl">
		      <div class="ts-placeholder ts-login-placeholder">
		        <span class="mui-btn mui-fab">
		          <span class="mui-icon mui-icon-home">
		          </span>
		        </span>
		        <h5>
		          您还没有登录，请登录后查看订单
		        </h5>
		        <a onclick="openLogin();" id="ts_login" class="mui-btn mui-btn-primary">
		          登录
		        </a>
		      </div>
		    </div>
		     <div id="xiadan">
		      <div class="ts-placeholder ts-login-placeholder">
		        <span class="mui-btn mui-fab">
		          <span class="mui-icon mui-icon-home">
		          </span>
		        </span>
		        <h5>
		         	你还没有订单
		        </h5>
		        <a onclick="openLogin();" id="ts_login" class="mui-btn mui-btn-primary">
		        	 去下单
		        </a>
		      </div>
		    </div>
		</div>
        
        <nav class="mui-bar mui-bar-tab">
<a class="mui-tab-item" id="appindex"> <span class="mui-icon iconfont">&#xe62c;</span> <span class="mui-tab-label">首页</span> </a>
<a class="mui-tab-item" id="appscsc"> <span class="mui-icon iconfont">&#xe644;</span> <span class="mui-tab-label">食材商城</span> </a>
<a class="mui-tab-item" id="appskjs"> <span class="mui-icon iconfont">&#xe655;</span> <span class="mui-tab-label">烧烤教室</span> </a>
<a class="mui-tab-item" id="applzwm"> <span class="mui-icon iconfont">&#xe649;</span> <span class="mui-tab-label">联系我们</span> </a>
<a class="mui-tab-item mui-active" id="apphyzx"> <span class="mui-icon iconfont">&#xe6c2;</span> <span class="mui-tab-label">会员中心</span> </a> </nav>
	</body>
	<script src="Public/script/zepto.min.js"></script>
	<script src="Public/script/api.js"></script>
	<script src="Public/script/common.js"></script>
	<script>
		var data=null;
		$(function(){
			getOrderlist();
			$("#segmentedControl").find("a").each(function(idx,el){
				$(this).click(function(){
					$("#segmentedControl").find("a").removeClass("mui-active").eq(idx).addClass("mui-active");
					if(idx==0){
						getAll();
					}else if(idx==1){
						getWwc();
					}else if(idx==2){
						getYWC();
					}
				});
			});
			$(".mui-action-back").click(function(){
				history.back();
			});
		});
		function openLogin(){
			var currUrl="<?php echo urlencode('http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);?>";
			window.location.href="win_login.php?from="+currUrl;
		}
		
		function getOrderlist(){
			if(localStorage.getItem(USERID)){
				var uid=localStorage.getItem(USERID);
				console.log(uid);
				var url=BaseUrl+"/getOrderlist/userid/"+uid;
				$.getJSON(url,function(json){
					if(json.status==1){
						
						$("#tpl").hide();
						$("#xiadan").hide();
						var list=json.list;
						data=list;
						var html='';
						for(var i=0;i<list.length;i++){
							var ordercode=list[i].code;
							var sendtime=list[i].sendtime;
							var stutas=list[i].stutas;
							var paytype=list[i].paytype;
							html+='<li class="mui-table-view-cell">';
					 		html+='<div class="orderitem">';
					 		html+='<div style="padding-bottom:10px;">';
				 			html+='<span><span class="ordercode" style="">订单号:</span>'+ordercode+'</span>';
				 			html+='<span class="orderview" onclick="openOrderDetail('+data[i].id+')">查看</span>';
					 		html+='</div>';
					 		html+='<div style="padding-bottom:10px;">';
					 		html+='<span><span class="ordercode" style="">支付方式:</span><span style="color:#1DA179">'+getPayType(paytype)+'</span></span>';
					 		html+='</div>';
					 		html+='<div class="blank" style=""></div>';
					 		html+='<div class="ordertime" style="">';
					 		html+='<span><span class="timename" style="">配送时间:</span>'+sendtime+'</span>';
					 		html+='<span style="float:right;">'+getStatus(stutas)+'</span>';
					 		html+='</div>';
					 		html+='</div>';
					 		html+='</li>';
						}
						$("#orderlist ul").html(html);
					}else{
						$("#tpl").hide();
						$("#xiadan").show();
					}
				});
			}else{
				$("#orderlist ul").html("");
				$("#tpl").show();
			}
		}
		function getWwc(){
			if(localStorage.getItem(USERID)){
					var html='';
				for(var i=0;i<data.length;i++){
					var ordercode=data[i].code;
					var sendtime=data[i].sendtime;
					var stutas=data[i].stutas;
					var paytype=data[i].paytype;
					if(stutas==4) return;
					html+='<li class="mui-table-view-cell">';
			 		html+='<div class="orderitem">';
			 		html+='<div style="padding-bottom:10px;">';
		 			html+='<span><span class="ordercode" style="">订单号:</span>'+ordercode+'</span>';
		 			html+='<span class="orderview" onclick="openOrderDetail('+data[i].id+')">查看</span>';
			 		html+='</div>';
			 		html+='<div style="padding-bottom:10px;">';
			 		html+='<span><span class="ordercode" style="">支付方式:</span><span style="color:#1DA179">'+getPayType(paytype)+'</span></span>';
			 		html+='</div>';
			 		html+='<div class="blank" style=""></div>';
			 		html+='<div class="ordertime" style="">';
			 		html+='<span><span class="timename" style="">配送时间:</span>'+sendtime+'</span>';
			 		html+='<span style="float:right;">'+getStatus(stutas)+'</span>';
			 		html+='</div>';
			 		html+='</div>';
			 		html+='</li>';
				}
				$("#orderlist ul").html(html);
			}
		}
		function getAll(){
			if(localStorage.getItem(USERID)){
					var html='';
				for(var i=0;i<data.length;i++){
					var ordercode=data[i].code;
					var sendtime=data[i].sendtime;
					var stutas=data[i].stutas;
					var paytype=data[i].paytype;
					
					html+='<li class="mui-table-view-cell">';
			 		html+='<div class="orderitem">';
			 		html+='<div style="padding-bottom:10px;">';
		 			html+='<span><span class="ordercode" style="">订单号:</span>'+ordercode+'</span>';
		 			html+='<span class="orderview" onclick="openOrderDetail('+data[i].id+')">查看</span>';
			 		html+='</div>';
			 		html+='<div style="padding-bottom:10px;">';
			 		html+='<span><span class="ordercode" style="">支付方式:</span><span style="color:#1DA179">'+getPayType(paytype)+'</span></span>';
			 		html+='</div>';
			 		html+='<div class="blank" style=""></div>';
			 		html+='<div class="ordertime" style="">';
			 		html+='<span><span class="timename" style="">配送时间:</span>'+sendtime+'</span>';
			 		html+='<span style="float:right;">'+getStatus(stutas)+'</span>';
			 		html+='</div>';
			 		html+='</div>';
			 		html+='</li>';
				}
				$("#orderlist ul").html(html);
			}
		}
		function getYWC(){
			if(localStorage.getItem(USERID)){
					var html='';
				for(var i=0;i<data.length;i++){
					var ordercode=data[i].code;
					var sendtime=data[i].sendtime;
					var stutas=data[i].stutas;
					var paytype=data[i].paytype;
					if(stutas==4) {
						html+='<li class="mui-table-view-cell">';
				 		html+='<div class="orderitem">';
				 		html+='<div style="padding-bottom:10px;">';
			 			html+='<span><span class="ordercode" style="">订单号:</span>'+ordercode+'</span>';
			 			html+='<span class="orderview" onclick="openOrderDetail('+data[i].id+')">查看</span>';
				 		html+='</div>';
				 		html+='<div style="padding-bottom:10px;">';
				 		html+='<span><span class="ordercode" style="">支付方式:</span><span style="color:#1DA179">'+getPayType(paytype)+'</span></span>';
				 		html+='</div>';
				 		html+='<div class="blank" style=""></div>';
				 		html+='<div class="ordertime" style="">';
				 		html+='<span><span class="timename" style="">配送时间:</span>'+sendtime+'</span>';
				 		html+='<span style="float:right;">'+getStatus(stutas)+'</span>';
				 		html+='</div>';
				 		html+='</div>';
				 		html+='</li>';
			 		}
				}
				$("#orderlist ul").html(html);
			}
		}
		function getPayType(paytype){
			var text='微信支付';
			if(paytype==0){
				text='货到付款';
			}
			return text;
		}
		function getStatus(status){
			var text='未审核';
			switch(status){
				case 0:
				text='未审核';
				break;
				case 1:
				text='已确认';
				break;
				case 2:
				text='备货中';
				break;
				case 3:
				text='已发货';
				break;
				case 4:
				text='已完成';
				break;
			}
			return text;
		}
		function openOrderDetail(orderid){
			window.location.href="my_order_detail.php?id="+orderid;
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