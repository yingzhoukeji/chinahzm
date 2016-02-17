<?php
// 本类由系统自动生成，仅供测试用途
class IndexAction extends Action {
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
			$this->ajaxReturn($result,'jsonp');
		}else{
			$this->ajaxReturn(0,'jsonp');
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
		$lang=$_GET['lang'];
		$count=$m->count();
		$rand=0; //产生随机数。
		$limit=$rand.','.'10'; 
		$wheredata["lang"]=$lang;
		$data=$m->where($wheredata)->field('id,cid,title,psize,image_id')->order("update_time asc")->limit($limit)->select();
		$data=parseProduct($data);		
		if($data){
			$this->ajaxReturn($data,'jsonp');
		}else{
			$this->ajaxReturn(0,'jsonp');
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
			$this->ajaxReturn($result,'jsonp');
		}else{
			$this->ajaxReturn(0,'jsonp');
		}
	}
	
	public function jpg(){
		$id=$_GET['id'];
		$model=M("images");
		$img=$model->find($id);
		$path="../".$img["savepath"];
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
		$lang=$_GET["lang"];
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
				$this->ajaxReturn($all,'jsonp');
			}else{
				$this->ajaxReturn(0,'jsonp');
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
				$this->ajaxReturn($all,'jsonp');
			}else{
				$this->ajaxReturn(0,'jsonp');
			}
		}
	}
	//新闻详情
	public function newsDetail(){
		$id=$_GET['id'];
		$model=M("news");
		$result=$model->find($id);
		if($result){
			$this->ajaxReturn($result,'jsonp');
		}else{
			$this->ajaxReturn(0,'jsonp');
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
}