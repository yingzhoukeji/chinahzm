<?php
namespace Admin\Model;
use Think\Model;
class JoinModel extends Model {
    public function addBargain() {
        $M = M("Bargain");
        $data=$_POST;
		$data['createtime']=date('Y-m-d H:m:s', time());
		if($M->add($data)){
			$arr=array('status' => 1, 'info' => '添加成功！','url' => U('Siteinfo/bargain'));
		}else{
			$arr=array('status' => 0, 'info' => "添加失败！");
		}
		return $arr;
    }
	public function listJoin($firstRow = 0, $listRows = 20){
		$M = M("Join");
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
	function edit(){
		$M = M("Bargain");
        $data=$_POST;
		$arr='';
		if($M->save($data)){
			$arr=array('status' => 1, 'info' => '更新成功！','url' => U('Siteinfo/bargain'));
		}else{
			$arr=array('status' => 0, 'info' => "更新失败！","sql"=>$M->getLastSql());
		}
		return $arr;
	}
}

?>
