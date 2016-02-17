<?php
	require_once("config.wx.php");
	$appid = WX_APPID;
	$redirect_uri=urlencode("http://www.chinahzm.cn/wxhd/bargain/test/main/oauth.php");
	header('location:https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$appid.'&redirect_uri='.$redirect_uri.'&response_type=code&scope=snsapi_userinfo&state=123&connect_redirect=1#wechat_redirect');
?>