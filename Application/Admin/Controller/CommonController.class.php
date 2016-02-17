<?php
namespace Admin\Controller;
use Think\Controller;
use Org\Util\Rbac;
class CommonController extends Controller {

    public $loginMarked;

    /**
      +----------------------------------------------------------
     * 初始化
     * 如果 继承本类的类自身也需要初始化那么需要在使用本继承类的类里使用parent::_initialize();
      +----------------------------------------------------------
     */
    public function _initialize() {
        header("Content-Type:text/html; charset=utf-8");
        header('Content-Type:application/json; charset=utf-8');
        $systemConfig = include WEB_ROOT . 'Common/Conf/systemConfig.php';
        if (empty($systemConfig['TOKEN']['admin_marked'])) {
            $systemConfig['TOKEN']['admin_marked'] = "http://www.jtys114.com";
            $systemConfig['TOKEN']['admin_timeout'] = 3600;
            $systemConfig['TOKEN']['member_marked'] = "http://www.jtys114.com";
            $systemConfig['TOKEN']['member_timeout'] = 3600;
            set_config("systemConfig", $systemConfig, WEB_ROOT . "Common/Conf/");
            if (is_dir(WEB_ROOT . "install/")) {
                //delDirAndFile(WEB_ROOT . "install/", TRUE);
            }
        }
        $this->loginMarked = md5($systemConfig['TOKEN']['admin_marked']);
        $this->checkLogin();
        // 用户权限检查
        if (C('USER_AUTH_ON') && !in_array(CONTROLLER_NAME, explode(',', C('NOT_AUTH_MODULE')))) {
           // import('ORG.Util.RBAC');
            if (!RBAC::AccessDecision()) {
                //检查认证识别号
                if (!$_SESSION [C('USER_AUTH_KEY')]) {
                    //跳转到认证网关
                    redirect(C('USER_AUTH_GATEWAY'));
//                    redirect(PHP_FILE . C('USER_AUTH_GATEWAY'));
                }
                // 没有权限 抛出错误
                if (C('RBAC_ERROR_PAGE')) {
                    // 定义权限错误页面
                    redirect(C('RBAC_ERROR_PAGE'));
                } else {
                    if (C('GUEST_AUTH_ON')) {
                        $this->assign('jumpUrl', C('USER_AUTH_GATEWAY'));
                    }
                    // 提示错误信息
//                     echo L('_VALID_ACCESS_');
                    $this->error(L('_VALID_ACCESS_'));
                }
            }
        }
        $this->assign("menu", $this->show_menu());
        $this->assign("sub_menu", $this->show_sub_menu());
        $this->assign("my_info", $_SESSION['my_info']);
        $this->assign("site", $systemConfig);

      //  $this->getQRCode();
    }

    protected function getQRCode($url = NULL) {
        if (IS_POST) {
            $this->assign("QRcodeUrl", "");
        } else {
//            $url = empty($url) ? C('WEB_ROOT') . $_SERVER['REQUEST_URI'] : $url;
            $url = empty($url) ? C('WEB_ROOT') . U(CONTROLLER_NAME . '/' . ACTION_NAME) : $url;
            /*import('QRCode');
            $QRCode = new QRCode('', 80);
            $QRCodeUrl = $QRCode->getUrl($url);
            $this->assign("QRcodeUrl", $QRCodeUrl);*/
        }
    }

    public function checkLogin() {
        if (isset($_COOKIE[$this->loginMarked])) {
            $cookie = explode("_", $_COOKIE[$this->loginMarked]);
            $timeout = C("TOKEN");
            if (time() > (end($cookie) + $timeout['admin_timeout'])) {
                setcookie("$this->loginMarked", NULL, -3600, "/");
                unset($_SESSION[$this->loginMarked], $_COOKIE[$this->loginMarked]);
                $this->error("登录超时，请重新登录", U("Public/index"));
            } else {
                if ($cookie[0] == $_SESSION[$this->loginMarked]) {
                    setcookie("$this->loginMarked", $cookie[0] . "_" . time(), 0, "/");
                    session('elfinder',true);
                } else {
                    setcookie("$this->loginMarked", NULL, -3600, "/");
                    unset($_SESSION[$this->loginMarked], $_COOKIE[$this->loginMarked]);
                    $this->error("帐号异常，请重新登录", U("Public/index"));
                }
            }
        } else {
            $this->redirect("Public/index");
        }
        return TRUE;
    }

