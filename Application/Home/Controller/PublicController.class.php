<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-7
 * Time: 下午3:36
 */
namespace Home\Controller;
use Think\Controller;
class PublicController extends Controller {
    public function index(){
    	$this->display();
    }
	public function getprovince(){
		$M=M("province");
		$result=$M->select();
		if($result){
			echo buildJSON(0, "获取成功",$result);
		}else{
			echo buildJSON(1, "无数据");
		}
	}
	public function getcity(){
		$M=M("city");
		$result=$M->where('fatherID='.$_GET['pid'])->select();
		if($result){
			echo buildJSON(0, "获取成功",$result);
		}else{
			echo buildJSON(1, "无数据");
		}
	}
	public function getarea(){
		$M=M("area");
		$result=$M->where('fatherID='.$_GET['pid'])->select();
		if($result){
			echo buildJSON(0, "获取成功",$result);
		}else{
			echo buildJSON(1, "无数据");
		}
	}
}