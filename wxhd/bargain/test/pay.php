<?php 
ini_set('date.timezone','Asia/Shanghai');
//error_reporting(E_ERROR);
header('Content-Type: text/html; charset=utf-8');
require_once "../lib/WxPay.Api.php";
require_once "WxPay.JsApiPay.php";
require_once("../include/config.db.php");
require_once("../include/db.class.php");
require_once("../include/common.php");
require_once("../include/log.php");
session_start();
$orderid=$_SESSION["orderid"];
$deposit=$_SESSION["deposit"];
$add_money=$deposit;

//初始化日志
$logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
$log = Log::Init($logHandler, 15);
$db=new db();
//打印输出数组信息
function printf_info($data)
{
    foreach($data as $key=>$value){
        echo "<font color='#00ff55;'>$key</font> : $value <br/>";
    }
}

//①、获取用户openid
$tools = new JsApiPay();
$tools->curl_timeout=300;
$openId =$_SESSION["openid"];//$tools->GetOpenid();
Log::DEBUG("openid1->".$_SESSION["openid"]);
Log::DEBUG("openid2->".$openId);
//②、统一下单
$input = new WxPayUnifiedOrder();
$input->SetBody("大森活动");
$input->SetAttach("大森活动");
$out_trade_no=WxPayConfig::MCHID.date("YmdHis");
$input->SetOut_trade_no($out_trade_no);
Log::DEBUG("out_trade_no->".$out_trade_no);
$input->SetTotal_fee($add_money*100);
$input->SetTime_start(date("YmdHis"));
$input->SetTime_expire(date("YmdHis", time() + 600));
$input->SetGoods_tag("大森活动");
$input->SetNotify_url("http://www.chinahzm.cn/wxhd/bargain/test/notify.php");
$input->SetTrade_type("JSAPI");
$input->SetOpenid($openId);
$order = WxPayApi::unifiedOrder($input);
$jsApiParameters = $tools->GetJsApiParameters($order);
Log::DEBUG("jsApiParameters->".$jsApiParameters);
$jsApiParametersObj=json_decode($jsApiParameters);
$db->table('order')->data(array("out_trade_no"=>$out_trade_no))->where(array("id"=>$orderid))->update();
//获取共享收货地址js函数参数
$editAddress = $tools->GetEditAddressParameters();
function build_order_no(){
    return date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
}
$myorderid=build_order_no();
//③、在支持成功回调通知中处理成功之后的事宜，见 notify.php
/**
 * 注意：
 * 1、当你的回调地址不可访问的时候，回调通知会失败，可以通过查询订单来确认支付是否成功
 * 2、jsapi支付时需要填入用户openid，WxPay.JsApiPay.php中有获取openid流程 （文档可以参考微信公众平台“网页授权接口”，
 * 参考http://mp.weixin.qq.com/wiki/17/c0f37d5704f0b64713d5d2c37b468d75.html）
 */
 
?>

<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/> 
    <title>大森活动-支付</title>
	<link href="../css/sweet-alert.css" rel="stylesheet"/>
	<script src="../js/zepto.min.js"></script>
	<script src="../js/sweet-alert.min.js"></script>
	 <style type="text/css">
 
