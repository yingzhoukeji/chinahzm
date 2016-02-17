<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>个人中心</title>
<link rel="stylesheet" href="css/app.css">
<link rel="stylesheet" href="css/mui.min.css">
<link rel="stylesheet" href="Public/css/showBo.css" />
<style>
.huiyuntx{margin:0; padding:20px; width:100%; clear:both; overflow:hidden; height:130px;
animation:myfirst 5s infinite linear ;
-moz-animation:myfirst 5s infinite linear ; /* Firefox */
-webkit-animation:myfirst 5s infinite linear ; /* Safari and Chrome */
-o-animation:myfirst 5s infinite linear ; /* Opera */
}
.mui-table-view{ font-size:18px !important; }
.huiyuntx .txiang{margin:0; padding:0; width:100%; height:130px; clear:both; overflow:hidden; text-align:center;}
.huiyuntx .txiang img{margin:0 auto; padding:0; width:80px; height:80px; clear:both; overflow:hidden; border-radius: 100%; }
.huiyuntx .txiang samp{margin:0; padding:0; height:30px; clear:both; overflow:hidden; line-height:30px; color:#FFF; font-weight:bold;text-shadow:#000 0 1px 0;}
.mui-icon{font-size:14px;}
@keyframes myfirst
{
0%   {background: #FEB544;}
25%  {background: #EA4B47;}
50%  {background: #4FBC82;}
100% {background: #6E3294;}
}

@-moz-keyframes myfirst /* Firefox */
{
0%   {background: #FEB544;}
25%  {background: #EA4B47;}
50%  {background: #4FBC82;}
100% {background: #6E3294;}
}

@-webkit-keyframes myfirst /* Safari 和 Chrome */
{
0%   {background: #FEB544;}
25%  {background: #EA4B47;}
50%  {background: #4FBC82;}
100% {background: #6E3294;}
}

@-o-keyframes myfirst /* Opera */
{
0%   {background: #FEB544;}
25%  {background: #EA4B47;}
50%  {background: #4FBC82;}
100% {background: #6E3294;}
}


</style>
	</head>

	<body>
<div class="mui-content">
<div class="huiyuntx">
    <div class="txiang"><img src="images/logo.png"><br><samp id="parallax"></samp></div>
</div>


<ul id="userinfo" class="mui-table-view">
    <li class="mui-table-view-cell" onclick="my_order();">
        <a  class="mui-navigate-right">
            <span class="mui-icon iconfont">&#xe6c2;</span> 我的订单
        </a>
    </li>
    <li class="mui-table-view-cell" onclick="openCart();">
        <a  class="mui-navigate-right">
            <span class="mui-icon iconfont">&#xe601;</span> 购物车
        </a>
    </li>
    <li class="mui-table-view-cell" onclick="openAddr();">
        <a  class="mui-navigate-right">
            <span class="mui-icon iconfont">&#xe66d;</span> 我的地址
        </a>
    </li>
    <li class="mui-table-view-cell" onclick="open_updatePass();">
        <a class="mui-navigate-right">
            <span class="mui-icon iconfont">&#xe67c;</span> 修改密码
        </a>
    </li>
    <li class="mui-table-view-cell" onclick="logout();">
        <a class="mui-navigate-right">
            <span class="mui-icon iconfont">&#xe6ac;</span> 安全退出
        </a>
    </li>
</ul>
 

<ul class="mui-table-view" style=" margin:10px 0 50px 0;">
    <li class="mui-table-view-cell">
        <a href="pages/bzzx/list.php" class="mui-navigate-right"><span class="mui-icon iconfont">&#xe6af;</span> 帮助中心</a>
    </li>
    <li class="mui-table-view-cell">
        <a href="lxwm.html" class="mui-navigate-right"><span class="mui-icon iconfont">&#xe68c;</span> 联系我们</a>
    </li>
</ul>
</div>
	
		
 <nav class="mui-bar mui-bar-tab">
<a class="mui-tab-item" id="appindex"> <span class="mui-icon iconfont">&#xe6b1;</span> <span class="mui-tab-label">首页</span> </a>
<a class="mui-tab-item" id="appscsc"> <span class="mui-icon iconfont">&#xe68b;</span> <span class="mui-tab-label">食材商城</span> </a>
<a class="mui-tab-item" id="appskjs"> <span class="mui-icon iconfont">&#xe653;</span> <span class="mui-tab-label">积分商城</span> </a>
<a class="mui-tab-item" id="applzwm"> <span class="mui-icon iconfont">&#xe63a;</span> <span class="mui-tab-label">加盟合作</span> </a>
<a class="mui-tab-item mui-active" id="apphyzx"> <span class="mui-icon iconfont">&#xe6b5;</span> <span class="mui-tab-label">会员中心</span> </a> </nav>       

	</body>
    <script src="Public/script/zepto.min.js"></script>
	<script src="Public/script/api.js"></script>
	<script src="Public/script/common.js"></script>
	<script src="Public/script/showBo.js"></script>
	<script>
		var isshipaddr=0;
		$(function(){
			$(".mui-action-back").click(function(){
				history.back();
			});
			getUserinfo();
		});
		function my_order(){
			window.location.href="my_order.php";
		}
		function openAddr(){
			if(!islogin()){
				openLogin();
			}else{
				if(isshipaddr==0){
					window.location.href="pages/user/add_addr.php";
					
				}else if(isshipaddr==1){
					
					window.location.href="pages/user/edit_addr.php";
				}
			}
		}
		function openCart(){
			if(!islogin()){
				openLogin();
			}else{
				
				window.location.href="pages/shop/submit_order.php";
			}
		}
		function open_updatePass(){
			if(!islogin()){
				openLogin();
			}else{
				
				window.location.href="win_updatepass.php";
			}
		}
		function logout(){
			if(islogin()){
				localStorage.removeItem(USERID);
				Showbo.Msg.alert("已经退出登录！");
				$("#ts_phone").text("");
			}else{
				Showbo.Msg.alert("对不起，你未登录！");
			}
		}
		function getUserinfo(){
			if(localStorage.getItem(USERID)){
				var uid=localStorage.getItem(USERID);
				var url=BaseUrl+"/getUserInfo/userid/"+uid;
				$.getJSON(url,function(json){
					console.log(JSON.stringify(json));
					if(json.status==1){
						$("#ts_phone").text(json.data.telephone);
						isshipaddr=json.data.isshipaddr;
					}
				});
			}
		}
		function openDetail(title,name){
			window.location.href="pages/zjtcbb/detail.php?name="+name+"&title="+title;
		}

		function islogin(){
			var flag=false;
			if(localStorage.getItem(USERID)){
				flag=true;
			}
			return flag;
		}
		function openLogin(){
			 Showbo.Msg.confirm('你还没有登录，是否登录?',function(btn){
				if(btn=="yes"){
					login();
				}
			});
		}
		function login(){
			var currUrl="<?php echo urlencode('http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);?>";
			window.location.href="win_login.php?from="+currUrl;
		}

		
document.getElementById('appindex').addEventListener('tap', function() {
	window.location.href="/weidian/index.php";
});
document.getElementById('appscsc').addEventListener('tap', function() {
	window.location.href="/weidian/pages/shop/supplier.php";
});
document.getElementById('appskjs').addEventListener('tap', function() {
	window.location.href="/wxhd/list.html";
});
document.getElementById('applzwm').addEventListener('tap', function() {
	window.location.href="/weidian/pages/jmwm/list.php";
});
document.getElementById('apphyzx').addEventListener('tap', function() {
	window.location.href="/weidian/usercenter.php";
});
	</script><div style="display:none"><script src="http://s11.cnzz.com/stat.php?id=1257365777&web_id=1257365777" language="JavaScript"></script></div>
</html>