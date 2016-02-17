<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>添加、编辑产品-后台管理-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='产品管理 > 添加编辑产品'; ?>
        <link rel="stylesheet" type="text/css" href="/Public/Min/?f=/Public/Admin/Css/base.css|/Public/Admin/Css/layout.css|/Public/Js/asyncbox/skins/default.css<?php echo ($addCss); ?>" />
<script type="text/javascript" src="/Public/Min/?f=/Public/Js/jquery-1.9.0.min.js|/Public/Js/jquery.lazyload.js|/Public/Js/functions.js|/Public/Admin/Js/base.js|/Public/Js/jquery.form.js|/Public/Js/asyncbox/asyncbox.js<?php echo ($addJs); ?>"></script>
        <style>
            div.spot {
                float: left;
                margin: 0 20px 0 0;
                width: 220px;
                min-height: 160px;
                border: 2px dashed #ddd;
            }
            .droparea {
                position: relative;
                text-align: center;
            }
            .droparea .instructions {
                opacity: 0.8;
                background-color: #cccccc;
                height: 25px;
                z-index: 10;
                zoom: 1;
                background-position: initial initial;
                background-repeat: initial initial;
                cursor: pointer;
            }
            .droparea div, .droparea input {
                position: absolute;
                top: 0;
                width: 100%;
                height: 100%;
            }
            .droparea input {
                cursor: pointer;
                opacity: 0;
            }
            .droparea div, .droparea input {
                position: absolute;
                top: 0;
                width: 100%;
                height: 100%;
            }
            #uparea1,#uparea2,#uparea3{
                height: 170px;
                cursor: pointer;
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
                        <div class="current">添加编辑产品</div>
                    </div>
                    <form>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
                            <?php if($site['SITE_INFO']['LANG_SWITCH_ON']=='1'){ ?>
                            <tr>
                                <th>语言选择：</th>
                                <td>
                                    <select name="info[lang]">
                                        <option value="zh-cn" <?php if($info['lang'] == 'zh-cn'): ?>selected<?php endif; ?> >简体中文</option>
                                        <option value="en-us" <?php if($info['lang'] == 'en-us'): ?>selected<?php endif; ?> >English</option>
										<option value="ru" <?php if($info['lang'] == 'ru'): ?>selected<?php endif; ?> >RU</option>
										<option value="spain" <?php if($info['lang'] == 'spain'): ?>selected<?php endif; ?> >SPAIN</option>
                                    </select></td>
                            </tr>
                            <?php } ?>
                            <tr>
                                <th width="100">产品标题：</th>
                                <td><input id="title" type="text" class="input" size="60" name="info[title]" value="<?php echo ($info["title"]); ?>"/> <a href="javascript:void(0)" id="checkNewsTitle">检测是否重复</a></td>
                            </tr>

                            <tr>
                                <th width="100">产品发布状态：</th>
                                <td><label><input type="radio" name="info[status]" value="0" <?php if($info["status"] == 0): ?>checked="checked"<?php endif; ?> /> 产品审核状态</label> &nbsp; <label><input type="radio" name="info[status]" value="1" <?php if($info["status"] == 1): ?>checked="checked"<?php endif; ?> /> 产品已发布状态</label> </td>
                            </tr>
                            <tr>
                                <th>产品所属分类：</th>
                                <td>
                                    <select name="info[cid]">
                                        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; if($vo[cid] == $info[cid]): ?><option value="<?php echo ($vo["cid"]); ?>" selected="selected"><?php echo ($vo["fullname"]); ?></option>
                                                <?php else: ?>
                                                <option value="<?php echo ($vo["cid"]); ?>"><?php echo ($vo["fullname"]); ?></option><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                                    </select></td>
                            </tr>
                            <tr>
                                <th>产品价格：</th>
                                <td><input type="text" class="input" size="20" name="info[price]" value="<?php echo ($info["price"]); ?>"/></td>
                            </tr>
                             <tr>
                                <th>单位：</th>
                                <td><input type="text" class="input" size="20" name="info[unit]" value="<?php echo ($info["unit"]); ?>"/></td>
                            </tr>
                            <tr>
                                <th>产品型号：</th>
                                <td><input type="text" class="input" size="20" name="info[psize]" value="<?php echo ($info["psize"]); ?>"/></td>
                            </tr>

                            <tr>
                                <th>产品图片：</th>
                                <td>
                                    <div class="droparea spot" id="image1" style="background-image: url('<?php echo ($img_info[0]['savepath']); ?>');background-size: 220px 160px;" ><div class="instructions" onclick="del_image('1')">删除</div><div id="uparea1"></div><input type="hidden" name="image_1[]" id="image_1" value="<?php echo ($img_info[0]['savepath']); ?>" /></div>
                                    <div class="droparea spot" id="image2" style="background-image: url('<?php echo ($img_info[1]['savepath']); ?>');background-size: 220px 160px;" ><div class="instructions" onclick="del_image('2')">删除</div><div id="uparea2"></div><input type="hidden" name="image_1[]" id="image_2" value="<?php echo ($img_info[1]['savepath']); ?>" /></div>
                                    <div class="droparea spot" id="image3" style="background-image: url('<?php echo ($img_info[2]['savepath']); ?>');background-size: 220px 160px;" ><div class="instructions" onclick="del_image('3')">删除</div><div id="uparea3"></div><input type="hidden" name="image_1[]" id="image_3" value="<?php echo ($img_info[2]['savepath']); ?>" /></div>
                                </td>
                            </tr>

                            <tr>
                                <th>产品关键词：</th>
                                <td><input type="text" class="input" size="60" name="info[keywords]" value="<?php echo ($info["keywords"]); ?>"/> 多关键词间用半角逗号（,）分开，可用于做文章关联阅读条件</td>
                            </tr>
                            <tr>
                                <th>产品描述：</th>
                                <td><textarea class="input" style="height: 60px; width: 600px;" name="info[description]"><?php echo ($info["description"]); ?></textarea> 用于SEO的description</td>
                            </tr>
                            <tr>
                                <th>产品摘要：</th>
                                <td><textarea class="input" style="height: 60px; width: 600px;" name="info[summary]"><?php echo ($info["summary"]); ?></textarea> 如果不填写则系统自动截取文章前200个字符</td>
                            </tr>
                            <tr>
                                <th>产品内容：</th>
                                <td><textarea id="content" class="" style="height: 300px; width: 80%;" name="info[content]"><?php echo ($info['content']); ?></textarea></td>
                            </tr>
                        </table>
                        <?php if(empty($_GET['do'])){ ?>
                        <input type="hidden" name="info[id]" value="<?php echo ($info["id"]); ?>" />
                        <?php }else{ $action_url='/index.php/conist/Product/add'; } ?>
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
        <script type="text/javascript" src="/Public/kindeditor/kindeditor.js"></script><script type="text/javascript" src="/Public/kindeditor/lang/zh_CN.js"></script>
        <script type="text/javascript">
            function del_image(num){
                $('#image'+num).css('background-image','');
                $('#image_'+num).val('');
            }
            $(function(){

                var  content ;
                KindEditor.ready(function(K) {
                    content = K.create('#content',{
                        allowFileManager : true,
                        uploadJson:'/Public/kindeditor/php/upload_json.php?dirname=product'
                    });
                });

                KindEditor.ready(function(K) {
                    K.create();
                    var editor = K.editor({
                        allowFileManager : true,
                        uploadJson:'/Public/kindeditor/php/upload_json.php?dirname=product'
                        //sdl:false
                    });
                    K('#uparea1').click(function() {
                        editor.loadPlugin('image', function() {
                            editor.plugin.imageDialog({
                                imageUrl : K('#image_1').val(),
                                clickFn : function(url, title, width, height, border, align) {
                                    $('#image1').css('background-image','url('+url+')').css('background-size','220px 160px');
                                    K('#image_1').val(url);
                                   // K('#getImgUrl').val(url);
                                    editor.hideDialog();
                                }
                            });
                        });
                    });

                    K('#uparea2').click(function() {
                        editor.loadPlugin('image', function() {
                            editor.plugin.imageDialog({
                                imageUrl : K('#image_2').val(),
                                clickFn : function(url, title, width, height, border, align) {
                                    $('#image2').css('background-image','url('+url+')').css('background-size','220px 160px');
                                    K('#image_2').val(url);
                                    // K('#getImgUrl').val(url);
                                    editor.hideDialog();
                                }
                            });
                        });
                    });

                    K('#uparea3').click(function() {
                        editor.loadPlugin('image', function() {
                            editor.plugin.imageDialog({
                                imageUrl : K('#image_3').val(),
                                clickFn : function(url, title, width, height, border, align) {
                                    $('#image3').css('background-image','url('+url+')').css('background-size','220px 160px');
                                    K('#image_3').val(url);
                                    // K('#getImgUrl').val(url);
                                    editor.hideDialog();
                                }
                            });
                        });
                    });


                });
                $("#checkNewsTitle").click(function(){
                    if($('#title').val()==''){
                        popup.error('标题不能为空！');
                        return false;
                    }
                    $.getJSON("/index.php/conist/Product/checkProductTitle", { title:$("#title").val(),id:"<?php echo ($info["id"]); ?>"}, function(json){
                        $("#checkNewsTitle").css("color",json.status==1?"#0f0":"#f00").html(json.info);
                    });
                });
                $(".submit").click(function(){
                    if($('#title').val()==''){
                        popup.error('标题不能为空！');
                        return false;
                    }
                    content.sync();
                    commonAjaxSubmit("<?php echo ($action_url); ?>");
                    return false;
                });
            });
        </script>
    </body>
</html>