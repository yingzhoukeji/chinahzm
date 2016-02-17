<?php
/**
 * 微信操作控制器
 * Created by PhpStorm.
 * User: cony
 * Date: 14-02-27
 * Time: 上午9:22
 */
namespace Home\Controller;
use Think\Controller;
use Org\Util\Wechat;
class WeiXinController extends Controller {
    /**
     * 接口地址
     * @return string
     */
    public function index(){
        $options = array(
            'token'=>C('WEIXIN.token'),//填写你设定的key
        );
        //dump($this->dealText('电话'));exit;
        $weObj = new Wechat($options);
        $weObj->valid();
        $type = $weObj->getRev()->getRevType();
        switch($type) {
            case Wechat::MSGTYPE_TEXT:
                $content=$weObj->getRevContent();
                $string=  $this->dealText($content);
                $weObj->text($string)->reply();
                exit;
                break;
            case Wechat::MSGTYPE_EVENT:
                return '事件回复';////暂无功能
                break;
            case Wechat::MSGTYPE_IMAGE:
                return '图片回复';////暂无功能
                break;
            default:
                return '默认回复';////暂无功能
        }
    }
    /**
     * @param $str  关键字字符串
     * @return string
     */
    protected  function dealText($str){
        if(!$str){return false;}
        $string=C('WEIXIN.callback');
        $list=explode('*',$string);
        foreach($list as $value){
            $arr=explode('|',$value);
            if(false!==strpos($arr[0],$str)){
                return $arr[1];
            }else{
                continue;
            }
        }
        return '找不到需要查询的内容！';
    }
}



