<?php
// 本类由系统自动生成，仅供测试用途
class ClientAction extends Action {
    public function index(){
		
    }
	//Index/categary?callback=callback&lang=zh-cn(en-us)
	//产品分类
	public function categary(){
		$model=M("category");
		$lang=$_GET['lang'];
		$data['lang']=$lang;
		$data['type']=$_GET["type"];
		$result=$model->where($data)->select();
		if($result){
			$this->ajaxReturn($result,'json');
		}else{
			$this->ajaxReturn(0,'json');
		}
	}
	//产品分类
	public function getproductcategary(){
		$model=M("category");
		$lang='zh-cn';
		$data['lang']=$lang;
		$data['type']='p';
		$result=$model->where($data)->select();
		if($result){
			$this->ajaxReturn($result,'json');
		}else{
			$this->ajaxReturn(0,'json');
		}
	}
	public function getallproduct(){
		$model=M("product");
		$lang='zh-cn';
		$data["lang"]=$lang;
		
		if(isset($need)){
			$need=$_GET["need"];
			$data["lang"]=$lang;
			$all=$model->where($data)->field($need)->order('id ASC')->select();
			$all=parseProduct($all);
		}else{
			$data["lang"]=$lang;
			$all=$model->where($data)->order('id ASC')->select();
			$all=parseProduct($all);
		}			
		if($all){
			$this->ajaxReturn($all,'json');
		}else{
			$this->ajaxReturn(0,'json');
		}
	}
	//产品列表
	/*
	*type 是否全部返回 不为空全部返回
	*cid产品分类id
	*need需要返回的字段
	*/
	public function product(){
		$type=$_GET['type'];
		$cid=$_GET['cid'];
		$lang=$_GET["lang"];
		$need=$_GET["need"];
		$model=M("product");
		if(!empty($type)){
			$all='';
			if(!empty($need)){
				$data["lang"]=$lang;
				
				$all=$model->where($data)->field($need)->order('id ASC')->select();
				$all=parseProduct($all);
			}else{
				$data["lang"]=$lang;
				
				$all=$model->where($data)->order('id ASC')->select();
				$all=parseProduct($all);
			}			
			if($all){
				$this->ajaxReturn($all,'jsonp');
			}else{
				$this->ajaxReturn(0,'jsonp');
			}
		}else{
			//need必传image_id,否则报错
			$data["cid"]=$cid;
			$data["lang"]=$lang;
			$all='';
			if(!empty($need)){
				$all=$model->where($data)->field($need)->order('id ASC')->select();
				$all=parseProduct($all);
			}else{
				$all=$model->where($data)->order('id ASC')->select();
				$all=parseProduct($all);
			}
			if($all){
				$this->ajaxReturn($all,'jsonp');
			}else{
				$this->ajaxReturn(0,'jsonp');
			}
		}
	}
	//随机获取产品10条
	public function randproduct(){
		$m=M('product'); 
		$lang="zh-cn";
		$count=$m->count();
		$rand=0; //产生随机数。
		$limit=$rand.','.'10'; 
		$wheredata["lang"]=$lang;
		$data=$m->where($wheredata)->field('pa_product.id,pa_product.unit,pa_product.cid,pa_product.title,pa_product.psize,pa_product.image_id,pa_product.price,pa_product.summary,pa_images.savepath')->join('inner join pa_images on pa_images.id=pa_product.image_id')->order("update_time asc")->limit($limit)->select();
		$data=parseProduct($data);		
		if($data){
			$this->ajaxReturn($data,'json');
		}else{
			$this->ajaxReturn(0,'json');
		}
	}
	//产品详情
	public function productDetail(){
		$id=$_GET['id'];
		$model=M("product");
		$result=$model->find($id);
		$savepath=getImagePathById($result["image_id"]);
		$result['savepath']=$savepath;
		if($result){
			$this->ajaxReturn($result,'json');
		}else{
			$this->ajaxReturn(0,'json');
		}
	}
	
