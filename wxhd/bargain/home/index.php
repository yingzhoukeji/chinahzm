<?php
require_once("rand.php");
require_once("../include/config.db.php");
require_once("../include/db.class.php");
require_once("config.wx.php");
require_once("../include/jssdk.php");
require_once("../include/log.php");
header("Content-Type:text/html;charset=utf-8");
error_reporting(0);
session_start();
$logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
$log = Log::Init($logHandler, 15);
//是否参加报名
$isjoin=false;
$ismyself=false;
$bargain_id=$_GET['id'];
/*if(empty($bargain_id)){
	echo '<script>window.location.href="bargainlist.php"</script>';
	exit();
}*/
if(empty($bargain_id)){
	//$bargain_id=0;
}
Log::DEBUG("forword：".$bargain_id);
$from='0';
if(isset($_GET['userfrom'])){
	$from=$_GET['userfrom'];
}
$_SESSION["bargain_id"]=$bargain_id;
$_SESSION["from"]=$from;
$page=0;

if(!isset($_SESSION["openid"])){
	echo '<script>window.location.href="login.php"</script>';
	exit();
}
$db=new db();
$bargain=$db->table('bargain')->where(array('id'=>$bargain_id))->find();
$checkjoin=null;
if($from!='0'){
	$checkjoindata["openid"]=$_SESSION["openid"];
	$checkjoindata["bargainid"]=$_SESSION["bargain_id"];
	$checkjoin=$db->table('join')->where($checkjoindata)->find();
	//已经参加报名
	
	if($checkjoin){
		$isjoin=true;
		if($_SESSION["openid"]!=$from){
			$ismyself=false;
			$checkjoindata["openid"]=$from;
			$checkjoindata["bargainid"]=$_SESSION["bargain_id"];
			$checkjoin=$db->table('join')->where($checkjoindata)->find();
		}else{
			$ismyself=true;
		}
	}else{
		$ismyself=false;
		$isjoin=false;
		$checkjoindata["openid"]=$from;
		$checkjoindata["bargainid"]=$_SESSION["bargain_id"];
		$checkjoin=$db->table('join')->where($checkjoindata)->find();
	}
	//展示亲友团
	
}else{
	//如果从后台发布的，则需要进行报名
	//echo '<script>window.location.href="join.php"</script>';
	$checkjoindata["openid"]=$_SESSION["openid"];
	$checkjoindata["bargainid"]=$_SESSION["bargain_id"];
	Log::DEBUG("forword1111：".$_SESSION["bargain_id"]);
	$checkjoin=$db->table('join')->where($checkjoindata)->find();
	if($checkjoin){
		$forword='index.php?id='.$_SESSION["bargain_id"].'&userfrom='.$_SESSION["openid"].'&param=xxx';
		//echo '<script>alert("'.$forword.'")</script>';
		Log::DEBUG("forword：".$forword);
		echo '<script>window.location.href="'.$forword.'"</script>';
	}else{
		echo '<script>window.location.href="join.php"</script>';
	}
}
$joinid=$checkjoin['id'];
//$myfriends=$db->table('friend')->where(array('joinid'=>$joinid))->limit($page,10)->order('id asc')->select();

