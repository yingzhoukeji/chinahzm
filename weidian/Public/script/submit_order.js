function getOrderNum(){
	var productlist=cart.getproductlist();
	var num=0;
	for(var i=0;i<productlist.length;i++){
		num+=productlist[i].num;
	}
	return num;
	
}
function getOrderPrice(){
	var productlist=cart.getproductlist();
	var price=0;
	for(var i=0;i<productlist.length;i++){
		
		price+=productlist[i].price*productlist[i].num;
	}
	return price;
}
function getProductlist(){
	var productlist=cart.getproductlist();
	for(var i=0;i<productlist.length;i++){
		var product=productlist[i];
		var html='<dl>';
			html+='<dt>';
			html+=product.name;
			html+='</dt>';
			html+='<dd>';
			html+='￥'+product.price;
			html+='</dd>';
			html+='<dd>';	
			html+=''+product.num+'';
			html+='</dd>';
			html+='</dl>';
			$("#orderlist").append(html);
	}
	$("#price").text(getOrderPrice());
	$("#num").text("数量："+getOrderNum());
}
function dosubmit(){
	if(!localStorage.getItem(USERID)){
		Showbo.Msg.confirm('你还没有登录，是否登录?',function(btn){
			if(btn=="yes"){
				login();
			}
		});
	}else{
		if(getOrderNum()==0){
			Showbo.Msg.alert("对不起你的购物车没有物品!");
			return;
		}
		window.location.href="addr.php";
	}
}

function getAddr(){
	var uid=localStorage.getItem(USERID);
	var url=BaseUrl+"/tcbb_getAddr/uid/"+uid;
	$.getJSON(url,function(json){
		console.log(JSON.stringify(json));
		if(json.status==1){
			shipaddrid=json.data.id;
			$("#consignee_name").val(json.data.receiver);
			$("#phone").val(json.data.telephone);
			$("#address").val(json.data.addr);
			$("#edit_addr").show();
			$("#add_info").show();
			$("#add_btn").hide();
		}else{
			if(json.status==0){
				$("#add_info").hide();
				var html='<div id="add_btn" class="mui-button-row" style="margin-bottom: 20px;">';
				html+='<button id="login" class="mui-btn mui-btn-primary mui-btn-block" style="padding:6px 0;" onclick="add_addr();">添加地址</button>';
				html+='</div>';
				$("#add_addr_content").append(html);
				$("#edit_addr").hide();
			}
		}
		
	});
}