	public function jpg(){
		$id=$_GET['id'];
		$model=M("images");
		$img=$model->find($id);
		$path="..".$img["savepath"];
		Header("Content-type: image/jpeg"); 
		$im = imagecreatefromjpeg($path); 
		Imagejpeg($im,'',10); 
		ImageDestroy($im);
		
		
	}
	//随机获取产品10条
	public function randnews(){
		$m=M('news'); 
		$lang=$_GET['lang'];
		$count=$m->count();
		$rand=0; //产生随机数。
		$limit=$rand.','.'3'; 
		$wheredata["lang"]=$lang;
		$data=$m->where($wheredata)->field('id,cid,title,click,content')->limit($limit)->select();   
		if($data){
			$this->ajaxReturn($data,'jsonp');
		}else{
			$this->ajaxReturn(0,'jsonp');
		}
	}
	public function news(){
		$type=$_GET['type'];
		$cid=$_GET['cid'];
		$lang="zh-cn";
		$need=$_GET["need"];
		$model=M("news");
		if(!empty($type)){
			$all='';
			if(!empty($need)){
				$data["lang"]=$lang;
				$all=$model->where($data)->field($need)->select();
			}else{
				$data["lang"]=$lang;
				$all=$model->where($data)->select();
			}			
			if($all){
				$this->ajaxReturn($all,'json');
			}else{
				$this->ajaxReturn(0,'json');
			}
		}else{
			$data["cid"]=$cid;
			$data["lang"]=$lang;
			$all='';
			if(!empty($need)){
				$all=$model->where($data)->field($need)->select();
			}else{
				$all=$model->where($data)->select();
			}
			if($all){
				$this->ajaxReturn($all,'json');
			}else{
				$this->ajaxReturn(0,'json');
			}
		}
	}
	//新闻详情
	public function newsDetail(){
		$id=$_GET['id'];
		$model=M("news");
		$result=$model->find($id);
		if($result){
			$this->ajaxReturn($result,'json');
		}else{
			$this->ajaxReturn(0,'json');
		}
	}
	public function pages(){
		$lang=$_GET["lang"];
		$model=M("page");
		$data['lang']=$lang;

		$result=$model->where($data)->select();
		if($result){
			$this->ajaxReturn($result,'jsonp');
		}else{
			$this->ajaxReturn(0,'jsonp');
		}
	}
	public function getpage(){
		$name=$_GET['name'];
		$model=M("page");
		$data['lang']='zh-cn';
		$data['unique_id']=$name;
		$result=$model->where($data)->find();
		if($result){
			$this->ajaxReturn($result,'json');
		}else{
			$this->ajaxReturn(0,'json');
		}
	}
	//注册
	//http://192.168.0.102:81/jyst/api.php/Index/regist?nickname=%E9%BB%84%E6%9D%A8%E4%BE%A31&pwd=123456&email=hylxinlang@sina.cn&phone=18382307095&callback=sadas
	public function regist(){
		$model=M("member");
		$nickname=$_GET['nickname'];
		$pwd=$_GET['pwd'];
		$email=$_GET['email'];
		$phone=$_GET['phone'];
		$data['nickname']=$nickname;
		$check=$model->where($data)->select();
		if($check){
			$arr=array(
				msg=>"该用户已经存在",
				status=>0
			);
			$this->ajaxReturn($arr,'jsonp');
		}else{
			$data['pwd']=md5($pwd);
			$data['email']=$email;
			$data['phone']=$phone;
			$registok=$model->add($data);
			
			if($registok){
				$arr=array(
					msg=>$registok,
					status=>1
				);
				$this->ajaxReturn($arr,'jsonp');
			}else{
				$arr=array(
					msg=>"注册失败",
					status=>0,
					
				);
				$this->ajaxReturn($arr,'jsonp');
			}
			
		}
	}
	public function login(){
		$model=M("member");
		$nickname=$_GET['nickname'];
		$pwd=$_GET['pwd'];
		$data['nickname']=$nickname;
		$data['pwd']=md5($pwd);
		$result=$model->field('uid,nickname,email,phone')->where($data)->find();
		if($result){
			$arr=array(
				msg=>"登录成功",
				status=>1,
				user=>$result
			);
			$this->ajaxReturn($arr,'jsonp');
		}else{
			$arr=array(
				msg=>"验证失败",
				status=>0
			);
			$this->ajaxReturn($arr,'jsonp');
		}
	}
	public function sendMsg(){
		import('ORG.Util.Date');
		$model=M("message");
		$username=$_GET['username'];
		$email=$_GET['email'];
		$mobile=$_GET['mobile'];
		$addtime=strtotime(new Date());
		$content=$_GET['content'];
		$productid=$_GET['productid'];
		$data['username']=$username;
		$data['email']=$email;
		$data['moblie']=$mobile;
		$data['addtime']=$addtime;
		$data['content']=$content;
		$data['productid']=$productid;
		if(!empty($_GET["headimgurl"])){
			$data['headimgurl']=$_GET["headimgurl"];
		}
		if($model->add($data)){
			$arr=array(
				msg=>"发表成功",
				status=>1
			);
			$this->ajaxReturn($arr,'jsonp');
		}else{
			$arr=array(
				msg=>"发表失败",
				status=>0
			);
			$this->ajaxReturn($arr,'jsonp');
		}
	}
	public function getmsg(){
		$data['productid']=$_GET['productid'];
		$model=M("message");
		$result=$model->where($data)->order("addtime desc")->select();
		$this->ajaxReturn($result,'jsonp');
	}
	
