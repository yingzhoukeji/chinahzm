<?php 
ini_set('date.timezone','Asia/Shanghai');
//error_reporting(E_ERROR);
//error_reporting(0);
header('Content-Type: text/html; charset=utf-8');
require_once "../lib/WxPay.Api.php";
require_once "WxPay.JsApiPay.php";
/*require_once("../../include/config.db.php");
require_once("../../include/db.class.php");
require_once("../../include/common.php");
require_once("../../include/log.php");*/
require_once '../../base.php';
session_start();
if(!isset($_SESSION['oid'])){
	buildErrPage('非法请求！');
	exit();
}
$recharge=$db->table('recharge')->where(array('id'=>$_SESSION['oid']))->find();
if(!$recharge){
	buildErrPage('该订单不存在！');
	exit();
}
$add_money=intval($recharge['addmoney']);
//①、获取用户openid
$tools = new JsApiPay();
$tools->curl_timeout=300;
$openId =$tools->GetOpenid();
Log::DEBUG("openid1->".$openId);
Log::DEBUG("openid2->".$openId);
//②、统一下单
$input = new WxPayUnifiedOrder();
$input->SetBody("付费排名支付");
$input->SetAttach("付费排名支付");
$out_trade_no=WxPayConfig::MCHID.date("YmdHis");
$input->SetOut_trade_no($out_trade_no);
Log::DEBUG("out_trade_no->".$out_trade_no);
$input->SetTotal_fee($add_money);
$input->SetTime_start(date("YmdHis"));
$input->SetTime_expire(date("YmdHis", time() + 600));
$input->SetGoods_tag("付费排名支付");
$input->SetNotify_url("http://tp.yz1681.com/wx/pay/test/notify.php");
$input->SetTrade_type("JSAPI");
$input->SetOpenid($openId);
$order = WxPayApi::unifiedOrder($input);
$jsApiParameters = $tools->GetJsApiParameters($order);
Log::DEBUG("jsApiParameters->".$jsApiParameters);
$jsApiParametersObj=json_decode($jsApiParameters);
$update=$db->table('recharge')->data(array("out_trade_no"=>$out_trade_no))->where(array("id"=>$_SESSION['oid']))->update();
//获取共享收货地址js函数参数
$editAddress = $tools->GetEditAddressParameters();
if(!$update){
	buildErrPage("对不起，系统忙，稍候再试");
	exit();
}
//function build_order_no(){
    //return date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
//}
//$myorderid=build_order_no();
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
    <title>盈舟品牌网-支付</title>
	<link rel="stylesheet" type="text/css" href="../../frozen/css/base.css" />
	<link rel="stylesheet" type="text/css" href="../../frozen/css/frozen.css" />
	<script src="../../frozen/lib/zepto.min.js"></script>
	<script src="../../frozen/js/frozen.js"></script>
    <script type="text/javascript">
	
	//调用微信JS api 支付
	function jsApiCall()
	{
		
		WeixinJSBridge.invoke(
			'getBrandWCPayRequest',
			<?php echo $jsApiParameters; ?>,
			function(res){
				WeixinJSBridge.log(res.err_msg);
				//$("#msg").val(res.err_msg);
				if(res.err_msg=="get_brand_wcpay_request:ok"){
					//$(".loading-page").show();
					//swal("支付成功!");
					//window.location.href="shopcart.php";
					//updatepay();
					var dia=$.dialog({
				        title:'支付结果',
				        content:'支付成功',
				        button:["确认"]
				    });
				}else if(res.err_msg=="get_brand_wcpay_request:cancel"){
					var dia=$.dialog({
				        title:'支付结果',
				        content:'取消支付',
				        button:["确认"]
				    });
				}else{
					//$(".loading-page").hide();
					//swal("支付失败!");
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
			//$(".loading-page").hide();
			var data={};
			data.out_trade_no="<?php echo $out_trade_no;?>";
			var url="../../ajax_api.php?action=ispay";
			var el=$.loading({
		        content:'正在支付...',
		    });
			$.post(url,data,function(json){
				//alert(JSON.stringify(json));
				el.loading("hide");
				if(json.r==0){
					jsApiCall();
				}else{
					var dia=$.dialog({
				        title:'提示信息',
				        content:json.msg,
				        button:["确认"]
				    });
				}
			},'json');
		    
		}
	}
	</script>
	<script type="text/javascript">
	$(function(){
		
		$.tips({
	        content:"支付时不要重复点击支付按钮，以免造成多次支付",
	        stayTime:4000,
	        type:"warn"
	    });
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
				window.location.href="shopcart.php";
			}else{
				$(".loading-page").hide();
				swal("系统异常不能支付!");
			}
		},'json');
	}
	</script>
</head>
<body>
	<div class="ui-tips ui-tips-warn">
    	<i></i><span>支付时不要重复点击支付按钮，以免造成多次支付</span>
	</div>
	<div class="ui-tips ui-tips-success">
    <i></i><span style="color:#9ACD32">该笔订单支付金额为<span style="color:#f00;font-size:50px"><?php echo $add_money; ?>元</span>人民币</span>
	</div>
	 <div class="ui-notice-btn">
        <button class="ui-btn-primary ui-btn-lg" onclick="callpay()">立即支付</button>
    </div>
</body>
</html>