<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<head>
    <meta charset="utf-8" />
    <title><?php echo ($webtitle); ?>-<?php echo ($site["name"]); ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="<?php echo ($site["description"]); ?>,<?php echo ($info['description']); ?>" />
    <meta name="keywords" content="<?php echo ($site["keyword"]); ?>,<?php echo ($info['keywords']); ?>" />
    <meta name="author" content="cony" />
    <!-- CSS -->
    <link href="/Public/Home/css/style.css" rel="stylesheet" type="text/css" />
    <!-- END CSS -->
    <!-- JAVASCRIPT -->
    <script src="/Public/Js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/Public/Home/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="/Public/Home/js/jquery.prettyPhoto.js"></script>
    <script type="text/javascript" src="/Public/Home/js/script.js"></script>
    <script type="text/javascript" src="/Public/Home/js/superfish.js"></script>
    <script type="text/javascript" src="/Public/Home/js/jquery.modernizr.min.js"></script>
    <!-- END JAVASCRIPT -->
</head>
<body>
<div class="header"><!-- HEADER -->
    <div class="container_16" style="padding-top: 6px;">
        <div class="grid_10">
            <ul class="filter group">
                <li><a href="javascript:" onClick="jscript:window.external.AddFavorite(document.location.href,document.title);">收藏本页</a></li>
                <?php $_m_nav=M("nav");$__list__=$_m_nav->where("lang='zh-cn'  AND type='top' AND parent_id=0")->order('sort DESC')->select();foreach($__list__ as $_k1=>$_v1):$cid=$_v1['id'];$child=$_m_nav->where('parent_id='.$cid)->order('sort DESC')->select();extract($_v1);?><li>
                        <a href="<?php echo ($link); ?>" class="grey"><?php echo ($nav_name); ?></a>
                    </li><?php endforeach; ?>
            </ul>
        </div>
        <div class="grid_6" style="text-align: right;">
                <?php if(C('SITE_INFO.LANG_SWITCH_ON')){ ?>
                    [<a href="/index.php/Home/Product?l=zh-cn" style='cursor:pointer;' title='简体中文'>简体中文</a>]
                    [<a href="/index.php/Home/Product?l=en-us" style='cursor:pointer;' title='English'>English</a>]
					[<a href="/index.php/Home/Product?l=ru" style='cursor:pointer;' title='русский '>русский </a>]
					[<a href="/index.php/Home/Product?l=spain" style='cursor:pointer;' title='El espa~nol'>El espa~nol</a>]
                  <!--  [<a href="<?php echo U('Member/index');?>" style='cursor:pointer;' title='login'><?php echo (L("T_LOGIN")); ?></a>]
                    [<a href="<?php echo U('Member/index');?>#toregister" style='cursor:pointer;' title='signIn'><?php echo (L("T_SIGN")); ?></a>]-->
                <?php } ?>
        </div>
    </div>
    <div class="container_12">
        <div class="grid_3">

            <div class="logo"><!-- LOGO -->
                <a href="/index.php"><img src="/Public/Home/images/logo.png" alt="" /></a>
            </div>
        </div><!-- END LOGO -->

        <div class="grid_9"><!-- MENU -->
            <ul class="sf-menu">
                <li>
                    <a href="/index.php"><span class="uppercase"><?php echo (L("T_HOME")); ?></span></a>
                </li>
                <?php $_m_nav=M("nav");$__list__=$_m_nav->where("lang='zh-cn'  AND type='middle' AND parent_id=0")->order('sort DESC')->select();foreach($__list__ as $_k1=>$_v1):$cid=$_v1['id'];$child=$_m_nav->where('parent_id='.$cid)->order('sort DESC')->select();extract($_v1);?><li>
                    <a href="<?php echo ($link); ?>"><span class="uppercase"><?php echo ($nav_name); ?></span></a>
                        <?php if(!empty($child)): ?><ul>
                                <?php if(is_array($child)): $i = 0; $__LIST__ = $child;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nc): $mod = ($i % 2 );++$i;?><li>
                                    <a href="<?php echo ($nc["link"]); ?>"><?php echo ($nc["nav_name"]); ?></a>
                                </li><?php endforeach; endif; else: echo "" ;endif; ?>
                            </ul><?php endif; ?>
                    </li><?php endforeach; ?>
            </ul>
        </div><!-- END MENU -->
    </div>
</div><!-- END HEADER -->
<script type="text/javascript" src="/Public/Home/js/jquery.quicksand.js"></script>
<div class="head_title"><!-- HEAD TITLE -->
    <div class="container_12">
        <div class="grid_12">

        </div>
    </div>
</div><!-- HEAD TITLE -->
<div class="breadcrumbs"><!-- BREADCRUMBS -->
    <div class="container_12">
        <div class="grid_12">
            <a href="/index.php"><?php echo (L("T_HOME")); ?></a>
            <a href="<?php echo U('product/index');?>" class="icon_meta"><?php echo (L("T_PRODUCT")); ?></a>
            <form id="search" action="#" />
            <fieldset>
                <input type="text" name="search" />
                <input type="submit" value="" />
            </fieldset>
            </form>
        </div>
    </div>