	public function search(){
		$name=$_GET["name"];
		$m=M('product'); 
		$lang=$_GET['lang'];
		$wheredata['title']  = array('like', '%'.$name.'%');
		$wheredata["lang"]=$lang;
		$data=$m->where($wheredata)->field('id,cid,title,psize,image_id')->order("update_time desc")->select();
		$data=parseProduct($data);		
		if($data){
			$this->ajaxReturn($data,'jsonp');
		}else{
			$this->ajaxReturn(0,'jsonp');
		}
	}
	public function checkOpenId(){
		$model=M("member");
		$data["openid"]=$_GET["openid"];
		$result=$model->where($data)->find();
		if($result){
			$arr=array(
				msg=>"存在该用户",
				status=>1,
				data=>$result
			);
			$this->ajaxReturn($arr,'jsonp');
		}else{
			$arr=array(
				msg=>"不存在该用户",
				status=>0
			);
			$this->ajaxReturn($arr,'jsonp');
		}
	}
	//同步微信用户，自动注册
	public function synuser(){
		$data["openid"]=$_GET['openid'];
		$data["headimgurl"]=$_GET['headimgurl'];
		$data["province"]=$_GET["province"];
		$data["city"]=$_GET["city"];
		$data["nickname"]=$_GET["nickname"];
		$data["pwd"]="123456ab";
		$data["srcoe"]=0;
		$model=M("member");
		$registok=$model->add($data);
		if($registok){
			$arr=array(
				msg=>$registok,
				status=>1
			);
			$this->ajaxReturn($arr,'jsonp');
		}else{
			$arr=array(
				msg=>"注册失败",
				status=>0
				
			);
			$this->ajaxReturn($arr,'jsonp');
		}
	}
	//推送
	public function testPush(){
		import("ORG.Push.JPush");
		$n_title   =  '1231232';
	    $n_content =  '12312321231232123123212312321231232';	
	    $appkeys='6a294744e3648d17ec318112';
	    $masterSecret='a0243924642060a7112f907b';
	    $sendno = 4;
	    $receiver_value = '';			
	    $platform = 'android,ios' ;
	    $msg_content = json_encode(array('n_builder_id'=>0, 'n_title'=>$n_title, 'n_content'=>$n_content));        
	    $obj = new jpush($masterSecret,$appkeys);			 
	    $res = $obj->send($sendno, 4, $receiver_value, 1, $msg_content, $platform);				
	    print_r($res);
    }
	public function push(){
		import("ORG.Push.JPush");
		$n_title   =$_GET['title'];
		$n_content =$_GET['content'];
		$appkeys='6a294744e3648d17ec318112';
		$masterSecret='a0243924642060a7112f907b';
		$sendno = 4;
		$receiver_value = '';
		$platform = 'android,ios' ;
		$msg_content = json_encode(array('n_builder_id'=>0, 'n_title'=>$n_title, 'n_content'=>$n_content));
		$obj = new jpush($masterSecret,$appkeys);
		$res = $obj->send($sendno, 4, $receiver_value, 1, $msg_content, $platform);
		$this->ajaxReturn($res,"获取成功",1);
	}
	
