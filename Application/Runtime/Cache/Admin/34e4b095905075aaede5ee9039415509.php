<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>产品管理-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='产品管理 > 产品列表'; ?>
        <link rel="stylesheet" type="text/css" href="/Public/Min/?f=/Public/Admin/Css/base.css|/Public/Admin/Css/layout.css|/Public/Js/asyncbox/skins/default.css<?php echo ($addCss); ?>" />
<script type="text/javascript" src="/Public/Min/?f=/Public/Js/jquery-1.9.0.min.js|/Public/Js/jquery.lazyload.js|/Public/Js/functions.js|/Public/Admin/Js/base.js|/Public/Js/jquery.form.js|/Public/Js/asyncbox/asyncbox.js<?php echo ($addJs); ?>"></script>
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
                        <div class="current">产品列表</div>
                    </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab">
                        <thead>
                            <tr>
                                <td>产品标题</td>
                                <td>所在分类</td>
                                <td>发布时间</td>
                                <td>发布人</td>
                                <td>状态</td>
                                <td>推荐</td>
                                <td width="150">操作</td>
                            </tr>
                        </thead>
                        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr align="center" id="<?php echo ($vo["id"]); ?>">
                                <td align="left"><img src="/Public/Img/<?php echo ($vo["lang"]); ?>.png"><a href="/index.php/conist/Product/edit?id=<?php echo ($vo["id"]); ?>"><?php echo ($vo["title"]); ?></a></td>
                                <td><?php echo ($vo["cidName"]); ?></td>
                                <td><?php echo (date("Y-m-d H:i:s",$vo["published"])); ?></td>
                                <td><?php echo ($vo["aidName"]); ?></td>
                                <td><a href="javascript:void(0);" onclick="changeStatus(<?php echo ($vo["id"]); ?>,this)"><?php echo ($vo["status"]); ?></a></td>
                                <td><a href="javascript:void(0);"  title="推荐" onclick="changeAttr(<?php echo ($vo["id"]); ?>,this)"><img src="/Public/Img/action_<?php echo ($vo["is_recommend"]); ?>.png" border="0"></a>
                                    &nbsp;&nbsp;
                                    <a href="javascript:void(0);" title="推荐到手机" onclick="changePhoneStatus(<?php echo ($vo["id"]); ?>,this)"><img src="/Public/Img/iphone-<?php echo ($vo["wap_display"]); ?>.png" border="0">
                                </td>
                                <td>[ <a href="/index.php/conist/Product/edit?id=<?php echo ($vo["id"]); ?>&do=copy">复制 </a> ][ <a href="/index.php/conist/Product/edit?id=<?php echo ($vo["id"]); ?>">编辑 </a> ] [ <a link="<?php echo U('Product/del/',array('id'=>$vo['id']));?>" href="javascript:void(0)" name="<?php echo ($vo["title"]); ?>" class="del">删除 </a> ]</td>
                            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                        <tr><td colspan="7" align="right"><?php echo ($page); ?></td></td></tr>


                        <tr><td colspan="7" align="left">
                            <form action="/index.php/conist/Product/index" method="get">
                                标题：<input type="text" name="title" value="<?php echo $_GET['title']; ?>" size="30" style="margin-right: 20px;">
                                分类：<select name="cid" style="margin-right: 20px;">
                                <option value="">--请选择--</option>
                                <?php if(is_array($catlist)): $i = 0; $__LIST__ = $catlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["cid"]); ?>" <?php if(I('cid') == $vo['cid']): ?>selected=1<?php endif; ?>><?php echo ($vo["fullname"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>

                                状态：<select name="status" style="margin-right: 20px;">
                                <option value="">--请选择--</option>
                                <option value="1" <?php if(I('status') == 1): ?>selected=1<?php endif; ?>>已发布</option>
                                <option value="0" <?php if(I('status') == '0'): ?>selected=1<?php endif; ?>>未审核</option>
                            </select>

                                推荐：<select name="is_recommend" style="margin-right: 20px;">
                                <option value="">--请选择--</option>
                                <option value="1" <?php if(I('is_recommend') == 1): ?>selected=1<?php endif; ?>>已推荐</option>
                                <option value="0" <?php if(I('is_recommend') == '0'): ?>selected=1<?php endif; ?>>未推荐</option>
                            </select>

                                <input type="submit" value="搜索">

                            </form>
                        </td></td></tr>



                    </table>
                </div>
            </div>
        </div>
        <div class="clear"></div>
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
                    popup.confirm('你真的打算删除【<b>'+$(this).attr("name")+'</b>】吗?','温馨提示',function(action){
                        if(action == 'ok'){
                            delByLink(delLink,$this);
                        }
                    });
                    return false;
                });
            });
            function changeAttr(id,v){
                $.get('<?php echo U("Product/changeAttr");?>?id='+id,function(data){
                    if(data.status==1){
                        $(v).html(data.info);
                    }
                });
            }
            function changeStatus(id,v){
                $.get('<?php echo U("Product/changeStatus");?>?id='+id,function(data){
                    if(data.status==1){
                        $(v).html(data.info);
                    }
                });
            }
            function changePhoneStatus(id,v){
                $.get('<?php echo U("Product/changePhoneStatus");?>?id='+id,function(data){
                    if(data.status==1){
                        $(v).html(data.info);
                    }
                });
            }
        </script>
    </body>
</html>