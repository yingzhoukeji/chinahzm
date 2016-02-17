<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-7
 * Time: 下午3:36
 */
namespace Home\Controller;
use Think\Controller;
class ProductController extends BaseController {
    /**
     * 列表页
     */
    public function index(){
        $P = M("Product");
        $C = M("Category");
        $cid=I('get.cid');
		
		$N = M("News");
		$map1['status']=1;
        $map1['lang']=LANG_SET;
		$map1['is_recommend']=1;
		$newslist=$N->where($map1)->order('rand()')->limit(5)->select();
		$this->assign("newslist",$newslist);

		$where['cid'] = $cid;
		$name=$C->field('name')->where($where)->getField('name');
		$this->assign("name", $name);
		
        $where1['type'] = p;
		$list1=$C->where($where1)->select();
		$this->assign("where", $where);
		$this->assign("list1", $list1);
		
        if($cid){
            $map['p.cid']=$cid;
        }
        $map['p.status']=1;
        $map['p.lang']=LANG_SET;
        $count = $P->table($P->getTableName().' p')
            ->join($C->getTableName().' c on c.cid=p.cid')
            ->field('p.id')
            ->where($map)->count();
        $page = new \Think\Page($count,9);
        $showPage = $page->show();
        $this->assign("page", $showPage);
        $list=$P->table($P->getTableName().' p')
            ->join($C->getTableName().' c on c.cid=p.cid')
            ->field('p.id,p.cid,p.image_id,p.price,p.psize,p.title,p.summary,p.update_time,p.click,c.name as cname')
            ->where($map)->order('id ASC')->limit("$page->firstRow, $page->listRows")->select();
        $this->assign("list", $list);
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',$name);
        $this->display();
    }
    /**
     * 详情页
     */
    public function read(){
        $id=I('get.id');
        $m_product=M('product');
		$C = M("Category");

		$where['type'] = p;
		$list1=$C->where($where)->select();
		$this->assign("list1", $list1);
		
		$where1['display']=1;
		$where1['productid']=$id;
		$lylist=M('message')->where($where1)->select();
		$this->assign("lylist", $lylist);
		
        if(!$id){$this->_empty($id);}
        $map['id']=$id;
        if($info=$m_product->where($map)->find()){
            if($info['status']==0){
                $this->redirect('product/index');
            }
            $map2['cid']=$info['cid'];
            $info['cname']=$C->where($map2)->getField('name');
            $this->assign('info',$info);
			//dump(get_img_array($info['image_id']));
            $this->assign('images',get_img_array($info['image_id']));
            $m_product->where($map)->setInc('click',1);
            $this->assign('webtitle',$info['title'].'-'.$info['cname']);
            $this->display();
        }else{
            $this->redirect('product/index');
        }
    }
    /**
     * 英文列表页
     */
    public function eindex(){
        $P = M("Product");
        $C = M("Category");
        $cid=I('get.cid');
        if($cid){
            $map['p.cid']=$cid;
        }
        $map['p.status']=1;
        $map['p.lang']=LANG_SET;
        $count = $P->table($P->getTableName().' p')
            ->join($C->getTableName().' c on c.cid=p.cid')
            ->field('p.id')
            ->where($map)->count();
        $page = new \Think\Page($count,C('LISTNUM.prolist'));
        $showPage = $page->show();
        $this->assign("page", $showPage);
        $list=$P->table($P->getTableName().' p')
            ->join($C->getTableName().' c on c.cid=p.cid')
            ->field('p.id,p.cid,p.image_id,p.price,p.psize,p.title,p.summary,p.update_time,p.click,c.name as cname')
            ->where($map)->order('id desc')->limit("$page->firstRow, $page->listRows")->select();
        $this->assign("list", $list);
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',L('T_PRODUCT'));
        $this->display();
    }
    /**
     * 俄文详情页
     */
    public function eread(){
        $id=I('get.id');
        $m_product=M('product');
        if(!$id){$this->_empty($id);}
        $map['id']=$id;
        if($info=$m_product->where($map)->find()){
            if($info['status']==0){
                $this->redirect('product/eindex');
            }
            $C = M("Category");
            $map2['cid']=$info['cid'];
            $info['cname']=$C->where($map2)->getField('name');
            $this->assign('info',$info);
            $this->assign('images',get_img_array($info['image_id']));
            $m_product->where($map)->setInc('click',1);
            $this->assign('webtitle',$info['title'].'-'.L('T_PRODUCT'));
            $this->display();
        }else{
            $this->redirect('product/eindex');
        }
    }
    /**
     * 列表页
     */
    public function rindex(){
        $P = M("Product");
        $C = M("Category");
        $cid=I('get.cid');
        if($cid){
            $map['p.cid']=$cid;
        }
        $map['p.status']=1;
        $map['p.lang']=LANG_SET;
        $count = $P->table($P->getTableName().' p')
            ->join($C->getTableName().' c on c.cid=p.cid')
            ->field('p.id')
            ->where($map)->count();
        $page = new \Think\Page($count,C('LISTNUM.prolist'));
        $showPage = $page->show();
        $this->assign("page", $showPage);
        $list=$P->table($P->getTableName().' p')
            ->join($C->getTableName().' c on c.cid=p.cid')
            ->field('p.id,p.cid,p.image_id,p.price,p.psize,p.title,p.summary,p.update_time,p.click,c.name as cname')
            ->where($map)->order('id desc')->limit("$page->firstRow, $page->listRows")->select();
        $this->assign("list", $list);
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',L('T_PRODUCT'));
        $this->display();
    }
    /**
     * 西班牙文详情页
     */
    public function rread(){
        $id=I('get.id');
        $m_product=M('product');
        if(!$id){$this->_empty($id);}
        $map['id']=$id;
        if($info=$m_product->where($map)->find()){
            if($info['status']==0){
                $this->redirect('product/rindex');
            }
            $C = M("Category");
            $map2['cid']=$info['cid'];
            $info['cname']=$C->where($map2)->getField('name');
            $this->assign('info',$info);
            $this->assign('images',get_img_array($info['image_id']));
            $m_product->where($map)->setInc('click',1);
            $this->assign('webtitle',$info['title'].'-'.L('T_PRODUCT'));
            $this->display();
        }else{
            $this->redirect('product/rindex');
        }
    }
    /**
     * 列表页
     */
    public function sindex(){
        $P = M("Product");
        $C = M("Category");
        $cid=I('get.cid');
        if($cid){
            $map['p.cid']=$cid;
        }
        $map['p.status']=1;
        $map['p.lang']=LANG_SET;
        $count = $P->table($P->getTableName().' p')
            ->join($C->getTableName().' c on c.cid=p.cid')
            ->field('p.id')
            ->where($map)->count();
        $page = new \Think\Page($count,C('LISTNUM.prolist'));
        $showPage = $page->show();
        $this->assign("page", $showPage);
        $list=$P->table($P->getTableName().' p')
            ->join($C->getTableName().' c on c.cid=p.cid')
            ->field('p.id,p.cid,p.image_id,p.price,p.psize,p.title,p.summary,p.update_time,p.click,c.name as cname')
            ->where($map)->order('id desc')->limit("$page->firstRow, $page->listRows")->select();
        $this->assign("list", $list);
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',L('T_PRODUCT'));
        $this->display();
    }
    /**
     * 详情页
     */
    public function sread(){
        $id=I('get.id');
        $m_product=M('product');
        if(!$id){$this->_empty($id);}
        $map['id']=$id;
        if($info=$m_product->where($map)->find()){
            if($info['status']==0){
                $this->redirect('product/sindex');
            }
            $C = M("Category");
            $map2['cid']=$info['cid'];
            $info['cname']=$C->where($map2)->getField('name');
            $this->assign('info',$info);
            $this->assign('images',get_img_array($info['image_id']));
            $m_product->where($map)->setInc('click',1);
            $this->assign('webtitle',$info['title'].'-'.L('T_PRODUCT'));
            $this->display();
        }else{
            $this->redirect('product/sindex');
        }
    }
}