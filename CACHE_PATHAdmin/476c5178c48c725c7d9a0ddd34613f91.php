<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加编辑菜单-网站设置-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
    <?php $addCss=""; $addJs=""; $currentNav ='网站设置 > 添加编辑菜单'; ?>
    <link rel="stylesheet" type="text/css" href="/Public/Min/?f=/Public/Admin/Css/base.css|/Public/Admin/Css/layout.css|/Public/Js/asyncbox/skins/default.css<?php echo ($addCss); ?>" />
<script type="text/javascript" src="/Public/Min/?f=/Public/Js/jquery-1.9.0.min.js|/Public/Js/jquery.lazyload.js|/Public/Js/functions.js|/Public/Admin/Js/base.js|/Public/Js/jquery.form.js|/Public/Js/asyncbox/asyncbox.js<?php echo ($addJs); ?>"></script>
</head>
<body>
<div class="wrap"> <div id="Top">
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
    <div class="mainBody"> <div id="Left">
    <div id="control" class=""></div>
    <div class="subMenuList">
        <div class="itemTitle"><?php if(CONTROLLER_NAME == 'Index'): ?>常用操作<?php else: ?>子菜单<?php endif; ?> </div>
        <ul>
            <?php if(is_array($sub_menu)): foreach($sub_menu as $key=>$sv): ?><li><a href="<?php echo ($sv["url"]); ?>"><?php echo ($sv["title"]); ?></a></li><?php endforeach; endif; ?>
        </ul>
    </div>

</div>
        <div id="Right">
            <div class="contentArea">
                <div class="Item hr">
                    <div class="current">添加编辑菜单</div>
                </div>
                <form action="<?php echo U('Siteinfo/add_nav');?>" method="post">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
                        <?php if($site['SITE_INFO']['LANG_SWITCH_ON']=='1'){ ?>
                        <tr>
                            <th>语言选择：</th>
                            <td><select name="lang" style="width: 80px;">
<option value="zh-cn" <?php if($info['lang'] == 'zh-cn'): ?>selected<?php endif; ?> >简体中文</option>
                                        <option value="en-us" <?php if($info['lang'] == 'en-us'): ?>selected<?php endif; ?> >English</option>
										<option value="ru" <?php if($info['lang'] == 'ru'): ?>selected<?php endif; ?> >RU</option>
										<option value="spain" <?php if($info['lang'] == 'spain'): ?>selected<?php endif; ?> >SPAIN</option>
                            </select></td>
                        </tr>
                        <?php } ?>
                        <tr>
                            <th width="120">菜单名称：</th>
                            <td><input name="nav_name" type="text" class="input" size="40" value="<?php echo ($info["nav_name"]); ?>" /> </td>
                        </tr>
                        <tr>
                            <th>父分类：</th>
                            <td><select name="parent_id" style="width: 140px;">
                                <option value="0">顶级分类</option>
                                <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>"  <?php if($vo['id'] == $info['parent_id']): ?>selected<?php endif; ?>><?php echo ($vo["fullname"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                            </select></td>
                        </tr>
                        <tr id="hidetr">
                            <th width="120">选择菜单：</th>
                            <td>
                                <select name="moduleguide" id="guide"  style="width: 140px;">
                                    <option value="">--请选择--</option>
                                    <option value="link-0" <?php if($info['module']=='link' && 0==$info['guide']){ ?>selected<?php } ?>>外部链接</option>
                                    <option value="message-0" <?php if($info['module']=='message' && 0==$info['guide']){ ?>selected<?php } ?>>留言板</option>
                                    <option disabled>文章分类</option>
                                    <option value="news-0" <?php if($info['module']=='news' && 0==$info['guide']){ ?>selected<?php } ?>>文章列表页</option>
                                    <?php if(is_array($artlist)): $i = 0; $__LIST__ = $artlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="news-<?php echo ($vo["cid"]); ?>"  <?php if($info['module']=='news' && $vo['cid']==$info['guide']){ ?>selected<?php } ?>>-<?php echo ($vo["fullname"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                    <option disabled>产品分类</option>
                                    <option value="product-0" <?php if($info['module']=='product' && 0==$info['guide']){ ?>selected<?php } ?>>产品列表页</option>
                                    <?php if(is_array($prolist)): $i = 0; $__LIST__ = $prolist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="product-<?php echo ($vo["cid"]); ?>" <?php if($info['module']=='product' && $vo['cid']==$info['guide']){ ?>selected<?php } ?>>-<?php echo ($vo["fullname"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                    <option disabled>单页</option>
                                    <?php if(is_array($pagelist)): $i = 0; $__LIST__ = $pagelist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="page-<?php echo ($vo["id"]); ?>" <?php if($info['module']=='page' && $vo['id']==$info['guide']){ ?>selected<?php } ?>>-<?php echo ($vo["fullname"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <th>导航位置：</th>
                            <td><select name="type" style="min-width: 80px;">
                                <option value="top" <?php if($info['type'] == 'top'): ?>selected<?php endif; ?>>顶部</option>
                                <option value="middle" <?php if($info['type'] == 'middle'): ?>selected<?php endif; ?>>中间</option>
                                <option value="bottom" <?php if($info['type'] == 'bottom'): ?>selected<?php endif; ?>>底部</option>
                            </select></td>
                        </tr>
                        <tr>
                            <th>打开方式：</th>
                            <td><select name="target" style="min-width: 80px;">
                                <option value="0" <?php if($info['target'] == 0): ?>selected<?php endif; ?>>当前窗口</option>
                                <option value="1" <?php if($info['target'] == 1): ?>selected<?php endif; ?>>新窗口</option>
                            </select></td>
                        </tr>
                        <tr>
                            <th>显示排序：</th>
                            <td><input class="input" name="sort" type="text" size="20" value="<?php echo ($info["sort"]); ?>" /> </td>
                        </tr>
                        <tr>
                            <th>外部链接：</th>
                            <td><input class="input" name="link" type="text" size="40" value="<?php echo ($info["link"]); ?>" /> 若使用内部链接此处留空！请加上http://</td>
                        </tr>
                    </table>
                    <input type="hidden" name="id" value="<?php echo ($info["id"]); ?>"/>
                </form>
                <div class="commonBtnArea" >
                    <button class="btn submit">提交</button>
                </div>
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
        $(".submit").click(function(){
            commonAjaxSubmit();
        });
    });
</script>
</body>
</html>