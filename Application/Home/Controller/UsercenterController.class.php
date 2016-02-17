<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-7
 * Time: 下午3:40
 */
namespace Home\Controller;
use Think\Controller;
class UsercenterController extends BaseController{
    public function index(){
    	if(session("uid")){
    		$M=M("order");
    		$count=$M->where(array('userid'=>session("uid"),'ispay'=>0))->count();
    		$this->assign("count",$count);
    		$this->display();
    	}else{
    		$this->error("你还没有登录",U('Member/index'));
    	}
        
    }
	public function orderlist(){
		if(session("uid")){
			$userid=session("uid");
			$M=M("order");
			$count=$M->where(array('userid'=>$userid,'operation'=>1))->order(array('ispay'=>'asc','orderdate'=>'desc'))->count();
			$page = new \Think\Page($count, 10);
			$list=$M->where(array('userid'=>$userid,'operation'=>1))->order(array('ispay'=>'asc','orderdate'=>'desc'))->select();
			$shipaddrModel=M("shipaddr");
			$shipaddr=$shipaddrModel->where(array('userid'=>$userid))->find();
			$show= $page->show();// 分页显示输出
			$this->assign("list",$list);
			$this->assign("shipaddr",$shipaddr);
			$this->assign('page',$show);// 赋值分页输出
			$this->display();
		}else{
			$this->error("你还没有登录",U('Member/index'));
		}
	}
	public function mycarts(){
		if(session("uid")){
			$orderid=$_GET['id'];
			$M=M("shopcart");
			
			$carts=$M->field('pa_shopcart.*,pa_product.title,pa_product.unit as myunit')->join('inner join pa_product on pa_shopcart.goodsid = pa_product.id')->where(array('orderid'=>$orderid))->select();
			$heji=0;
			$list=array();
			foreach ($carts as $vo){
				$imgs=get_img_array($vo['imgid']);
				if(count($imgs)>0){
					$vo['imgurl']=$imgs[0]['savepath'];
				}
				$vo['totalprice']=$vo['num']*$vo['price'];
				$product=M('product')->find($vo['id']);
				$vo['unit']=$product['unit'];
				if($vo['num']>0){
					array_push($list, $vo);
				}
				$heji=$heji+$vo['num']*$vo['price'];
			}
			$this->assign("list",$list);
			$this->assign("heji",$heji);
			$this->display();
			
		}else{
			$this->error("你还没有登录",U('Member/index'));
		}
	}
	public function del_order(){
		if(session("uid")!=null){
			$id=$_GET['id'];
			$M=M("order");
			$result=$M->data(array('operation'=>0))->where(array('id'=>$id))->save();
			
			if($result){
				echo json_encode(array('status'=>1,'msg'=>'删除成功！'));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'删除失败！','r'=>$M->getLastSql()));
			}
		}else{
			echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
		}
		
	}
	public function user_edit(){
		if(session("uid")!=null){
			if(IS_POST){
				$M=M('user');
				$user=$M->find(session("uid"));
				if($user['password']!=$_POST['ypassword']){
					$this->error("原密码不正确!");
				}else{
					$update=$M->data(array('password'=>$_POST['password']))->where(array('id'=>session("uid")))->save();
					if($update){
						$this->success("修改成功！","user_edit");
					}else{
						$this->error("修改失败！");
					}
				}
			}else{
				$this->display();
			}
		}else{
			$this->error("你还没有登录",U('Member/index'));
		}
		
	}
	
	public function myaddr(){
		if(session("uid")!=null){
			$uid=session('uid');
    		$shipaddrModel=M("shipaddr");
    		$shipaddr=$shipaddrModel->where(array('userid'=>$uid))->find();
    		$hasaddr=0;
    		if($shipaddr){
    			$hasaddr=1;
    			$this->assign("info",$shipaddr);
    		}
    		$this->assign("hasaddr",$hasaddr);
			$this->display();
		}else{
			$this->error("你还没有登录",U('Member/index'));
		}
	}

}