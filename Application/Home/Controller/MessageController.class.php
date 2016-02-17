<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-7
 * Time: 下午2:20
 */
namespace Home\Controller;
use Think\Controller;
class MessageController extends BaseController {

    public function _initialize(){
        parent::_initialize();
        $if_open=C('TOKEN.mess_on');
        if($if_open!=1){
            $this->error('留言板已关闭！',U('index/index'));
        }
    }
    /**
     * 显示页
     */
    public function index(){
		$P = M("Product");
		$map1['status']=1;
        $map1['lang']=LANG_SET;
		$map1['is_recommend']=1;
		$productlist=$P->where($map1)->order('rand()')->select();
		$this->assign("productlist",$productlist);
		
        $m_page=M('page');
        $map2['display']=1;
        $map2['lang']=LANG_SET;
        $catlist=$m_page->field('unique_id,page_name')->where($map2)->order('id DESC')->select();
        $this->assign('catlist',$catlist);
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',L('T_MESSAGE'));
        $this->display();
    }
	/**
     * 英文显示页
     */
    public function eindex(){
        $m_page=M('page');
        $map2['display']=1;
        $map2['lang']=LANG_SET;
        $catlist=$m_page->field('unique_id,page_name')->where($map2)->order('id DESC')->select();
        $this->assign('catlist',$catlist);
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',L('T_MESSAGE'));
        $this->display();
    }
	/**
     * 俄罗斯显示页
     */
    public function rindex(){
        $m_page=M('page');
        $map2['display']=1;
        $map2['lang']=LANG_SET;
        $catlist=$m_page->field('unique_id,page_name')->where($map2)->order('id DESC')->select();
        $this->assign('catlist',$catlist);
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',L('T_MESSAGE'));
        $this->display();
    }
	/**
     * 西班牙显示页
     */
    public function sindex(){
        $m_page=M('page');
        $map2['display']=1;
        $map2['lang']=LANG_SET;
        $catlist=$m_page->field('unique_id,page_name')->where($map2)->order('id DESC')->select();
        $this->assign('catlist',$catlist);
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',L('T_MESSAGE'));
        $this->display();
    }
    /**
     * 提交页
     */
    public function add(){
        if (IS_POST) {
        if (check_verify($_POST['verify_code'])==false) {
            $this->error('验证码错误啦，再输入吧');
        }
        $data['username']=I('post.username');
        $data['email']=I('post.email');
        $data['moblie']=I('post.moblie');
        $data['addtime']=time();
        $data['content']=strip_tags($_POST['content']);
        $message=M('message');
        if($message->add($data)){
                $this->success('留言成功');
        }else{
                $this->error('留言失败');
        }
      }
    }
}