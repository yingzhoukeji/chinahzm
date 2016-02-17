<?php
//微信接口
class WeixinAction extends Action {
    public function index(){
    	$this->display("check1");
    }
	public function login(){
		//换成自己的接口信息
    	$appid = 'wxc820504dfda73992';
    	$redirect_uri=urlencode("http://www.chinahzm.cn/jyst/api.php/Weixin/oauth");
    	header('location:https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$appid.'&redirect_uri='.$redirect_uri.'&response_type=code&scope=snsapi_userinfo&state=123&connect_redirect=1#wechat_redirect');
	}
    public function oauth(){
    	$code = $_GET['code'];
    	$state = $_GET['state'];
    	//换成自己的接口信息
    	$appid = 'wxc820504dfda73992';
    	$appsecret = '8d545776ff603e9448e5851582f250b5';
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
    	$this->assign("user",$userstr);
    	$this->display();
    }
    public function app(){
    	$this->display("index");
    }
	
}