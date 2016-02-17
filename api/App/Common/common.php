<?php
function parseProduct($products){
	$arr=array();
	$imgModel=M("images");
	for($i=0;$i<count($products);$i++){
		$product=$products[$i];
		$image_id=$product["image_id"];
		$img=$imgModel->field("savepath")->find($image_id);
		$savepath=$img["savepath"];
		$product["savepath"]=$savepath;
		array_push($arr,$product);
	}
	return $arr;
}
function getImagePathById($image_id){
	$imgModel=M("images");
	$img=$imgModel->field("savepath")->find($image_id);
	$savepath=$img["savepath"];
	return $savepath;
}
//生成订单号
function build_order_no(){
	return date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
}
?>