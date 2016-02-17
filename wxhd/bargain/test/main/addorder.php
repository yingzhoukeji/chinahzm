<?php
require_once("../../include/config.db.php");
require_once("../../include/db.class.php");
require_once("../../include/common.php");
require_once("config.wx.php");
header("Content-Type:text/html;charset=utf-8");
session_start();
//是否参加报名
$isjoin=false;
$bargain_id=$_SESSION["bargain_id"];
$openid=$_SESSION["openid"];
$deposit=$_GET['deposit'];
$currprice=$_GET['currprice'];
$db=new db();
$bargain=$db->table('bargain')->where(array('id'=>$bargain_id))->find();
$join=$db->table('join')->where(array('bargainid'=>$bargain_id,'openid'=>$openid))->find();
?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<title>填写购买信息</title>
		<link rel="stylesheet" href="../../css/mui.min.css">
		<link rel="stylesheet" href="../../css/sweet-alert.css">
		<link rel="stylesheet" href="../../css/index.css">
        <link rel="stylesheet" href="../../css/frozen.css" />
		<link rel="stylesheet" type="text/css" href="../../css/path_menu.css"/>
	</head>
	<body>
		<div class="mui-content mui-scroll"><div style="height:50px !important; clear:bothl; overflow:hidden; background:#00763D">
			<div style="line-height:30px; padding:10px 20px 0 0 !important;  float:right;"><a href="http://www.chinahzm.cn/wx/html/product/search.html" style="color:rgba(255,255,255,1.00);"><samp class="mui-icon mui-icon-search"></samp></a></div>
			<a href="javascript:history.back();"><img src="http://www.chinahzm.cn/wx/images/logo.png" height="40"/></a>

		</div>
			<div class="welcome">欢迎<span style="color:red;"><?php echo $_SESSION["nickname"];  ?></span>购买大森产品！砍后价格<span style="color:red;"><?php echo $currprice;?>元</span>，该产品需要支付<span style="color:red;"><?php echo $deposit;?></span>定金</div>
			<form id="joinForm" class="mui-input-group" action="addorder_submit.php" method="post">
					<div class="mui-input-row">
						<label>姓名：</label>
						<input type="text" id="name" name="name" value="<?php echo $join['name'];?>" placeholder="请输入姓名">
					</div>
					<div class="mui-input-row">
						<label>手机号码：</label>
						<input type="tel" id="phone" name="phone" value="<?php echo $join['phone'];?>" class="mui-input-clear" placeholder="请输入电话号码">
					</div>
					<div class="mui-input-row">
						<label>公司名称：</label>
						<input type="text" id="company" name="company" value="<?php echo $join['company'];?>" class="mui-input-clear" placeholder="请输入公司名称">
					</div>
					<div class="mui-button-row" style="margin:10px; clear:both; padding:0 0 200px 0">
                    
<button class="mui-btn mui-btn-primary mui-btn-block" type="button" id="mysubmit">确定购买</button>
<button class="mui-btn mui-btn-negative mui-btn-block" type="button" id="back">取消购买</button>

					</div>
					<input type="hidden" name="openid" value="<?php echo $openid;?>" placeholder="请输入姓名">
					<input type="hidden" name="deposit" value="<?php echo $deposit;?>" placeholder="请输入姓名">
					<input type="hidden" name="bargainid" value="<?php echo $bargain_id;?>" placeholder="请输入姓名">
					<input type="hidden" name="currprice" value="<?php echo $currprice;?>" placeholder="请输入姓名">
			</form>
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
	<script type="text/javascript" src="../../js/zepto.min.js" ></script>
	<script type="text/javascript" src="../../js/sweet-alert.min.js" ></script>
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