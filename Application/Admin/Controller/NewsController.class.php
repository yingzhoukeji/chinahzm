<?php
namespace Admin\Controller;
use Think\Controller;
class NewsController extends CommonController {

    public function index() {
//            die(".............");
        $M = M("News");
//        die(".............");
        $count = $M->count();
        //import("ORG.Util.Page");       //载入分页类
        $page = new \Think\Page($count, 15);
        $showPage = $page->show();
        $this->assign("page", $showPage);
        $this->assign("list", D("News")->listNews($page->firstRow, $page->listRows));
        $this->display();
    }

    public function category() {
        if (IS_POST) {
            echo json_encode(D("News")->category());
        } else {
            $this->assign("list", D("News")->category());
            $this->display();
        }
    }

    public function add() {
        if (IS_POST) {
            $this->checkToken();
            echo json_encode(D("News")->addNews());
        } else {
            $this->assign("list", D("News")->category());
            $this->display();
        }
    }

    public function checkNewsTitle() {
        $M = M("News");
        $where = "title='" .I('get.title') . "'";
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
        $M = M("News");
        if (IS_POST) {
            $this->checkToken();
            echo json_encode(D("News")->edit());
        } else {
            $info = $M->where("id=" . (int) $_GET['id'])->find();
            if ($info['id'] == '') {
                $this->error("不存在该记录");
            }
            if($info['image_id']){
                $image = M("images");
                $map['id']=$info['image_id'];
                $img_info = $image->where($map)->find();
                $this->assign("img_info", $img_info);
            }
            $this->assign("info", $info);
            $this->assign("list", D("News")->category());
            $this->display("add");
        }
    }

    public function del() {
        if (M("News")->where("id=" . (int) $_GET['id'])->delete()) {
            $this->success("成功删除");
//            echo json_encode(array("status"=>1,"info"=>""));
        } else {
            $this->error("删除失败，可能是不存在该ID的记录");
        }
    }

    public function changeAttr(){
        $id=I('get.id');
        $m_news=M("News");
        $map['id']=$id;
        $is_recommend=$m_news->where($map)->getField('is_recommend');
        $data['is_recommend']=abs($is_recommend-1);
        if($m_news->where($map)->save($data)){
            echo json_encode(array("status" => 1, "info" => '<img src="'.__ROOT__.'/Public/Img/action_'.$data['is_recommend'].'.png" border="0">'));
            exit;
        }
        return false;
    }

    public function changeStatus(){
        $id=I('get.id');
        $m_news=M("News");
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

}