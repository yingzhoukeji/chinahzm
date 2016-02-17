<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2014 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用入口文件

// 检测PHP环境
if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');
ob_start();
ini_set('date.timezone', 'Asia/Shanghai');
// 开启调试模式 建议开发阶段开启 部署阶段注释或者设为false
define('APP_DEBUG',true);

// 定义应用目录
define('APP_PATH','./Application/');
define("WEB_ROOT", dirname(__FILE__) . "/Application/");
define("DatabaseBackDir", WEB_ROOT . "Database/"); //系统备份数据库文件存放目录
define('WEB_CACHE_PATH', WEB_ROOT."Runtime/");
if (!file_exists(WEB_ROOT.'Common/Conf/systemConfig.php')) {
    header("Location: Application/install/");
    exit;
}
// 引入ThinkPHP入口文件
require './include/ThinkPHP.php';

// 亲^_^ 后面不需要任何代码了 就是如此简单