.sk-circle {
  margin: 40px auto;
  width: 40px;
  height: 40px;
  position: relative; }
  .sk-circle .sk-child {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0; }
  .sk-circle .sk-child:before {
    content: '';
    display: block;
    margin: 0 auto;
    width: 15%;
    height: 15%;
    background-color: #fff;
    border-radius: 100%;
    -webkit-animation: sk-circleBounceDelay 1.2s infinite ease-in-out both;
            animation: sk-circleBounceDelay 1.2s infinite ease-in-out both; }
  .sk-circle .sk-circle2 {
    -webkit-transform: rotate(30deg);
        -ms-transform: rotate(30deg);
            transform: rotate(30deg); }
  .sk-circle .sk-circle3 {
    -webkit-transform: rotate(60deg);
        -ms-transform: rotate(60deg);
            transform: rotate(60deg); }
  .sk-circle .sk-circle4 {
    -webkit-transform: rotate(90deg);
        -ms-transform: rotate(90deg);
            transform: rotate(90deg); }
  .sk-circle .sk-circle5 {
    -webkit-transform: rotate(120deg);
        -ms-transform: rotate(120deg);
            transform: rotate(120deg); }
  .sk-circle .sk-circle6 {
    -webkit-transform: rotate(150deg);
        -ms-transform: rotate(150deg);
            transform: rotate(150deg); }
  .sk-circle .sk-circle7 {
    -webkit-transform: rotate(180deg);
        -ms-transform: rotate(180deg);
            transform: rotate(180deg); }
  .sk-circle .sk-circle8 {
    -webkit-transform: rotate(210deg);
        -ms-transform: rotate(210deg);
            transform: rotate(210deg); }
  .sk-circle .sk-circle9 {
    -webkit-transform: rotate(240deg);
        -ms-transform: rotate(240deg);
            transform: rotate(240deg); }
  .sk-circle .sk-circle10 {
    -webkit-transform: rotate(270deg);
        -ms-transform: rotate(270deg);
            transform: rotate(270deg); }
  .sk-circle .sk-circle11 {
    -webkit-transform: rotate(300deg);
        -ms-transform: rotate(300deg);
            transform: rotate(300deg); }
  .sk-circle .sk-circle12 {
    -webkit-transform: rotate(330deg);
        -ms-transform: rotate(330deg);
            transform: rotate(330deg); }
  .sk-circle .sk-circle2:before {
    -webkit-animation-delay: -1.1s;
            animation-delay: -1.1s; }
  .sk-circle .sk-circle3:before {
    -webkit-animation-delay: -1s;
            animation-delay: -1s; }
  .sk-circle .sk-circle4:before {
    -webkit-animation-delay: -0.9s;
            animation-delay: -0.9s; }
  .sk-circle .sk-circle5:before {
    -webkit-animation-delay: -0.8s;
            animation-delay: -0.8s; }
  .sk-circle .sk-circle6:before {
    -webkit-animation-delay: -0.7s;
            animation-delay: -0.7s; }
  .sk-circle .sk-circle7:before {
    -webkit-animation-delay: -0.6s;
            animation-delay: -0.6s; }
  .sk-circle .sk-circle8:before {
    -webkit-animation-delay: -0.5s;
            animation-delay: -0.5s; }
  .sk-circle .sk-circle9:before {
    -webkit-animation-delay: -0.4s;
            animation-delay: -0.4s; }
  .sk-circle .sk-circle10:before {
    -webkit-animation-delay: -0.3s;
            animation-delay: -0.3s; }
  .sk-circle .sk-circle11:before {
    -webkit-animation-delay: -0.2s;
            animation-delay: -0.2s; }
  .sk-circle .sk-circle12:before {
    -webkit-animation-delay: -0.1s;
            animation-delay: -0.1s; }

@-webkit-keyframes sk-circleBounceDelay {
  0%, 80%, 100% {
    -webkit-transform: scale(0);
            transform: scale(0); }
  40% {
    -webkit-transform: scale(1);
            transform: scale(1); } }

