<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>模型管理-后台管理首页-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='模型管理 > 模型列表'; ?>
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
    <span class="fr">系统现有数据模型<b><?php echo ($models_count); ?></b>个</span>
    <div class="current">数据模型列表</div>
</div>
<form>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab">
        <thead>
            <tr>
                <td>模型名（表名）</td>
                <td>菜单名</td>
                <td>模型字段数</td>
                <td>模型记录行数</td>
                <td>内部表</td>
                <td>操作</td>
            </tr>
        </thead>
        <tbody>
            <?php if(is_array($models)): $i = 0; $__LIST__ = $models;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$model): $mod = ($i % 2 );++$i;?><tr align="center">
                <td><?php echo ($model['name']); ?>（<?php echo ($model['tbl_name']); ?>）</td>
                <td><?php echo ($model['menu_name']); ?></td>
                <td><?php echo ($model['fields_count']); ?></td>
                <td><?php echo ($model['rows']); ?></td>
                <td><?php if($model['is_inner'] == 1): ?>是<?php else: ?>否<?php endif; ?></td>
                <td>[ <a href="<?php echo U('Models/show', array('id' => $model['id']));?>">查看</a> ] [ <a href="<?php echo U('Models/edit', array('id' => $model['id']));?>">编辑</a> ] [ <a href="javascript:void(0);" value="<?php echo U('Models/delete', array('id' => $model['id']));?>" name="<?php echo ($model['name']); ?>(<?php echo ($model['tbl_name']); ?>)" class="del">删除</a> ]</td>
            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
        </tbody>
    </table>
</form>

<div class="page">
    <?php echo ($page); ?>
</div>

<script type="text/javascript">
$(function(){
    $(".del").click(function(){
        var del_link = $(this).attr("value");
        popup.confirm('你真的打算删除 <b>'+ $(this).attr("name")+'</b> 吗?','温馨提示',function(action){
            if(action == 'ok'){
                $.getJSON(del_link, function(json){
                    if (json.status) {
                        popup.success(json.info);
                        setTimeout(function(){
                            popup.close("asyncbox_success");
                        },2000);
                    } else {
                        popup.error(json.info);
                        setTimeout(function(){
                            popup.close("asyncbox_error");
                        },2000);
                    }

                    setTimeout(function(){
                        top.window.location.reload();
                    },1000);
                });
            }
        });

        return false;
    });
});
</script>
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
    </body>
</html>