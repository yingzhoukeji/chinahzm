<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-2-26
 * Time: 下午2:16
 */
return array(
    'URL_ROUTE_RULES'=>array(
    		/*新闻*/
        'news/:id\d'    => 'news/read',
        'news/'    => 'news/index',
        'news/:cid\d'    => 'news/index',
        
        /*产品*/
        'product/:id\d'    => 'product/read',
        'product/'    => 'product/index',
        'product/:cid\d'    => 'product/index',
        
         /*单页*/
         /*单页*/
        'page/index/name/:name'    => 'page/index',
		'page/eindex/name/:name'    => 'page/eindex',
    ),
);