@keyframes sk-circleBounceDelay {
  0%, 80%, 100% {
    -webkit-transform: scale(0);
            transform: scale(0); }
  40% {
    -webkit-transform: scale(1);
            transform: scale(1); } }
	.loading-page{
		display:none;
		position:fixed;
		z-index: 100;
		left:0;
		right:0;
		top:0;
		bottom:0;
		width:100%;
		margin: 0!important;padding: 0!important;  background: rgba(0,0,0,.8);/*opacity: 0.8;*/
	}
	
  </style>
    <script type="text/javascript">
	
	//调用微信JS api 支付
	function jsApiCall()
	{
		WeixinJSBridge.invoke(
			'getBrandWCPayRequest',
			<?php echo $jsApiParameters; ?>,
			function(res){
				WeixinJSBridge.log(res.err_msg);
				$("#msg").val(res.err_msg);
				if(res.err_msg=="get_brand_wcpay_request:ok"){
					//$(".loading-page").show();
					swal("支付成功!");
					window.location.href="main/shopcart.php";
					//updatepay();
				}else if(res.err_msg=="get_brand_wcpay_request:cancel"){
					$(".loading-page").hide();
					swal("你已取消支付!");
				}else{
					$(".loading-page").hide();
					swal("支付失败!");
				}
				
			}
		);
	}
	
	function callpay()
	{
		if (typeof WeixinJSBridge == "undefined"){
		    if( document.addEventListener ){
		        document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
		    }else if (document.attachEvent){
		        document.attachEvent('WeixinJSBridgeReady', jsApiCall); 
		        document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
		    }
		}else{
			$(".loading-page").hide();
			
			
		    jsApiCall();
		}
	}
	</script>
	<script type="text/javascript">
	$(function(){
		//alert($("html").html());
	});
	//获取共享地址
	function editAddress()
	{
		WeixinJSBridge.invoke(
			'editAddress',
			<?php echo $editAddress; ?>,
			function(res){
				var value1 = res.proviceFirstStageName;
				var value2 = res.addressCitySecondStageName;
				var value3 = res.addressCountiesThirdStageName;
				var value4 = res.addressDetailInfo;
				var tel = res.telNumber;
				
				//alert(value1 + value2 + value3 + value4 + ":" + tel);
			}
		);
	}
	
	window.onload = function(){
		if (typeof WeixinJSBridge == "undefined"){
		    if( document.addEventListener ){
		        document.addEventListener('WeixinJSBridgeReady', editAddress, false);
		    }else if (document.attachEvent){
		        document.attachEvent('WeixinJSBridgeReady', editAddress); 
		        document.attachEvent('onWeixinJSBridgeReady', editAddress);
		    }
		}else{
			editAddress();
		}
	};
	function updatepay(){
		var data={};
		data.action="updatePay";
		$.post("updateorder.php",data,function(json){
			//alert(JSON.stringify(json));
			if(json.status==1){
				window.location.href="shopcart.php";
			}
		},'json');
	}
	function mypay(){
		var nonceStr='<?php echo $jsApiParametersObj->nonceStr; ?>';
		var prepay_id='<?php echo $jsApiParametersObj->package; ?>';
		var paySign='<?php echo $jsApiParametersObj->paySign; ?>';
		var data={};
		data.action="updateNonceStr";
		data.nonceStr=nonceStr;
		data.prepay_id=prepay_id;
		data.paySign=paySign;
		$(".loading-page").show();
		$.post("updateorder.php",data,function(json){
			if(json.status==1){
				callpay();
			}else if(json.status==2){
				window.location.href="main/shopcart.php";
			}else{
				$(".loading-page").hide();
				swal("系统异常不能支付!");
			}
		},'json');
	}
	</script>
</head>
<body>
	<input type="hidden" id="msg"/>
    <br/>
	
    <font color="#9ACD32"><b>该笔订单支付金额为<span style="color:#f00;font-size:50px"><?php echo $add_money; ?>元</span>人民币</b></font><br/><br/>
	<div align="center">
		<button style="width:210px; height:50px; border-radius: 15px;background-color:#FE6714; border:0px #FE6714 solid; cursor: pointer;  color:white;  font-size:16px;" type="button" onclick="mypay()" >立即支付</button>
	</div>
	
	<div class="loading-page">
    <div class="sk-circle">
      <div class="sk-circle1 sk-child"></div>
      <div class="sk-circle2 sk-child"></div>
      <div class="sk-circle3 sk-child"></div>
      <div class="sk-circle4 sk-child"></div>
      <div class="sk-circle5 sk-child"></div>
      <div class="sk-circle6 sk-child"></div>
      <div class="sk-circle7 sk-child"></div>
      <div class="sk-circle8 sk-child"></div>
      <div class="sk-circle9 sk-child"></div>
      <div class="sk-circle10 sk-child"></div>
      <div class="sk-circle11 sk-child"></div>
      <div class="sk-circle12 sk-child"></div>
    </div>
	<div style="text-align:center;color:#fff;">支付信息正在入库，请不要离开！</div>
	</div>
</body>
</html>