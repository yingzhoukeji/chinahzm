//startclock();
var timerID = null;   
var timerRunning = false;   
function showtime() {   
	var Today = new Date();
	var year = Today.getFullYear();
	//document.getElementById("next_yeat").innerHTML = year + 1;
	var NowHour = Today.getHours(); 
	
	var NowMinute = Today.getMinutes();   
	var NowMonth = Today.getMonth();   
	var NowDate = Today.getDate(); 	
	var NowYear = Today.getYear();   
	var NowSecond = Today.getSeconds();   
	if (NowYear <2000)   
	NowYear=1900+NowYear;   
	Today = null;  
	starttime=starttime.replace("-","/");
	starttime=starttime.replace("-","/");
	starttime=starttime.replace("-","/");
	LeftDay=new Date(starttime);
	Hourleft = LeftDay.getHours() - NowHour;   
	Minuteleft = LeftDay.getMinutes() - NowMinute; 
	Secondleft = LeftDay.getSeconds() - NowSecond   ;
	Yearleft = year - NowYear ;  
	Monthleft = LeftDay.getMonth() - NowMonth - 1 ;
	Dateleft = LeftDay.getDate() - NowDate   ;
	if (Secondleft<0)   
	{   
		Secondleft=60+Secondleft;   
		Minuteleft=Minuteleft-1;   
	}   
	if (Minuteleft<0)   
	{    
		Minuteleft=60+Minuteleft;   
		Hourleft=Hourleft-1;   
	}   
	if (Hourleft<0)   
	{   
		Hourleft=24+Hourleft;   
		Dateleft=Dateleft-1;   
	}   
	if (Dateleft<0)   
	{   
		Dateleft=31+Dateleft;   
		Monthleft=Monthleft-1;   
	}   
	if (Monthleft<0)   
	{   
		Monthleft=12+Monthleft;   
		Yearleft=Yearleft-1;   
	}   
	
	//Temp=/*Yearleft+'年, '+Monthleft+'月, '+*/Dateleft+'天, '+Hourleft+'小时, '+Minuteleft+'分, '+Secondleft+'秒';
	var Temp='<span>离活动结束还有：</span>'
	+'<span class="count-red">'+Dateleft+'</span>天 <span class="count-red">'+Hourleft+'</span>小时 <span class="count-red">'+Minuteleft+'</span>分<span class="count-red">'+Secondleft+'</span>秒';
	$(".count-down").html(Temp);
	//document.form1.left.value=Temp;   
	timerID = setTimeout("showtime()",1000);   
	timerRunning = true;   
}   
var timerID = null;   
var timerRunning = false;   
function stopclock () {   
	if(timerRunning)   
	clearTimeout(timerID);   
	timerRunning = false;   
}   
function startclock () {   
	stopclock();   
	showtime();   
}   
  
