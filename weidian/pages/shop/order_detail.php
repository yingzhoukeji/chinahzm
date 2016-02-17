<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>挑食&#183;火锅送 - 我的订单</title>
		<link href="../../css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="../../css/ts.css" />
		<style>
			body,html{font-size:13px;height:100%;background-color:#efeff4}
			.mui-checkbox.mui-left input[type=checkbox]{left:10px;top:15px}
			.mui-table-view-cell.mui-checkbox.mui-left{padding-left:35px}
			.mui-table-view-cell.mui-checkbox.mui-left a{margin:-11px 15px;padding:11px 0}
			.mui-table-view-cell.mui-collapse.mui-active{background-color:#fff}
			.mui-table-view-cell.mui-collapse.mui-active .mui-table-view{border-top:1px solid #c8c7cc}
			.mui-table-view-cell .mui-table-view-cell{height:40px}
			.ts-cart-material-name,.ts-cart-material-price{display:inline-block}
			.ts-cart-material-price{left:50%;position:absolute}
			.ts-numbox{top:8px}
			#cart p{color:#ff5d3a}
			.mui-bar-tab .ts-bar-checkbox{width:40%}
			.mui-bar-tab .ts-bar-desc{width:30%;color:#000}
			i{font-style:normal}
			.mui-bar-tab .ts-bar-btn{width:30%;background-color:#ff5d3a;color:#fff!important}
			.mui-tab-item .mui-checkbox.mui-left label{padding-left:38px;text-align:left}
			.mui-tab-item .mui-checkbox.mui-left input[type=checkbox]{top:2px}
			#cart .mui-icon-trash{position:absolute;right:0;top:10px}
			.mui-table-view .mui-media-object{width:42px}
			.mui-input-row label {width: 25%;padding: 10px 3px;padding-left: 10px;}
			.mui-input-row label~input{width:75%}
			.list-header{
				padding:7px 10px;
				background:#efeff4;
				color:#000;
				font-weight: bold;
				font-size: 14px;
			}
			.mui-input-row span{top: 8px;position: inherit;}
			.pay-btn{width: 20%!important;right: 10px!important;padding: 3px!important;}
			.pay-tel{width: 13%!important;right: 10px!important;padding: 3px!important;}
			.mui-input-group .mui-input-row:after{left:0}
			.mui-bar.mui-bar-tab{background:#FF5D3A;}
			.mui-bar{-webkit-box-shadow: 0 0 0px rgba(0,0,0,.85);box-shadow: 0 0 0px rgba(0,0,0,.85);}
			.mui-bar.mui-bar-tab a{color:#fff;font-size:16px;}
			.footer{bottom:0!important;}
		</style>
	</head>
	<body class="ts-statusbaroffset mui-ios mui-ios-8 mui-ios-8-0">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav"></a>
			<h1 id="ts_title" class="mui-title">订单详情</h1>
		</header>
		<nav id="nav" class="mui-bar mui-bar-tab">
			<a id="receive_ok_btn" class="mui-tab-item">确认收货</a>
		</nav>
		<div id="scroll" class="mui-content mui-scroll-wrapper" style="-webkit-overflow-scrolling:auto;top: 54px;">
			<div id="orderdetail">
				
				<div class="mui-input-group" style="margin-top: 10px;">
					
					<div id="orderinfo">
					<!--
						<div class="list-header">
							订单信息
						</div>
						<div class="mui-input-row">
							<label>订单号：</label>
							<input id="consignee_name" class="mui-input-clear" type="text" readonly="">
						</div>
						<div class="mui-input-row">
							<label>状态：</label>
							<span></span>
						</div>
						<div class="list-header">
							支付信息
						</div>
						<div class="mui-input-row">
							<label>支付方式：</label>
							<input id="consignee_phone" value="微信支付" class="mui-input-clear" type="text" readonly="">
						</div>
						<div class="mui-input-row">
							<label>是否支付：</label>
							<span>否</span>
							<span  class="pay-btn mui-pull-right mui-btn mui-btn-success mui-btn-outlined">马上支付</span>
						</div>
						<div class="mui-input-row">
							<label>金额：</label>
							<span>￥1000</span>
							
						</div>
						<div class="list-header">
							配送信息
						</div>
						
						<div class="mui-input-row">
							<label>收货人：</label>
							<input id="consignee_name" class="mui-input-clear" type="text" readonly="">
						</div>
						<div class="mui-input-row">
							<label>手机号码：</label>
							<input id="consignee_phone" class="mui-input-clear" type="number" readonly="">
						</div>
						<div class="mui-input-row">
							<label>配送地址：</label>
							<input id="consignee_phone" value="sadasddddddddddddddddddddddsssssssssssssss" class="mui-input-clear" type="text" readonly="">
						</div>
						<div class="list-header">
							配送业务员
						</div>
						
						<div class="mui-input-row">
							<label>姓名：</label>
							<input id="consignee_name" class="mui-input-clear" type="text" readonly="">
						</div>
						<div class="mui-input-row">
							<label>手机号码：</label>
							
							<span>18382307095</span>
							<span  class="pay-tel mui-pull-right mui-btn mui-btn-success mui-btn-outlined">催单</span>
						</div>
						-->
					</div>
					
				</div>
			</div>
			<div id="cart">
				<div class="list-header">
					商品列表
				</div>
				<ul class="mui-table-view">
					<li class="mui-table-view-cell">
						<div class="ts-cart-material-name" style="color:red;">
							食材名称
						</div>
						<div class="ts-cart-material-price" style="color:red;">
							单价
						</div>
						<div class="ts-numbox" data-id="43321" style="color:red;">
							数量
						
						</div>
					</li>
					<div id="orderlist"></div>
				</ul>
			</div>
			
		</div>
	</body>
	<script src="../../script/zepto.min.js"></script>
	<script src="../../script/api.js"></script>
	<script src="../../script/common.js"></script>
	<script>
		apiready=function(){
			var orderid=api.pageParam.id;
			getOrderDetail(orderid);
			$(".mui-action-back").click(function(){
				api.closeWin();
			});
		}
		function getOrderDetail(orderid){
			var url=BaseUrl+"/getOrderDetail/orderid/"+orderid;
			showLoading();
			$.getJSON(url,function(json){
				hideLoading();
				var data=json.data;
				var orderdetail=data.orderdetail;
				var shopcarts=data.shopcarts;
				buildorderinfo(orderdetail);
				bulidCartList(shopcarts);
			});
		}
		function bulidCartList(shopcarts){
			var productlist=shopcarts;
			for(var i=0;i<productlist.length;i++){
				var product=productlist[i];
				var html='<li class="mui-table-view-cell">';
					html+='<div class="ts-cart-material-name">';
					html+=product.title;
					html+='</div>';
					html+='<div class="ts-cart-material-price">';
					html+='￥'+product.price;
					html+='</div>';
					html+='<div class="mui-numbox ts-numbox" data-id="43321">';	
					html+='<input class="mui-numbox-input" type="number" value="'+product.num+'">';
					html+='</div>';
					html+='</li>';
					$("#orderlist").append(html);
			}
		}
		function buildorderinfo(orderdetail){
			var html='';
			html+='<div class="list-header">';
						html+='订单信息';
					html+='</div>';
					html+='<div class="mui-input-row">';
						html+='<label>订单号：</label>';
						html+='<input id="consignee_name" value="'+orderdetail.code+'" class="mui-input-clear" type="text" readonly="">';
					html+='</div>';
					html+='<div class="mui-input-row">';
						html+='<label>状态：</label>';
						html+='<span>'+getStatus(orderdetail.stutas)+'</span>';
					html+='</div>';
					html+='<div class="list-header">';
						html+='支付信息';
					html+='</div>';
					html+='<div class="mui-input-row">';
						html+='<label>支付方式：</label>';
						html+='<input id="consignee_phone" value="'+getPayType(orderdetail.paytype)+'" class="mui-input-clear" type="text" readonly="">';
					html+='</div>';
					if(orderdetail.paytype==1){
							html+='<div class="mui-input-row">';
								html+='<label>是否支付：</label>';
								if(orderdetail.ispay==1){
									html+='<span>是</span>';
								}else{
									html+='<span>否</span>';
									html+='<span  class="pay-btn mui-pull-right mui-btn mui-btn-success mui-btn-outlined">马上支付</span>';
								}
							html+='</div>';
					}
				
					html+='<div class="mui-input-row">';
						html+='<label>金额：</label>';
						html+='<span>￥'+orderdetail.totalfee+'</span>';
						
					html+='</div>';
					html+='<div class="list-header">';
						html+='配送信息';
					html+='</div>';
					
					html+='<div class="mui-input-row">';
						html+='<label>收货人：</label>';
						html+='<input id="consignee_name" value="'+orderdetail.receiver+'" class="mui-input-clear" type="text" readonly="">';
					html+='</div>';
					html+='<div class="mui-input-row">';
						html+='<label>手机号码：</label>';
						html+='<input id="consignee_phone" value="'+orderdetail.telephone+'" class="mui-input-clear" type="number" readonly="">';
					html+='</div>';
					html+='<div class="mui-input-row">';
						html+='<label>配送地址：</label>';
						html+='<input id="consignee_phone" value="'+orderdetail.shipaddr+'" class="mui-input-clear" type="text" readonly="">';
					html+='</div>';
					html+='<div class="mui-input-row">';
						html+='<label>配送时间：</label>';
						html+='<input id="consignee_phone" value="'+orderdetail.sendtime+'" class="mui-input-clear" type="text" readonly="">';
					html+='</div>';
					html+='<div class="list-header">';
						html+='配送业务员';
					html+='</div>';
					
					html+='<div class="mui-input-row">';
						html+='<label>姓名：</label>';
						if(orderdetail.distributioner==null||orderdetail.distributioner==""){
							html+='<input id="consignee_name" class="mui-input-clear" type="text" value="暂未分配" readonly="">';
						}else{
							html+='<input id="consignee_name" class="mui-input-clear" type="text" value="'+orderdetail.distributioner+'" readonly="">';
						}
						
					html+='</div>';
					html+='<div class="mui-input-row">';
						html+='<label>手机号码：</label>';
						if(orderdetail.distributioner_phone==null||orderdetail.distributioner_phone==""){
							html+='<input id="consignee_name" class="mui-input-clear" type="text" value="暂无" readonly="">';
						}else{
							html+='<span>'+orderdetail.distributioner_phone+'</span>';
							html+='<span onclick="call(\''+orderdetail.distributioner_phone+'\')"  class="pay-tel mui-pull-right mui-btn mui-btn-success mui-btn-outlined">催单</span>';
						}
						
					html+='/div>';
					if(orderdetail.receive_ok==1){
						$("#nav").remove();
						$("#scroll").addClass('footer');
					}else{
						$("#receive_ok_btn").click(function(){
							if(orderdetail.stutas>3){
								updatereceive_ok(orderdetail.id);
							}else{
								api.toast({
				                    msg:'还未发货'
				                });
							}
							
						});
					}
					$("#orderinfo").html(html);
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
		function call(num){
			api.call({
			    type: 'tel_prompt',
			    number: num
			});
		}
		function updatereceive_ok(orderid){
			var url=BaseUrl+"/updatereceive_ok/orderid/"+orderid;
			showLoading();
			$.getJSON(url,function(json){
				hideLoading();
				api.toast({
                    msg:json.msg
                });
				if(json.status==1){
					$("#nav").remove();
					$("#scroll").addClass('footer');
				}
			});
		}
		
	</script>
</html>