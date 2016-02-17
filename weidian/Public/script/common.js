/**
 * Created by Administrator on 2015/8/25.
 */
var BaseUrl = "http://www.chinahzm.cn/api/api.php/client";
var BasePath = "http://www.chinahzm.cn";
var ImgUrl=BaseUrl+"/jpg/id/";
var isLogin = "isLogin";
var USERID = "userid";
var framelist = new Array();
function opneFrame(url, header_h, footer_h, isshow, bounces) {
	var $body = $api.dom('body');
	var body_h = $api.offset($body).h;
	var rect_h = body_h - header_h - footer_h;
	api.openFrame({
		name : url,
		url : url,
		rect : {
			x : 0,
			y : header_h,
			w : 'auto',
			h : rect_h
		},
		pageParam : {
			name : 'test'
		},
		bounces : bounces,
		bgColor : 'rgba(0,0,0,0)',
		vScrollBarEnabled : true,
		hScrollBarEnabled : false
	});

	var obj = {};
	obj.visible = isshow;
	obj.url = url;
	framelist.push(obj);
	if (!isshow) {
		api.setFrameAttr({
			name : url,
			hidden : true
		});
	}

}
function openWin(url){
	api.openWin({
	    name: url,
	    url: url
    });
}
function hideFrame(name) {
	api.setFrameAttr({
		name : name,
		hidden : true
	});
}

function showFrame(name) {
	api.setFrameAttr({
		name : name,
		hidden : false
	});
}

function getJSON(url, f) {
	api.ajax({
		url : url,
		method : 'get',
		timeout : 30,
		dataType : 'json',
		returnAll : false
	}, function(ret, err) {
		f(ret);
	});
}

function post(url, mydata, f) {
	api.ajax({
		url : url,
		method : 'post',
		timeout : 30,
		dataType : 'json',
		returnAll : false,
		data : {
			values : mydata
		}
	}, function(ret, err) {
		f(ret);
	});
}

function showLoading() {
	api.showProgress({
		style : 'default',
		animationType : 'fade',
		title : '努力加载中...',
		text : '先喝杯茶...',
		modal : false
	});
}

function hideLoading() {
	api.hideProgress();
}

function login(f) {
	var wx = api.require('wx');
	wx.auth({
		apiKey : 'wx4436d81b89272fa4'
	}, function(ret, err) {
		//console.log(JSON.stringify(ret));
		if (ret.status) {
			var code = ret.code;
			wx.getToken({
				apiKey : 'wx4436d81b89272fa4',
				apiSecret : 'c9174d9d304910541c19a9c27f66cf82',
				code : code
			}, function(ret, err) {
				//console.log(JSON.stringify(ret));
				if (ret.status) {
					wx.getUserInfo({
						accessToken : ret.accessToken,
						openId : ret.openId
					}, function(ret, err) {
						//console.log(JSON.stringify(ret));
						if (ret.status) {
							localStorage.setItem(isLogin, 1);
							localStorage.setItem(wxuser, JSON.stringify(ret));
							f();
						} else {
							localStorage.setItem(isLogin, 0);
							f();
						}
					});
				} else {
					localStorage.setItem(isLogin, 0);
					f();
				}
			});
		} else {
			localStorage.setItem(isLogin, 0);
			f();
		}
	});
}
//异步加载js
function loadJs(sid,jsurl,callback){
    var nodeHead = document.getElementsByTagName('head')[0];
    var nodeScript = null;
    if(document.getElementById(sid) == null){
        nodeScript = document.createElement('script');
        nodeScript.setAttribute('type', 'text/javascript');
        nodeScript.setAttribute('src', jsurl);
        nodeScript.setAttribute('id',sid);
        if (callback != null) {
            nodeScript.onload = nodeScript.onreadystatechange = function(){
                if (nodeScript.ready) {
                    return false;
                }
                if (!nodeScript.readyState || nodeScript.readyState == "loaded" || nodeScript.readyState == 'complete') {
                    nodeScript.ready = true;
                    callback();
                }
            };
        }
        nodeHead.appendChild(nodeScript);
    } else {
        if(callback != null){
            callback();
        }
    }
}

String.prototype.replaceAll = function(s1,s2){ 
	return this.replace(new RegExp(s1,"gm"),s2); 
}
//制保留2位小数，如：2，会在2后面补上00.即2.00  
function toDecimal2(x) {  
    var f = parseFloat(x);  
    if (isNaN(f)) {  
        return false;  
    }  
    var f = Math.round(x*100)/100;  
    var s = f.toString();  
    var rs = s.indexOf('.');  
    if (rs < 0) {  
        rs = s.length;  
        s += '.';  
    }  
    while (s.length <= rs + 2) {  
        s += '0';  
    }  
    return s;  
}
// 对Date的扩展，将 Date 转化为指定格式的String   
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
// 例子：   
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423   
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18   
Date.prototype.Format = function(fmt)   
{ //author: meizz   
  var o = {   
    "M+" : this.getMonth()+1,                 //月份   
    "d+" : this.getDate(),                    //日   
    "h+" : this.getHours(),                   //小时   
    "m+" : this.getMinutes(),                 //分   
    "s+" : this.getSeconds(),                 //秒   
    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
    "S"  : this.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
}

function islogin(){
	var flag=false;
	if(localStorage.getItem(USERID)){
		flag=true;
	}
	return flag;
}
function openLogin(){
	 api.confirm({
         title:"提示信息",
         msg:'你还未登录，是否马上登录？',
         buttons:["否","是"]
    },function(ret,err){
		if(ret.buttonIndex==2){
              api.openWin({
                  name: 'win_login.html',
                  url: 'win_login.html'
              });
        }
    });
}