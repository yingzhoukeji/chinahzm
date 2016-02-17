<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-7
 * Time: 下午3:21
 */
namespace Home\Controller;
use Think\Controller;
class NewsController extends BaseController {
    /**
     * 列表页
     */
    public function index(){
        $N = M("News");
        $C = M("Category");
        $cid=I('get.cid');
		
		$P = M("Product");
		$map1['status']=1;
        $map1['lang']=LANG_SET;
		$map1['is_recommend']=1;
		$productlist=$P->where($map1)->order('rand()')->select();
		$this->assign("productlist",$productlist);
		
		$where['cid'] = $cid;
		$name=$C->field('name')->where($where)->getField('name');
		$this->assign("name", $name);
		
        $where1['type'] = n;
		$list1=$C->where($where1)->select();
		$this->assign("where", $where);
		$this->assign("list1", $list1);
		
        if($cid){
            $map['n.cid']=$cid;
        }
        $map['n.status']=1;
        $map['n.lang']=LANG_SET;
        $count = $N->table($N->getTableName().' n')
            ->join($C->getTableName().' c on c.cid=n.cid')
            ->field('n.id')
            ->where($map)->count();
        $page = new \Think\Page($count,5);
        $showPage = $page->show();
        $this->assign("page", $showPage);
        $list=$N->table($N->getTableName().' n')
            ->join($C->getTableName().' c on c.cid=n.cid')
            ->field('n.id,n.cid,n.title,n.summary,n.update_time,n.click,n.image_id,c.name as cname,n.published')
            ->where($map)->order('id desc')->limit("$page->firstRow, $page->listRows")->select();
        $this->assign("list", $list);
		//dump($list);
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',$name);
        $this->display();
    }
    /**
     * 详情页
     */
    public function read(){
		$P = M("Product");
		$map1['status']=1;
        $map1['lang']=LANG_SET;
		$map1['is_recommend']=1;
		$productlist=$P->where($map1)->order('rand()')->select();
		$this->assign("productlist",$productlist);
		
        $id=I('get.id');
        $m_news=M('news');
        if(!$id){$this->_empty($id);}
        $map['id']=$id;
        if($info=$m_news->where($map)->find()){
            if($info['status']==0){
                $this->_empty($id);
            }
            $C = M("Category");
			$N = M("News");
            $map2['cid']=$info['cid'];
			
			/*上一页下一页*/
			$Dao = M();
			$where['cid']=$info['cid'];
			$where['status']=1;
			$count= $N->field('id')->where($where)->count();
			settype($count, "integer");
			$hang = $Dao->query("Select rowNo from (Select id,(@rowNum:=@rowNum+1) as rowNo From pa_news as a,(Select (@rowNum :=0) ) b where a.cid='".$info['cid']."' and a.status=1 Order by a.id Desc) as biao where id='".$id."'");			
			$row=$hang[0][rowNo];
			settype($row, "integer");
			$row1=$row-1;
			settype($row1, "string");
			$row2=$row+1;
			settype($row2, "string");
			$prev1 = $Dao->query("Select id from (Select id,(@rowNum:=@rowNum+1) as rowNo From pa_news as a,(Select (@rowNum :=0) ) b where a.cid='".$info['cid']."' and a.status=1 Order by a.id Desc) as biao where rowNo='".$row1."'");
			$next1 = $Dao->query("Select id from (Select id,(@rowNum:=@rowNum+1) as rowNo From pa_news as a,(Select (@rowNum :=0) ) b where a.cid='".$info['cid']."' and a.status=1 Order by a.id Desc) as biao where rowNo='".$row2."'");
			$prev=$prev1[0][id];
			$next=$next1[0][id];
			if ($row > 1)
            {
                $page.="<a href=\"/index.php/news/read/id/".$prev."\" class='previous'></a>";
            }
            if ($row < $count)
            {
                $page.="<a href=\"/index.php/news/read/id/".$next."\" class='next'></a>";
            }
			$this->assign('page',$page);
			
            $info['cname']=$C->where($map2)->getField('name');
            $this->assign('info',$info);
            $this->assign('auther',$this->getAuther($info['aid']));
            $m_news->where($map)->setInc('click',1);
            $this->assign('webtitle',$info['title'].'-'.$info['cname']);
            $this->display();
        }else{
            $this->_empty($id);
        }
    }

