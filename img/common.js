$(document).ready(function(){
	// a�쒓렇
	//alert($('a[href~="#none"]').length);
	$('a[href~="#none"]').bind('click' , function(){
		return false;
	});
	
	$('select').customStyle();
});

function cfn_ajaxHelper(url, params, sucFunc, errFunc, addData){
	loadingStart();
	
	return $.ajax({
        type: "POST"
        ,asyn: false
        ,url: url
        ,data: params
        ,dataType: "json"       
        ,contentType :"application/x-www-form-urlencoded;charset=UTF-8"
        ,success: function(data){
            if(sucFunc){
            	var successFunc = eval(sucFunc);
            	successFunc(data, addData);
            }
            loadingEnd();
            
        }
        ,error : function(data, status, err) {
        	if(errFunc){
        		var errorFunc = eval(errFunc);
            	errorFunc(data, addData);
        	}
        	
        	loadingEnd();
        }
	});
}

//ajax start
function loadingStart(){
	$('body').append('<div id="loadingMask"></div>').append('<div id="loadingWrap"></div>');
	$('#loadingMask').css({'width' : '100%', 'height' : '100%', 'position' : 'fixed', 'z-index' : '1000', 'left' : '0', 'top' : '0', 'background' : '#fff', 'opacity' : '0' });
	$('#loadingWrap').css({'position' : 'absolute', 'z-index' : '1100', 'left' : '0', 'top' : '0', 'width' : '100%', 'height' : '100%' });
	$('#loadingWrap img').css({'position' : 'absolute', 'left' : '50%', 'top' : '50%', 'margin-left' : - 30 + 'px', 'margin-top' : - 30 + 'px' });
}

//ajax stop
function loadingEnd(){
	$('#loadingMask').remove();
	$('#loadingWrap').remove();
}

function cfn_enterEvent(event,functionNm){
	if(event.keyCode==13){
		eval(functionNm);
	}
}

function cfn_setCookie(name,value,expiredays) //荑좏궎 ��옣�⑥닔
{ 
	var todayDate = new Date(); 
	todayDate.setDate(todayDate.getDate() + expiredays); 
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
}

function cfn_getCookie(Name) { // 荑좏궎 遺덈윭�ㅻ뒗 �⑥닔
	var search = Name + "=";
	if (document.cookie.length > 0) { // if there are any cookies
		offset = document.cookie.indexOf(search);
		
		if (offset != -1){ // if cookie exists
			offset += search.length; // set index of beginning of value
			end = document.cookie.indexOf(";", offset); // set index of end of cookie value
			if (end == -1) 
			end = document.cookie.length;
			return unescape(document.cookie.substring(offset, end));
		} 
	}
}


// �먮━�섎쭔��0異붽� �⑥닔
function inZero(p1, p2){
   var zero="";
   for (var i=0; i<p2; i++) zero += "0";
   return zero.toString().concat(p1).match(new RegExp("\\d{"+p2+"}$"));
}


//�꾩옱�쇱쓣 諛쏆븘�⑤떎.
function getDate(){
    var today = new Date();
    var timeStr;
    timeStr = today.getFullYear().toString();
    timeStr += "-"+inZero(today.getMonth()+1, 2);
    timeStr += "-"+inZero(today.getDate(), 2);
    return timeStr;
}

	 

//�닿�蹂멸� �명똿
function cfn_setCookieBoardSeq(boardSeq, boardAttribute){
	var oldBoardSeq = new Array();
	if(boardAttribute=="1"){ //湲곗궗�뺢쾶�쒗뙋
		
		for(var i=0;i<=4;i++){ //湲곗〈 �곗씠�곕� 諛곗뿴���댁븘�붾떎.
			if(cfn_getCookie("viewBoardSeq"+i)){
				oldBoardSeq.push(cfn_getCookie("viewBoardSeq"+i));
			}
		}
		
		cfn_setCookie("viewBoardSeq0", boardSeq , 7); //泥ル쾲吏몄뿉 �명똿�섍퀬
		var idx = 1;
		for(var j=0;j<oldBoardSeq.length;j++){
			if(boardSeq!=oldBoardSeq[j]){
				cfn_setCookie("viewBoardSeq"+(idx++), oldBoardSeq[j] , 7); //�섎㉧吏�� �ㅼ떆 �명똿�댁���	
			}
		}
	}else if(boardAttribute=="2"){ //�숈쁺�곴쾶�쒗뙋
		for(var i=0;i<=4;i++){ //湲곗〈 �곗씠�곕� 諛곗뿴���댁븘�붾떎.
			if(cfn_getCookie("viewMovieBoardSeq"+i)){
				oldBoardSeq.push(cfn_getCookie("viewMovieBoardSeq"+i));
			}
		}
		
		cfn_setCookie("viewMovieBoardSeq0", boardSeq , 7); //泥ル쾲吏몄뿉 �명똿�섍퀬
		var idx = 1;
		for(var j=0;j<oldBoardSeq.length;j++){
			if(boardSeq!=oldBoardSeq[j]){
				cfn_setCookie("viewMovieBoardSeq"+(idx++), oldBoardSeq[j] , 7); //�섎㉧吏�� �ㅼ떆 �명똿�댁���	
			}
		}
	}
	
}

