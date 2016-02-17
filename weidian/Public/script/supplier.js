function addproduct(id,name,num,price){
	var product ={'id': id,'name': name,'num':num,'price':price};
	cart.addproduct(product);
	updateCategary();
	var product=findProductByPid(id);
	updateCart(product.cid);
	updateNum();
}
function detailUpdate(id){
	updateCategary();
	var product=findProductByPid(id);
	updateCart(product.cid);
	updateNum();
}
function minusproduct(id){
	var num=$("#material_"+id+"_num").val();
	if(num==0){
		api.toast({
		    msg: '对不起，该食材数据已经为0',
		    duration:2000,
		    location: 'middle'
		});
		return;
	}
	if(num==1){
		cart.deleteproduct(id);
		$("#material_"+id+"_num").val(0);
	}else{
		cart.updateproductnum(id,num-1);
	}
	
	updateCategary();
	var product=findProductByPid(id);
	updateCart(product.cid);
	updateNum();
}
function findProductByPid(pid){
	var obj=null;
	for(var i=0;i<alljson.length;i++){
		if(alljson[i].id==pid){
			obj=alljson[i];
		}
	}
	return obj;
}
function getProductByCid(cid){
	var arr=new Array();
	for(var i=0;i<alljson.length;i++){
		if(alljson[i].cid==cid){
			
			arr.push(alljson[i]);
		}
	}
	return arr;
}
function updateCart(cid){
	var products=getProductByCid(cid);
	for(var i=0;i<products.length;i++){
		var product=products[i];
		console.log(product.id);
		
		if(findProductBycart(product.id)!=null){
			var productBycart =findProductBycart(product.id);
			var num=productBycart.num;
			$("#material_"+productBycart.id+"_num").val(num);
		}
	}
}
//从购物车获取产品
function findProductBycart(mid){
	var productlist=cart.getproductlist();
	var product=null;
	for(var i=0;i<productlist.length;i++){
		var id=productlist[i].id;
		if(id==mid){
			product=productlist[i];
		}
	}
	return product;
}
function updateCategary(){
	var productlist=cart.getproductlist();
	console.log(JSON.stringify(productlist));
	$("#category").find("li").each(function(idx,el){
		$(this).find("span").text(0);
		if(!$(this).find("span").hasClass('mui-hidden')){
			$(this).find("span").addClass('mui-hidden');
		}
	});
	$("#category").find("li").each(function(idx,el){
		var cid=$(this).data("id");
		for(var i=0;i<productlist.length;i++){
			var id=productlist[i].id;
			var num=productlist[i].num;
			var product=findProductByPid(id);
			var cart_cid=product.cid;
			if(num>0){
				if(cid==cart_cid){
					var currnum=$(this).find("span").text();
					$(this).find("span").text(parseInt(currnum)+productlist[i].num);
					$(this).find("span").removeClass('mui-hidden');
				}
			}
			
		}
	});
}
function updateNum(){
	var num=getOrderNum();
	if(num==0){
		$("#ts_cart_num").hide();
	}else{
		$("#ts_cart_num").show();
	}
	$("#ts_cart_num").text(getOrderNum());
	$("#price").text(getOrderPrice());
}
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