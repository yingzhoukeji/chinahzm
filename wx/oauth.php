<?php
	$code = $_GET['code'];
	$state = $_GET['state'];
	//换成自己的接口信息
	$appid = 'wx6dddc292e71c1d00';
	$appsecret = 'f1fd5dea6a68b162abfe935c91fdada6';
	if (empty($code)) $this->error('授权失败');
	$token_url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid='.$appid.'&secret='.$appsecret.'&code='.$code.'&grant_type=authorization_code';
	$token = json_decode(file_get_contents($token_url));
	if (isset($token->errcode)) {
		echo '<h1>错误1：</h1>'.$token->errcode;
		echo '<br/><h2>错误信息1：</h2>'.$token->errmsg;
		exit;
	}
	$access_token_url = 'https://api.weixin.qq.com/sns/oauth2/refresh_token?appid='.$appid.'&grant_type=refresh_token&refresh_token='.$token->refresh_token;
	//转成对象
	$access_token = json_decode(file_get_contents($access_token_url));
	if (isset($access_token->errcode)) {
		echo '<h1>错误2：</h1>'.$access_token->errcode;
		echo '<br/><h2>错误信息2：</h2>'.$access_token->errmsg;
		exit;
	}
	$user_info_url = 'https://api.weixin.qq.com/sns/userinfo?access_token='.$access_token->access_token.'&openid='.$access_token->openid.'&lang=zh_CN';
	$userstr=file_get_contents($user_info_url);
	
?>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>浙江海之梦股份有限公司</title>
		 <script src="js/zepto.min.js"></script>
	</head>

	<body>
		<script>
			var serverUrl="http://www.chinahzm.cn/dsapi/api.php/Index";
			var user='<?php echo $userstr; ?>';
			$(function(){
				localStorage.setItem("wx_user",user);
				localStorage.setItem("islogin",1);
				var userObj=JSON.parse(user);
				var check_url=serverUrl+"/checkOpenId?openid="+userObj.openid+"&callback=?";
				$.getJSON(check_url,function(json){
					//alert(JSON.stringify(json));
					if(json.status==0){
						var addwx_url=serverUrl+"/synuser?openid="+userObj.openid+"&headimgurl="+userObj.headimgurl+"&province="+userObj.province+"&city="+userObj.city+"&nickname="+userObj.nickname+"&callback=?";
						$.getJSON(addwx_url,function(data){
							if(data.status==1){
								localStorage.setItem("uid",data.msg);
								localStorage.setItem("username",userObj.nickname);
								localStorage.setItem("email","");
								localStorage.setItem("phone","");
								window.location.href="index.html";
							}
							
						});
					}else{
						
						var data=json.data;
						localStorage.setItem("uid",data.uid);
						localStorage.setItem("username",data.nickname);
						localStorage.setItem("email","");
						localStorage.setItem("phone","");
						window.location.href="index.html";
					}
				});
			});
			
		</script>
	</body>

</html>