//�덉씠�댄뙘��
/*function layerPop(obj){
	$('#'+obj).css({
		'position' : 'fixed',
		'z-index' : '510',
		'left' : '50%',
		'top' : '50%',
		'margin-top' : - ($('#'+obj).height() /2 ) +'px',
		'margin-left' : - ($('#'+obj).width() /2 ) +'px',
		'display' : 'block'
	});
	$('#'+obj).prev('.dimmed').show();
	
	$(window).resize(function(){
		$('#'+obj).css({
			'margin-top' : - ($('#'+obj).height() /2 ) +'px',
			'margin-left' : - ($('#'+obj).width() /2 ) +'px'
		});
	});
	
	// �대깽���숈쓽�섍린 �덉씠�댄뙘��泥댄겕諛뺤뒪
	if(obj == 'eventJoinAgree_layerPop'){
		$('#'+obj).find('#agreeYes').removeAttr('checked');
	}
	
}*/

function layerPop(obj){
	if($(window).height() < $('#'+obj).height()){
		$('#'+obj).css({
			'position' : 'absolute',
			'z-index' : '510',
			'left' : '50%',
			'top' : '0',
			'margin-top' : 0 +'px',
			'margin-left' : - ($('#'+obj).width() /2 ) +'px',
			'display' : 'block'
		});
		$(window).scrollTop(0);
	} else {
		$('#'+obj).css({
			'position' : 'fixed',
			'z-index' : '510',
			'left' : '50%',
			'top' : '50%',
			'margin-top' : - ($('#'+obj).height() /2 ) +'px',
			'margin-left' : - ($('#'+obj).width() /2 ) +'px',
			'display' : 'block'
		});
	}
	
	$('#'+obj).prev('.dimmed').show();
	
	$(window).resize(function(){
		if($(window).height() < $('#'+obj).height()){
			$('#'+obj).css({
				'position' : 'absolute',
				'z-index' : '510',
				'left' : '50%',
				'top' : '0',
				'margin-top' : 0 +'px',
				'margin-left' : - ($('#'+obj).width() /2 ) +'px'
			});
		} else {
			$('#'+obj).css({
				'position' : 'fixed',
				'z-index' : '510',
				'left' : '50%',
				'top' : '45%',
				'margin-top' : - ($('#'+obj).height() /2 ) +'px',
				'margin-left' : - ($('#'+obj).width() /2 ) +'px'
			});
		}
		
	});
	
	// �대깽���숈쓽�섍린 �덉씠�댄뙘��泥댄겕諛뺤뒪
	if(obj == 'eventJoinAgree_layerPop'){
		$('#'+obj).find('#agreeYes').removeAttr('checked');
	}
	
}


/***************    移댁뭅�ㅽ넚 start **********************************************************************/
//移댁뭅�ㅽ넚 留곹겕
function executeURLLink(p_msg , p_url , p_appid , p_app_name)
{
    /* 
    msg, url, appid, appname���ㅼ젣 �쒕퉬�ㅼ뿉���ъ슜�섎뒗 �뺣낫濡��낅뜲�댄듃�섏뼱���⑸땲�� 
    */
    kakao.link("talk").send({
        msg : p_msg,
        url : p_url,
        appid : p_appid,
        appver : "2.0",
        appname : p_app_name,
        type : "link"
    });

}

//移댁뭅���ㅽ넗由�怨듭쑀
function executeKakaoStoryLink(p_url , p_appid , p_app_name , p_title , p_desc)
{
    kakao.link("story").send({   
        post : p_url,
        appid : p_appid,
        appver : "1.0",
        appname : p_app_name,
        urlinfo : JSON.stringify({title:p_title, desc:p_desc, type:"article"})
    });
}
/***************    移댁뭅�ㅽ넚 end **********************************************************************/

// 鍮꾨�踰덊샇 �뺤씤 蹂�꼍 �앹뾽
function passChangePopup(){
	$('#passChangePopup').show();
	if($(window).height() < $('#passChangePopup').height()){
		$('#passChangePopup').css({
			'position' : 'absolute',
			'left' : '50%',
			'top' : '0',
			'z-index' : '510',
			'margin-left' :  - ($('#passChangePopup').width()/2) + 'px',
			'margin-top' : '0px'
		});
	} else {
		$('#passChangePopup').css({
			'position' : 'fixed',
			'left' : '50%',
			'top' : '50%',
			'z-index' : '510',
			'margin-left' :  - ($('#passChangePopup').width()/2) + 'px',
			'margin-top' : - ($('#passChangePopup').height()/2) + 'px'
		});
	}
	
	$('#passChangePopup').prev('.dimmed').show();
	$(window).resize(function(){
		if($(window).height() < $('#passChangePopup').height()){
			$('#passChangePopup').css({
				'position' : 'absolute',
				'left' : '50%',
				'top' : '0',
				'z-index' : '510',
				'margin-left' :  - ($('#passChangePopup').width()/2) + 'px',
				'margin-top' : '0px'
			});	
		} else {
			$('#passChangePopup').css({
				'position' : 'fixed',
				'left' : '50%',
				'top' : '50%',
				'z-index' : '510',
				'margin-left' :  - ($('#passChangePopup').width()/2) + 'px',
				'margin-top' : - ($('#passChangePopup').height()/2) + 'px'
			});
		}
	});
}
function passChangePopupClose(){
	$('#passChangePopup').hide();
	$('#passChangePopup').prev('.dimmed').hide();
}