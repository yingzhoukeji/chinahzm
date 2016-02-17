<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-7
 * Time: 上午10:15
 */
/**
 * 获取默认图片
 * @param $str
 * @return bool|mixed
 */
function get_default_img($str){
    if(!$str)return false;
    $str_arr=explode(',',$str);
    $map['id']=$str_arr[0];
    return M('images')->where($map)->getField('savepath');
}

/**
 * 获取图片集
 * @param $str
 * @return bool|mixed
 */
function get_img_array($str){
    if(!$str)return false;
    $str_arr=@explode(',',$str);
    $map['id']=array('in',$str_arr);
    return M('images')->where($map)->field('savepath')->select();
}

/**
 * 分类面包屑导航
 * @param $cid
 * @param bool $flag
 * @return string
 */
function conist_nav($cid,$flag=false){
    $cat = new \Org\Util\Category('Category', array('cid', 'pid', 'name', 'fullname'));
    $arr=$cat->getPath($cid);
    $str='<a href='.__APP__.'>'.L('T_HOME').'</a>>';
    if(is_array($arr))
    foreach($arr as $v){
        $str.=$v['name'].'>';
    }
    if($flag)$str=substr($str,0,-1);
    return $str;
}
/**
 * 获取当前页面完整URL地址
 */
function get_url() {
	$sys_protocal = isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://';
	$php_self = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
	$path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '';
	$relate_url = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : $php_self.(isset($_SERVER['QUERY_STRING']) ? '?'.$_SERVER['QUERY_STRING'] : $path_info);
	return $sys_protocal.(isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '').$relate_url;
}
function buildJSON($r,$msg,$data=null){
	$json=array(
			'r'=>$r,
			'msg'=>$msg,
			'data'=>$data
	);
	return json_encode($json);
}
//生成订单号
function build_order_no(){
	return date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
}


