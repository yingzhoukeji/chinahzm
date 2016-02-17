<?php
require_once("../include/config.db.php");
require_once("../include/db.class.php");
require_once("../include/common.php");
require_once("config.wx.php");
require_once("../include/log.php");
header("Content-Type:text/html;charset=utf-8");
error_reporting(0);
session_start();
$logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
$log = Log::Init($logHandler, 15);
//是否参加报名
$isjoin=false;
$bargain_id=$_SESSION["bargain_id"];
$from=$_SESSION["from"];
/*if(!isset($_SESSION["openid"])){
	echo '<script>window.location.href="login.php"</script>';
	exit();
}*/
Log::DEBUG("bargain_id----->".$bargain_id);
$db=new db();
$bargain=$db->table('bargain')->where(array('id'=>$bargain_id))->find();
if((int)$from!=0){
	$checkjoindata["openid"]=$_SESSION["openid"];
	$checkjoindata["bargainid"]=$_SESSION["bargain_id"];
	$checkjoin=$db->table('join')->where($checkjoindata)->find();
	Log::DEBUG("开始-判断是否报名-----------------------------------开始");
	Log::DEBUG("openid->".$_SESSION["openid"]);
	Log::DEBUG("bargainid->".$_SESSION["bargain_id"]);
	Log::DEBUG("checkjoin->".json_encode($checkjoin));
	Log::DEBUG("结束-判断是否报名-----------------------------------结束");
	//已经参加报名
	if($checkjoin){
		$isjoin=true;
		echo buildErrPage("你已经参加了本次砍价活动,不能重复报名！");
	}
}

?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<title>报名大森砍价活动</title>
		<link rel="stylesheet" href="../css/mui.min.css">
		<link rel="stylesheet" href="../css/sweet-alert.css">
		<link rel="stylesheet" href="../css/index.css">
        <link rel="stylesheet" href="../css/frozen.css" />
		<link rel="stylesheet" type="text/css" href="../css/path_menu.css"/>
	</head>
	<body>
		<div class="mui-content mui-scroll"><div style="height:50px !important; clear:bothl; overflow:hidden; background:#00763D">
			<div style="line-height:30px; padding:10px 20px 0 0 !important;  float:right;"><a href="http://www.chinahzm.cn/wx/html/product/search.html" style="color:rgba(255,255,255,1.00);"><samp class="mui-icon mui-icon-search"></samp></a></div>
			<a href="javascript:history.back();"><img src="http://www.chinahzm.cn/wx/images/logo.png" height="40"/></a>

		</div>
			<div class="welcome">欢迎<span style="color:red;"><?php echo $_SESSION["nickname"];  ?></span>报名大森砍价活动！</div>
			<form id="joinForm" class="mui-input-group" action="join_submit.php" method="post">
					<div class="mui-input-row">
						<label>姓名：</label>
						<input type="text" id="name" name="name" placeholder="请输入姓名">
					</div>
					<div class="mui-input-row">
						<label>手机号码：</label>
						<input type="tel" id="phone" name="phone" class="mui-input-clear" placeholder="请输入电话号码">
					</div>
					<div class="mui-input-row">
						<label>公司名称：</label>
						<input type="text" id="company" name="company" class="mui-input-clear" placeholder="请输入公司名称">
					</div>
					<div class="mui-button-row" style="margin:10px; clear:both; padding:0 0 60px 0">
						<button type="button" id="mysubmit" class="mui-btn mui-btn-primary mui-btn-block">确认参加</button>
					</div>
					<div class="mui-button-row" style="margin:10px; clear:both; padding:0 0 100px 0">
						<button type="button" id="back" class="mui-btn mui-btn-negative mui-btn-block">取消参加</button>
					</div>
				</form>
			<div style="margin: 10px 5px 5px 5px;clear:both;border-bottom: solid 1px #DBDADA; padding:10px 0;">
				<b style="color:#00763d; font-size:15px;"><span>■</span> 活动介绍</b>
			</div>
			<div class="products-detail"><?php echo $bargain['bargain_info']  ?></div>
			<div style="margin: 10px 5px 5px 5px;clear:both;border-bottom: solid 1px #DBDADA; padding:10px 0;">
				<b style="color:#00763d; font-size:15px;"><span>■</span> 活动规则</b>
			</div>
			<div class="products-detail"><?php echo $bargain['bargain_rule']  ?></div>
            <div style="margin: 10px 5px 5px 5px;clear:both;border-bottom: solid 1px #DBDADA; padding:10px 0;">
				<b style="color:#00763d; font-size:15px;"><span>■</span> 商品详情</b>
			</div>
			<div class="products-detail" style="margin:0 0 50px 0;">
				<?php echo $bargain['content']  ?>
			</div>
			
		</div>
<nav class="mui-bar mui-bar-tab">
    <a class="mui-tab-item " href="/wx/">
		<span class="mui-icon mui-icon-home"></span>
		<span class="mui-tab-label">大森官网</span>
	</a>
	<a class="mui-tab-item mui-active" href="bargainlist.php">
		<span class="mui-icon mui-icon-starhalf"></span>
		<span class="mui-tab-label">砍价活动</span>
	</a>
    <a class="mui-tab-item" href="orderlist.php">
		<span class="mui-icon mui-icon-list"></span>
		<span class="mui-tab-label">砍价销售榜</span>
	</a>
	<a class="mui-tab-item" href="http://www.chinahzm.cn/wxhd/list.html">
		<span class="mui-icon mui-icon-pengyouquan"></span>
		<span class="mui-tab-label">分享活动</span>
	</a>
	<a class="mui-tab-item" href="tel:13738578698">
		<span class="mui-icon mui-icon-phone"></span>
		<span class="mui-tab-label">咨询</span>
	</a>
</nav> 
	</body>
	<script type="text/javascript" src="../js/zepto.min.js" ></script>
	<script type="text/javascript" src="../js/sweet-alert.min.js" ></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script>
		$(function(){
			$("#mysubmit").click(function(){
				mysubmit();
			});
			$("#back").click(function(){
				history.back();
			});
		});
		function mysubmit(){
			var name=$("#name").val();
			var phone=$("#phone").val();
			var company=$("#company").val();
			if(name==""){
				swal("请输入姓名！");
				return;
			}
			if(phone==""){
				swal("请输入手机号码！");
				return;
			}
			if(phone.length!=11){
				swal("请输入正确的手机号码！");
				return;
			}
			
			$("#joinForm").submit();
		}
	</script>
	
</html>