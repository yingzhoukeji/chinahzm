<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>修改密码</title>
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
		<div id="panels" class="mui-content mui-fullscreen" style="top:0px;">
			<div id="ts_login_panel" class="mui-content-padded" style="margin: 20px;">
				<div class="mui-input-group">
					<div class="mui-input-row">
						<input id="newpass" type="password" placeholder="输入新密码">
					</div>
					<div class="mui-input-row" style="margin-top: -1px;">
						<input id="rpass" type="password" placeholder="再次输入密码">
					</div>
				</div>
				
				<div class="mui-button-row" style="margin-bottom: 20px;">
					<button id="login" class="mui-btn mui-btn-primary mui-btn-block" style="padding:6px 0;" onclick="login();">确定修改</button>
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
		
		function login(){
			var newpass=$("#newpass").val();
			var rpass=$("#rpass").val();
			var uid=localStorage.getItem(USERID);
			if(newpass==""){
				showMsg('请输入新密码！'); 
			    return;
			}
			if(rpass==""){
				showMsg('请再次输入新密码！'); 
			    return;
			}
			if(rpass!=newpass){
				showMsg('密码不一致！'); 
			    return;
			}
			var url=BaseUrl+"/update_pass";
			
			$.post(url,{userid:uid,password:newpass},function(json){
				
				showMsg(json.msg);
				if(json.status==1){
					setTimeout(function(){window.location.href="usercenter.php";},1000);
				}
			},'json');
		}
		function showMsg(msg){
			Showbo.Msg.alert(msg);
		}
	</script>
</html>