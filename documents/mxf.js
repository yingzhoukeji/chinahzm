//手机底部导航
$(".arrow").click(function(){
	if($(this).hasClass('down'))
	{
		$(this).toggleClass("down");
		$(this).toggleClass("up");
		$(this).parent().parent().find('div').slideDown();
	}
	else
	{
		$(this).toggleClass("up");
		$(this).toggleClass("down");
		$(this).parent().parent().find('div').slideUp();
	}
});

//头部二级导航下拉
$(".mxfdh").hover(function () {   
    	$(".mxfsub1").stop(true,true).slideDown('1000');
 	}, function () {
    	$(".mxfsub1").stop(true,true).slideUp('1000');
});
	
$(".mxfsub1").hover(function () {   
    	$(".mxfsub1").stop();
 	}, function () {
    	$(".mxfsub1").stop(true,true).slideUp('1000');
});
	
//产品列表页
$(".pdlb").hover(function(){
    $(this).find("div").slideDown();
},function(){
    $(this).find("div").slideUp();
})

//产品详情页
$(document).ready(function(){
  $(".qq").mouseover(function(){
    $("#qqzx").animate({right:'35px',opacity:'1'},100);
  })
  $(".qq").mouseout(function(){
    $("#qqzx").animate({right:'0px',opacity:'0'},200);
  })
  
  $(".liuyan").mouseover(function(){
    $("#khfk").animate({right:'35px',opacity:'1'},100);
  })
  $(".liuyan").mouseout(function(){
    $("#khfk").animate({right:'0px',opacity:'0'},200);
  })
  
  $(".zhiding").mouseover(function(){
    $("#fhdb").animate({right:'35px',opacity:'1'},100);
  })
  $(".zhiding").mouseout(function(){
    $("#fhdb").animate({right:'0px',opacity:'0'},200);
  })
});

//刷新推荐产品
$(".change").click(function(){
	$("#recommend").load(location.href+" #recommend");
});

//产品图片展示
$(function(){			
   $(".jqzoom").jqueryzoom({
		xzoom:400,
		yzoom:400,
		offset:10,
		position:"right",
		preload:1,
		lens:1
	});
	$("#spec-list").jdMarquee({
		deriction:"left",
		width:350,
		height:56,
		step:2,
		speed:4,
		delay:10,
		control:true,
		_front:"#spec-right",
		_back:"#spec-left"
	});
	$("#spec-list img").bind("mouseover",function(){
		var src=$(this).attr("src");
		$("#spec-n1 img").eq(0).attr({
			src:src.replace("\/n5\/","\/n1\/"),
			jqimg:src.replace("\/n5\/","\/n0\/")
		});
		$(this).css({
			"border":"2px solid #ff6600",
			"padding":"1px"
		});
	}).bind("mouseout",function(){
		$(this).css({
			"border":"1px solid #ccc",
			"padding":"2px"
		});
	});				
})
	
	