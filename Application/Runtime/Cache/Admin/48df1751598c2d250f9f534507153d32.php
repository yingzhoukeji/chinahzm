<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>微信活动礼品申请管理-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='>微信活动礼品申请管理 > 申请列表'; ?>
        <link rel="stylesheet" type="text/css" href="/Public/Min/?f=/Public/Admin/Css/base.css|/Public/Admin/Css/layout.css|/Public/Js/asyncbox/skins/default.css<?php echo ($addCss); ?>" />
<script type="text/javascript" src="/Public/Min/?f=/Public/Js/jquery-1.9.0.min.js|/Public/Js/jquery.lazyload.js|/Public/Js/functions.js|/Public/Admin/Js/base.js|/Public/Js/jquery.form.js|/Public/Js/asyncbox/asyncbox.js<?php echo ($addJs); ?>"></script>
		<style>
			.qrcode{
				  /*width: 100%;
				  height: 100%;
				  position: fixed;
				  top: 0;
				  left: 0;
				  background: #000;
				  opacity: .6;
				  -webkit-transform: translate3d(0,0,0);
				  z-index: 20;*/
				  display:none;
				
			}
			.qrcontent{
				  position: fixed;
				  top: 35%;
				  left: 0;
				  right:0;
				  height:200px;
				  text-align:center;
				  z-index: 100;
				  
			}
			.btn_qrcode{
				background:#417EB7;
				padding:5px;
				border-radius: 3px;
				color: #fff;
			}
		</style>
    </head>
    <body>
        <div class="wrap">
            <div id="Top">
    <div class="logo"><a target="_blank" href="<?php echo ($site["WEB_ROOT"]); ?>"><img src="/Public/Admin/Img/logo.png" /></a></div>
    <div class="help"><a href="http://www.jtys114.com" target="_blank">使用帮助</a><span><a href="http://www.jtys114.com" target="_blank">关于</a></span></div>
    <div class="menu">
        <ul> <?php echo ($menu); ?> </ul>
    </div>
</div>
<div id="Tags">
    <div class="userPhoto"><img src="/Public/Admin/Img/userPhoto.jpg" /> </div>
    <div class="navArea">
        <div class="userInfo"><div><a href="<?php echo U('Webinfo/index');?>" class="sysSet"><span>&nbsp;</span>系统设置</a> <a href="<?php echo U("Public/loginOut");?>" class="loginOut"><span>&nbsp;</span>退出系统</a></div>欢迎您，<?php echo ($my_info["email"]); ?></div>
        <div class="nav"><font id="today"><?php echo date("Y-m-d H:i:s"); ?></font>您的位置：<?php echo ($currentNav); ?></div>
    </div>
</div>
<div class="clear"></div>
            <div class="mainBody">
                <div id="Left">
    <div id="control" class=""></div>
    <div class="subMenuList">
        <div class="itemTitle"><?php if(CONTROLLER_NAME == 'Index'): ?>常用操作<?php else: ?>子菜单<?php endif; ?> </div>
        <ul>
            <?php if(is_array($sub_menu)): foreach($sub_menu as $key=>$sv): ?><li><a href="<?php echo ($sv["url"]); ?>"><?php echo ($sv["title"]); ?></a></li><?php endforeach; endif; ?>
        </ul>
    </div>

</div>
                <div id="Right">
                    <div class="Item hr">
                        <div class="current">活动列表</div>
                    </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab">
                        <thead>
                            <tr>
                                <td>ID</td>
                                <td>活动名称</td>
                                <td>申请人</td>
                                <td>状态</td>
								<td>申请人剩余积分</td>
								<td>联系人地址</td>
								<td>联系电话</td>
								<td>申请日期</td>
                                <td>操作</td>
                               
                            </tr>
                        </thead>
                        <?php if(is_array($applys)): $i = 0; $__LIST__ = $applys;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr align="center" id="<?php echo ($vo["id"]); ?>">
								<td><?php echo ($vo["id"]); ?></td>
								 <td><?php echo ($vo["title"]); ?></td>
                                <td align="left"><?php echo ($vo["nickname"]); ?></td>
								<td><?php echo ($vo["mstatus"]); ?></td>
                                <td><?php echo ($vo["srcoe"]); ?></td>
								<td><?php echo ($vo["adress"]); ?></td>
								<td><?php echo ($vo["phone"]); ?></td>
								<td><?php echo (date("Y-m-d H:i:s",$vo["createtime"])); ?></td>
                                <td> [ <a link="<?php echo U('Siteinfo/sureapply/',array('id'=>$vo['id']));?>" href="javascript:void(0)" name="<?php echo ($vo["nickname"]); ?>" class="del">同意申请 </a> ]</td>
								
                            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                        <tr><td colspan="6" align="right"><?php echo ($page); ?></td></tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="clear"></div>
		<div class="qrcode">
			<div class="qrcontent">
				<img id="qrcode" src="http://qr.liantu.com/api.php?text=">
			</div>
			
		</div>
        <script type="text/javascript">
    $(window).resize(autoSize);
    $(function(){
        autoSize();
        $(".loginOut").click(function(){
            var url=$(this).attr("href");
            popup.confirm('你确定要退出吗？','你确定要退出吗',function(action){
                if(action == 'ok'){ window.location=url; }
            });
            return false;
        });

        var time=self.setInterval(function(){$("#today").html(date("Y-m-d H:i:s"));},1000);


    });

</script>
        <script type="text/javascript">
            $(function(){
                $(".del").click(function(){
                    var delLink=$(this).attr("link");
                    $this = $(this);
                    popup.confirm('你真的要同意【<b>'+$(this).attr("name")+'</b>】的申请吗?','温馨提示',function(action){
                        if(action == 'ok'){
                            delByLink(delLink,$this);
                            setTimeout(function(){
								window.location.reload();
							},1000);
                        }
                    });
                    return false;
                });
				$(".qrcode").click(function(){
					$(".qrcode").hide();
				});
            });
            function changeAttr(id,v){
                $.get('<?php echo U("News/changeAttr");?>?id='+id,function(data){
                    if(data.status==1){
                        $(v).html(data.info);
                    }
                });
            }
            function changeStatus(id,v){
                $.get('<?php echo U("News/changeStatus");?>?id='+id,function(data){
                    if(data.status==1){
                        $(v).html(data.info);
                    }
                });
            }
			function getQrcode(id){
				var url="<?php echo ($QRCODE_URL); echo ($WX_SITE); ?>?id="+id+"0";
				$("#qrcode").attr("src",url);
				$(".qrcode").toggle();
			}
        </script>
    </body>
</html>