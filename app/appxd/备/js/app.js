var module;
//var serverUrl="http://192.168.0.108:81/jyst/api.php/Index";
var serverUrl="http://www.chinahzm.cn/dsapi/api.php/Index";
//var picUrl="http://192.168.0.102:81/jyst/api.php/Index/jpg?id=";
var picUrl="http://www.chinahzm.cn";
var lang="zh-cn";
(function(){
    module = angular.module('app', ['onsen','ngSanitize','angular-cache']);
    
    module.run(function ($http, CacheFactory) {
	  $http.defaults.cache = CacheFactory('defaultCache', {
	    maxAge: 15 * 60 * 1000, // Items added to this cache expire after 15 minutes
	    cacheFlushInterval: 60 * 60 * 1000, // This cache will clear itself every hour
	    deleteOnExpire: 'aggressive' // Items will be deleted from this cache when they expire
	  });
	});
	module.controller('AppController', function($scope) { 
		/*$scope.$on('loginChange',function(event, msg){
			
			$scope.$broadcast("homeLoginChange", msg);
		});*/
	});
	module.controller('homeController',function($scope, $http,HomeService){
		ons.ready(function() {
		  modal.show();
		  $scope.picUrl=picUrl;
		  
		  if(localStorage.getItem("islogin")&&localStorage.getItem("islogin")==1){
		  	 $scope.logininfo=localStorage.getItem("username");
		  }else{
		  	 $scope.logininfo="登录";
		  }
		  
          /*$http.jsonp(serverUrl+"/randproduct?lang="+lang+"&callback=JSON_CALLBACK").success(function(data){
			   $scope.randProducts=data;
			   modal.hide();
			   $scope.ngproductDetail= function (index) {
		           $scope.myNavigator.pushPage('productDetail', {animation : 'slide',pid:data[index].id});
		       }
		  });*/
		  HomeService.randproduct().then(function(data){
		  	modal.hide();
		  	$scope.randProducts=data;
		  	$scope.ngproductDetail= function (index) {
	           $scope.myNavigator.pushPage('productDetail', {animation : 'slide',pid:data[index].id});
	        }
		  });
		  $http.jsonp(serverUrl+"/randnews?lang="+lang+"&callback=JSON_CALLBACK").success(function(data){
			   $scope.randnews=data;
			   $scope.ngNewsDetail= function (index) {
		           $scope.myNavigator.pushPage('newsDetail', {animation : 'slide',data:data[index]});
		       }
		  });
		  $scope.goRegister=function(){
		  	if(localStorage.getItem("islogin")&&localStorage.getItem("islogin")==1){
		  	 	ons.notification.alert({
				  message: "你已经注册了",
				  title: '提示信息',
				  buttonLabel: '确定',
				  animation: 'default'
				});
				return;
		  	}
		  	$scope.myNavigator.pushPage('regist', {animation : 'slide'});
		  };
		  $scope.gologinView=function(){
		  	if(localStorage.getItem("islogin")&&localStorage.getItem("islogin")==1){
		  	 	ons.notification.alert({
				  message: "你已经登录",
				  title: '提示信息',
				  buttonLabel: '确定',
				  animation: 'default'
				});
				return;
		  	}
		  	$scope.myNavigator.pushPage('loginView', {animation : 'slide'});
		  };
		  $scope.ngOpenProductSearch= function () {
	           $scope.myNavigator.pushPage('productSearch', {animation : 'fade'});
	      }
		  $scope.logout=function(){
		  	localStorage.setItem("islogin",0);
		  	document.querySelector("#id_username").innerText="登录";
		  	ons.notification.alert({
			  message: "你已经退出登录",
			  title: '提示信息',
			  buttonLabel: '确定',
			  animation: 'default'
			});
		  };
		  $scope.openMap=function(){
    		$scope.myNavigator.pushPage('baidumap', {animation : 'fade'});
    	  }
		  /*$scope.$on('homeLoginChange',function(event, msg){
			 $scope.logininfo=msg;
		  });*/
        });
    });
    //产品分类
    module.controller('productController',function($scope, $http){
    	modal.show();
		$http.jsonp(serverUrl+"/categary?lang="+lang+"&type=p&callback=JSON_CALLBACK").success(function(data){
		   modal.hide();
		   $scope.pCategary=data;
		   $scope.ngProductList= function (index) {
	           $scope.myNavigator.pushPage('productlist', {animation : 'slide',cid:data[index].cid,name:data[index].name});
	       }
		   $scope.ngOpenProductSearch= function () {
	           $scope.myNavigator.pushPage('productSearch', {animation : 'fade'});
	       }
	    });
	    
    });
    module.controller('productListController',function($scope, $http){
		var page = myNavigator.getCurrentPage();
  		var cid=page.options.cid;
  		cname=page.options.name;
  		$scope.cname=cname;
  		modal.show();
  		$scope.picUrl=picUrl;
		$http.jsonp(serverUrl+"/product?lang="+lang+"&cid="+cid+"&callback=JSON_CALLBACK").success(function(data){
			modal.hide();
			$scope.productlist=data;
			$scope.ngproductDetail= function (index) {
	           $scope.myNavigator.pushPage('productDetail', {animation : 'slide',pid:data[index].id});
	       }
		   $scope.ngOpenProductSearch= function () {
	           $scope.myNavigator.pushPage('productSearch', {animation : 'fade'});
	       }
		});
    });
    //产品搜索
    module.controller('productSearchController',function($scope, $http){
		$scope.picUrl=picUrl;
  		modal.show();
		$http.jsonp(serverUrl+"/product?lang="+lang+"&type=all&callback=JSON_CALLBACK").success(function(data){
			modal.hide()
			$scope.productlist=data;
			$scope.ngproductDetail= function (index) {
	           $scope.myNavigator.pushPage('productDetail', {animation : 'slide',pid:data[index].id});
	           var query = element(by.model('query'));
	       }
		});
    });
    module.controller('productDetailController',function($scope, $http,$sce){
		var page = myNavigator.getCurrentPage();
  		var pid=page.options.pid;
  		$scope.picUrl=picUrl;
  		modal.show();
		$http.jsonp(serverUrl+"/productDetail?id="+pid+"&callback=JSON_CALLBACK").success(function(data){
			$scope.product=data;
			$scope.content=$sce.trustAsHtml(data.content);
			$http.jsonp(serverUrl+"/getmsg?productid="+pid+"&callback=JSON_CALLBACK").success(function(data){
				modal.hide()
				$scope.msgs=data;
			});
		});
		$scope.ngOpenProductSearch= function () {
	           $scope.myNavigator.pushPage('productSearch', {animation : 'fade'});
	       }
		$scope.sendMsg=function(){
			$scope.myNavigator.pushPage('sendMsg', {animation : 'fade',id:pid});
		}
		
    });
    //新闻
     module.controller('newsController',function($scope, $http){
    	modal.show();
		$http.jsonp(serverUrl+"/categary?lang="+lang+"&type=n&callback=JSON_CALLBACK").success(function(data){
		   modal.hide();
		   $scope.pCategary=data;
		   $scope.ngNewsList= function (index) {
	           $scope.myNavigator.pushPage('newslist', {animation : 'slide',cid:data[index].cid,name:data[index].name});
	       }
	    });
	    
    });
    
    //新闻列表
    module.controller('newslistController',function($scope, $http){
		var page = myNavigator.getCurrentPage();
  		var cid=page.options.cid;
  		cname=page.options.name;
  		$scope.cname=cname;
  		modal.show();
		$http.jsonp(serverUrl+"/news?lang="+lang+"&cid="+cid+"&callback=JSON_CALLBACK").success(function(data){
			modal.hide()
			$scope.newslist=data;
			$scope.ngNewsDetail= function (index) {
	           $scope.myNavigator.pushPage('newsDetail', {animation : 'slide',data:data[index]});
	       }
		});
    });
    //新闻详情
    module.controller('newsDetailController',function($scope,$sce){
		var page = myNavigator.getCurrentPage();
  		var data=page.options.data;
  		$scope.picUrl=picUrl;
  		$scope.news=data;
  		$scope.content=$sce.trustAsHtml(data.content);
    });
    //关于
    
    module.controller('aboutController',function($scope){
		$scope.openMap=function(){
    		$scope.myNavigator.pushPage('baidumap', {animation : 'fade'});
    	}
		$scope.clearCache=function(){
			localStorage.clear();
			ons.notification.alert({
			  message: '成功清除缓存！!',
			  title: '提示信息',
			  buttonLabel: '确定',
			  animation: 'default'
			});
		}
    });
    //注册
    module.controller('registController',function($scope,$http){
    	$scope.regist=function(){
    		var username=$scope.username;
    		var password=$scope.password;
    		var rpassword=$scope.rpassword;
    		var email=$scope.email;
    		var phone=$scope.phone;
    		//$scope.$emit("loginChange", "注册");
    		if(username==undefined){
    			ons.notification.alert({
				  message: '请输入用户名!',
				  title: '提示信息',
				  buttonLabel: '确定',
				  animation: 'default'
				});
				return;
    		}
    		if(password==undefined){
    			ons.notification.alert({
				  message: '请输入密码!',
				  title: '提示信息',
				  buttonLabel: '确定',
				  animation: 'default'
				});
				return;
    		}
    		if(rpassword==undefined){
    			ons.notification.alert({
				  message: '请再次输入密码!',
				  title: '提示信息',
				  buttonLabel: '确定',
				  animation: 'default'
				});
				return;
    		}
    		if(rpassword!=password){
    			ons.notification.alert({
				  message: '两次输入的密码不一致!',
				  title: '提示信息',
				  buttonLabel: '确定',
				  animation: 'default'
				});
				return;
    		}
    		modal.show();
			$http.jsonp(serverUrl+"/regist?nickname="+username+"&pwd="+password+"&email="+email+"&phone="+phone+"&callback=JSON_CALLBACK").success(function(data){
				modal.hide()
				if(data.status==0){
					ons.notification.alert({
					  message: data.msg,
					  title: '提示信息',
					  buttonLabel: '确定',
					  animation: 'default'
					});
				}else{
					ons.notification.alert({
					  message: '注册成功！',
					  title: '提示信息',
					  buttonLabel: '确定',
					  animation: 'default',
					  callback:function(){
					  	//注册成功回到上一个页面
					  	localStorage.setItem("islogin",1);
					  	localStorage.setItem("uid",data.msg);
					  	localStorage.setItem("username",username);
					  	localStorage.setItem("email",email);
					  	localStorage.setItem("phone",phone);
					  	var page = myNavigator.getCurrentPage();
					  		myNavigator.popPage();
					  }
					});
				}
			});
    	}
    	
    });
    //登录
    module.controller('loginController',function($scope,$http){
    	$scope.submit=function(){
    		var username=$scope.username;
    		var password=$scope.password;
    		if(username==undefined){
    			ons.notification.alert({
				  message: '请输入用户名!',
				  title: '提示信息',
				  buttonLabel: '确定',
				  animation: 'default'
				});
				return;
    		}
    		if(password==undefined){
    			ons.notification.alert({
				  message: '请输入密码!',
				  title: '提示信息',
				  buttonLabel: '确定',
				  animation: 'default'
				});
				return;
    		}
    		modal.show();
    		$http.jsonp(serverUrl+"/login?nickname="+username+"&pwd="+password+"&callback=JSON_CALLBACK").success(function(data){
    			modal.hide();
    			if(data.status==1){
    				ons.notification.alert({
					  message: '登录成功！',
					  title: '提示信息',
					  buttonLabel: '确定',
					  animation: 'default',
					  callback:function(){
					  	//注册成功回到上一个页面
					  	localStorage.setItem("islogin",1);
					  	localStorage.setItem("uid",data.user.uid);
					  	localStorage.setItem("username",data.user.nickname);
					  	localStorage.setItem("email",data.user.email);
					  	localStorage.setItem("phone",data.user.phone);
					  	document.querySelector("#id_username").innerText=username;
					  	var page = myNavigator.getCurrentPage();
					  		myNavigator.popPage();
					  }
					});
    			}else{
    				ons.notification.alert({
					  message: data.msg,
					  title: '提示信息',
					  buttonLabel: '确定',
					  animation: 'default'
					});
    			}
    		});
    	}
    });
    //留言
	module.controller('sendMsgController',function($scope, $http){
		if(localStorage.getItem("islogin")&&localStorage.getItem("islogin")==1){
			$scope.username=localStorage.getItem("username");
			$scope.phone=localStorage.getItem("phone");
			$scope.email=localStorage.getItem("email");
		}
		$scope.submit=function(){
			var page = myNavigator.getCurrentPage();
  			var id=page.options.id;
			var username=$scope.username;
			var phone=$scope.phone;
			var email=$scope.email;
			var content=$scope.content;
			
			if(username==undefined){
    			ons.notification.alert({
				  message: '请输入姓名!',
				  title: '提示信息',
				  buttonLabel: '确定',
				  animation: 'default'
				});
				return;
    		}
			if(phone==undefined){
    			ons.notification.alert({
				  message: '请输入电话号码，方便联系!',
				  title: '提示信息',
				  buttonLabel: '确定',
				  animation: 'default'
				});
				return;
    		}
			if(email==undefined){
    			ons.notification.alert({
				  message: '请输入邮件地址，方便联系!',
				  title: '提示信息',
				  buttonLabel: '确定',
				  animation: 'default'
				});
				return;
    		}
			if(content==undefined){
    			ons.notification.alert({
				  message: '请输入留言内容!',
				  title: '提示信息',
				  buttonLabel: '确定',
				  animation: 'default'
				});
				return;
    		}
			modal.show();
			$http.jsonp(serverUrl+"/sendMsg?username="+username+"&email="+email+"&mobile="+phone+"&content="+content+"&productid="+id+"&callback=JSON_CALLBACK").success(function(data){
				modal.hide();
				if(data.status==1){
					ons.notification.alert({
					  message: data.msg,
					  title: '提示信息',
					  buttonLabel: '确定',
					  animation: 'default',
					  callback:function(){
					  	var page = myNavigator.getCurrentPage();
					  	myNavigator.popPage();
					  }
					});
				}else{
					ons.notification.alert({
					  message: data.msg,
					  title: '提示信息',
					  buttonLabel: '确定',
					  animation: 'default'
					});
				}
			});
		}
    });
    //获取menu
    module.controller('menuController',function($scope,$http){
    	$http.jsonp(serverUrl+"/pages?lang="+lang+"&callback=JSON_CALLBACK").success(function(data){
    		//走进大森
    		var zjds=new Array();
    		//服务中心
    		var fwzx=new Array();
    		//人力资源
    		var rlzy=new Array();
    		//联系我们
    		var lxwm=new Array();
    		for(var i=0;i<data.length;i++){
    			if(data[i].parent_id==20){
    				zjds.push(data[i]);
    			}else if(data[i].parent_id==37){
    				fwzx.push(data[i]);
    			}else if(data[i].parent_id==32){
    				rlzy.push(data[i]);
    			}else if(data[i].parent_id==44){
    				lxwm.push(data[i]);
    			}
    			
    		}
    		$scope.zjds=zjds;
    		$scope.fwzx=fwzx;
    		$scope.rlzy=rlzy;
    		$scope.lxwm=lxwm;
    		$scope.gopageDetail=function(index,type){
    			var data=null;
    			if(type==0){
    				data=zjds[index];
    			}else if(type==1){
    				data=zjds[index];
    			}
    			else if(type==2){
    				data=rlzy[index];
    			}
    			else if(type==3){
    				data=lxwm[index];
    			}
    			$scope.myNavigator.pushPage('pageDetail', {animation : 'slide',data:data});
    			menu.closeMenu();
    		}
    		
    	});
    	$scope.openMap=function(){
    		$scope.myNavigator.pushPage('baidumap', {animation : 'fade'});
    	}
    	
    });
    module.controller('pageDetailController',function($scope,$sce){
    	var page = myNavigator.getCurrentPage();
  		var data=page.options.data;
    	$scope.data=data;
    	$scope.content=$sce.trustAsHtml(data.content);
    });
    
})();