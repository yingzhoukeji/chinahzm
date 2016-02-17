<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>添加、编辑微信活动-后台管理-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='微信活动管理 > 添加编辑活动'; ?>
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
                        <div class="current">添加编辑活动</div>
                    </div>
                    <form>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
                            <tr>
                                <th width="100">活动标题：</th>
                                <td><input id="title" type="text" class="input" size="60" name="title" value="<?php echo ($info["title"]); ?>"/></td>
                            </tr>
							<tr>
                                <th>结束日期：</th>
                                <td><input id="title" type="text" class="input" size="60" name="endtime" value="<?php echo ($info["title"]); ?>" onClick="WdatePicker()"/></td>
                            </tr>
							<tr>
                                <th>活动积分：</th>
                                <td><input id="title" type="text" class="input" size="60" name="srcoe" value="<?php echo ($info["title"]); ?>"/></td>
                            </tr>
							<tr>
                                <th>兑换礼品最低积分：</th>
                                <td><input id="limit" type="text" class="input" size="60" name="limit" value="<?php echo ($info["limit"]); ?>"/></td>
                            </tr>
							<tr>
                                <th>电话联系：</th>
                                <td><input id="title" type="text" class="input" size="60" name="phone" value="<?php echo ($info["phone"]); ?>"/></td>
                            </tr>
                            <tr>
                                <th>活动图片：</th>
                                <td><input type="text" id="url1" class="input" size="40" name="image" value="<?php echo ($img_info["savepath"]); ?>"/>
                                    <?php if(!empty($img_info)): ?><input type="hidden" name="image_id" value="<?php echo ($img_info["id"]); ?>" /><?php endif; ?>
                                    <input type="button" class="btn " id="image1" value="选择图片" /></td>
                            </tr>
							 <tr>
                                <th width="100">发布状态：</th>
                                <td><label><input type="radio" name="status" value="0" <?php if($info["status"] == 0): ?>checked="checked"<?php endif; ?> /> 启用</label> &nbsp; <label><input type="radio" name="status" value="1" <?php if($info["status"] == 1): ?>checked="checked"<?php endif; ?> /> 禁用</label> </td>
                            </tr>
                            
                            <tr>
                                <th>活动简介：</th>
                                <td><textarea class="input" style="height: 60px; width: 600px;" name="summary"><?php echo ($info["summary"]); ?></textarea> 如果不填写则系统自动截取文章前200个字符</td>
                            </tr>
                            <tr>
                                <th>活动内容：</th>
                                <td><textarea id="content" class="input" style="height: 300px; width: 100%;" name="content"><?php echo ($info["content"]); ?></textarea></td>
                            </tr>
                        </table>
                        <input type="hidden" name="id" value="<?php echo ($info["id"]); ?>" />
                    </form>
                    <div class="commonBtnArea" >
                        <button class="btn submit">提交</button>
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
        <script type="text/javascript" src="/Public/kindeditor/kindeditor.js"></script><script type="text/javascript" src="/Public/kindeditor/lang/zh_CN.js"></script><script type="text/javascript" src="/Public/My97DatePicker/WdatePicker.js"></script>
		
        <script type="text/javascript">
            $(function(){
				var  content ;
                KindEditor.ready(function(K) {
                    content = K.create('#content',{
                        allowFileManager : true,
                        uploadJson:'/Public/kindeditor/php/upload_json.php?dirname=wxhd'
                    });
                });
               KindEditor.ready(function(K) {
                    content = K.create('#content',{
                        allowFileManager : true,
                        uploadJson:'/Public/kindeditor/php/upload_json.php?dirname=wxhd'
                    });
                });
                $(".submit").click(function(){
                    content.sync();
                    commonAjaxSubmit();
                    return false;
                });
            });
        </script>
        <script>
            KindEditor.ready(function(K) {
                var editor = K.editor({
                    allowFileManager : true,
                    uploadJson:'/Public/kindeditor/php/upload_json.php?dirname=wxhd'
                });
                K('#image1').click(function() {
                    editor.loadPlugin('image', function() {
                        editor.plugin.imageDialog({
                            imageUrl : K('#url1').val(),
                            clickFn : function(url, title, width, height, border, align) {
                                K('#url1').val(url);
                                editor.hideDialog();
                            }
                        });
                    });
                });
            });
        </script>
    </body>
</html>