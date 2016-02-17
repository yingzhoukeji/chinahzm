<?php
namespace Admin\Model;
use Think\Model;
class WxhdModel extends Model {
    public function addWxhd() {
        $M = M("Wxhd");
        $data['title']=I('post.title');
		$data['phone']=I('post.phone');
		$data['endtime']=strtotime(I('post.endtime'));
		$data['image']=I('post.image');
		$data['status']=I('post.status');
		$data['srcoe']=I('post.srcoe');
		$data['limit']=I('post.limit');
		$data['summary']=I('post.summary');
		$data['published']=time();
		$data['content']=I('post.content');
		$arr='';
		//$arr=$data;
		if($M->add($data)){
			$arr=array('status' => 1, 'info' => '添加成功！','url' => U('Siteinfo/wxmanager'));
		}else{
			$arr=array('status' => 0, 'info' => "添加失败！");
		}
		return $arr;
    }
	public function listWxhd($firstRow = 0, $listRows = 20){
		$M = M("Wxhd");
        $list = $M->order("`published` DESC")->limit("$firstRow , $listRows")->select();
        $statusArr = array("启用", "禁用");
        foreach ($list as $k => $v) {
            $list[$k]['status'] = $statusArr[$v['status']];
        }
        return $list;
	}
	function edit(){
		$M = M("Wxhd");
		$data['id']=I('post.id');
        $data['title']=I('post.title');
		$data['endtime']=strtotime(I('post.endtime'));
		$data['image']=I('post.image');
		$data['status']=I('post.status');
		$data['srcoe']=I('post.srcoe');
		$data['summary']=I('post.summary');
		$data['content']=I('post.content');
		$data['phone']=I('post.phone');
		$data['limit']=I('post.limit');
		$arr='';
		//$arr=$data;
		if($M->save($data)){
			$arr=array('status' => 1, 'info' => '更新成功！','url' => U('Siteinfo/wxmanager'));
		}else{
			$arr=array('status' => 0, 'info' => "更新失败！","sql"=>$M->getLastSql());
		}
		return $arr;
	}
}

?>
