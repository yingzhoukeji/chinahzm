<?php
	require_once("config.wx.php");
	require_once("../../include/config.db.php");
	require_once("../../include/db.class.php");
	require_once("../../include/log.php");
	$code = $_GET['code'];
	$state = $_GET['state'];
	//换成自己的接口信息
	$appid = WX_APPID;
	$appsecret = WX_APPSECRET;
	if (empty($code)) $this->error('授权失败');
	$token_url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid='.$appid.'&secret='.$appsecret.'&code='.$code.'&grant_type=authorization_code';
	$token = json_decode(file_get_contents($token_url));
	if (isset($token->errcode)) {
		echo '<h1>错误：</h1>'.$token->errcode;
		echo '<br/><h2>错误信息：</h2>'.$token->errmsg;
		exit;
	}
	$access_token_url = 'https://api.weixin.qq.com/sns/oauth2/refresh_token?appid='.$appid.'&grant_type=refresh_token&refresh_token='.$token->refresh_token;
	//转成对象
	$access_token = json_decode(file_get_contents($access_token_url));
	if (isset($access_token->errcode)) {
		echo '<h1>错误：</h1>'.$access_token->errcode;
		echo '<br/><h2>错误信息：</h2>'.$access_token->errmsg;
		exit;
	}
	$user_info_url = 'https://api.weixin.qq.com/sns/userinfo?access_token='.$access_token->access_token.'&openid='.$access_token->openid.'&lang=zh_CN';
	$userstr=file_get_contents($user_info_url);
	$logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
	$log = Log::Init($logHandler, 15);
	Log::DEBUG("--------------------------------------------------------------------");
	Log::DEBUG("授权成功！");
	Log::DEBUG("微信用户信息：".$userstr);
	Log::DEBUG("--------------------------------------------------------------------");
	$db=new db();
	$wxuserObj=json_decode($userstr);
	$openid=$wxuserObj->openid;
	//判断数据是否存在，不存在则添加
	$checkwxuser=$db->table('wxuser')->field('id')->where(array('openid'=>$openid))->find();
	if(!$checkwxuser){
		$wxuserObj->ip=$_SERVER["REMOTE_ADDR"];
		$wxuserObj->createtime=date('Y-m-d H:m:s', time());
		$db->table('wxuser')->data($wxuserObj)->insert();
	}
	 session_start();
	 $_SESSION["openid"]=$openid;
	 $_SESSION["nickname"]=$wxuserObj->nickname;
	 $_SESSION["headimgurl"]=$wxuserObj->headimgurl;
	 $url='index.php?id='.$_SESSION["bargain_id"].'&userfrom='.$_SESSION["from"].'&param=xxx';
	 echo '<script>window.location.href="'.$url.'"</script>';
?>

</html>