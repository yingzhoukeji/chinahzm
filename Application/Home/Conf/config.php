<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-2-21
 * Time: 下午2:13
 */
return array(
    'TAGLIB_PRE_LOAD' =>array( 'Think\\Template\\TagLib\\Html', 'Think\\Template\\TagLib\\Weblock'),
    'TAGLIB_BUILD_IN' => 'Cx,Html,Weblock',//标签库类名
    'URL_ROUTER_ON'   => true,// 开启路由
    'LOAD_EXT_CONFIG' => 'router',


    'LANG_SWITCH_ON' => true,   // 开启语言包功能
    'LANG_AUTO_DETECT' => true, // 自动侦测语言 开启多语言功能后有效
    'DEFAULT_LANG'=>'zh-cn',
    'LANG_LIST'        =>'zh-cn,en-us,ru,spain', // 允许切换的语言列表 用逗号分隔
    'VAR_LANGUAGE'     => 'l',// 默认语言切换变量

    'DEFAULT_THEME'    =>C('LISTNUM.DEFAULT_THEME'),// 设置默认的模板主题
    'URL_HTML_SUFFIX'       => C('TOKEN.URL_HTML_SUFFIX'),  // URL伪静态后缀设置
    'URL_DENY_SUFFIX' => C('TOKEN.URL_DENY_SUFFIX'), // URL禁止访问的后缀设置
    'URL_MODEL' =>C('TOKEN.false_static'),// URL伪静态设置/开启，关闭


    /* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__UPLOAD__' => __ROOT__ . '/Uploads',
        '__STATIC__' => __ROOT__ . '/Public',
        '__IMG__'    => __ROOT__ . '/Public/Home/images',
        '__CSS__'    => __ROOT__ . '/Public/Home/css',
        '__JS__'     => __ROOT__ . '/Public/Home/js',
        '--PUBLIC--'=>__ROOT__ . '/Public' ,
    ),

);