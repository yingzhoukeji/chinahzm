<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-7
 * Time: 下午3:28
 */
namespace Home\Controller;
use Think\Controller;
class PageController extends BaseController {
    /**
     * 显示
     */
    public function index(){
		
        $name=I('get.name');
        if(!$name){$this->_empty($name);}
        $map['lang']= $map2['lang']=LANG_SET;
		
		
        $map['unique_id']=$name;
        $map['display']=1;
        $m_page=M('page');
        $info=$m_page->where($map)->find();
        $map2['unique_id']=array('neq',$name);
        $map2['display']=1;
        $map2['parent_id']=0;
        $catelist=$m_page->field('unique_id,page_name')->where($map2)->order('id DESC')->select();
		$this->assign('catelist',$catelist);

        $map3['display']=1;
        $map3['parent_id']=$info['parent_id'];
        $subcatelist=$m_page->field('unique_id,page_name')->where($map3)->order('id ASC')->select();
        $this->assign('subcatelist',$subcatelist);
		
		$P = M("Product");
		$map1['status']=1;
        $map1['lang']=LANG_SET;
		$map1['is_recommend']=1;
		$productlist=$P->where($map1)->order('rand()')->select();
		$this->assign("productlist",$productlist);
		/*二级导航*/
		$N = M("Nav");
		$url=$_SERVER["REQUEST_URI"];
		$where['guide'] = $info['id'];
		$where['module']=page;
		$pid = $N->field('parent_id')->where($where)->getField('parent_id');
	    $where2['parent_id'] = $pid;
		$list=$N->where($where2)->select();
		$this->assign("list", $list);
        
        $this->assign('info',$info);
        $this->assign("ad_info", $this->getAd($name));
        $this->assign('webtitle',$info['page_name']);
        $this->display();
    }
    /**
     * 英文显示
     */
    public function eindex(){
		
        $name=I('get.name');
        if(!$name){$this->_empty($name);}
        $map['lang']= $map2['lang']=LANG_SET;
		
		
        $map['unique_id']=$name;
        $map['display']=1;
        $m_page=M('page');
        $info=$m_page->where($map)->find();
        $map2['unique_id']=array('neq',$name);
        $map2['display']=1;
        $map2['parent_id']=0;
        $catlist=$m_page->field('unique_id,page_name')->where($map2)->order('id DESC')->select();

        $map3['display']=1;
        $map3['parent_id']=$info['id'];
        $subcatlist=$m_page->field('unique_id,page_name')->where($map3)->order('id DESC')->select();
        $this->assign('subcatlist',$subcatlist);

        $this->assign('catlist',$catlist);
        $this->assign('info',$info);
        $this->assign("ad_info", $this->getAd($name));
        $this->assign('webtitle',$info['page_name']);
        $this->display();
    }
	/**
     * 俄文显示
     */
    public function rindex(){
		
        $name=I('get.name');
        if(!$name){$this->_empty($name);}
        $map['lang']= $map2['lang']=LANG_SET;
		
		
        $map['unique_id']=$name;
        $map['display']=1;
        $m_page=M('page');
        $info=$m_page->where($map)->find();
        $map2['unique_id']=array('neq',$name);
        $map2['display']=1;
        $map2['parent_id']=0;
        $catlist=$m_page->field('unique_id,page_name')->where($map2)->order('id DESC')->select();

        $map3['display']=1;
        $map3['parent_id']=$info['id'];
        $subcatlist=$m_page->field('unique_id,page_name')->where($map3)->order('id DESC')->select();
        $this->assign('subcatlist',$subcatlist);

        $this->assign('catlist',$catlist);
        $this->assign('info',$info);
        $this->assign("ad_info", $this->getAd($name));
        $this->assign('webtitle',$info['page_name']);
        $this->display();
    }
	/**
     * 西班牙文显示
     */
    public function sindex(){
		
        $name=I('get.name');
        if(!$name){$this->_empty($name);}
        $map['lang']= $map2['lang']=LANG_SET;
		
		
        $map['unique_id']=$name;
        $map['display']=1;
        $m_page=M('page');
        $info=$m_page->where($map)->find();
        $map2['unique_id']=array('neq',$name);
        $map2['display']=1;
        $map2['parent_id']=0;
        $catlist=$m_page->field('unique_id,page_name')->where($map2)->order('id DESC')->select();

        $map3['display']=1;
        $map3['parent_id']=$info['id'];
        $subcatlist=$m_page->field('unique_id,page_name')->where($map3)->order('id DESC')->select();
        $this->assign('subcatlist',$subcatlist);

        $this->assign('catlist',$catlist);
        $this->assign('info',$info);
        $this->assign("ad_info", $this->getAd($name));
        $this->assign('webtitle',$info['page_name']);
        $this->display();
    }

}