</div><!-- END BREADCRUMBS -->
<div class="main"><!-- MAIN -->
    <div class="container_12">
        <div class="grid_12">
            <dl class="group"><!-- CATEGORY FILTER -->
                <dd>
                    <ul class="filter group">
                        <li class="current all">
                            <a href="#">All</a>
                        </li>
                        <?php $__m_cat=M("category");$__cat_list=$__m_cat->where("lang='zh-cn'  AND type='p' AND pid=0")->limit()->select();foreach($__cat_list as $_ck=>$_cv):$cid=$_cv['cid'];$child=$__m_cat->where('pid='.$cid)->order('cid DESC')->select();extract($_cv);?><li class="cat-<?php echo ($cid); ?>">
                                <a href="#"><?php echo ($name); ?></a>
                            </li><?php endforeach; ?>
                    </ul>
                </dd>
            </dl><!-- END CATEGORY FILTER -->
            <ul class="portfolio_4_col group"><!-- PORTFOLIO ITEMS -->
                <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="item" data-id="id-<?php echo ($vo["id"]); ?>" data-type="cat-<?php echo ($vo["cid"]); ?>">
                    <a href="<?php echo get_default_img($vo['image_id']);?>" rel="prettyPhoto[portfolio]"><img src="<?php echo get_default_img($vo['image_id']);?>" alt="<?php echo ($vo["title"]); ?>" /></a>
                    <h5 class="uppercase">
                        <?php echo ($vo["title"]); ?>
                    </h5>
                    <p>
                        <?php echo cutStr($vo['summary'],40,0);?>
                    </p><a href="<?php echo U('product/read',array('id'=>$vo['id']));?>" class="link_bottom"><?php echo (L("T_VIEW")); ?></a>
                </li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul><!-- END PORTFOLIO ITEMS -->
        </div>
        <div class="pagination"><!-- PAGINATION -->
            <a href="#"><?php echo ($page); ?></a>
        </div>
    </div>
</div><!-- END MAIN -->
<div class="footer_middle"><!-- FOOTER MIDDLE -->
    <div class="container_12">
        <div class="grid_2">
            <h5>
                <?php echo (L("T_NAV")); ?>
            </h5>
            <div class="list-type-footer">
                <ul>
                    <li>
                        <a href="/index.php"><span class="grey"><?php echo (L("T_HOME")); ?></span></a>
                    </li>
                    <?php $_m_nav=M("nav");$__list__=$_m_nav->where("lang='zh-cn'  AND type='bottom' AND parent_id=0")->order('sort DESC')->select();foreach($__list__ as $_k1=>$_v1):$cid=$_v1['id'];$child=$_m_nav->where('parent_id='.$cid)->order('sort DESC')->select();extract($_v1);?><li>
                            <a href="<?php echo ($link); ?>" class="grey"><?php echo ($nav_name); ?></a>
                        </li><?php endforeach; ?>
                </ul>
            </div>
        </div>
        <div class="grid_2">
            <h5>
                <?php echo (L("T_LINKS")); ?>
            </h5>
            <div class="list-type-footer">
                <ul>
                    <?php $__m_link=M("link");$__link_list=$__m_link->where('display=1')->order('sort DESC')->limit(6)->select();foreach($__link_list as $_lk=>$_lv):extract($_lv);?><li>
                        <a href="<?php echo ($link); ?>" class="grey" <?php if($target == 2): ?>target='_blank'<?php endif; ?> title='<?php echo ($title); ?>'><?php echo ($title); ?></a>
                    </li><?php endforeach; ?>
                </ul>
            </div>
        </div>
        <div class="grid_2">
            <h5>
                关注微博
            </h5>
            <div class="list-type-footer">
                <a href="http://weibo.com/522504678" target="_blank"><img src="/Public/Home/images/logo_ft_1.png"> </a>
            </div>
        </div>
        <div class="grid_3 latest_posts">
            <h5>
                关注微信
            </h5>
            <div class="list-type-footer">
                <img src="/Public/Home/images/weixin.jpg" width="110" height="110">
            </div>
        </div>
        <div class="grid_3">
            <h5>
                Contact Details
            </h5>
            <div class="list-type-footer">
                <p class="grey">
                    CONIST
                </p><br />
                <p class="grey">
                    广东省 广州市 天河区
                </p><br />
                <p class="grey">
                    QQ群:  <a target="_blank" href="http://wp.qq.com/wpa/qunwpa?idkey=d58a5cb1a5297cd53db318b24cf5de264a68c7869f29c7c659b86d6ad80debca"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="Conist php技术交流群" title="Conist php技术交流群"></a>
                </p><br />
                <p class="grey">
                    Email: <a href="conist@jtys114.com" class="grey">conist@jtys114.com</a>
                </p>
            </div>
        </div>
    </div>
</div><!-- FOOTER MIDDLE -->

<div class="footer"><!-- FOOTER -->
    <div class="container_12">
        <div class="grid_6">
            <p class="copyright">
                &copy; Copyright &copy; 2013.Conist All rights reserved.<a target="_blank" href="#"></a>
            </p>
        </div>
        <div class="grid_6">
            <div class="social-box">
                <a href="#"><img src="/Public/Home/images/social_facebook.png" width="19" height="18" alt="" /></a> <a href="#"><img src="/Public/Home/images/social_twitter.png" width="19" height="18" alt="" /></a> <a href="#"><img src="/Public/Home/images/social_flickr.png" width="19" height="18" alt="" /></a> <a href="#"><img src="/Public/Home/images/social_linkedin.png" width="19" height="19" alt="" /></a> <a href="#"><img src="/Public/Home/images/social_dribble.png" width="19" height="18" alt="" /></a>
            </div>
        </div>
    </div>
</div><!-- END FOOTER -->
</body></html>