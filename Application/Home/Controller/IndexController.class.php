<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends BaseController {

    public function index() {
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',L('T_HOME'));
		$C = M("Category");
		$where['type'] = p;
		$where['lang'] = LANG_SET;
		$list=$C->where($where)->select();
		$this->assign("list", $list);
		$N = M("News");
		$map['status']=1;
        $map['lang']=LANG_SET;
		$newslist=$N->where($map)->order('rand()')->limit(6)->select();
		$this->assign("newslist", $newslist);
        $this->display();
    }
	 public function eindex() {
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',L('T_HOME'));
        $this->display();
    }
	 public function rindex() {
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',L('T_HOME'));
        $this->display();
    }
	 public function sindex() {
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',L('T_HOME'));
        $this->display();
    }

    /**
     * UC登录测试
     */
    function test(){
        $uc = new \Ucenter\Client\Client();
        $re = $uc->uc_user_login("zhangsan", "123456ab");//也可以$uc->ucUserLogin(),兼容驼峰式风格
        dump($re);
    }

}
?>