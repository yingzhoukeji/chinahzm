<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-7
 * Time: 下午3:40
 */
namespace Home\Controller;
use Think\Controller;
class MemberController extends BaseController{


    public function index(){		
        $this->display();
    }
	//UC登录
    public function login(){
        if(IS_POST){
        	$M=M('user');
        	$result=$M->where($_POST)->find();
        	if($result){
        		session("uid",$result['id']);
        		session("telephone",$result['telephone']);
        		echo json_encode(array('status'=>1,'msg'=>'登录成功！'));
        		//Think\Log::record(date("Y-m-d H:i:s", time())."==".$result['telephone']."用户登录");
        		$M->data(array('logintime'=>date("Y-m-d H:i:s", time())))->where(array('id'=>$result['id']))->save();
        	}else{
        		echo json_encode(array('status'=>0,'msg'=>'登录失败！'));
        	}
        }else{
        	echo json_encode(array('status'=>0,'msg'=>'非法请求！'));
        }
    }


    public function register(){
    	if(IS_POST){
    		$M=M('user');
    		$checktelephone=$M->where(array('telephone'=>$_POST['telephone']))->find();
    		if($checktelephone){
    			//$this->ajaxReturn(0,'对不起该手机号码已经注册！',null);
    			echo json_encode(array('status'=>0,'msg'=>'对不起该手机号码已经注册！'));
    		}else{
    			$_POST['createtime']=date("Y-m-d H:i:s", time());
    			$_POST['ip']=get_client_ip();
    			$_POST['logintime']=date("Y-m-d H:i:s", time());
    			$result=$M->add($_POST);
    			if($result){
    				session("uid",$result);
    				session("telephone",$_POST['telephone']);
    				echo json_encode(array('status'=>1,'msg'=>'注册成功！'));
    			}else{
    				echo json_encode(array('status'=>0,'msg'=>'注册失败！'));
    			}
    		}
    	}else{
    		$this->display();
    	}
    	
    }
    
   	public function logout(){
   		session("uid",null);
   		session("telephone",null);
   		$this->success('退出成功', $_GET['goto']);
   	}

}