    /**
      +----------------------------------------------------------
     * 验证token信息
      +----------------------------------------------------------
     */
    protected function checkToken() {
        if (IS_POST) {
            if (!M("Admin")->autoCheckToken($_POST)) {
                die(json_encode(array('status' => 0, 'info' => '令牌验证失败')));
            }
            unset($_POST[C("TOKEN_NAME")]);
        }
    }

    /**
      +----------------------------------------------------------
     * 显示一级菜单
      +----------------------------------------------------------
     */
    private function show_menu() {
        $cache = C('admin_big_menu');
        $model=M('model')->where('is_inner=0')->field('tbl_name,menu_name')->select();
        foreach ($model as $key => $value) {
          $k=ucwords(str_replace(C('DB_PREFIX'),'', $value['tbl_name']));
          $cache[$k]=$value['menu_name'];
        }
        $count = count($cache);
        $i = 1;
        $menu = "";
        foreach ($cache as $url => $name) {
            if ($i == 1) {
                $css = $url == CONTROLLER_NAME || !$cache[CONTROLLER_NAME] ? "fisrt_current" : "fisrt";
                $menu.='<li class="' . $css . '"><span><a href="' . U($url . '/index') . '">' . $name . '</a></span></li>';
            } else if ($i == $count) {
                $css = $url == CONTROLLER_NAME ? "end_current" : "end";
                $menu.='<li class="' . $css . '"><span><a href="' . U($url . '/index') . '">' . $name . '</a></span></li>';
            } else {
                $css = $url == CONTROLLER_NAME ? "current" : "";
                $menu.='<li class="' . $css . '"><span><a href="' . U($url . '/index') . '">' . $name . '</a></span></li>';
            }
            $i++;
        }
        return $menu;
    }

    /**
      +----------------------------------------------------------
     * 显示二级菜单
      +----------------------------------------------------------
     */
    private function show_sub_menu() {
        $big = CONTROLLER_NAME == "Index" ? "Common" : CONTROLLER_NAME;
        $cache = C('admin_sub_menu');       
        if($mo=C($big)){
          $model[$big]=array();
          foreach ($mo['sub_menu'] as $value) {
              if(!$value['hidden']){
                  foreach ($value['item'] as $k => $v) {
                    $kv=explode('/', $k);
                    $model[$big][$kv[1]]=$v;
                  }
              }
          }
          $cache=array_merge($cache,$model);
        }
        $sub_menu = array();
        if ($cache[$big]) {
            $cache = $cache[$big];
            foreach ($cache as $url => $title) {
                $url = $big == "Common" ? $url : "$big/$url";
                $sub_menu[] = array('url' => U("$url"), 'title' => $title);
            }
            return $sub_menu;
        } else {
            return $sub_menu[] = array('url' => '#', 'title' => "该菜单组不存在");
        }
    }


    /**
     * 得到数据分页
     * @param  string $modelName 模型名称
     * @param  array  $where     分页条件
     * @return array
     */
    protected function getPagination($modelName, $where, $fields, $order) {
        $service = D($modelName, 'Service');
        // 总数据行数
        $totalRows = $service->getCount($where);
        // 实例化分页
        $page = new \Think\Page($totalRows, C('PAGE_LIST_ROWS'));
        $result['show'] = $page->show();
        // 得到分页数据
        $data = $service->getPagination($where,
                                        $fields,
                                        $order,
                                        $page->firstRow,
                                        $page->listRows);
        $result['data'] = $data;
        $result['total_rows'] = $totalRows;
        return $result;
    }

    /**
     * { status : true, info: $info}
     * @param  string $info
     * @param  string $url
     * @return
     */
    protected function successReturn($info, $url) {
        $this->resultReturn(true, $info, $url);
    }

    /**
     * { status : false, info: $info}
     * @param  string $info
     * @param  string $url
     * @return
     */
    protected function errorReturn($info, $url) {
        $this->resultReturn(false, $info, $url);
    }

    /**
     * 返回带有status、info键值的json数据
     * @param  boolean $status
     * @param  string $info
     * @param  string $url
     * @return
     */
    protected function resultReturn($status, $info, $url) {
        $json['status'] = $status;
        $json['info'] = $info;
        $json['url'] = isset($url) ? $url : '';

        return $this->ajaxReturn($json);
    }
    
}