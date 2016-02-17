<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>海之梦</title>
<link rel="stylesheet" href="css/app.css">
<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" href="Public/css/ts.css" />
		<link rel="stylesheet" href="Public/css/showBo.css" />
		<style>
			#get_sms {
				position: absolute;
				position: absolute;
				top: 10px;
				right: 10px;
				color: #ff5d3a;
			}
			.ts-login-tip {
				margin-top: 5px;
				color: #ff5d3a;
			}
			.link-area {
				display: block;
				margin-top: 25px;
				text-align: center;
			}
			.spliter {
				color: #bbb;
				padding: 0px 8px;
			}
			#dvMsgBox .top{background-color: #F94C4C;}
			input.btn{background-color: #F94C4C;}
		</style>
	</head>
	<body>

		<div id="panels" class="mui-content mui-fullscreen" style="top: 64px;">
			<div id="ts_login_panel" class="mui-content-padded" style="margin: 20px;">
				<div class="mui-input-group">
					<div class="mui-input-row">
						<input id="telephone" type="number" placeholder="输入手机号">
					</div>
					<div class="mui-input-row" style="margin-top: -1px;">
						<input id="password" type="password" placeholder="请输入密码">
					</div>
					<div class="mui-input-row" style="margin-top: -1px;">
						<input id="rpassword" type="password" placeholder="再次输入密码">
					</div>
				</div>
				
				<div class="mui-button-row" style="margin-bottom: 20px;">
					<button id="login" class="mui-btn mui-btn-primary mui-btn-block" style="padding:6px 0;" onclick="register();">注册</button>
					
				</div>
				
			</div>
		</div>
	</body>
	<script src="Public/script/zepto.min.js"></script>
	<script src="Public/script/api.js"></script>
	<script src="Public/script/common.js"></script>
	<script src="Public/script/showBo.js"></script>
	<script>
		$(function(){
			$(".mui-action-back").click(function(){
				history.back();
			});
		});
		function register(){
			var telephone=$("#telephone").val();
			var password=$("#password").val();
			var rpassword=$("#rpassword").val();
			var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
			if(!myreg.test(telephone)){ 
				showMsg('请输入有效的手机号码！'); 
			    return;
			} 
			if(password==""){
				showMsg('请输入密码！'); 
			    return;
			}
			if(rpassword==""){
				showMsg('请再次输入密码！'); 
			    return;
			}
			if(rpassword!=password){
				showMsg('密码不一致'); 
			    return;
			}
			var url=BaseUrl+"/tcbb_register";
			
			$.post(url,{telephone:telephone,password:password},function(json){
				
				console.log(JSON.stringify(json));
				showMsg(json.msg);
				if(json.status==1){
					localStorage.setItem(USERID,json.uid);
					setTimeout(function(){window.location.href="<?php echo $_GET['form'];?>";},1000);
					
				}
			},'json');
		}
		function showMsg(msg){
			Showbo.Msg.alert(msg);
		}
	</script>
</html>