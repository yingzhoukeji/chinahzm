//var serverUrl="http://192.168.0.103:81/jyst/api.php/Index";
var serverUrl="http://www.chinahzm.cn/api/api.php/Index";
var wxhdUrl="http://www.chinahzm.cn/api/api.php/Wxhd";
//var picUrl="http://192.168.0.102:81/jyst/api.php/Index/jpg?id=";
//var picUrl="http://192.168.0.103:81";
var picUrl="http://www.chinahzm.cn";
var indexUrl="http://www.chinahzm.cn/wx/index.html";
var lang="zh-cn";
function GetQueryString(name)     
{     
     var reg = new RegExp("(^|&)"+name+"=([^&]*)(&|$)");    			    
     var r=window.location.search.substr(1).match(reg);     
     if(r!=null) return unescape(r[2]);   
     return   null;
}
String.prototype.replaceAll  = function(s1,s2){
	return this.replace(new RegExp(s1,"gm"),s2);
}
Date.prototype.format = function(format)
{
    var o =
    {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(), //day
        "h+" : this.getHours(), //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3), //quarter
        "S" : this.getMilliseconds() //millisecond
    }

    if(/(y+)/.test(format))
    {
        format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }

    for(var k in o)
    {
        if(new RegExp("("+ k +")").test(format))
        {
            format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
        }
    }
    return format;
}