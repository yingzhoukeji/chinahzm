<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-3
 * Time: 下午2:35
 */
namespace Admin\Controller;
use Think\Controller;
class ProductController extends CommonController {

    public function index() {

        $M = M("Product");
        //过滤
        $s=array('0','1');
        $map=array();
        if($title=I('get.title'))$map['title']=array('like',"%{$title}%");
        if(in_array(I('get.status'),$s))$map['status']=I('get.status');
        if($cid=I('get.cid'))$map['cid']=$cid;
        if(in_array(I('get.is_recommend'),$s))$map['is_recommend']=I('get.is_recommend');
        //
        $count = $M->where($map)->count();

        $page = new \Think\Page($count, 20);
        $showPage = $page->show();
        $this->assign("page", $showPage);
        $this->assign("list", D("Product")->listProduct($page->firstRow, $page->listRows,$map));
        $this->assign("catlist", D("Product")->category());
        $this->display();
    }

    public function category() {
        if (IS_POST) {
            echo json_encode(D("Product")->category());
        } else {
            $this->assign("list", D("Product")->category());
            $this->display();
        }
    }

    public function add() {
        if (IS_POST) {
            $this->checkToken();
            echo json_encode(D("Product")->addProduct());
        } else {
            $this->assign("list", D("Product")->category());
            $this->display();
        }
    }

    public function checkProductTitle() {
        $M = M("Product");
        if(!$_GET['title']){
            echo json_encode(array("status" => 0, "info" => "标题为空"));
        }
        $where = "title='" . I('get.title') . "'";
        if (!empty($_GET['id'])) {
            $where.=" And id !=" . (int) $_GET['id'];
        }
        if(!I('get.title')){
            echo json_encode(array("status" => 0, "info" => "请输入标题"));
        }
        if ($M->where($where)->count() > 0) {
            echo json_encode(array("status" => 0, "info" => "已经存在，请修改标题"));
        } else {
            echo json_encode(array("status" => 1, "info" => "可以使用"));
        }
    }

    public function edit() {
        $M = M("Product");
        if (IS_POST) {
            $this->checkToken();
            echo json_encode(D("Product")->edit());
        } else {
            $info = $M->where("id=" . (int) $_GET['id'])->find();
            if ($info['id'] == '') {
                $this->error("不存在该记录");
            }
            if($info['image_id']){
                $image = M("images");
                $map['id']=array('in',$info['image_id']);
                $img_info = $image->where($map)->order('id asc')->select();
                $this->assign("img_info", $img_info);
            }
            $this->assign("info", $info);
            $this->assign("list", D("Product")->category());
            $this->display("add");
        }
    }

    public function del() {
        if (M("Product")->where("id=" . (int) $_GET['id'])->delete()) {
            echo json_encode(array("status" => 1, "info" =>'删除成功'));
//            echo json_encode(array("status"=>1,"info"=>""));
        } else {
            echo json_encode(array("status" => 0, "info" =>'删除失败，可能是不存在该ID的记录'));
        }
    }
    public function changeAttr(){
        $id=I('get.id');
        $m_news=M("Product");
        $map['id']=$id;
        $is_recommend=$m_news->where($map)->getField('is_recommend');
        $data['is_recommend']=abs($is_recommend-1);
        if($m_news->where($map)->save($data)){
            echo json_encode(array("status" => 1, "info" => '<img src="'.__ROOT__.'/Public/Img/action_'.$data['is_recommend'].'.png" border="0">'));
            //echo '<img src="../Public/Img/action_'.$data['is_recommend'].'.png" border="0">';
            exit;
        }
        return false;
    }

    public function changeStatus(){
        $id=I('get.id');
        $m_news=M("Product");
        $map['id']=$id;
        $status=$m_news->where($map)->getField('status');
        $data['status']=abs($status-1);
        $statusArr = array("待审核", "已发布");
        if($m_news->where($map)->save($data)){
            echo json_encode(array("status" => 1, "info" => $statusArr[$data['status']]));
            //echo '<img src="../Public/Img/action_'.$data['is_recommend'].'.png" border="0">';
            exit;
        }
        return false;
    }
    public function changePhoneStatus(){
        $id=I('get.id');
        $m_news=M("Product");
        $map['id']=$id;
        $status=$m_news->where($map)->getField('wap_display');
        $data['wap_display']=abs($status-1);
        if($m_news->where($map)->save($data)){
            echo json_encode(array("status" => 1, "info" => '<img src="'.__ROOT__.'/Public/Img/iphone-'.$data['wap_display'].'.png" border="0">'));
            //echo '<img src="../Public/Img/action_'.$data['is_recommend'].'.png" border="0">';
            exit;
        }
        return false;
    }

}