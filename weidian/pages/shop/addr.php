<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>完善配送信息</title>
<link rel="stylesheet" href="../../css/app.css">
<link rel="stylesheet" href="../../css/mui.min.css">
<link rel="stylesheet" href="../../Public/css/ts.css" />
		<link rel="stylesheet" href="../../Public/css/showBo.css" />
		<script src="../../Public/script/My97DatePicker/WdatePicker.js"></script>
		<style>
			.mui-input-row input,.mui-input-row label{font-size:13px}
			.mui-input-row label{padding:13px 0 13px 15px;width:30%}
			.mui-input-row label~input{width:70%}
			.mui-input-group{margin-bottom:10px}
			.mui-content-padded{background-color:#fff;margin:0;text-align:center;margin-bottom:10px;color:#ff5d3a;font-size:17px;height:40px;line-height:40px}
			.mui-input-group .mui-input-tip{height:auto}
			.mui-input-tip p{font-size:13px;padding:0 15px;color:#a9a9a9;line-height:17px}
			#offline{background-color:#ffa902;border-color:#ffa902;color:#fff}
			#online,#wechat{background-color:#ff5d3a;border-color:#ff5d3a;color:#fff}
			[data-type=hour] .mui-dtpicker-title h5,[data-type=hour] .mui-listpicker{width:20%}
			[data-type=hour] .mui-dtpicker-title h5[data-id=title-h],[data-type=hour] .mui-listpicker[data-id=picker-h]{width:40%}
			.mui-dtpicker .mui-listpicker ul li{padding:5px}
				#dvMsgBox .top{background-color: #F94C4C;}
			input.btn{background-color: #F94C4C;}
		</style>
	</head>
	<body>

	
		<div class="mui-content">

			<div class="mui-input-group" id="add_addr_content">
				<div id="add_info">
					<div class="mui-input-row">
						<label>客官姓名</label>
						<input id="consignee_name" type="text" readonly>
					</div>
					<div class="mui-input-row">
						<label>联系电话</label>
						<input id="phone" type="number" readonly>
					</div>
					<div class="mui-input-row">
						<label>详细地址</label>
						<input id="address" type="text" readonly>
					</div>
					
				</div>
				
			</div>
			<div class="mui-input-group" id="add_addr_content">
				<div id="add_info">
					<div class="mui-input-row">
						<label>配送时间</label>
						<input id="sendtime" type="datetime" readonly onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm'});">
					</div>
				</div>
				
			</div>
			<div id="edit_addr" class="mui-button-row" style="margin-bottom: 20px; padding:0 10px">
				<button id="login" class="mui-btn mui-btn-primary mui-btn-block" style="padding:6px 0;" onclick="edit_addr();">修改地址</button>
				
			</div>
			<div class="mui-content-padded" style="font-size:12px;">本店统一由微信支付，如果没有微信客户端，请自行下载</span>
			<div class="mui-content-padded">应付金额：￥<span id="pay_count">0</span>
			</div>
			
			<div class="mui-input-row" style="margin: 10px 5px;">
				<textarea id="remark" placeholder="如有特殊需求请在此处填写"></textarea>
			</div>


		</div>
	
		<nav id="nav" class="mui-bar mui-bar-tab">
			<a id="offline" class="mui-tab-item">货到付款</a>
			<a id="online" class="mui-tab-item mui-wechat-hidden">微信支付</a>
		</nav>

</body>
	<script src="../../Public/script/zepto.min.js"></script>
	<script src="../../Public/script/api.js"></script>
	<script src="../../Public/script/common.js"></script>
	<script src="../../Public/script/showBo.js"></script>
	<script type="text/javascript" src="../../Public/script/shopcart.js"></script>
	<script type="text/javascript" src="../../Public/script/submit_order.js"></script>
	<script>
		var shipaddrid=null;
		$(function(){
			$(".mui-action-back").click(function(){
				history.back();
			});
			$("#online").click(function(){
				doOrder(1);
			});
			$("#offline").click(function(){
				doOrder(0);
			});
			initdate();
			init();
		});
		
		function edit_addr(){
            window.location.href="edit_addr.php";
		}
		function add_addr(){
			window.location.href="add_addr.php";
		}
		function init(){
			getAddr();
			$("#pay_count").text(getOrderPrice());
		}
		function doOrder(paytype){
			var data={};
			if(!localStorage.getItem(USERID)){
				showMsg('未登录，请先登录！');
				return;
			}
			data.userid=localStorage.getItem(USERID);
			if(shipaddrid==null){
				showMsg('请先完善收货地址！');
				return;
			}
			if(getOrderNum()==0){
				showMsg('添加物品后才提交！');
				return;
			}
			var sendtime=$("#sendtime").val();
			
			data.shipaddrid=shipaddrid;
			data.receiver=$("#consignee_name").val();
			data.telephone=$("#phone").val();
			data.shipaddr=$("#address").val();
			data.goodsfee=getOrderPrice();
			data.totalfee=getOrderPrice();
			data.remark=$("#remark").val();
			data.cartlist=bulidCartList();
			data.paytype=paytype;
			data.sendtime=sendtime;
			console.log(JSON.stringify(data));
			var url=BaseUrl+"/doorder";
			$.post(url,data,function(json){
				
				if(json.status==1){
					showMsg("提交成功，请到购车查看订单详情");
					cart.clear();
					if(paytype==0){
						setTimeout(function(){
							window.location.href="../../index.php";
						},1000);
					}else if(paytype==1){
						//showMsg("请用微信进行支付");
						
						setTimeout(function(){
							window.location.href="../../pay/test/pay.php?oid="+json.orderid;
						},1000);
						
						
					}
					
					
				}else{
					showMsg(json.msg);
				}
			},'json');
		}
		function showMsg(msg){
			Showbo.Msg.alert(msg);
		}
		function bulidCartList(){
			var arr=new Array();
			var productlist=cart.getproductlist();
			for(var i=0;i<productlist.length;i++){
				var p=productlist[i];
				var id=p.id;
				var num=p.num;
				var price=p.price;
				var title=p.name;
				var p1=getProductById(id);
				var img=p1.image_id;
				var obj={};
				obj.id=id;
				obj.num=num;
				obj.price=price;
				obj.title=title;
				obj.img=img;
				arr.push(obj);
			}
			
			return JSON.stringify(arr);
		}
		function getProductById(id){
			var products=JSON.parse(localStorage.getItem("products"));
			var product=null;
			for(var i=0;i<products.length;i++){
				if(products[i].id==id){
					product=products[i];
				}
			}
			return product;
		}
		
		function initdate(){
			var dtNow=new Date();
			var afterTime=new Date(dtNow.getTime()+2*60*60*1000);
			$("#sendtime").val(afterTime.Format("yyyy-MM-dd hh:mm:ss"));
			
		}
	</script>
</html>