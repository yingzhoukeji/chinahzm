<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-3
 * Time: 下午2:52
 */
namespace Admin\Model;
use Think\Model;
class ProductModel extends Model {

    public function listProduct($firstRow = 0, $listRows = 20,$__map) {
        $M = M("Product");

        $list = $M->field("`id`,`title`,`status`,`published`,`cid`,`aid`,`is_recommend`,`lang`,`wap_display`")->where($__map)->order("`published` DESC")->limit("$firstRow , $listRows")->select();
        $statusArr = array("待审核", "已发布");
        $aidArr = M("Admin")->field("`aid`,`email`,`nickname`")->select();
        foreach ($aidArr as $k => $v) {
            $aids[$v['aid']] = $v;
        }
        unset($aidArr);
        $map['type']='p';
        $cidArr = M("Category")->field("`cid`,`name`")->where($map)->select();
        foreach ($cidArr as $k => $v) {
            $cids[$v['cid']] = $v;
        }
        unset($cidArr);
        foreach ($list as $k => $v) {
            $list[$k]['aidName'] =$aids[$v['aid']]['nickname'] == '' ? $aids[$v['aid']]['email'] : $aids[$v['aid']]['nickname'];
            $list[$k]['status'] = $statusArr[$v['status']];
            $list[$k]['cidName'] = $cids[$v['cid']]['name'];
        }
        return $list;
    }

    public function category() {
        if (IS_POST) {
            $act = $_POST[act];
            $data = $_POST['data'];
            $data['name'] = addslashes($data['name']);
            $data['type'] ='p';
            $M = M("Category");
            if ($act == "add") { //添加分类
                unset($data[cid]);
                $data['type']= $_POST['type'];
                if ($M->where($data)->count() == 0) {
                    return ($M->add($data)) ? array('status' => 1, 'info' => '分类 ' . $data['name'] . ' 已经成功添加到系统中', 'url' => U('Product/category', array('time' => time()))) : array('status' => 0, 'info' => '分类 ' . $data['name'] . ' 添加失败');
                } else {
                    return array('status' => 0, 'info' => '系统中已经存在分类' . $data['name']);
                }
            } else if ($act == "edit") { //修改分类
                if (empty($data['name'])) {
                    unset($data['name']);
                }
                if ($data['pid'] == $data['cid']) {
                    unset($data['pid']);
                }
                return ($M->save($data)) ? array('status' => 1, 'info' => '分类 ' . $data['name'] . ' 已经成功更新', 'url' => U('Product/category', array('time' => time()))) : array('status' => 0, 'info' => '分类 ' . $data['name'] . ' 更新失败');
            } else if ($act == "del") { //删除分类
                unset($data['pid'], $data['name']);
                if($M->where('pid='.$data['cid'].' AND cid!='.$data['cid'])->count()>0){
                    return (array('status' => 0, 'info' => $data['name'] . '存在下级分类，请先删除'));
                    exit;
                }
                return ($M->where($data)->delete()) ? array('status' => 1, 'info' => '分类 ' . $data['name'] . ' 已经成功删除', 'url' => U('Product/category', array('time' => time()))) : array('status' => 0, 'info' => '分类 ' . $data['name'] . ' 删除失败');
            }
        } else {
            $map['type']='p';
            $cat = new \Org\Util\Category('Category', array('cid', 'pid', 'name', 'fullname'),$map);
            return $cat->getList();               //获取分类结构
        }
    }

    public function addProduct($imagename='') {
        $M = M("Product");
        $data = $_POST['info'];
        $data['published'] = time();
        $data['summary']=nl2br($data['summary']);
        $data['title']=strip_tags($data['title']);

        $image=I('post.image_1');
        if($image){
            if(is_array($image)){
                $M_image = M("images");
                $image_id=array();
                foreach($image as $k=>$v){
                    $img_data['savepath']=$v;
                    $img_data['savename']=end(explode('/',$v));
                    $img_data['create_time']=time();
                    $img_data['catname']='product';
                    if($v)
                    $image_id[$k]=$M_image->add($img_data);
                }
                $data['image_id']=implode(',',$image_id);
            }
        }

        $data['aid'] = $_SESSION['my_info']['aid'];
        if(empty($data['title'])){
            return array('status' => 0, 'info' => "请输入标题！",'url'=>__SELF__);
        }
        if (empty($data['summary'])) {
            $data['summary'] = cutStr(strip_tags($data['content']), 200);
        }
        if ($M->add($data)) {
            return array('status' => 1, 'info' => "已经发布", 'url' => U('Product/index'));
        } else {
            return array('status' => 0, 'info' => "发布失败，请刷新页面尝试操作");
        }
    }

    public function edit() {
        $M = M("Product");
        $data = $_POST['info'];
        $data['update_time'] = time();
        $data['summary']=nl2br($data['summary']);
        $data['title']=strip_tags($data['title']);

        $M_image = M("images");
        $map['id']=$data['id'];
        $image_ids=$M->where($map)->getField('image_id');
        $image_map['id']=array('in',$image_ids);
        $M_image->where($image_map)->delete();
        $data['image_id']='';

        $image=I('post.image_1');
        if($image){
            if(is_array($image)){
                $image_id=array();
                foreach($image as $k=>$v){
                    $img_data['savepath']=$v;
                    $img_data['savename']=end(explode('/',$v));
                    $img_data['create_time']=time();
                    $img_data['catname']='product';
                    if($v)
                    $image_id[$k]=$M_image->add($img_data);
                }
                $data['image_id']=implode(',',$image_id);
            }
        }

        if(empty($data['title'])){
            return array('status' => 0, 'info' => "请输入标题！",'url'=>__SELF__);
        }
        if ($M->save($data)) {
            return array('status' => 1, 'info' => "已经更新", 'url' => U('Product/index'));
        } else {
            return array('status' => 0, 'info' => "更新失败，请刷新页面尝试操作");
        }
    }

}