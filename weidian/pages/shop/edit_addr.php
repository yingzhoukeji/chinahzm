<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>海之梦-修改地址</title>
		<link href="../../Public/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="../../Public/css/ts.css" />
		<link rel="stylesheet" href="../../Public/css/showBo.css" />
		<link href="../../Public/css/mui.picker.css" rel="stylesheet" />
		<link href="../../Public/css/mui.poppicker.css" rel="stylesheet" />
		<style>
			.mui-input-row label{padding:12px 0 12px 15px;width:38%}
			.mui-input-row label~input,.mui-input-row label~textarea{width:62%;float:left}
			.mui-input-row input,.mui-input-row label,.mui-input-row textarea{font-size:15px}
			#address~span,#region_id~span{position:absolute;right:7px;top:7px;color:#999;width:30px;text-align:right}
			.mui-bar .mui-btn.mui-pull-right{margin-left:0;margin-right:0}
			.mui-input-group.mui-inline{display:table}
			.mui-input-group.mui-inline:after,.mui-input-group.mui-inline:before{height:0}
			.mui-input-group.mui-inline .mui-input-row{display:table-cell;width:100%;vertical-align:middle;background-color:#fff}
			.mui-input-group.mui-inline .mui-input-row:after{height:0}
			.mui-input-group.mui-inline .mui-input-row input[type=number]{margin-bottom:0}
			.mui-input-group.mui-inline .mui-button-row{padding:0;display:table-cell;width:1%;white-space:nowrap;vertical-align:middle}
			.mui-input-group.mui-inline .mui-button-row button{padding:9px 12px;margin-left:5px}
			#dvMsgBox .top{background-color: #F94C4C;}
			input.btn{background-color: #F94C4C;}
		</style>
	</head>
	<body class="mui-ios mui-ios-8 mui-ios-8-0">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav"></a>
			<h1 class="mui-title">修改配送地址</h1>
			<button id="save" style="color: #fff;" type="button" class="mui-right mui-btn  mui-btn-link mui-btn-nav mui-pull-right">
				保存
			</button>
		</header>
		<div id="site" class="mui-content" style="padding-top:64px;">
			<input id="site_id" type="hidden">
			<div class="mui-input-group">
				<div id="region_select" class="mui-input-row">
					<label>所在城区：</label>
					<input id="region_name" type="text" readonly="" placeholder="选择城区">
					<input id="city_id" type="hidden">
					<input id="region_id" type="hidden">
					<span class="mui-icon mui-icon-arrowright"></span>
				</div>
				<div class="mui-input-row" style="height: 80px;">
					<label>详细地址：</label>
					<textarea id="address" style="height: 80px;padding-right: 30px;"></textarea>
					<span id="geolocation" class="mui-icon ts-icon ts-icon-geolocation"></span>
				</div>
			</div>
			<div class="mui-input-group" style="margin-top: 10px;">
				<div class="mui-input-row">
					<label>您的姓名：</label>
					<input id="consignee_name" class="mui-input-clear" type="text">
				</div>
				<div class="mui-input-row">
					<label>您的手机号：</label>
					<input id="consignee_phone" class="mui-input-clear" type="number">
				</div>
			</div>
			
		</div>
	
	

</body>
	<script src="../../Public/script/zepto.min.js"></script>
	<script src="../../Public/script/api.js"></script>
	<script src="../../Public/script/common.js"></script>
	<script src="../../Public/script/showBo.js"></script>
	<script src="../../Public/script/mui.min.js"></script>
	<script src="../../Public/script/mui.picker.js"></script>
	<script src="../../Public/script/mui.poppicker.js"></script>
	<script src="../../Public/script/city.data-3.js" type="text/javascript" charset="utf-8"></script>
	<script>
		var addr_id=null;
		Zepto(function(){
			getAddr();
			Zepto(".mui-action-back").click(function(){
				histroy.go(-1);
			});
			Zepto("#save").click(function(){
				if(addr_id!=null){
					edit_addr();
				}else{
					showMsg("无地址可编辑！");
				}
				
			});
			Zepto("#region_name").click(function(){
				var cityPicker3 = new mui.PopPicker({
					layer: 3
				});
				cityPicker3.setData(cityData3);
				cityPicker3.show(function(items) {
					var text = (items[0] || {}).text + "-" + (items[1] || {}).text + "-" + (items[2] || {}).text;
					$("#region_name").val(text);
				});
			});
		});
		
		function getAddr(){
			var uid=localStorage.getItem(USERID);
			var url=BaseUrl+"/tcbb_getAddr/uid/"+uid;
			Zepto.getJSON(url,function(json){
				
				if(json.status==1){
					addr_id=json.data.id;
					Zepto("#consignee_name").val(json.data.receiver);
					Zepto("#consignee_phone").val(json.data.telephone);
					Zepto("#address").val(json.data.addr);
					Zepto("#region_name").val(json.data.areainfo);
				}else{
					showMsg(json.info);
					
				}
				
			});
		}
		function edit_addr(){
			var url=BaseUrl+"/tcbb_editAddr";
			var region_name=Zepto("#region_name").val();
			var address=Zepto("#address").val();
			var consignee_name=Zepto("#consignee_name").val();
			var consignee_phone=Zepto("#consignee_phone").val();
			if(region_name==""){showMsg('请选择城市区域！');return;}
			if(address==""){showMsg('请输入详细地址！');return;}
			if(consignee_name==""){showMsg('请输入收货人姓名！');return;}
			var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
			if(!myreg.test(consignee_phone)){ showMsg('请输入有效的手机号码！');return;}
			 var data={};
			 data.userid=localStorage.getItem(USERID);
			 data.telephone=consignee_phone;
			 data.receiver=consignee_name;
			 data.telephone=consignee_phone;
			 data.addr=address;
			 data.areainfo=region_name;
			 data.id=addr_id;
			
			Zepto.post(url,data,function(json){
				
				showMsg(json.msg);
				if(json.status==1){	
					setTimeout(function(){
						window.location.href="addr.php";
					},1000);
					
				}
			},'json');
		}
		function showMsg(msg){
			Showbo.Msg.alert(msg);
			
		}
	</script>
</html>