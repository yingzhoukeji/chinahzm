<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>数据管理-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='数据管理 > 数据库表信息'; ?>
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
                        <span class="fr">数据库中共有<?php echo ($tables); ?>张表，共计<?php echo ($total); ?></span>
                        <div class="current">数据库表结构列表</div>
                    </div>
                    <form>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab">
                            <thead>
                                <tr>
                                    <td width="90"><label><input name="" class="chooseAll" type="checkbox"/> 全选</label> <label><input name="" class="unsetAll" type="checkbox"/> 反选</label></td>
                                    <td>表名</td>
                                    <td>表用途</td>
                                    <td>记录行数</td>
                                    <td>引擎类型</td>
                                    <td>字符集</td>
                                    <td>表大小</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$tab): $mod = ($i % 2 );++$i;?><tr align="center">
                                        <td><input type="checkbox" name="table[]" value="<?php echo ($tab["Name"]); ?>"/></td>
                                        <td align="left"><?php echo ($tab["Name"]); ?></td>
                                        <td><?php echo ($tab["Comment"]); ?></td>
                                        <td><?php echo ($tab["Rows"]); ?></td>
                                        <td><?php echo ($tab["Engine"]); ?></td>
                                        <td><?php echo ($tab["Collation"]); ?></td>
                                        <td><?php echo ($tab["size"]); ?></td>
                                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                            </tbody>
                            <tfoot align="center">
                                <tr>
                                    <td width="90"><label><input name="" class="chooseAll" type="checkbox"/> 全选</label> <label><input name="" class="unsetAll" type="checkbox"/> 反选</label></td>
                                    <td>表名</td>
                                    <td>表用途</td>
                                    <td>记录行数</td>
                                    <td>引擎类型</td>
                                    <td>字符集</td>
                                    <td>总计：<?php echo ($total); ?></td>
                                </tr>
                            </tfoot>
                        </table>
                    </form>
                    <div class="commonBtnArea" >
                        <button class="btn submit">备份所选</button>
                    </div>
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
                clickCheckbox();
                $(".submit").click(function(){
                    if($("tbody input[type='checkbox']:checked").size()==0){
                        popup.alert("请先选择你要备份的数据库表吧");
                        return false;
                    }
                    if($(this).attr("disabledSubmit")){
                        popup.alert("已提交，系统在处理中...");
                    }else{
                        $(this).attr("disabledSubmit",true).html("提交处理中...");
                        commonAjaxSubmit("/index.php/conist/SysData/backup");
//                        popup.alert("系统处理中，如果数据库中数据较多可能需要较长时间，请稍候....");
                        setTimeout(function(){
                            popup.close("asyncbox_alert");
                        },2000);
                    }
                });
            });
        </script>
    </body>
</html>