$pagesize=10;
$allfriend=$db->query('select * from pa_friend where joinid='.$joinid);
$count=count($allfriend);
$pages=(int)($count/$pagesize);
if($count%$pagesize) $pages++;
if(isset($_GET['page'])){
	$page=(int)$_GET['page'];
}else{
	$page=1;
}
$offset=$pagesize*($page - 1);
$sql="select * from pa_friend where joinid=".$joinid." order by price DESC limit ".$offset.",".$pagesize;
$myfriends=$db->query($sql);
$prev=$page-1;
$next=$page+1;
$prevURL="#";
if($prev>0){
	$prevURL='index.php?id='.$bargain_id.'&userfrom='.$from.'&page='.$prev.'&param=xxx';
}
$nextURL="#";
if($next<=$pages){
	$nextURL='index.php?id='.$bargain_id.'&userfrom='.$from.'&page='.$next.'&param=xxx';
}
//微信分享调用
$jssdk = new JSSDK(WX_APPID,WX_APPSECRET);
$signPackage = $jssdk->GetSignPackage('http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
//Log::DEBUG("微信签名：".json_encode($signPackage));
?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<title><?php echo $bargain['title'];?></title>
		<link rel="stylesheet" href="../css/mui.min.css">
		<link rel="stylesheet" href="../css/index.css">
		<link rel="stylesheet" href="../css/sweet-alert.css">
		<link rel="stylesheet" href="../css/frozen.css" />
		<link rel="stylesheet" type="text/css" href="../css/path_menu.css"/>
	</head>
	<body>
		<div class="mui-content mui-scroll">
			<div class="product-img">
				<img id="img" src="<?php echo $bargain['img']  ?>">
			</div>
			<div class="bargain-title"><?php echo $bargain['title'];?></div>
			<?php 
				if(strtotime($bargain['endtime'])>strtotime(date('Y-m-d H:i:s',time()))){
					echo '<div class="count-down" ></div>';
				}else{
					echo '<div class="bargainstart" style="position: absolute;top: 280px;left: 0;right: 0;text-align: center;background-color:rgba(0,0,0,0.5);color:#fff;padding:10px 10px;">活动已经结束</div>';
					echo '<div class="count-down" style="display:none"></div>';
				}
				//echo '<div class="count-down" ></div>';
			?>
			
			<div class="curr-bargain">
				已经有<span style="color:red;"><?php echo $count; ?></span>位朋友，帮
				<?php
					if($ismyself){
						echo "<span style='color:red'>你</span>砍价了。当前价格为";
						echo '<span style="color:red;">'.$checkjoin['price'].'</span>';
						echo ',快邀请你的好友帮你砍价吧！';
					}else{
						echo "<span style='color:red'>".$checkjoin['name']."</span>砍价了。当前价格为";
						echo '<span style="color:red;">'.$checkjoin['price'].'</span>';
						echo '，你也来帮他砍一刀吧！分享给你的朋友，为他助力！';
					}
				?>
				
			</div>
			<div class="bargain-btn">
				<?php
				if(strtotime($bargain['endtime'])>strtotime(date('Y-m-d H:i:s',time()))){
					if($ismyself){
						echo '<div class="mui-btn mui-btn-danger" onclick="myorder()">申请购买</div><div style="margin-left:5px;" class="mui-btn mui-btn-danger"><a style="color:#fff" href="shopcart.php">购物车</a></div>';
					}else{
						echo '<div class="mui-btn mui-btn-danger" id="rand">帮砍一刀</div><div style="margin-left:5px;" class="mui-btn mui-btn-danger"><a style="color:#fff" href="join.php">我要参加</a></div>';
					}
				}else{
					
				}
					
				?>
				<!--<div class="mui-btn mui-btn-danger" id="rand">
					帮砍一刀
				</div>
				<div class="mui-btn mui-btn-danger">
					<a style="color:#fff" href="join.php">我要参加</a>
				</div>-->
			</div>
			<div class="friend-table">
				<table>
					<tr>
						<th>亲友团</th>
						<th>砍掉价格</th>
						<th>砍后价格</th>
					</tr>
					<?php
						
						for($j=0;$j<count($myfriends);$j++){
							$html='<tr><td>'.$myfriends[$j]['nickname'].'</td><td>&#165; '.$myfriends[$j]['price'].'</td><td>&#165; '.$myfriends[$j]['after'].'</td></tr>';
							echo $html;
						}
					?>
					
					
				</table> <div class="bargain-btn" style="padding-top: 20px;">
								<button type="button" style="width:35%;padding:3px 10px;" class="mui-btn mui-btn-primary mui-btn-outlined">
									<a href="<?php echo $prevURL;?>">上一页</a>
								</button>
								<button type="button" style="width:35%;padding:3px 10px;" class="mui-btn mui-btn-primary mui-btn-outlined">
									<a href="<?php echo $nextURL;?>">下一页</a>
								</button>
							</div>
						
				<br>
			</div>
			
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
		var starttime='<?php echo $bargain['endtime']  ?>';
	</script>
	<script type="text/javascript" src="../js/countdown.js" ></script>
	<script>
		$(function(){
			//alert($('html').html());
			startclock();
			
			$("#rand").click(function(){
				rand();
			});
		});
		<?php 
			$otherjoin=null;
			if(!$ismyself){
				$checkjoindata["openid"]=$from;
				$checkjoindata["bargainid"]=$_SESSION["bargain_id"];
				$otherjoin=$db->table('join')->where($checkjoindata)->find();
		?>
			function rand(){
				
				var id=<?php echo $bargain_id;?>;
				var joinid=<?php echo $otherjoin['id'];?>;
				var data={};
				data.id=id;
				
				data.joinid=joinid;
				$.post("ajax_kanjia.php",data,function(json){
					if(json.status==1){
						swal("你成功砍掉了"+json.rand);
						setTimeout(function(){
							window.location.href="index.php?id=<?php echo $bargain_id; ?>&userfrom=<?php echo $from; ?>&param=xxx";
						},2000);
						
					}else{
						swal(json.msg);
					}
				},'json');
			}
		<?php
			}
			
		?>
		var jsApiList=[
				'checkJsApi',
				'onMenuShareTimeline',
				'onMenuShareAppMessage',
				'onMenuShareQQ',
				'onMenuShareWeibo'	
			];
		wx.config({
			debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			appId: "<?php echo $signPackage['appId']; ?>", // 必填，公众号的唯一标识
			timestamp: "<?php echo $signPackage['timestamp']; ?>", // 必填，生成签名的时间戳
			nonceStr: "<?php echo $signPackage['nonceStr']; ?>", // 必填，生成签名的随机串
			signature: "<?php echo $signPackage['signature']; ?>",// 必填，签名，见附录1
			jsApiList: jsApiList // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		wx.ready(function(){
			wx.onMenuShareTimeline({
				title: "<?php echo $_SESSION["nickname"]; ?>参与了<?php echo $bargain['sharetitle']; ?>", // 分享标题
				link: document.URL, // 分享链接
				imgUrl: "<?php echo 'http://'.$_SERVER['HTTP_HOST'].$bargain['shareimg']; ?>", // 分享图标
				success: function () { 
					//alert(picUrl+"/wxhd/detail.html?id="+hdObj.id+user.openid);
				},
				cancel: function () { 
					
				}
			});
			wx.onMenuShareAppMessage({
				title:"<?php echo $_SESSION["nickname"]; ?>参与了<?php echo $bargain['sharetitle']; ?>", // 分享标题
				desc: "<?php echo $bargain['sharedec']; ?>", // 分享描述
				link: document.URL, // 分享链接
				imgUrl: "<?php echo 'http://'.$_SERVER['HTTP_HOST'].$bargain['shareimg']; ?>", // 分享图标
				success: function () { 
					// 用户确认分享后执行的回调函数
					//alert(picUrl+"/wxhd/detail.html?id="+hdObj.id+user.openid);
				},
				cancel: function () { 
					// 用户取消分享后执行的回调函数
				}
			});
			wx.error(function (res) {
				alert(res.errMsg);
			});
		});
		
		function myorder(){
			window.location.href="addorder.php?deposit=<?php echo $bargain['deposit']; ?>&currprice=<?php echo $checkjoin['price']; ?>";
		}
		
	</script><div style="display:none"><script src="http://s4.cnzz.com/stat.php?id=1255818854&web_id=1255818854" language="JavaScript"></script></div>

</html>