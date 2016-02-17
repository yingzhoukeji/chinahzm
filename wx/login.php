<?php
	//换成自己的接口信息
	$appid = 'wx6dddc292e71c1d00';
	$redirect_uri=urlencode("http://www.chinahzm.cn/wx/oauth.php");
	header('location:https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$appid.'&redirect_uri='.$redirect_uri.'&response_type=code&scope=snsapi_userinfo&state=123&connect_redirect=1#wechat_redirect');
?>