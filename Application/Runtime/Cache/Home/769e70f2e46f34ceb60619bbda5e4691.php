<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="zh-ch" class="squarespace-damask">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="initial-scale=1">
<meta name="description" content="<?php echo ($site["description"]); ?>,<?php echo ($info['description']); ?>" />
<meta name="keywords" content="<?php echo ($site["keyword"]); ?>,<?php echo ($info['keywords']); ?>" />
<link href='/documents/css.css?family=Open+Sans:400,700,300,600' rel='stylesheet' type='text/css'>
<meta charset="utf-8" />
<title><?php echo ($site["name"]); ?></title>
<link rel="shortcut icon" type="image/x-icon" href="/documents/favicon.ico"/>
<link rel="canonical" href=""/>

<!--[if !IE]> -->
<link rel="stylesheet" type="text/css" href="/documents/site.css?&filterFeatures=false"/>
<link rel="stylesheet" type="text/css" href="/documents/iconfont.css"/>

</head>
<body id="collection-5474ede1e4b02b8f5975247c" class="header-alignment-left gallery-design-slideshow aspect-ratio-auto lightbox-style-dark gallery-navigation-bullets gallery-info-overlay-show-on-hover gallery-aspect-ratio-32-standard gallery-arrow-style-no-background gallery-transitions-fade gallery-show-arrows gallery-auto-crop   product-list-titles-under product-list-alignment-center product-item-size-11-square product-image-auto-crop product-gallery-size-11-square  show-product-price show-product-item-nav product-social-sharing   event-thumbnails event-thumbnail-size-32-standard event-date-label  event-list-show-cats event-list-date event-list-time event-list-address     event-excerpts  event-item-back-link     hide-opentable-icons opentable-style-dark newsletter-style-dark small-button-style-solid small-button-shape-square medium-button-style-solid medium-button-shape-square large-button-style-solid large-button-shape-square button-style-default button-corner-style-square product-list-titles-under product-list-alignment-center product-item-size-11-square product-image-auto-crop product-gallery-size-11-square  show-product-price show-product-item-nav product-social-sharing native-currency-code-usd collection-type-home2 collection-layout-home collection-5474ede1e4b02b8f5975247c homepage view-list mobile-style-available">
<div class="site-menu__underlay"></div>
<div class="site-menu__bg"></div>
<div class="site-menu" data-content-field="navigation-mainNav">
  <div class="site-menu__content">
    <button class="site-menu__close" type="button">关闭</button>
	<div class="sjnav">
		<div class="sjlang">
			  <a href="/index.php/Home/Index?l=zh-cn"><span><img src="/documents/ch.jpg"></span><span> 中文</span></a>
			  <a href="/index.php/Index/eindex?l=en-us"><span><img src="/documents/en.jpg"></span><span> 英文</span></a>
		</div>	
		<div class="sjdl">
			  <?php if(session('uid')!=null){ echo '<a href="'.U('Usercenter/index').'">'.session('telephone').'</a>'; echo '<span> / </span><a href="'.U('Member/logout').'?goto='.urlencode(get_url()).'">退出</a>'; }else{ echo '<a href="'.U('Member/index').'?goto='.urlencode(get_url()).'">登陆</a>'; echo '<span> / </span><a href="'.U('Member/register').'">注册</a>'; } ?>
		</div>
	</div>
    <ul class="site-nav">
		<?php $_m_nav=M("nav");$__list__=$_m_nav->where("lang='zh-cn'  AND type='middle' AND parent_id=0")->order('sort DESC')->select();foreach($__list__ as $_k1=>$_v1):$cid=$_v1['id'];$child=$_m_nav->where('parent_id='.$cid)->order('sort DESC')->select();extract($_v1);?><li class="site-nav__item">
				<span><?php echo ($nav_name); ?></span>
				<?php if(!empty($child)): ?><ul class="sub-nav">
					<?php if(is_array($child)): $i = 0; $__LIST__ = $child;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nc): $mod = ($i % 2 );++$i;?><li class="sub-nav__item "> <a href="<?php echo ($nc["link"]); ?>"><?php echo ($nc["nav_name"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
				</ul><?php endif; ?>
			</li><?php endforeach; ?>
	</ul>	
  </div>
</div>
<div class="body">

<!--Content injection point.-->
<main id="content" class="content" role="main" data-content-field="main-content">
<section class="intro nection nection--intro hentry tag-intro tag-light tag-full author-maciej-j post-type-text article-index-1">
  <header class="header mxftop">
  <div class="mxfhead"> 
    <a class="header__logo logo logo--large mxflogo" href="/"> <img src="/documents/logo.png" alt="海之梦集团"> </a> <a class="header__logo logo logo--small" href="/"> <img src="/documents/logo-sm.png" alt="海之梦集团"> </a>
    <ul class="mxfdh">
		<?php $_m_nav=M("nav");$__list__=$_m_nav->where("lang='zh-cn'  AND type='middle' AND parent_id=0")->order('sort DESC')->select();foreach($__list__ as $_k1=>$_v1):$cid=$_v1['id'];$child=$_m_nav->where('parent_id='.$cid)->order('sort DESC')->select();extract($_v1);?><li><?php echo ($nav_name); ?></li><?php endforeach; ?>
	</ul>	
	<div class="header__content mxfyb">	
	  <div class="lang">
		  <a href="/index.php/Home/Index?l=zh-cn"><span><img src="/documents/ch.jpg"></span><span> 中文</span></a>
		  <a href="/index.php/Index/eindex?l=en-us"><span><img src="/documents/en.jpg"></span><span> 英文</span></a>
	  </div>	
      <div class="header-nav">
          <span class="header-nav__item mxfdl"> 
		  <?php if(session('uid')!=null){ echo '<a href="'.U('Usercenter/index').'">'.session('telephone').'</a>'; echo '<a href="'.U('Member/logout').'?goto='.urlencode(get_url()).'">退出</a>'; }else{ echo '<a href="'.U('Member/index').'?goto='.urlencode(get_url()).'">登陆</a>'; echo '<a href="'.U('Member/register').'">注册</a>'; } ?>
		  </span>
          <span class="header-nav__item mxfmenu">
            <button type="button" class="site-menu__open">菜单</button>
          </span>
      </div>
    </div>
  </div>
  
  <div class="mxfsub2">
  <div class="mxfsub1"> 
  <div class="subz">&nbsp;</div>
  <div class="subm">
	<?php $_m_nav=M("nav");$__list__=$_m_nav->where("lang='zh-cn'  AND type='middle' AND parent_id=0")->order('sort DESC')->select();foreach($__list__ as $_k1=>$_v1):$cid=$_v1['id'];$child=$_m_nav->where('parent_id='.$cid)->order('sort DESC')->select();extract($_v1); if(!empty($child)): ?><ul>
				<?php if(is_array($child)): $i = 0; $__LIST__ = $child;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nc): $mod = ($i % 2 );++$i;?><li> <a href="<?php echo ($nc["link"]); ?>"><?php echo ($nc["nav_name"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
			</ul><?php endif; endforeach; ?>
  </div>
  <div class="suby">
	<a href="/index.php/product/index/cid/1"><img src="/documents/lh1.png" id="test"></a>
	<p><a href="/index.php/product/index/cid/1">海之梦礼盒系列</a></p>
	<p>订购热线：400 8707 797</p>
  </div>  
  <div class="wave"></div>
  </div>
  </div>	
</header>


<script>
	function change(n){
		if(n>5) n=1;  // 一共5张图片，所以循环替换
		document.getElementById("test").setAttribute("src", "/documents/lh"+n+".png");
		n++;
		setTimeout("change("+n+")",2000);
	}
	window.onload = function(){
		setTimeout("change(1)", 2000);
	}
</script>

  <video autoplay loop poster="/documents/video.jpg" class="intro__video intro__video--dynamic" alt="Introductory video">
    <source src="/documents/inca.mp4" type="video/mp4">
    <source src="/documents/inca.webm" type="video/webm">
  </video>
  <img src="/documents/video.jpg" class="intro__video intro__video--static">
  <div class="intro__content">
    <div class="sqs-layout sqs-grid-12 columns-12" data-layout-label="Post Body" data-type="item" data-updated-on="1417540394082" id="item-547df29ae4b014d3d28888a5">
      <div class="row sqs-row">
        <div class="col sqs-col-2 span-2">
          <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1417043884606_284003">
            <div class="sqs-block-content">&nbsp;</div>
          </div>
        </div>
        <div class="col sqs-col-8 span-8">
          <div class="sqs-block html-block sqs-block-html" data-block-type="2" id="block-41f0cd755eb7dda07408">
            <div class="sqs-block-content">
              <h2>海之梦集团</h2>
              <h1 class="text-align-center">Ocean Dream Group</h1>
            </div>
          </div>
        </div>
        <div class="col sqs-col-2 span-2">
          <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1417043884606_284878">
            <div class="sqs-block-content">&nbsp;</div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <button class="intro__scroll">走进海之梦</button>
</section>
<section class="nection nection--not-typical-tourist-attractions hentry tag-bg-full tag-light tag-places author-maciej-j post-type-text article-index-2" style="background-image: url(/documents/1.jpg)">
  <div class="sqs-layout sqs-grid-12 columns-12" data-layout-label="Post Body" data-type="item" data-updated-on="1416950335278" id="item-5474f19be4b0d8c535b0fc1e">
    <div class="row sqs-row">
      <div class="col sqs-col-1 span-1">
        <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1416949211079_89452">
          <div class="sqs-block-content">&nbsp;</div>
        </div>
      </div>
      <div class="col sqs-col-5 span-5">
        <div class="sqs-block html-block sqs-block-html" data-block-type="2" id="block-3d271b3930a6807d67ed">
          <div class="sqs-block-content">
            <h2>产品中心</h2>
            <p class="text-align-left">海之梦产品有冷冻食品、干品食品、酱卤食品、鱼糜食品、鱼罐食品、果罐食品、果泥食品、海鲜礼品、海鲜礼包等系列，远销国内外各个地区。</p>
          </div>
        </div>
      </div>
      <div class="col sqs-col-1 span-1">
        <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1416949211079_91281">
          <div class="sqs-block-content">&nbsp;</div>
        </div>
      </div>
      <div class="col sqs-col-5 span-5">
        <div class="sqs-block markdown-block sqs-block-markdown" data-block-type="44" id="block-yui_3_17_2_1_1418162608321_79020">
          <div class="sqs-block-content">
            <ul>
			  <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a class="cplb" href="/index.php/product/index/cid/<?php echo ($vo["cid"]); ?>"><em class="iconfont cid<?php echo ($vo["cid"]); ?>"></em> <strong><?php echo ($vo["name"]); ?></strong> Healthy Fresh Delicious</a></li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="nection nection--why-inca hentry tag-bg-right author-maciej-j post-type-text article-index-3" style="background-image: url(/documents/2.jpg)">
  <div class="sqs-layout sqs-grid-12 columns-12" data-layout-label="Post Body" data-type="item" data-updated-on="1422474205595" id="item-54c93b72e4b0aad28fe79f2e">
    <div class="row sqs-row">
      <div class="col sqs-col-1 span-1">
        <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1422474213456_44561">
          <div class="sqs-block-content">&nbsp;</div>
        </div>
      </div>
      <div class="col sqs-col-5 span-5">
        <div class="sqs-block html-block sqs-block-html" data-block-type="2" id="block-6120886ecdfc8fd0e40b">
          <div class="sqs-block-content">
            <h2 class="mxfgsjj">企业简介</h2>
            <p dir="ltr" class="mxfgsjjp">中国海之梦，浙江省著名商标，水产品十大品牌海鲜大礼包，二十多年口碑积淀，信誉至上，全力打造海鲜礼品第一品牌。</p>
          </div>
        </div>
        <div class="sqs-block button-block sqs-block-button" data-block-type="53" id="block-yui_3_17_2_1_1422474051073_57978">
          <div class="sqs-block-content">
            <div class="sqs-block-button-container--center"> <a href="/index.php/page/index/name/qyjj" class="sqs-block-button-element--small sqs-block-button-element" >了解更多为什么选择海之梦</a> </div>
          </div>
        </div>
      </div>
      <div class="col sqs-col-1 span-1">
        <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1422474213456_45457">
          <div class="sqs-block-content">&nbsp;</div>
        </div>
      </div>
      <div class="col sqs-col-5 span-5">
        <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1422474213456_46262">
          <div class="sqs-block-content">&nbsp;</div>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="nection nection--adventure-with-a-conscience hentry tag-bg-full tag-light author-maciej-j post-type-text article-index-4" style="background-image: url(/documents/3.jpg)">
  <div class="sqs-layout sqs-grid-12 columns-12" data-layout-label="Post Body" data-type="item" data-updated-on="1416950123007" id="item-5474f055e4b053539becfacc">
    <div class="row sqs-row">
      <div class="col sqs-col-3 span-3">
        <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1416949211079_61520">
          <div class="sqs-block-content">&nbsp;</div>
        </div>
      </div>
      <div class="col sqs-col-6 span-6">
        <div class="sqs-block html-block sqs-block-html" data-block-type="2" id="block-c2cdd49a7aaadbb17744">
          <div class="sqs-block-content">
            <h2 class="text-align-center">企业荣誉</h2>
            <p class="text-align-center">海之梦集团多次获得各类国家级证书和浙江省省级证书，证明着我们的实力。</p>
          </div>
        </div>
        <div class="sqs-block button-block sqs-block-button" data-block-type="53" id="block-yui_3_17_2_1_1416949211079_57077">
          <div class="sqs-block-content">
            <div class="sqs-block-button-container--center"> <a href="/index.php/page/index/name/qyry" class="sqs-block-button-element--small sqs-block-button-element" >查看荣誉证书</a> </div>
          </div>
        </div>
      </div>
      <div class="col sqs-col-3 span-3">
        <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1416949211079_62349">
          <div class="sqs-block-content">&nbsp;</div>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="nection nection--exceptional-guides hentry tag-image-flush-bottom tag-bg-none author-maciej-j post-type-text article-index-5" style="background-image: url(/documents/no-image.png)">
  <div class="sqs-layout sqs-grid-12 columns-12" data-layout-label="Post Body" data-type="item" data-updated-on="1416952243733" id="item-5474f23be4b03e43714e5661">
    <div class="row sqs-row">
      <div class="col sqs-col-1 span-1">
        <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1416949211079_110346">
          <div class="sqs-block-content">&nbsp;</div>
        </div>
      </div>
      <div class="col sqs-col-5 span-5">
        <div class="sqs-block html-block sqs-block-html" data-block-type="2" id="block-ca648fcd901b3f532ba1">
          <div class="sqs-block-content mxfspaq">
            <h2 class="text-align-center">食品安全</h2>
            <p class="text-align-center">海之梦产品生产的每一个过程都经过严格把关，保证到您手中的健康、新鲜与美味。</p>
          </div>
        </div>
        <div class="sqs-block button-block sqs-block-button" data-block-type="53" id="block-yui_3_17_2_1_1416949211079_108759">
          <div class="sqs-block-content">
            <div class="sqs-block-button-container--center"> <a href="/index.php/page/index/name/spaq" class="sqs-block-button-element--small sqs-block-button-element" >了解更多生产过程</a> </div>
          </div>
        </div>
      </div>
      <div class="col sqs-col-1 span-1">
        <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1416949211079_114774">
          <div class="sqs-block-content">&nbsp;</div>
        </div>
      </div>
      <div class="col sqs-col-5 span-5">
        <div class="sqs-block image-block sqs-block-image" data-block-type="5" id="block-yui_3_17_2_1_1416949211079_119601">
          <div class="sqs-block-content">
            <div class="image-block-outer-wrapper layout-caption-hidden ">
              <div class="intrinsic" style="max-width:100%;">
                <div class="image-block-wrapper has-aspect-ratio spaq" data-description="">
                  <img class="thumb-image mxfspaqimg" src="/documents/1.png" data-image-dimensions="565x630" data-image-focal-point="0.5,0.5" data-load="false" data-image-id="5474f907e4b05f0cbaa9f9eb" data-type="image" /> </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="nection nection--private-adventures hentry tag-bg-full tag-light author-maciej-j post-type-text article-index-6" style="background-image: url(/documents/4.jpg)">
  <div class="sqs-layout sqs-grid-12 columns-12" data-layout-label="Post Body" data-type="item" data-updated-on="1417043935333" id="item-54765fb8e4b0fa76b3a0492d">
    <div class="row sqs-row">
      <div class="col sqs-col-3 span-3">
        <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1417043884606_54674">
          <div class="sqs-block-content">&nbsp;</div>
        </div>
      </div>
      <div class="col sqs-col-6 span-6">
        <div class="sqs-block html-block sqs-block-html" data-block-type="2" id="block-210941092c9f13614b32">
          <div class="sqs-block-content">
            <h2 class="text-align-center">购物流程</h2>
            <p class="text-align-center">您可以直接在本网站下单购买海之梦产品，支持在线支付和货到付款，我们会给您配送到家，当然也欢迎您到各经销商处光临购买。</p>
          </div>
        </div>
        <div class="sqs-block button-block sqs-block-button" data-block-type="53" id="block-yui_3_17_2_1_1417043884606_40290">
          <div class="sqs-block-content">
            <div class="sqs-block-button-container--center"> <a href="/index.php/page/index/name/gwlc" class="sqs-block-button-element--small sqs-block-button-element" >查看购物流程</a> </div>
          </div>
        </div>
      </div>
      <div class="col sqs-col-3 span-3">
        <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1417043884606_55367">
          <div class="sqs-block-content">&nbsp;</div>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="nection nection--trending-the-incasphere hentry tag-nu-gallery tag-dark tag-bg-none author-maciej-j post-type-text article-index-7" style="background-image: url(no-image.png)">
  <div class="sqs-layout sqs-grid-12 columns-12" data-layout-label="Post Body" data-type="item" data-updated-on="1417044586301" id="item-54766202e4b08c38dd213e92">
    <div class="row sqs-row">
      <div class="col sqs-col-1 span-1">
        <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1417043884606_99477">
          <div class="sqs-block-content">&nbsp;</div>
        </div>
      </div>
      <div class="col sqs-col-10 span-10">
        <div class="sqs-block html-block sqs-block-html" data-block-type="2" id="block-f2d7c7342a696854dfa7">
          <div class="sqs-block-content">
            <h2 class="text-align-center">新闻资讯</h2>
          </div>
        </div>
		
	  <div class="mxfxwlb">
	  <?php if(is_array($newslist)): $i = 0; $__LIST__ = $newslist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="mxfnews">
			<a href="<?php echo U('news/read',array('id'=>$vo['id']));?>" class="image-slide-anchor content-fill">
				<img src="<?php echo get_default_img($vo['image_id']);?>" />
				<p><?php echo ($vo["title"]); ?></p>
			</a>
		</div><?php endforeach; endif; else: echo "" ;endif; ?>
	  </div>

        <div class="sqs-block button-block sqs-block-button" data-block-type="53" id="block-yui_3_17_2_1_1417043884606_91218">
          <div class="sqs-block-content">
            <div class="sqs-block-button-container--center"> <a href="/blog" class="sqs-block-button-element--small sqs-block-button-element" >查看更多新闻</a> </div>
          </div>
        </div>
      </div>
      <div class="col sqs-col-1 span-1">
        <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1417043884606_101011">
          <div class="sqs-block-content">&nbsp;</div>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="nection nection--testimonials hentry tag-full-width tag-bg-none tag-testimonials author-alan-abonyi post-type-text article-index-8">
<div class="sqs-layout sqs-grid-12 columns-12">
  <div class="row sqs-row">
    <div class="col sqs-col-12 span-12">
      <div class="sqs-block gallery-block sqs-block-gallery" data-block-json="{&quot;hSize&quot;:null,&quot;floatDir&quot;:null,&quot;methodOption&quot;:&quot;transient&quot;,&quot;existingGallery&quot;:null,&quot;design&quot;:&quot;slideshow&quot;,&quot;aspectRatio&quot;:null,&quot;autoplay&quot;:true,&quot;autoplay-duration&quot;:5,&quot;controls&quot;:true,&quot;auto-crop&quot;:true,&quot;thumbnails&quot;:false,&quot;show-meta&quot;:true,&quot;meta-position&quot;:&quot;bottom&quot;,&quot;show-meta-on-hover&quot;:false,&quot;active-alignment&quot;:&quot;center&quot;,&quot;collectionId&quot;:&quot;5480a182e4b0e9f25c8604d7&quot;,&quot;vSize&quot;:null,&quot;transientGalleryId&quot;:&quot;5480a182e4b0e9f25c8604d7&quot;}" data-block-type="8">
        <div class="sqs-block-content">
          <div class="sqs-gallery-container sqs-gallery-block-slideshow sqs-gallery-has-controls sqs-gallery-block-show-meta sqs-gallery-block-meta-position-bottom clear">
            <div class="sqs-gallery">
              <div> <img src="documents/5.jpg">
                
                <div class="color-overlay"></div>
              </div>
              <div> <img src="documents/6.jpg">
                
                <div class="color-overlay"></div>
              </div>
            </div>
            <div class="sqs-gallery-meta-container">
              <div class="sqs-gallery-controls"> <a href="#" class="previous"></a> <a href="#" class="next"></a> </div>
            </div>
            <!-- END .sqs-gallery-meta-container --> 
            
          </div>
        </div>
      </div>
    </div>
  </div>
  </section>
  <section class="nection nection--stay-in-the-loop hentry tag-dark tag-newsletter tag-bg-none author-maciej-j post-type-text article-index-9" style="background-image: url(/documents/no-image.png)">
    <div class="sqs-layout sqs-grid-12 columns-12" data-layout-label="Post Body" data-type="item" data-updated-on="1417045577751" id="item-547665c0e4b0abd39b925d30">
      <div class="row sqs-row">
        <div class="col sqs-col-1 span-1">
          <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1417043884606_133274">
            <div class="sqs-block-content">&nbsp;</div>
          </div>
        </div>
        <div class="col sqs-col-5 span-5">
          <div class="sqs-block image-block sqs-block-image" data-block-type="5" id="block-yui_3_17_2_1_1417043884606_138460">
            <div class="sqs-block-content">
              <div class="image-block-outer-wrapper layout-caption-hidden ">
                <div class="intrinsic" style="max-width:540.0px;">
                  <div style="padding-bottom:94.44444274902344%;" class="image-block-wrapper   has-aspect-ratio" data-description="">
                    <img class="thumb-image" src="/documents/9.jpg" data-image="/documents/9.jpg" data-image-dimensions="540x510" data-image-focal-point="0.5,0.5" data-load="false" data-image-id="54766787e4b09fd35235218f" data-type="image" /> </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col sqs-col-5 span-5">
          <div class="sqs-block html-block sqs-block-html" data-block-type="2" id="block-7c84db6c3aa3a9f14baa">
            <div class="sqs-block-content">
              <h2 class="text-align-center">加盟合作</h2>
              <p class="text-align-center">我们期待您的加盟，与我们共创美好未来！</p>
            </div>
          </div>
          <div class="sqs-block form-block sqs-block-form" data-block-type="9" id="block-yui_3_17_2_1_1417043884606_392241">
            <div class="sqs-block-content">
              <div class="lightbox-handle-wrapper lightbox-handle-wrapper--align-center"> <a href="/index.php/page/index/name/jmzc" class="lightbox-handle sqs-system-button sqs-editable-button"> 加入我们 </a> </div>
            </div>
          </div>
        </div>
        <div class="col sqs-col-1 span-1">
          <div class="sqs-block spacer-block sqs-block-spacer sized vsize-1" data-block-type="21" id="block-yui_3_17_2_1_1417043884606_134054">
            <div class="sqs-block-content">&nbsp;</div>
          </div>
        </div>
      </div>
    </div>
  </section>
  </main>
  
  <footer id="footer" class="site-footer nection">
	
	<section class="site-footer__links">
      <div class="sqs-layout sqs-grid-12 columns-12" data-type="block-field" data-updated-on="1447090435758" id="footerLinks">
        <div class="row sqs-row">
          <div class="col sqs-col-12 span-12">
            <div class="row sqs-row mxflink">
			<?php $_m_nav=M("nav");$__list__=$_m_nav->where("lang='zh-cn'  AND type='middle' AND parent_id=0")->order('sort DESC')->select();foreach($__list__ as $_k1=>$_v1):$cid=$_v1['id'];$child=$_m_nav->where('parent_id='.$cid)->order('sort DESC')->select();extract($_v1);?><div class="dbdh">
                <div class="sqs-block html-block sqs-block-html mxfdiv" data-block-type="2" id="block-0ccb3c236c8fcffdaa93">
                  <div class="sqs-block-content">
				    <p class="text-align-left mxfnav"><?php echo ($nav_name); ?><span class="arrow down"></span></p>
					<div class="mxfsubnav">
					<?php if(is_array($child)): $i = 0; $__LIST__ = $child;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nc): $mod = ($i % 2 );++$i;?><a href="<?php echo ($nc["link"]); ?>"><?php echo ($nc["nav_name"]); ?></a><br /><?php endforeach; endif; else: echo "" ;endif; ?>
					</div>
				  </div>
                </div>
              </div><?php endforeach; ?>
			</div>
           </div>
        </div>
	  </div>
    </section>
	
	<section class="site-footer__meta">
      <div class="sqs-layout sqs-grid-12 columns-12" data-type="block-field" data-updated-on="1448929361320" id="metaBlocks">
        <div class="row sqs-row">
          <div class="col sqs-col-12 span-12">
            <div class="sqs-block html-block sqs-block-html" data-block-type="2" id="block-719c5b397f46bcf5af51">
			
			<div class="bdsharebuttonbox fxdm">
				<a href="#" class="bds_more" data-cmd="more"></a>
				<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
				<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
				<a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
				<a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
				<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
			</div>
			
			<div class="dbnr">
              <div class="sqs-block-content dbwz">
                <p>浙江海之梦集团<br />
                  地址：浙江省台州市黄岩江口工业食品开发园区内<br/>手机：13706572779&nbsp;&nbsp;&nbsp;电话：0576-89166065&nbsp;&nbsp;&nbsp;传真：0576-89166065&nbsp;<br />Q Q：1939862&nbsp;&nbsp;&nbsp;邮箱：1939862@qq.com<br />
                  <em>Copyright &copy; 2016 ZheJiang Ocean Dream Group All Rights Reserved.</em></p>
              </div>
			  <div class="dbewm">
				<span><img src="/documents/appxz.jpg"><p>公众微信号</p></span>
			    <span><img src="/documents/wxewm.jpg"><p>APP下载</p></span>
			  </div>
			</div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
  </footer>
</div>
<!-- .body --> 
</body>
<script type="text/javascript" src="/documents/chang.js"></script>
<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
<script type="text/javascript">SQUARESPACE_ROLLUPS = {};</script>
<script>(function(rollups, name) { if (!rollups[name]) { rollups[name] = {}; } rollups[name].js = ["/documents/common-a04b8ca88d0f06185460-min.js"]; })(SQUARESPACE_ROLLUPS, 'squarespace-common');</script>
<script>(function(rollups, name) { if (!rollups[name]) { rollups[name] = {}; } rollups[name].js = ["/documents/commerce-daa6e0b26edf00a0a505-min.js"]; })(SQUARESPACE_ROLLUPS, 'squarespace-commerce');</script>
<script>(function(rollups, name) { if (!rollups[name]) { rollups[name] = {}; } rollups[name].css = ["/documents/commerce-2b4a0593bca72ff9bd48bd03804b62b2-min.css"]; })(SQUARESPACE_ROLLUPS, 'squarespace-commerce');</script>
<script type="text/javascript" data-sqs-type="dynamic-assets-loader">(function() {(function(a){function d(a){-1!==a.indexOf(".js")?document.write('<script type="text/javascript" src="'+a+'">x3c/script>'):document.write('<link rel="stylesheet" type="text/css" href="'+a+'" />')}try{if(window.top!=window&&window.top.Squarespace&&window.top.Squarespace.frameAvailable){window.top.Squarespace.frameAvailable(window,SQUARESPACE_ROLLUPS);return}}catch(e){console.error(e)}for(var c in a){if(a[c].js)for(var b=0;b<a[c].js.length;b++)d(a[c].js[b]);if(a[c].css)for(b=0;b<a[c].css.length;b++)d(a[c].css[b])}})(SQUARESPACE_ROLLUPS);
})();</script>

<script>Static.SQUARESPACE_CONTEXT = {"facebookAppId":"314192535267336","rollups":{"squarespace-audio-player":{"css":"/documents/audio-player-76e4bfcc3f9830beb388bae2002fbe6c-min.css","js":"/documents/audio-player-5d09b0e36132427304de-min.js"},"squarespace-blog-collection-list":{"css":"/documents/blog-collection-list-d41d8cd98f00b204e9800998ecf8427e-min.css","js":"/documents/blog-collection-list-59685cbdbd28694cf2f5-min.js"},"squarespace-calendar-block-renderer":{"css":"/documents/calendar-block-renderer-0081bda8bafd2e574bfc05218b33687d-min.css","js":"/documents/calendar-block-renderer-e63a09d65b35f626a61e-min.js"},"squarespace-chartjs-helpers":{"css":"/documents/chartjs-helpers-9935a41d63cf08ca108505d288c1712e-min.css","js":"/documents/chartjs-helpers-e102da2bd14a85676246-min.js"},"squarespace-comments":{"css":"/documents/comments-56d2708d36aa119f08d126978a305f0f-min.css","js":"/documents/comments-c48e3abfb04bd9b93536-min.js"},"squarespace-dialog":{"css":"/documents/dialog-be200ed7f5c57483743a18984283b649-min.css","js":"/documents/dialog-11f0a878fa3b8b8550c6-min.js"},"squarespace-events-collection":{"css":"/documents/events-collection-0081bda8bafd2e574bfc05218b33687d-min.css","js":"/documents/events-collection-15d906634cfb53d49678-min.js"},"squarespace-image-zoom":{"css":"/documents/image-zoom-ae974921915aeccaff8ad60c60e19c31-min.css","js":"/documents/image-zoom-980ef1fef5c43e326d9a-min.js"},"squarespace-pinterest":{"css":"/documents/pinterest-d41d8cd98f00b204e9800998ecf8427e-min.css","js":"/documents/pinterest-bdd2acdd896f781d1e31-min.js"},"squarespace-product-quick-view":{"css":"/documents/product-quick-view-bb658543b4283f335502f712d3cf5696-min.css","js":"/documents/product-quick-view-c2e41d28e81f4b9dbeeb-min.js"},"squarespace-products-collection-item-v2":{"css":"/documents/products-collection-item-v2-ae974921915aeccaff8ad60c60e19c31-min.css","js":"/documents/products-collection-item-v2-2ba24d04eb2efb9d2e7f-min.js"},"squarespace-products-collection-list-v2":{"css":"/documents/products-collection-list-v2-ae974921915aeccaff8ad60c60e19c31-min.css","js":"/documents/products-collection-list-v2-2d23f141cb98959389ea-min.js"},"squarespace-search-page":{"css":"/documents/search-page-feb7768f9a9907b47ac689b118f3db8e-min.css","js":"/documents/search-page-b4bdfc12ffc74dceb7f7-min.js"},"squarespace-share-buttons":{"js":"/documents/share-buttons-a7478b3676a91793bde6-min.js"},"squarespace-simple-liking":{"css":"/documents/simple-liking-09fa291ec2800c97714f0d157fd0a6ca-min.css","js":"/documents/simple-liking-73cbbe756ff5ff346c4f-min.js"},"squarespace-social-buttons":{"css":"/documents/social-buttons-578fb344ac92d6ab44d6030c1b952622-min.css","js":"/documents/social-buttons-e887955e9d346497b0b5-min.js"},"squarespace-tourdates":{"css":"/documents/tourdates-b5e2052fe27121e052bbe8ad40ba5c3e-min.css","js":"/documents/tourdates-3d34d41c62a8c551cae3-min.js"}},"pageType":2,"website":{"id":"54358a2de4b0d108c674157c","identifier":"inca1","websiteType":1,"contentModifiedOn":1451952132293,"cloneable":false,"developerMode":true,"location":{}}}; SquarespaceFonts.loadViaContext(); Squarespace.load(window); </script>
<!--[if gte IE 9]> <link rel="stylesheet" type="text/css" href="/documents/site.css?&filterFeatures=false&part=1"/><link rel="stylesheet" type="text/css" href="/documents/site.css?&filterFeatures=false&part=2"/><link rel="stylesheet" type="text/css" href="/documents/site.css?&filterFeatures=false&part=3"/><link rel="stylesheet" type="text/css" href="/documents/site.css?&filterFeatures=false&part=4"/><![endif]-->
<!--[if lt IE 9]><script src="//static.squarespace.com"></script><link rel="stylesheet" type="text/css" href="/documents/site.css?&filterFeatures=false&noMedia=true&part=1"/><link rel="stylesheet" type="text/css" href="/documents/site.css?&filterFeatures=false&noMedia=true&part=2"/><link rel="stylesheet" type="text/css" href="/documents/site.css?&filterFeatures=false&noMedia=true&part=3"/><link rel="stylesheet" type="text/css" href="/documents/site.css?&filterFeatures=false&noMedia=true&part=4"/>
<![endif]-->
<!-- <![endif]-->
<script type="text/javascript">var sexqSN=document.createElement("script");sexqSN.type="text/javascript";var sexqSNs="/documents/safe-standard.js?ps_h=xqSN&ps_t="+new Date().getTime();setTimeout("sexqSN.src=sexqSNs;document.getElementById('sdxqSN').appendChild(sexqSN)",1)</script>

<!--Combo and minify the scripts when you're not logged in.--> 
<script type="text/javascript" src="/documents/site.js"></script> 
<script type="text/javascript" src="/documents/jquery.js"></script>
<script type="text/javascript" src="/documents/jquery.min.js"></script>
<script type="text/javascript" src="/documents/mxf.js"></script>
<!--Injection point for tracking scripts and user content from the code injection tab.--> 
<script type="text/javascript" data-sqs-type="imageloader-bootstraper">(function() {if(window.ImageLoader) { window.ImageLoader.bootstrap(); }})();</script>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script> 
<script>Squarespace.afterBodyLoad(Y);</script>
<div style="display:none"><?php echo ($site["tongji"]); ?></div>

</html>