	public function tcbb_login(){
		if(IS_POST){
			$M=M('user');
			$result=$M->where($_POST)->find();
			if($result){
				session("uid",$result['id']);
				session("telephone",$result['telephone']);
				echo json_encode(array('status'=>1,'msg'=>'登录成功！','uid'=>$result['id']));
				//Think\Log::record(date("Y-m-d H:i:s", time())."==".$result['telephone']."用户登录");
				$M->data(array('logintime'=>date("Y-m-d H:i:s", time())))->where(array('id'=>$result['id']))->save();
			}else{
				echo json_encode(array('status'=>0,'msg'=>'手机号码或者密码错误！'));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'非法请求！'));
		}
	}
	public function tcbb_getAddr(){
		$uid=$_GET['uid'];
		$M=M('shipaddr');
		$addr=$M->where(array('userid'=>$uid))->find();
		if($addr){
			$this->ajaxReturn($addr,'获取成功！',1);
		}else{
			$this->ajaxReturn(null,'你还没有配置你的地址信息！',0);
		}
	}
	public function tcbb_addAddr(){
		if(IS_POST){
			if(isset($_POST['userid'])){
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
			echo json_encode(array('status'=>0,'msg'=>'非法请求！'));
		}
	}
	public function tcbb_editAddr(){
		if(IS_POST){
			if(isset($_POST['userid'])){
				$_POST['createtime']=date('Y-m-d H:m:s',time());
				$M=M('shipaddr');
				$result=$M->save($_POST);
				if($result){
					echo json_encode(array('status'=>1,'msg'=>'修改成功！'));
				}else{
					echo json_encode(array('status'=>0,'msg'=>'添加失败！'));
				}
			}else{
				echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
			}
		}else{
			echo json_encode(array('status'=>0,'msg'=>'非法请求！'));
		}
	}
	public function doorder(){
		if($_POST['userid']){
			if(isset($_POST['shipaddrid'])){
				$data['userid']=$_POST['userid'];
				$data['code']=build_order_no();
				$data['orderdate']=time();
				$data['shipaddrid']=$_POST['shipaddrid'];
				$data['shipaddr']=$_POST['shipaddr'];
				$data['receiver']=$_POST['receiver'];
				$data['telephone']=$_POST['telephone'];
				$data['goodsfee']=$_POST['goodsfee'];
				$data['totalfee']=$_POST['totalfee'];
				$data['freight']=0;
				$data['paytype']=$_POST['paytype'];
				$data['sendtime']=$_POST['sendtime'];
				$data['remark']=$_POST['remark'];
				$M=M("order");
				$shopcartModel=M("shopcart");
				$cartlist=json_decode($_POST['cartlist']);
				$result=$M->add($data);
				if($result){
					//购物车入库
					foreach ($cartlist as $vo){
						$shopcartdata['goodsid']=$vo->id;
						$shopcartdata['orderid']=$result;
						$shopcartdata['num']=$vo->num;
						$shopcartdata['price']=$vo->price;
						$shopcartdata['title']=$vo->title;
						$shopcartdata['imgid']=$vo->img;
						$shopcartdata['createtime']=date("Y-m-d H:m:s");
						$shopcartModel->add($shopcartdata);
					}
					echo json_encode(array('status'=>1,'msg'=>'提交成功！','orderid'=>$result));
				}else{
					echo json_encode(array('status'=>0,'msg'=>'提交失败！'));
				}			
			}else{
				echo json_encode(array('status'=>0,'msg'=>'请填写收货人地址！'));
			}
		}else{
			echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
		}
	}
	public function pay_order(){
		$oid=$_POST['oid'];
		$data['id']=$oid;
		$data['tradeNo']=$_POST['tradeNo'];
		$M=M("order");
		if($M->save($data)){
			echo json_encode(array('status'=>1,'msg'=>'提交成功！',''));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'提交失败！'));
		}
	}
	public function getOrderlist(){
		if(isset($_GET['userid'])){
			$M=M('order');
			$result=$M->where(array('userid'=>$_GET['userid']))->order('orderdate desc')->select();
			if($result){
				echo json_encode(array('status'=>1,'msg'=>'获取成功！','list'=>$result));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'获取失败！'));
			}
		}else{
			echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
		}
	}
	
	public function getUserInfo(){
		if(isset($_GET['userid'])){
			$M=M('user');
			$shipaddr_Model=M('shipaddr');
			$addr=$shipaddr_Model->where(array('userid'=>$_GET['userid']))->find();
			$result=$M->field('telephone')->where(array('id'=>$_GET['userid']))->find();
			$data['isshipaddr']=0;
			if($addr){
				$data['isshipaddr']=1;
			}
			if($result){
				$data['telephone']=$result['telephone'];
				echo json_encode(array('status'=>1,'msg'=>'获取成功！','data'=>$data));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'获取失败！'));
			}
		}else{
			echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
		}
	}
	public function getOrderDetail(){
		$M=M('order');
		$orderdetail=$M->find($_GET['orderid']);
		$shopcartModel=M('shopcart');
		$shopcarts=$shopcartModel->where(array('orderid'=>$_GET['orderid']))->select();
		$data['orderdetail']=$orderdetail;
		$data['shopcarts']=$shopcarts;
		$this->ajaxReturn($data,'获取成功！',1);
	}
	public function updatereceive_ok(){
		$M=M('order');
		$data['id']=$_GET['orderid'];
		$data['receive_ok']=1;
		$result=$M->save($data);
		if($result){
			echo json_encode(array('status'=>1,'msg'=>'已确认收货！'));
		}else{
			echo json_encode(array('status'=>0,'msg'=>'操作失败'));
		}
	}
	public function update_pass(){
		if(isset($_POST['userid'])){
			$M=M('user');
			$data['id']=$_POST['userid'];
			$data['password']=$_POST['password'];
			if($M->save($data)){
				echo json_encode(array('status'=>1,'msg'=>'修改成功！'));
			}else{
				echo json_encode(array('status'=>1,'msg'=>'修改失败！'));
			}
		}else{
			echo json_encode(array('status'=>2,'msg'=>'未登录，请先登录！'));
		}
	}
	public function tcbb_register(){
		$M=M('user');
		$checktelephone=$M->where(array('telephone'=>$_POST['telephone']))->find();
		if($checktelephone){
			echo json_encode(array('status'=>0,'msg'=>'对不起该手机号码已经注册！'));
		}else{
			$_POST['createtime']=date("Y-m-d H:i:s", time());
			$_POST['ip']=get_client_ip();
			$_POST['logintime']=date("Y-m-d H:i:s", time());
			$result=$M->add($_POST);
			if($result){
				echo json_encode(array('status'=>1,'msg'=>'注册成功！','uid'=>$result));
			}else{
				echo json_encode(array('status'=>0,'msg'=>'注册失败！'));
			}
		}
	}
}