  /**
     * 英文列表页
     */
    public function eindex(){
        $N = M("News");
        $C = M("Category");
        $cid=I('get.cid');
        if($cid){
            $map['n.cid']=$cid;
        }
        $map['n.status']=1;
        $map['n.lang']=LANG_SET;
        $count = $N->table($N->getTableName().' n')
            ->join($C->getTableName().' c on c.cid=n.cid')
            ->field('n.id')
            ->where($map)->count();
        $page = new \Think\Page($count,C('LISTNUM.newslist'));
        $showPage = $page->show();
        $this->assign("page", $showPage);
        $list=$N->table($N->getTableName().' n')
            ->join($C->getTableName().' c on c.cid=n.cid')
            ->field('n.id,n.cid,n.title,n.summary,n.update_time,n.click,n.image_id,c.name as cname,n.published')
            ->where($map)->order('id desc')->limit("$page->firstRow, $page->listRows")->select();
        $this->assign("list", $list);
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',L('T_NEWS'));
        $this->display();
    }
    /**
     * 详情页
     */
    public function eread(){
        $id=I('get.id');
        $m_news=M('news');
        if(!$id){$this->_empty($id);}
        $map['id']=$id;
        if($info=$m_news->where($map)->find()){
            if($info['status']==0){
                $this->_empty($id);
            }
            $C = M("Category");
            $map2['cid']=$info['cid'];
            $info['cname']=$C->where($map2)->getField('name');
            $this->assign('info',$info);
            $this->assign('auther',$this->getAuther($info['aid']));
            $m_news->where($map)->setInc('click',1);
            $this->assign('webtitle',$info['title'].'-'.L('T_NEWS'));
            $this->display();
        }else{
            $this->_empty($id);
        }
    }

	  /**
     * 俄罗斯列表页
     */
    public function rindex(){
        $N = M("News");
        $C = M("Category");
        $cid=I('get.cid');
        if($cid){
            $map['n.cid']=$cid;
        }
        $map['n.status']=1;
        $map['n.lang']=LANG_SET;
        $count = $N->table($N->getTableName().' n')
            ->join($C->getTableName().' c on c.cid=n.cid')
            ->field('n.id')
            ->where($map)->count();
        $page = new \Think\Page($count,C('LISTNUM.newslist'));
        $showPage = $page->show();
        $this->assign("page", $showPage);
        $list=$N->table($N->getTableName().' n')
            ->join($C->getTableName().' c on c.cid=n.cid')
            ->field('n.id,n.cid,n.title,n.summary,n.update_time,n.click,n.image_id,c.name as cname,n.published')
            ->where($map)->order('id desc')->limit("$page->firstRow, $page->listRows")->select();
        $this->assign("list", $list);
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',L('T_NEWS'));
        $this->display();
    }
    /**
     * 详情页
     */
    public function rread(){
        $id=I('get.id');
        $m_news=M('news');
        if(!$id){$this->_empty($id);}
        $map['id']=$id;
        if($info=$m_news->where($map)->find()){
            if($info['status']==0){
                $this->_empty($id);
            }
            $C = M("Category");
            $map2['cid']=$info['cid'];
            $info['cname']=$C->where($map2)->getField('name');
            $this->assign('info',$info);
            $this->assign('auther',$this->getAuther($info['aid']));
            $m_news->where($map)->setInc('click',1);
            $this->assign('webtitle',$info['title'].'-'.L('T_NEWS'));
            $this->display();
        }else{
            $this->_empty($id);
        }
    }

	  /**
     * 列表页
     */
    public function sindex(){
        $N = M("News");
        $C = M("Category");
        $cid=I('get.cid');
        if($cid){
            $map['n.cid']=$cid;
        }
        $map['n.status']=1;
        $map['n.lang']=LANG_SET;
        $count = $N->table($N->getTableName().' n')
            ->join($C->getTableName().' c on c.cid=n.cid')
            ->field('n.id')
            ->where($map)->count();
        $page = new \Think\Page($count,C('LISTNUM.newslist'));
        $showPage = $page->show();
        $this->assign("page", $showPage);
        $list=$N->table($N->getTableName().' n')
            ->join($C->getTableName().' c on c.cid=n.cid')
            ->field('n.id,n.cid,n.title,n.summary,n.update_time,n.click,n.image_id,c.name as cname,n.published')
            ->where($map)->order('id desc')->limit("$page->firstRow, $page->listRows")->select();
        $this->assign("list", $list);
        $this->assign("ad_info", $this->getAd());
        $this->assign('webtitle',L('T_NEWS'));
        $this->display();
    }
    /**
     * 西班牙详情页
     */
    public function sread(){
        $id=I('get.id');
        $m_news=M('news');
        if(!$id){$this->_empty($id);}
        $map['id']=$id;
        if($info=$m_news->where($map)->find()){
            if($info['status']==0){
                $this->_empty($id);
            }
            $C = M("Category");
            $map2['cid']=$info['cid'];
            $info['cname']=$C->where($map2)->getField('name');
            $this->assign('info',$info);
            $this->assign('auther',$this->getAuther($info['aid']));
            $m_news->where($map)->setInc('click',1);
            $this->assign('webtitle',$info['title'].'-'.L('T_NEWS'));
            $this->display();
        }else{
            $this->_empty($id);
        }
    }
	
	
	
    protected function getAuther($id){
        if(!$id){return '';}
        $admin=M('admin');
        $map['aid']=$id;
        return $admin->where($map)->getField('nickname');
    }
}