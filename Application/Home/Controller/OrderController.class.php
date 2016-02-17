<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-7
 * Time: 下午3:36
 */
namespace Home\Controller;
use Think\Controller;
use Org\phpqrcode\phpqrcode;
class OrderController extends BaseController {
    public function index(){
    	$this->display();
    }
    //添加购物车
    public function addshopcart(){
    	if(session("uid")!=null){
    		$cart = new \Think\Cart();
    		if(isset($_POST['goodid'])){
    			$productModel=M("product");
    			$product=$productModel->find($_POST['goodid']);
    			if($product){
    				$cart->addItem($product['id'], $product['title'], $product['price'], 1, $product['image_id']);
    				echo json_encode(array('status'=>1,'msg'=>'成功加入购物车！'));
    			}else{
    				echo json_encode(array('status'=>0,'msg'=>'该产品已下架！'));
    			}
    			
    		}else{
    			echo json_encode(array('status'=>0,'msg'=>'非法请求！'));
    		}
    	}else{
    		echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
    	}
    }
    public function mycart(){
    	
    	if(session("uid")!=null){
    		$carts=session('cart');
    		$list=array();
    		$heji=0;
    		foreach ($carts as $vo){
    			$imgs=get_img_array($vo['img']);
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
    		//var_dump($list);
    	}else{
    		$this->error("对不起请先登录",U('Member/index'));
    	}
    	
    }
    
    public function minus_cart(){
   	 	if(session("uid")!=null){
   	 		$cart = new \Think\Cart();
   	 		$cart->decNum($_POST['id']);
   	 		echo json_encode(array('status'=>1,'msg'=>'成功移除！'));
    	}else{
    		echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
    	}
    }
    public function add_cart(){
    	if(session("uid")!=null){
    		$cart = new \Think\Cart();
    		$cart->incNum($_POST['id']);
    		echo json_encode(array('status'=>1,'msg'=>'成功添加！'));
    	}else{
    		echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
    	}
    }
    public function change_num(){
    	if(session("uid")!=null){
    		$cart = new \Think\Cart();
    		$cart->modNum($_POST['id'],intval($_POST['num']));
    		echo json_encode(array('status'=>1,'msg'=>'成功添加！'));
    	}else{
    		echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
    	}
    }
   public function del_cart(){
    	if(session("uid")!=null){
    		$cart = new \Think\Cart();
    		$cart->delItem($_POST['id']);
    		echo json_encode(array('status'=>1,'msg'=>'成功添加！'));
    	}else{
    		echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
    	}
    }
    public function clear_cart(){
    	if(session("uid")!=null){
    		$cart = new \Think\Cart();
    		$cart->clear();
    		echo json_encode(array('status'=>1,'msg'=>'成功添加！'));
    	}else{
    		echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
    	}
    }
    
    public function orderinfo(){
    	if(session("uid")!=null){
    		$carts=session('cart');
    		$list=array();
    		$heji=0;
    		foreach ($carts as $vo){
    			$imgs=get_img_array($vo['img']);
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
    		//获取收获地址
    		$uid=session('uid');
    		$shipaddrModel=M("shipaddr");
    		$shipaddr=$shipaddrModel->where(array('userid'=>$uid))->find();
    		$hasaddr=0;
    		if($shipaddr){
    			$hasaddr=1;
    			$this->assign("shipaddr",$shipaddr);
    		}
    		$this->assign("hasaddr",$hasaddr);
    		$this->assign("list",$list);
    		$this->assign("heji",$heji);
    		$this->display();
    		
    	}else{
    		$this->error("对不起请先登录",U('Member/index'));
    	}
    }
    public function add_shipaddr(){
    	if(IS_POST){
    		if(session("uid")!=null){
    			$_POST['userid']=session('uid');
    			$_POST['createtime']=date('Y-m-d H:m:s',time());
    			$M=M('shipaddr');
    			$result=$M->add($_POST);
    			if($result){
    				echo json_encode(array('status'=>1,'msg'=>'成功添加！'));
    			}else{
    				echo json_encode(array('status'=>0,'msg'=>'添加失败！'));
    			}
    		}else{
    			echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
    		}
    	}else{
    		$this->display();
    	}
    }
    public function edit_shipaddr(){
    	if(IS_POST){
    		if(session("uid")!=null){
    			$_POST['userid']=session('uid');
    			$_POST['createtime']=date('Y-m-d H:m:s',time());
    			$M=M('shipaddr');
    			$result=$M->save($_POST);
    			if($result){
    				echo json_encode(array('status'=>1,'msg'=>'更新成功！'));
    			}else{
    				echo json_encode(array('status'=>0,'msg'=>'更新失败！'));
    			}
    		}else{
    			echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
    		}
    	}else{
    		$M=M('shipaddr');
    		$result=$M->where(array('userid'=>session('uid')))->find();
    		$this->assign("info",$result);
    		$this->display();
    	}
    }
    
   	public function doorder(){
   		if(session("uid")!=null){
   			if(isset($_POST['shipaddrid'])){
   				$cart = new \Think\Cart();
   				$data['userid']=session("uid");
   				$data['code']=build_order_no();
   				$data['orderdate']=time();
   				$data['shipaddrid']=$_POST['shipaddrid'];
   				$data['shipaddr']=$_POST['shipaddr'];
   				$data['receiver']=$_POST['receiver'];
   				$data['telephone']=$_POST['telephone'];
   				$data['goodsfee']=$cart->getPrice();
   				$data['totalfee']=$cart->getPrice();
   				$data['freight']=0;
   				$data['remark']=$_POST['remark'];
   				$M=M("order");
   				$shopcartModel=M("shopcart");
   				$cartlist=$_SESSION['cart'];
   				$isnull=false;
   				foreach ($cartlist as $vo){
   					if($vo['num']>0){
   						$isnull=true;
   					}
   				}
   				if($isnull){
   					$result=$M->add($data);
   					if($result){
   					
   						//购物车入库
   						foreach ($cartlist as $vo){
   							$shopcartdata['goodsid']=$vo['id'];
   							$shopcartdata['orderid']=$result;
   							$shopcartdata['num']=$vo['num'];
   							$shopcartdata['price']=$vo['price'];
   							$shopcartdata['title']=$vo['title'];
   							$shopcartdata['imgid']=$vo['img'];
   							$shopcartdata['createtime']=date("Y-m-d H:m:s");
   							$shopcartModel->add($shopcartdata);
   						}
   						$cart->clear();
   						//echo json_encode(array('status'=>1,'msg'=>'提交成功！','orderid'=>$result));
   						$this->success("提交成功,请用微信客户端扫描完成支",U('Order/qrcode',array('id'=>$result)));
   					}else{
   						//echo json_encode(array('status'=>0,'msg'=>'提交失败！'));
   						$this->error("提交失败!");
   					}
   				}else{
   					//echo json_encode(array('status'=>0,'msg'=>'对不起，你的购物车没有物品！'));
   					$this->error("对不起，你的购物车没有物品！",U("Product/index"));
   				}
   				
   			}else{
   				//echo json_encode(array('status'=>0,'msg'=>'请填写收货人地址！'));
   				$this->error("请填写收货人地址！");
   			}
   			
   		}else{
    		//echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
    		$this->error("请填写收货人地址！",U("Member/index"));
    	}
   	}
   	public function qrcode(){
   		$id=$_GET['id'];
   		Vendor('phpqrcode.phpqrcode');
   		$data = 'http://mls.chinahzm.cn/regiser/home/querytopay.php?id='.$id;
   		$object = new \QRcode();
   		$object->png($data, false, 'L', 4, 2);
   	}
    
}