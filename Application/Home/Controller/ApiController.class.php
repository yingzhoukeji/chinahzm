<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-2-25
 * Time: 下午2:27
 * 去UCserver后台添加应用，应用url就是http://yoursite/Home ，
 * 应用接口文件名称设置为 index。 添加完毕后，再点开编辑，将最下面的配置参数全部复制下来。
 * 接下来你需要在 Home/Conf 下添加uc.php，将复制的代码粘贴进去
 *
 *
 * 使用uc_client接口
 *
<?php
namespace Home\Controller;
class PublicController extends \Think\Controller{
function login(){
$uc = new \Ucenter\Client\Client();
$re = $uc->uc_user_login("zhangsan", "lisi");//也可以$uc->ucUserLogin(),兼容驼峰式风格
//dump($re);
}
}
?>
通信响应事件的开发
响应事件在ApiController里添加对应的动作方法实现，由于ApiController继承至Uc类，Uc类已经实现了test()方法用于响应ucserver后台的通信检测，其他方法如synlogin需要你手动在ApiController中实现。
UC支持的响应方法有： test()：通信测试，已经实现。 deleteuser()：同步删除本地用户。 renameuser()：同步重命名本地用户名。 ……
以及其他一系列接口不一一说明，请自行参考ucenter自带的手册'API接口'一章。
需要特别注意的两点:
1.如果API接口函数中包含下划线，在ApiController创建动作时请转为驼峰风格，例如 uc_userlogin()那么对应动作方法应该是 ucUserlogin(),这是为了统一风格。
2.动作方法可以接收两个参数$get,$post分别代表从ucserver发来的请求中包含的get参数和post参数数组。
 */
namespace Home\Controller;
use Ucenter\Api\Uc;
class ApiController extends Uc{
    /**
     * 通信测试接口
     */
    function index(){
        $this->response();
    }

}