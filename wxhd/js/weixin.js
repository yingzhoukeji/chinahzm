var jsApiList=[
		'checkJsApi',
		'onMenuShareTimeline',
		'onMenuShareAppMessage',
		'onMenuShareQQ',
		'onMenuShareWeibo',
		'hideMenuItems',
		'showMenuItems',
		'hideAllNonBaseMenuItem',
		'showAllNonBaseMenuItem',
		'translateVoice',
		'startRecord',
		'stopRecord',
		'onRecordEnd',
		'playVoice',
		'pauseVoice',
		'stopVoice',
		'uploadVoice',
		'downloadVoice',
		'chooseImage',
		'previewImage',
		'uploadImage',
		'downloadImage',
		'getNetworkType',
		'openLocation',
		'getLocation',
		'hideOptionMenu',
		'showOptionMenu',
		'closeWindow',
		'scanQRCode',
		'chooseWXPay',
		'openProductSpecificView',
		'addCard',
		'chooseCard',
		'openCard'
];

function initWeixin(){
	var url=document.URL;
	$.post("http://www.chinahzm.cn/wxhd/api.php",{url:url},function(json){
		wx.config({
			debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			appId: json.appId, // 必填，公众号的唯一标识
			timestamp: json.timestamp, // 必填，生成签名的时间戳
			nonceStr: json.nonceStr, // 必填，生成签名的随机串
			signature: json.signature,// 必填，签名，见附录1
			jsApiList: jsApiList // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		wx.ready(function(){
			if(localStorage.getItem("wx_user")){
				//alert(localStorage.getItem("wx_user"));
				var user=JSON.parse(localStorage.getItem("wx_user"));
				wx.onMenuShareTimeline({
					title: hdObj.title, // 分享标题
					link: picUrl+"/wxhd/detail.html?id="+hdObj.id+user.openid, // 分享链接
					imgUrl: picUrl+hdObj.image, // 分享图标
					success: function () { 
						//alert(picUrl+"/wxhd/detail.html?id="+hdObj.id+user.openid);
					},
					cancel: function () { 
						
					}
				});
				wx.onMenuShareAppMessage({
					title:hdObj.title, // 分享标题
					desc: hdObj.summary, // 分享描述
					link: picUrl+"/wxhd/detail.html?id="+hdObj.id+user.openid, // 分享链接
					imgUrl: picUrl+hdObj.image, // 分享图标
					success: function () { 
						// 用户确认分享后执行的回调函数
						//alert(picUrl+"/wxhd/detail.html?id="+hdObj.id+user.openid);
					},
					cancel: function () { 
						// 用户取消分享后执行的回调函数
					}
				});
			}else{
				//alert(22);
				wx.onMenuShareTimeline({
					title: hdObj.title, // 分享标题
					link: picUrl+"/wxhd/detail.html?id="+hdObj.id+"0", // 分享链接
					imgUrl: picUrl+hdObj.image, // 分享图标
					success: function () { 
						//alert(picUrl+"/wxhd/detail.html?id="+hdObj.id+"0");
					},
					cancel: function () { 
						
					}
				});
				wx.onMenuShareAppMessage({
					title:hdObj.title, // 分享标题
					desc: hdObj.summary, // 分享描述
					link: picUrl+"/wxhd/detail.html?id="+hdObj.id+"0", // 分享链接
					imgUrl: picUrl+hdObj.image, // 分享图标
					success: function () { 
						// 用户确认分享后执行的回调函数
						//alert(picUrl+"/wxhd/detail.html?id="+hdObj.id+"0");
					},
					cancel: function () { 
						// 用户取消分享后执行的回调函数
					}
				});
			}
			
			
		});
		wx.error(function (res) {
		  //alert(res.errMsg);
		});
		
	});			
}

function openMap(){
	wx.openLocation({
		latitude: 28.607621543695, // 纬度，浮点数，范围为90 ~ -90
		longitude: 121.52780381617, // 经度，浮点数，范围为180 ~ -180。
		name: '浙江海之梦股份有限公司', // 位置名
		address: '中国·浙江滨海工业园区B区海丰路2229号', // 地址详情说明
		scale: 20
	});
}
		