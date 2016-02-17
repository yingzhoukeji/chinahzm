<?php
namespace Admin\Model;
use Think\Model;
class Order1Model extends Model {
	public function listOrder1($firstRow = 0, $listRows = 20){
		$M = M("Order");
		$M_Bargain = M("Bargain");
        $list = $M->order("id asc")->limit("$firstRow , $listRows")->select();
		$arr=array();
		for($i=0;$i<count($list);$i++){
			$Bargain=$M_Bargain->field('title')->find($list[$i]['bargainid']);
			$list[$i]['bargain_title']=$Bargain['title'];
			array_push($arr,$list[$i]);
		}
        return $arr;
	}
}

?>
