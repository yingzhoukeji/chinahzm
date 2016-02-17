<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-7
 * Time: 下午1:55
 */
namespace Home\Controller;
use Think\Controller;
class EmptyController extends BaseController{
    public function index(){
        //根据当前模块名来判断要执行那个城市的操作
        $this->display('Base:empty');
    }
}