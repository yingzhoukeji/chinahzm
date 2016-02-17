<?php
	//定义项目名称
    define('APP_NAME', 'App');
    //定义项目路径
    define('APP_PATH', './App/');
    //加载框架入文件
    define('APP_DEBUG', true);
    //开启GZIP
    //define ("GZIP_ENABLE", function_exists ( 'ob_gzhandler') );
    //ob_start ( GZIP_ENABLE ? 'ob_gzhandler': null );
    //'SHOW_PAGE_TRACE' =>true, // 显示页面Trace信息
    //define(SHOW_PAGE_TRACE, true);
    require 'ThinkPHP/ThinkPHP.php';
?>