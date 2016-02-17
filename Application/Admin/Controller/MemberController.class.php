<?php
namespace Admin\Controller;
use Think\Controller;
class MemberController extends CommonController {

    public function index() {

        $M = M("Member");
        $count = $M->count();
        //import("ORG.Util.Page");       //载入分页类
        $page = new \Think\Page($count, 12);
        $showPage = $page->show();
        $list=$M->order('uid desc')->limit("$page->firstRow, $page->listRows")->select();
        $this->assign("page", $showPage);
        $this->assign("list",$list);
        $this->display();
    }

    public function edit(){
        if(IS_POST){
            $m_member=M('Member');
            $data=$_POST['info'];
            $uid=I('post.uid');
            $sm['email']=$data['email'];
            $sm['uid']=array('neq',$uid);
            if($m_member->where($sm)->find()){
                echo json_encode(array("status" => 0, "info" => "邮箱地址已存在！"));
                exit;
            }
            if(!is_email($data['email'])){
                echo json_encode(array("status" => 0, "info" => "邮箱格式错误！"));
                exit;
            }
            if($data['pwd']){
                if(strlen($data['pwd'])<6){
                    echo json_encode(array("status" => 0, "info" => "密码少于6位！"));
                    exit;
                }
                $data['pwd']=encrypt( $data['pwd']);
            }else{
                unset($data['pwd']);
            }
            if($uid){
                $map['uid']=$uid;
                if($m_member->where($map)->save($data)){
                    echo json_encode(array("status" => 1, "info" => "修改会员成功",'url'=>U('Member/index')));
                    exit;
                }else{
                    echo json_encode(array("status" => 0, "info" => "修改会员失败"));
                    exit;
                }
            }else{
                if(empty($data['pwd'])){
                    echo json_encode(array("status" => 0, "info" => "请输入密码！"));
                    exit;
                }
                if($m_member->add($data)){
                    echo json_encode(array("status" => 1, "info" => "添加会员成功",'url'=>U('Member/index')));
                    exit;
                }else{
                    echo json_encode(array("status" => 0, "info" => "添加会员失败"));
                    exit;
                }
            }


        }else{
            $uid=I('get.uid');
            $m_member=M('Member');
            $map['uid']=$uid;
            $info=$m_member->where($map)->find();
            $this->assign('info',$info);
            $this->display();
        }
    }
    public function del(){
        $uid=I('get.uid');
        if(!$uid){return false;}
        $m_member=M('Member');
        $map['uid']=$uid;
        if($m_member->where($map)->delete()){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }


}