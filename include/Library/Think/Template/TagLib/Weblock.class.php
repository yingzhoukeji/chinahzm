<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-3
 * Time: 上午11:20
 */

namespace Think\Template\TagLib;
use Think\Template\TagLib;
defined('THINK_PATH') or exit();
class Weblock extends TagLib{

    protected  $tags=array(
        'weblock'=>array('attr'=>'name','close'=>0),
        'news'=>array('attr'=>'order,limit,where'),
        'product'=>array('attr'=>'order,limit,where'),
        'nav'=>array('attr'=>'order,limit,posstion'),
        'cat'=>array('attr'=>'limit,type,pid','level'=>3),
        'flink'=>array('attr'=>'limit,order'),
    );

    //块内容
    public function _weblock($tag,$content){
        $m_tag=M('tag');
        $map['lang']=LANG_SET;
        $map['unique_id']=$tag['name'];
        $c=$m_tag->where($map)->getField('content');
        return $c;
    }
    /**
     * 读取文章列表标签
     */
    public function _news($tag,$content){
        $order=$tag['order'];
        $limit=$tag['limit'];
        $where=$tag['where'];
        $lang=LANG_SET;
        if($where){
            $where='"'.$where.' AND status=1 AND lang=\''.$lang.'\'"';
        }else{
            $where='"status=1 AND lang=\''.$lang.'\'"';
        }
        $str='<?php $__m_news=M("news");?>';
        $str.='<?php $_news_list=$__m_news
        ->field("id,cid,title,update_time,image_id,status,published,summary")
        ->where('.$where.')
        ->order("'.$order.'")
        ->limit('.$limit.')
        ->select();?>';
        $str.='<?php foreach ($_news_list as $key=>$new):?>';
        $str .= $content;
        $str .= '<?php endforeach;?>';
        return $str;
    }

    /**
     * 读取产品列表标签
     */
    public function _product($tag,$content){
        $order=$tag['order'];
        $limit=$tag['limit'];
        $where=$tag['where'];
        $lang=LANG_SET;
        if($where){
            $where='"'.$where.' AND status=1 AND lang=\''.$lang.'\'"';
        }else{
            $where='"status=1 AND lang=\''.$lang.'\'"';
        }
        $str='<?php $__m_product=M("product");?>';
        $str.='<?php $_m_product_list=$__m_product
        ->field("id,cid,title,update_time,status,published,image_id,psize,summary")
        ->where('.$where.')
        ->order("'.$order.'")
        ->limit('.$limit.')
        ->select();?>';
        $str.='<?php foreach ($_m_product_list as $key=>$pro):?>';
        $str .= $content;
        $str .= '<?php endforeach;?>';
        return $str;
    }

    /**
     * 导航标签
     */
    public function _nav($tag,$content){
        $order=$tag['order'];
        $limit=$tag['limit'];
        $posstion=$tag['posstion'];
        $lang=LANG_SET;
        if(!$order){$order='id';}
        $where="\"lang='{$lang}' ";
        if($posstion){$where.=" AND type='{$posstion}'";};
        $where.=" AND parent_id=0";
        $where.="\"";
        $str='<?php ';
        $str.='$_m_nav=M("nav");';
        $str.="\$__list__=\$_m_nav->where({$where})->order('{$order}')->select();";
        $str.="foreach(\$__list__ as \$_k1=>\$_v1):";
        $str.="\$cid=\$_v1['id'];";
        $str.="\$child=\$_m_nav->where('parent_id='.\$cid)->order('sort DESC')->select();";
        $str .= "extract(\$_v1);?>";
        $str.=$content;
        $str.="<?php endforeach; ?>";
        return $str;
    }

    /**
     * 分类标签
     */
    public function _cat($tag,$content){
        $type=$tag['type'];
        $limit=$tag['limit'];
        $pid=$tag['pid'];
        $lang=LANG_SET;
        $where="\"lang='{$lang}' ";
        if($type){$where.=" AND type='{$type}'";};
        if(isset($pid)){$where.=" AND pid={$pid}";};
        $where.="\"";
        $str='<?php ';
        $str.='$__m_cat=M("category");';
        $str.="\$__cat_list=\$__m_cat->where({$where})->limit({$limit})->select();";
        $str.="foreach(\$__cat_list as \$_ck=>\$_cv):";
        $str.="\$cid=\$_cv['cid'];";
        $str.="\$child=\$__m_cat->where('pid='.\$cid)->order('cid DESC')->select();";
        $str .= "extract(\$_cv);?>";
        $str.=$content;
        $str.="<?php endforeach; ?>";
        return $str;
    }
    /*
     * 友情链接
     */
    public function _flink($tag,$content){
        $order=$tag['order'];
        $limit=$tag['limit'];
        $str='<?php ';
        $str.='$__m_link=M("link");';
        $str.="\$__link_list=\$__m_link->where('display=1')->order('{$order}')->limit({$limit})->select();";
        $str.="foreach(\$__link_list as \$_lk=>\$_lv):";
        $str .= "extract(\$_lv);?>";
        $str.=$content;
        $str.="<?php endforeach; ?>";
        return $str;
    }


} 