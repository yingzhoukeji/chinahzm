<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>砍价销售榜</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link rel="stylesheet" href="/wxhd/css/mui.min.css">
		<link rel="stylesheet" href="/wxhd/css/frozen.css" />
		<link rel="stylesheet" type="text/css" href="/wxhd/css/path_menu.css"/>
		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<style>
				.ui-notice{top: 0;z-index: -1;}
				.ui-dialog{margin: 0!important;padding: 0!important;  background: rgba(0,0,0,.65);opacity: 0.8;display:none;}
		</style>
		<style>
			body {
				color: #222;
				font-family: Microsoft YaHei, Helvitica, Verdana, Tohoma, Arial, san-serif;
				margin: 0;
				padding: 0;
				text-decoration: none;
			}
			
			.mui-bar-nav a{color: #fff;}
			.mui-bar-nav a:active {
			  color: #fff;
			}
			.mui-title{color: #fff;}
			.mui-content-padded {
			  font-size: 14px;
			  margin: 10px;
			  color: #333;
			}
			
			html,
			body {
				height: 100%;
				margin: 0px;
				padding: 0px;
				overflow: hidden;
				-webkit-touch-callout: none;
				-webkit-user-select: none;
			}
			
			
			.product-info{margin: 5px;border: 1px solid #ddd;border-radius: 3px;}
			.product-img{height: 200px;width: 100%;padding: 0px;}
			.product-img img{height: 100%;width: 100%;}
			.product-title{font-size: 14px;}
			.product-title span{font-size: 13px;}
			.company{font-size: 12px;}
			
			#msglist .mui-table-view-cell{
				 padding: 15px 15px;
				 font-size: 12px;
			}
			.mui-table-view-divider{background-color: #026634;color:#fff;font-size:16px;}
			.message span{width: 50%;font-size: 12px;text-align: center;}
			.message span:first-child{border-right: 1px solid #ddd;}
			.content,.canshu{
				  font-size: 12px;
				  padding: 10px;
				  background: #026634;
				  color:#fff;
			}
			.mui-content{position: fixed;left: 0;right: 0;top:0;bottom: 0;overflow-y: auto;}
			::-webkit-scrollbar{width: 0px;}
			.content img{display: none;width: 100%!important;max-height: 200px;}
			.content table{width: 100%!important;overflow-x: hidden;}
			.msgPanel{position: fixed;width: 100%;bottom: 0;top: 0;z-index: 100000;}
			.sharebtn{
				float: right;
				  margin-top: -30px;
				  background: #000;
				  color: #fff;
				  padding: 5px;
				  border-radius: 3px;
			}
			#mcover {
			  position: fixed;
			  top: 0;
			  left: 0;
			  width: 100%;
			  height: 100%;
			  background: rgba(0, 0, 0, 0.7);
			  display: none;
			  z-index: 20000;
			}
			#mcover img {
			  position: fixed;
			  right: 18px;
			  top: 5px;
			  width: 260px!important;
			  height: 180px!important;
			  z-index: 20001;
			}/* 底部 */		
#footer {background-color:#008643;
z-index:999;
position:fixed;
bottom:0;
left:0;
width:100%;
_position:absolute;
_top: expression_r(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight);
overflow:visible;
}  
#footer ul{ margin:0; padding:0; line-height:50px; border-top: #006C36 1px solid; width:100%}
#footer li{width:24%; float:left; text-align:center;list-style-type:none;}
#footer li a{ color:rgba(255,255,255,1.00);}
		</style>
	</head>
	<body>	        
		<div class="mui-content">
        <div style="height:50px !important; clear:bothl; overflow:hidden; background:#00763D">
			<div style="line-height:30px; padding:10px 20px 0 0 !important;  float:right;"><a href="http://www.chinahzm.cn/wx/html/product/search.html" style="color:rgba(255,255,255,1.00);"><samp class="mui-icon mui-icon-search"></samp></a></div>
			<a href="javascript:history.back();"><img src="http://www.chinahzm.cn/wx/images/logo.png" height="40"/></a>

		</div>
			<ul id="list" class="mui-table-view mui-table-view-chevron">
				<?php
					require_once("../../include/config.db.php");
					require_once("../../include/db.class.php");
					require_once("../../include/common.php");
					$db=new db();
					$orders=$db->table("order")->select();
					for($i=0;$i<count($orders);$i++){
						echo '<li class="mui-table-view-cell mui-media">';
						echo '<a><div class="mui-media-body">'.$orders[$i]['name'].'<p class="mui-ellipsis">砍后购买价格：'.$orders[$i]['currprice'].' 元</p></div></a></li>';
					}
				?>
			</ul>
		</div> <nav class="mui-bar mui-bar-tab">
    <a class="mui-tab-item " href="/wx/">
		<span class="mui-icon mui-icon-home"></span>
		<span class="mui-tab-label">大森官网</span>
	</a>
	<a class="mui-tab-item" href="bargainlist.php">
		<span class="mui-icon mui-icon-starhalf"></span>
		<span class="mui-tab-label">砍价活动</span>
	</a>
    <a class="mui-tab-item mui-active" href="orderlist.php">
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
	
</html>
