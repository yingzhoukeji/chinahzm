# -----------------------------------------------------------
# PHP-Amateur database backup files
# Blog: http://blog.51edm.org
# Type: 系统自动备份
# Description:当前SQL文件包含了表：pa_access、pa_ad、pa_admin、pa_category、pa_field、pa_images、pa_input、pa_link、pa_member、pa_message、pa_model、pa_nav、pa_news、pa_node、pa_page、pa_product、pa_role、pa_role_user、pa_tag、pa_wxhd的结构信息，表：pa_access、pa_ad、pa_admin、pa_category、pa_field、pa_images、pa_input、pa_link、pa_member、pa_message、pa_model、pa_nav、pa_news、pa_node、pa_page、pa_product、pa_role、pa_role_user、pa_tag、pa_wxhd的数据
# Time: 2015-08-05 20:53:06
# -----------------------------------------------------------
# 当前SQL卷标：#1
# -----------------------------------------------------------


# 数据库表：pa_access 结构信息
DROP TABLE IF EXISTS `pa_access`;
CREATE TABLE `pa_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限分配表' ;

# 数据库表：pa_ad 结构信息
DROP TABLE IF EXISTS `pa_ad`;
CREATE TABLE `pa_ad` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(60) NOT NULL DEFAULT '',
  `ad_link` varchar(255) NOT NULL DEFAULT '',
  `ad_img` varchar(255) NOT NULL,
  `position` char(10) NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_admin 结构信息
DROP TABLE IF EXISTS `pa_admin`;
CREATE TABLE `pa_admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT '登录账号',
  `pwd` char(32) DEFAULT NULL COMMENT '登录密码',
  `status` int(11) DEFAULT '1' COMMENT '账号状态',
  `remark` varchar(255) DEFAULT '' COMMENT '备注信息',
  `find_code` char(5) DEFAULT NULL COMMENT '找回账号验证码',
  `time` int(10) DEFAULT NULL COMMENT '开通时间',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='网站后台管理员表' ;

# 数据库表：pa_category 结构信息
DROP TABLE IF EXISTS `pa_category`;
CREATE TABLE `pa_category` (
  `cid` int(5) NOT NULL AUTO_INCREMENT,
  `pid` int(5) DEFAULT NULL COMMENT 'parentCategory上级分类',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `type` char(2) NOT NULL DEFAULT 'n',
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新闻分类表' ;

# 数据库表：pa_field 结构信息
DROP TABLE IF EXISTS `pa_field`;
CREATE TABLE `pa_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `model_id` int(11) NOT NULL COMMENT '所属模型id',
  `name` varchar(128) NOT NULL COMMENT '字段名称',
  `comment` varchar(32) NOT NULL COMMENT '字段注释',
  `type` varchar(32) NOT NULL COMMENT '字段类型',
  `length` varchar(16) NOT NULL COMMENT '字段长度',
  `value` varchar(128) NOT NULL COMMENT '字段默认值',
  `is_require` tinyint(4) DEFAULT '0' COMMENT '是否必需',
  `is_unique` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否唯一',
  `is_index` tinyint(4) DEFAULT '0' COMMENT '是否添加索引',
  `is_system` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否系统字段',
  `is_list_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT '列表中显示',
  `auto_filter` varchar(32) NOT NULL COMMENT '自动过滤函数',
  `auto_fill` varchar(32) NOT NULL COMMENT '自动完成函数',
  `fill_time` varchar(16) NOT NULL DEFAULT 'both' COMMENT '填充时机',
  `relation_model` int(11) NOT NULL COMMENT '关联的模型',
  `relation_field` varchar(128) NOT NULL COMMENT '关联的字段',
  `relation_value` varchar(128) NOT NULL COMMENT '关联显示的值',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `fk_field_model` (`model_id`),
  CONSTRAINT `pa_field_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `pa_model` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据模型字段' ;

# 数据库表：pa_images 结构信息
DROP TABLE IF EXISTS `pa_images`;
CREATE TABLE `pa_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(20) NOT NULL,
  `savename` varchar(100) NOT NULL,
  `savepath` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=511 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_input 结构信息
DROP TABLE IF EXISTS `pa_input`;
CREATE TABLE `pa_input` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `field_id` int(11) NOT NULL COMMENT '字段id',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '表单域是否显示',
  `label` varchar(32) NOT NULL COMMENT '表单域标签',
  `remark` varchar(128) NOT NULL COMMENT '表单域域',
  `type` varchar(32) NOT NULL COMMENT '表单域类型',
  `width` int(11) NOT NULL DEFAULT '20' COMMENT '表单域宽度',
  `height` int(11) NOT NULL DEFAULT '8' COMMENT '表单域高度',
  `opt_value` text NOT NULL COMMENT '表单域可选值',
  `value` varchar(128) NOT NULL COMMENT '表单域默认值',
  `editor` varchar(32) NOT NULL COMMENT '编辑器类型',
  `html` text NOT NULL COMMENT '表单域html替换',
  `show_order` int(11) DEFAULT NULL COMMENT '表单域显示顺序',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `fk_field_input` (`field_id`),
  CONSTRAINT `pa_input_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `pa_field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字段表单域信息' ;

# 数据库表：pa_link 结构信息
DROP TABLE IF EXISTS `pa_link`;
CREATE TABLE `pa_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `display` int(1) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `target` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_member 结构信息
DROP TABLE IF EXISTS `pa_member`;
CREATE TABLE `pa_member` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `weibo_uid` varchar(15) DEFAULT NULL COMMENT '对应的新浪微博uid',
  `headimgurl` varchar(200) DEFAULT NULL,
  `srcoe` int(11) DEFAULT '0',
  `openid` varchar(50) DEFAULT NULL,
  `tencent_uid` varchar(20) DEFAULT NULL COMMENT '腾讯微博UID',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `pwd` char(32) DEFAULT NULL COMMENT '密码',
  `reg_date` int(10) DEFAULT NULL,
  `reg_ip` char(15) DEFAULT NULL COMMENT '注册IP地址',
  `verify_status` int(1) DEFAULT '0' COMMENT '电子邮件验证标示 0未验证，1已验证',
  `verify_code` varchar(32) DEFAULT NULL COMMENT '电子邮件验证随机码',
  `verify_time` int(10) DEFAULT NULL COMMENT '邮箱验证时间',
  `verify_exp_time` int(10) DEFAULT NULL COMMENT '验证邮件过期时间',
  `find_fwd_code` varchar(32) DEFAULT NULL COMMENT '找回密码验证随机码',
  `find_pwd_time` int(10) DEFAULT NULL COMMENT '找回密码申请提交时间',
  `find_pwd_exp_time` int(10) DEFAULT NULL COMMENT '找回密码验证随机码过期时间',
  `avatar` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `birthday` int(10) DEFAULT NULL COMMENT '用户生日',
  `sex` int(1) DEFAULT NULL COMMENT '0女1男',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `province` varchar(100) DEFAULT NULL COMMENT '省份',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `intr` varchar(500) DEFAULT NULL COMMENT '个人介绍',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `phone` varchar(30) DEFAULT NULL COMMENT '电话',
  `fax` varchar(30) DEFAULT NULL,
  `qq` int(15) DEFAULT NULL,
  `msn` varchar(100) DEFAULT NULL,
  `login_ip` varchar(15) DEFAULT NULL COMMENT '登录ip',
  `login_time` int(10) DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=371 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='网站前台会员表' ;

# 数据库表：pa_message 结构信息
DROP TABLE IF EXISTS `pa_message`;
CREATE TABLE `pa_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `email` varchar(32) NOT NULL,
  `moblie` char(15) NOT NULL,
  `display` int(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `content` text NOT NULL,
  `headimgurl` varchar(500) DEFAULT NULL,
  `openid` varchar(100) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_model 结构信息
DROP TABLE IF EXISTS `pa_model`;
CREATE TABLE `pa_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(32) NOT NULL COMMENT '模型名称',
  `tbl_name` varchar(32) NOT NULL COMMENT '数据表名称',
  `menu_name` varchar(32) NOT NULL COMMENT '菜单名称',
  `is_inner` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为内部表',
  `has_pk` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否包含主键',
  `tbl_engine` varchar(16) NOT NULL DEFAULT 'InnoDB' COMMENT '引擎类型',
  `description` text NOT NULL COMMENT '模型描述',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据模型信息' ;

# 数据库表：pa_nav 结构信息
DROP TABLE IF EXISTS `pa_nav`;
CREATE TABLE `pa_nav` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL,
  `nav_name` varchar(255) NOT NULL,
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `guide` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `link` varchar(225) NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn' COMMENT '语言',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `target` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_news 结构信息
DROP TABLE IF EXISTS `pa_news`;
CREATE TABLE `pa_news` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `cid` smallint(3) DEFAULT NULL COMMENT '所在分类',
  `title` varchar(200) DEFAULT NULL COMMENT '新闻标题',
  `keywords` varchar(50) DEFAULT NULL COMMENT '文章关键字',
  `description` mediumtext COMMENT '文章描述',
  `status` tinyint(1) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL COMMENT '文章摘要',
  `published` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `content` text,
  `click` int(11) NOT NULL DEFAULT '0',
  `aid` smallint(3) DEFAULT NULL COMMENT '发布者UID',
  `is_recommend` int(1) NOT NULL DEFAULT '0',
  `image_id` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='新闻表' ;

# 数据库表：pa_node 结构信息
DROP TABLE IF EXISTS `pa_node`;
CREATE TABLE `pa_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='权限节点表' ;

# 数据库表：pa_page 结构信息
DROP TABLE IF EXISTS `pa_page`;
CREATE TABLE `pa_page` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `page_name` varchar(150) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `display` int(1) NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_product 结构信息
DROP TABLE IF EXISTS `pa_product`;
CREATE TABLE `pa_product` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `cid` smallint(3) DEFAULT NULL COMMENT '所在分类',
  `title` varchar(200) DEFAULT NULL COMMENT '产品标题',
  `price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `psize` varchar(32) NOT NULL,
  `image_id` varchar(255) NOT NULL COMMENT '图片',
  `keywords` varchar(200) DEFAULT NULL COMMENT '产品关键字',
  `description` mediumtext COMMENT '产品描述',
  `status` tinyint(1) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL COMMENT '产品摘要',
  `published` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `content` text,
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  `aid` smallint(3) DEFAULT NULL COMMENT '发布者UID',
  `click` int(11) NOT NULL DEFAULT '0',
  `is_recommend` int(1) NOT NULL DEFAULT '0',
  `wap_display` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=452 DEFAULT CHARSET=utf8 COMMENT='产品表' ;

# 数据库表：pa_role 结构信息
DROP TABLE IF EXISTS `pa_role`;
CREATE TABLE `pa_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='权限角色表' ;

# 数据库表：pa_role_user 结构信息
DROP TABLE IF EXISTS `pa_role_user`;
CREATE TABLE `pa_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色表' ;

# 数据库表：pa_tag 结构信息
DROP TABLE IF EXISTS `pa_tag`;
CREATE TABLE `pa_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `unique_id` char(20) NOT NULL,
  `content` text NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_wxhd 结构信息
DROP TABLE IF EXISTS `pa_wxhd`;
CREATE TABLE `pa_wxhd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `endtime` int(10) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `srcoe` int(11) DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `published` int(10) DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;



# 数据库表：pa_access 数据信息
INSERT INTO `pa_access` VALUES ('2','8','3','14','');
INSERT INTO `pa_access` VALUES ('2','14','2','1','');
INSERT INTO `pa_access` VALUES ('2','10','3','4','');
INSERT INTO `pa_access` VALUES ('2','4','2','1','');
INSERT INTO `pa_access` VALUES ('2','7','3','3','');
INSERT INTO `pa_access` VALUES ('2','3','2','1','');
INSERT INTO `pa_access` VALUES ('2','6','3','2','');
INSERT INTO `pa_access` VALUES ('2','5','3','2','');
INSERT INTO `pa_access` VALUES ('2','2','2','1','');
INSERT INTO `pa_access` VALUES ('2','1','1','0','');
INSERT INTO `pa_access` VALUES ('3','14','2','1','');
INSERT INTO `pa_access` VALUES ('3','13','3','4','');
INSERT INTO `pa_access` VALUES ('3','12','3','4','');
INSERT INTO `pa_access` VALUES ('3','11','3','4','');
INSERT INTO `pa_access` VALUES ('3','10','3','4','');
INSERT INTO `pa_access` VALUES ('3','4','2','1','');
INSERT INTO `pa_access` VALUES ('3','9','3','3','');
INSERT INTO `pa_access` VALUES ('3','8','3','3','');
INSERT INTO `pa_access` VALUES ('3','7','3','3','');
INSERT INTO `pa_access` VALUES ('3','3','2','1','');
INSERT INTO `pa_access` VALUES ('3','6','3','2','');
INSERT INTO `pa_access` VALUES ('3','5','3','2','');
INSERT INTO `pa_access` VALUES ('3','2','2','1','');
INSERT INTO `pa_access` VALUES ('3','1','1','0','');
INSERT INTO `pa_access` VALUES ('4','7','3','3','');
INSERT INTO `pa_access` VALUES ('4','3','2','1','');
INSERT INTO `pa_access` VALUES ('4','6','3','2','');
INSERT INTO `pa_access` VALUES ('4','5','3','2','');
INSERT INTO `pa_access` VALUES ('4','2','2','1','');
INSERT INTO `pa_access` VALUES ('4','1','1','0','');
INSERT INTO `pa_access` VALUES ('2','9','3','14','');
INSERT INTO `pa_access` VALUES ('2','15','3','14','');
INSERT INTO `pa_access` VALUES ('2','16','3','14','');
INSERT INTO `pa_access` VALUES ('2','17','3','14','');
INSERT INTO `pa_access` VALUES ('2','18','3','14','');
INSERT INTO `pa_access` VALUES ('2','19','3','14','');
INSERT INTO `pa_access` VALUES ('2','20','3','14','');
INSERT INTO `pa_access` VALUES ('2','21','3','14','');
INSERT INTO `pa_access` VALUES ('2','22','3','14','');
INSERT INTO `pa_access` VALUES ('2','23','3','14','');
INSERT INTO `pa_access` VALUES ('2','24','3','14','');
INSERT INTO `pa_access` VALUES ('2','25','3','14','');
INSERT INTO `pa_access` VALUES ('2','26','2','1','');
INSERT INTO `pa_access` VALUES ('2','27','3','26','');
INSERT INTO `pa_access` VALUES ('2','28','3','26','');
INSERT INTO `pa_access` VALUES ('2','29','3','26','');
INSERT INTO `pa_access` VALUES ('2','30','3','26','');
INSERT INTO `pa_access` VALUES ('2','31','3','26','');


# 数据库表：pa_ad 数据信息
INSERT INTO `pa_ad` VALUES ('23','首页1','http://www.2345.com/?kconist','531e85f90bcc1.png','index','10','zh-cn');
INSERT INTO `pa_ad` VALUES ('24','首页2','http://www.2345.com/?kconist','531e88216e887.png','index','9','zh-cn');
INSERT INTO `pa_ad` VALUES ('25','首页3','http://www.2345.com/?kconist','531e88325b1c2.png','index','8','zh-cn');


# 数据库表：pa_admin 数据信息
INSERT INTO `pa_admin` VALUES ('1','超级管理员','hylxinlang@sina.cn','5bc94f7298d654a5afec588df6f52018','1','我是超级管理员 哈哈~~','','1436535143');


# 数据库表：pa_category 数据信息
INSERT INTO `pa_category` VALUES ('1','0','大森动态','n','zh-cn');
INSERT INTO `pa_category` VALUES ('2','0','专题活动','n','zh-cn');
INSERT INTO `pa_category` VALUES ('4','0','展会信息','n','zh-cn');
INSERT INTO `pa_category` VALUES ('5','0','缝纫知识','n','zh-cn');
INSERT INTO `pa_category` VALUES ('3','0','Dynamic','n','en-us');
INSERT INTO `pa_category` VALUES ('52','0','电脑平缝机系列','p','zh-cn');
INSERT INTO `pa_category` VALUES ('55','0','平缝机系列','p','zh-cn');
INSERT INTO `pa_category` VALUES ('54','53','技术前沿','n','zh-cn');
INSERT INTO `pa_category` VALUES ('56','0','双针机','p','zh-cn');
INSERT INTO `pa_category` VALUES ('57','0','包缝机系列','p','zh-cn');
INSERT INTO `pa_category` VALUES ('58','0','绷缝机系列','p','zh-cn');
INSERT INTO `pa_category` VALUES ('59','0','特种机、花样机','p','zh-cn');
INSERT INTO `pa_category` VALUES ('60','0','绣花机系列','p','zh-cn');
INSERT INTO `pa_category` VALUES ('61','0','多针机','p','zh-cn');
INSERT INTO `pa_category` VALUES ('62','0','节能电机电控','p','zh-cn');
INSERT INTO `pa_category` VALUES ('63','0','曲折缝','p','zh-cn');
INSERT INTO `pa_category` VALUES ('64','0','曲腕机','p','zh-cn');
INSERT INTO `pa_category` VALUES ('65','0','削皮机','p','zh-cn');
INSERT INTO `pa_category` VALUES ('66','0','缝包机','p','zh-cn');
INSERT INTO `pa_category` VALUES ('67','0','高头机','p','zh-cn');
INSERT INTO `pa_category` VALUES ('68','0','压画机','p','zh-cn');
INSERT INTO `pa_category` VALUES ('69','0','激光机','p','zh-cn');
INSERT INTO `pa_category` VALUES ('70','0','熨斗','p','zh-cn');
INSERT INTO `pa_category` VALUES ('71','0','断布机、裁剪机','p','zh-cn');
INSERT INTO `pa_category` VALUES ('72','0','分线机','p','zh-cn');
INSERT INTO `pa_category` VALUES ('73','0','地毯包边机','p','zh-cn');
INSERT INTO `pa_category` VALUES ('74','0','全自动模板缝纫机','p','zh-cn');
INSERT INTO `pa_category` VALUES ('108','0','Bag closer machine','p','en-us');
INSERT INTO `pa_category` VALUES ('107','0','Leather skiving machine','p','en-us');
INSERT INTO `pa_category` VALUES ('106','0','Fee-off-the-arm chainstitch machine','p','en-us');
INSERT INTO `pa_category` VALUES ('105','0','Zigzag sewing machine','p','en-us');
INSERT INTO `pa_category` VALUES ('104','0','Servo motor system','p','en-us');
INSERT INTO `pa_category` VALUES ('103','0','Mulit-needle sewing machine','p','en-us');
INSERT INTO `pa_category` VALUES ('102','0','Embroidery machine','p','en-us');
INSERT INTO `pa_category` VALUES ('101','0','Special/synchronized sewing machine','p','en-us');
INSERT INTO `pa_category` VALUES ('100','0','Interlock machine','p','en-us');
INSERT INTO `pa_category` VALUES ('99','0','Overlock sewing machine','p','en-us');
INSERT INTO `pa_category` VALUES ('98','0','Double needle sewing machine','p','en-us');
INSERT INTO `pa_category` VALUES ('97','0','Lockstitch sewing machine','p','en-us');
INSERT INTO `pa_category` VALUES ('96','0','Computerised lockstitch sewing machine','p','en-us');
INSERT INTO `pa_category` VALUES ('109','0','Postbed machine','p','en-us');
INSERT INTO `pa_category` VALUES ('110','0','Heat transfer machine','p','en-us');
INSERT INTO `pa_category` VALUES ('111','0','Laser cutting machine','p','en-us');
INSERT INTO `pa_category` VALUES ('112','0','Iron','p','en-us');
INSERT INTO `pa_category` VALUES ('113','0','Thread distributor','p','en-us');
INSERT INTO `pa_category` VALUES ('114','0','Cutting machine','p','en-us');
INSERT INTO `pa_category` VALUES ('115','0','Blanket overedging sewing machine','p','en-us');
INSERT INTO `pa_category` VALUES ('116','0','Automatic template sewing machine','p','en-us');
INSERT INTO `pa_category` VALUES ('117','0','Машина швейная компьютера','p','ru');
INSERT INTO `pa_category` VALUES ('118','0','швейная машина','p','ru');
INSERT INTO `pa_category` VALUES ('119','0','Двухместный машина иглы','p','ru');
INSERT INTO `pa_category` VALUES ('120','0','Оверлоки Швейные машины','p','ru');
INSERT INTO `pa_category` VALUES ('121','0','Estire máquina де Козер','p','ru');
INSERT INTO `pa_category` VALUES ('122','0','Специальные машины','p','ru');
INSERT INTO `pa_category` VALUES ('123','0','Вышивка машины','p','ru');
INSERT INTO `pa_category` VALUES ('124','0','Multi-игла машины','p','ru');
INSERT INTO `pa_category` VALUES ('125','0','Электрическое управление','p','ru');
INSERT INTO `pa_category` VALUES ('126','0','зигзага Козер','p','ru');
INSERT INTO `pa_category` VALUES ('127','0','Цюй запястье машины','p','ru');
INSERT INTO `pa_category` VALUES ('128','0','Пилинг машины','p','ru');
INSERT INTO `pa_category` VALUES ('129','0','Совместный устав','p','ru');
INSERT INTO `pa_category` VALUES ('130','0','Высокая головка машины','p','ru');
INSERT INTO `pa_category` VALUES ('131','0','Машина давления картину','p','ru');
INSERT INTO `pa_category` VALUES ('132','0','Лазерные машины','p','ru');
INSERT INTO `pa_category` VALUES ('133','0','железо','p','ru');
INSERT INTO `pa_category` VALUES ('134','0','автомат для резки','p','ru');
INSERT INTO `pa_category` VALUES ('135','0','Sub-лайн машины','p','ru');
INSERT INTO `pa_category` VALUES ('136','0','Ковры окантовку машины','p','ru');
INSERT INTO `pa_category` VALUES ('137','0','Por subespecie','p','spain');
INSERT INTO `pa_category` VALUES ('138','0','pespunte máquina de coser','p','spain');
INSERT INTO `pa_category` VALUES ('139','0','Máquina de coser overlock','p','spain');
INSERT INTO `pa_category` VALUES ('140','0','Estire máquina de coser','p','spain');
INSERT INTO `pa_category` VALUES ('141','0','Máquina especial, máquina sincronizada','p','spain');
INSERT INTO `pa_category` VALUES ('142','0','Multi-aguja de la máquina','p','spain');
INSERT INTO `pa_category` VALUES ('143','0','zigzag coser','p','spain');
INSERT INTO `pa_category` VALUES ('144','0','Máquina de corte, máquina de corte','p','spain');
INSERT INTO `pa_category` VALUES ('145','0','hierro','p','spain');
INSERT INTO `pa_category` VALUES ('146','0','Laser máquina','p','spain');
INSERT INTO `pa_category` VALUES ('147','0','Sub-línea de la máquina','p','spain');
INSERT INTO `pa_category` VALUES ('148','0','máquina de bordar','p','spain');
INSERT INTO `pa_category` VALUES ('149','0','Qu máquina muñeca','p','spain');
INSERT INTO `pa_category` VALUES ('150','0','Alfombra Canteadora','p','spain');
INSERT INTO `pa_category` VALUES ('151','0','Computer máquina de coser','p','spain');
INSERT INTO `pa_category` VALUES ('152','0','carta conjunta','p','spain');
INSERT INTO `pa_category` VALUES ('153','0','High-cabeza de la máquina','p','spain');
INSERT INTO `pa_category` VALUES ('154','0','máquina de doble aguja','p','spain');
INSERT INTO `pa_category` VALUES ('155','0','Peeling máquina','p','spain');
INSERT INTO `pa_category` VALUES ('156','0','Presión máquina de pintar','p','spain');
INSERT INTO `pa_category` VALUES ('157','0','Ahorro de energía de control eléctrico','p','spain');
INSERT INTO `pa_category` VALUES ('158','0','Special events','n','en-us');
INSERT INTO `pa_category` VALUES ('159','0','Exhibition','n','en-us');
INSERT INTO `pa_category` VALUES ('160','0','Sewing knowledge','n','en-us');
INSERT INTO `pa_category` VALUES ('161','0','Большой  Сен  динамический ','n','ru');
INSERT INTO `pa_category` VALUES ('162','0',' Специальные мероприятия ','n','ru');
INSERT INTO `pa_category` VALUES ('163','0','выставка информации ','n','ru');
INSERT INTO `pa_category` VALUES ('164','0','швейная  знаний ','n','ru');
INSERT INTO `pa_category` VALUES ('165','0','La gran dinámica de Sen','n','spain');
INSERT INTO `pa_category` VALUES ('166','0','El tema de la actividad','n','spain');
INSERT INTO `pa_category` VALUES ('167','0','La exposición de la información','n','spain');
INSERT INTO `pa_category` VALUES ('168','0','De conocimientos','n','spain');


# 数据库表：pa_field 数据信息


# 数据库表：pa_images 数据信息
INSERT INTO `pa_images` VALUES ('68','product','DS-0302.jpg','/Uploads/image/product/20150712/DS-0302.jpg','1436609177');
INSERT INTO `pa_images` VALUES ('69','product','DS-111QG.jpg','/Uploads/image/product/20150712/DS-111QG.jpg','1436609183');
INSERT INTO `pa_images` VALUES ('70','product','DS-5550-Grey.jpg','/Uploads/image/product/20150712/DS-5550-Grey.jpg','1436609186');
INSERT INTO `pa_images` VALUES ('71','product','DS-5550.jpg','/Uploads/image/product/20150712/DS-5550.jpg','1436609189');
INSERT INTO `pa_images` VALUES ('72','product','DS-6-28.jpg','/Uploads/image/product/20150712/DS-6-28.jpg','1436609195');
INSERT INTO `pa_images` VALUES ('73','product','DS-6150QG.jpg','/Uploads/image/product/20150712/DS-6150QG.jpg','1436609199');
INSERT INTO `pa_images` VALUES ('74','product','DS-6202.jpg','/Uploads/image/product/20150712/DS-6202.jpg','1436609205');
INSERT INTO `pa_images` VALUES ('75','product','DS-8500.jpg','/Uploads/image/product/20150712/DS-8500.jpg','1436609208');
INSERT INTO `pa_images` VALUES ('76','product','DS-8600-J.jpg','/Uploads/image/product/20150712/DS-8600-J.jpg','1436609211');
INSERT INTO `pa_images` VALUES ('77','product','DS-8700.jpg','/Uploads/image/product/20150712/DS-8700.jpg','1436609216');
INSERT INTO `pa_images` VALUES ('78','product','DS-8800.jpg','/Uploads/image/product/20150712/DS-8800.jpg','1436609219');
INSERT INTO `pa_images` VALUES ('79','product','DS-8900.jpg','/Uploads/image/product/20150712/DS-8900.jpg','1436609227');
INSERT INTO `pa_images` VALUES ('80','product','DS-0058-3.jpg','/Uploads/image/product/20150712/DS-0058-3.jpg','1436616817');
INSERT INTO `pa_images` VALUES ('81','product','DS-0058.jpg','/Uploads/image/product/20150712/DS-0058.jpg','1436616822');
INSERT INTO `pa_images` VALUES ('82','product','DS-8420.jpg','/Uploads/image/product/20150712/DS-8420.jpg','1436616825');
INSERT INTO `pa_images` VALUES ('83','product','DS-8450.jpg','/Uploads/image/product/20150712/DS-8450.jpg','1436616830');
INSERT INTO `pa_images` VALUES ('84','product','DS-900T-4AT.jpg','/Uploads/image/product/20150712/DS-900T-4AT.jpg','1436616914');
INSERT INTO `pa_images` VALUES ('85','product','DS-900-4S.jpg','/Uploads/image/product/20150712/DS-900-4S.jpg','1436616916');
INSERT INTO `pa_images` VALUES ('144','product','DS-900-4BK.jpg','/Uploads/image/product/20150712/DS-900-4BK.jpg','1436617692');
INSERT INTO `pa_images` VALUES ('87','product','DS-900-4.jpg','/Uploads/image/product/20150712/DS-900-4.jpg','1436616920');
INSERT INTO `pa_images` VALUES ('88','product','DS-5200-4AT.jpg','/Uploads/image/product/20150712/DS-5200-4AT.jpg','1436616921');
INSERT INTO `pa_images` VALUES ('89','product','DS-800-4.jpg','/Uploads/image/product/20150712/DS-800-4.jpg','1436616922');
INSERT INTO `pa_images` VALUES ('90','product','DS-900-4.jpg','/Uploads/image/product/20150712/DS-900-4.jpg','1436616923');
INSERT INTO `pa_images` VALUES ('510','product','900-4AT-EUT.jpg','/Uploads/image/product/20150712/900-4AT-EUT.jpg','1437334347');
INSERT INTO `pa_images` VALUES ('92','product','MX5200-4.jpg','/Uploads/image/product/20150712/MX5200-4.jpg','1436616927');
INSERT INTO `pa_images` VALUES ('111','product','DS-700-3-17PK-SP.jpg','/Uploads/image/product/20150712/DS-700-3-17PK-SP.jpg','1436617266');
INSERT INTO `pa_images` VALUES ('110','product','DS-700-3.jpg','/Uploads/image/product/20150712/DS-700-3.jpg','1436617248');
INSERT INTO `pa_images` VALUES ('108','product','DS-700-4-BK.jpg','/Uploads/image/product/20150712/DS-700-4-BK.jpg','1436617226');
INSERT INTO `pa_images` VALUES ('96','product','DS-800-4AT-EUT.jpg','/Uploads/image/product/20150712/DS-800-4AT-EUT.jpg','1436616950');
INSERT INTO `pa_images` VALUES ('97','product','DS-787-33AC.jpg','/Uploads/image/product/20150712/DS-787-33AC.jpg','1436616951');
INSERT INTO `pa_images` VALUES ('98','product','DS-787-01CB-EUT.jpg','/Uploads/image/product/20150712/DS-787-01CB-EUT.jpg','1436616953');
INSERT INTO `pa_images` VALUES ('99','product','DS-1500.jpg','/Uploads/image/product/20150712/DS-1500.jpg','1436616961');
INSERT INTO `pa_images` VALUES ('100','product','DS-500-01CB-EUT.jpg','/Uploads/image/product/20150712/DS-500-01CB-EUT.jpg','1436616973');
INSERT INTO `pa_images` VALUES ('101','product','500-01CB-AT.jpg','/Uploads/image/product/20150712/500-01CB-AT.jpg','1436616987');
INSERT INTO `pa_images` VALUES ('102','product','DS-500-01CB.jpg','/Uploads/image/product/20150712/DS-500-01CB.jpg','1436616992');
INSERT INTO `pa_images` VALUES ('103','product','DS-500-02BB.jpg','/Uploads/image/product/20150712/DS-500-02BB.jpg','1436617063');
INSERT INTO `pa_images` VALUES ('104','product','DS-500-04CB.jpg','/Uploads/image/product/20150712/DS-500-04CB.jpg','1436617065');
INSERT INTO `pa_images` VALUES ('105','product','DS-500-05BB.jpg','/Uploads/image/product/20150712/DS-500-05BB.jpg','1436617069');
INSERT INTO `pa_images` VALUES ('106','product','DS-500-10SZ.jpg','/Uploads/image/product/20150712/DS-500-10SZ.jpg','1436617075');
INSERT INTO `pa_images` VALUES ('107','product','DS-600-0CB-EUT.jpg','/Uploads/image/product/20150712/DS-600-0CB-EUT.jpg','1436617079');
INSERT INTO `pa_images` VALUES ('112','product','DS-700-4.jpg','/Uploads/image/product/20150712/DS-700-4.jpg','1436617502');
INSERT INTO `pa_images` VALUES ('113','product','DS-700-4-AT.jpg','/Uploads/image/product/20150712/DS-700-4-AT.jpg','1436617503');
INSERT INTO `pa_images` VALUES ('114','product','DS-700-5.jpg','/Uploads/image/product/20150712/DS-700-5.jpg','1436617504');
INSERT INTO `pa_images` VALUES ('115','product','DS-737F.jpg','/Uploads/image/product/20150712/DS-737F.jpg','1436617504');
INSERT INTO `pa_images` VALUES ('116','product','DS-737FS.jpg','/Uploads/image/product/20150712/DS-737FS.jpg','1436617505');
INSERT INTO `pa_images` VALUES ('117','product','DS-747F-AT.jpg','/Uploads/image/product/20150712/DS-747F-AT.jpg','1436617506');
INSERT INTO `pa_images` VALUES ('118','product','DS-747F-BK.jpg','/Uploads/image/product/20150712/DS-747F-BK.jpg','1436617507');
INSERT INTO `pa_images` VALUES ('119','product','DS-747F-PK-SP.jpg','/Uploads/image/product/20150712/DS-747F-PK-SP.jpg','1436617508');
INSERT INTO `pa_images` VALUES ('120','product','DS-747F.jpg','/Uploads/image/product/20150712/DS-747F.jpg','1436617509');
INSERT INTO `pa_images` VALUES ('121','product','DS-9816.jpg','/Uploads/image/product/20150712/DS-9816.jpg','1436617524');
INSERT INTO `pa_images` VALUES ('122','product','DS-373AT.jpg','/Uploads/image/product/20150712/DS-373AT.jpg','1436617524');
INSERT INTO `pa_images` VALUES ('123','product','DS-1377.jpg','/Uploads/image/product/20150712/DS-1377.jpg','1436617525');
INSERT INTO `pa_images` VALUES ('124','product','DS-1790.jpg','/Uploads/image/product/20150712/DS-1790.jpg','1436617526');
INSERT INTO `pa_images` VALUES ('125','product','DS-1850.jpg','/Uploads/image/product/20150712/DS-1850.jpg','1436617526');
INSERT INTO `pa_images` VALUES ('126','product','DS-1900ASS.jpg','/Uploads/image/product/20150712/DS-1900ASS.jpg','1436617527');
INSERT INTO `pa_images` VALUES ('127','product','DS-1903A.jpg','/Uploads/image/product/20150712/DS-1903A.jpg','1436617528');
INSERT INTO `pa_images` VALUES ('128','product','DS-210D.jpg','/Uploads/image/product/20150712/DS-210D.jpg','1436617529');
INSERT INTO `pa_images` VALUES ('129','product','DS-2516.jpg','/Uploads/image/product/20150712/DS-2516.jpg','1436617530');
INSERT INTO `pa_images` VALUES ('145','product','DS-373.jpg','/Uploads/image/product/20150712/DS-373.jpg','1436617701');
INSERT INTO `pa_images` VALUES ('131','product','DS-781.jpg','/Uploads/image/product/20150712/DS-781.jpg','1436617531');
INSERT INTO `pa_images` VALUES ('132','product','DS-808.jpg','/Uploads/image/product/20150712/DS-808.jpg','1436617533');
INSERT INTO `pa_images` VALUES ('133','product','DS-1201.jpg','/Uploads/image/product/20150712/DS-1201.jpg','1436617544');
INSERT INTO `pa_images` VALUES ('134','product','DS-1204.jpg','/Uploads/image/product/20150712/DS-1204.jpg','1436617546');
INSERT INTO `pa_images` VALUES ('135','product','DS-1208.jpg','/Uploads/image/product/20150712/DS-1208.jpg','1436617548');
INSERT INTO `pa_images` VALUES ('136','product','DS-1212.jpg','/Uploads/image/product/20150712/DS-1212.jpg','1436617549');
INSERT INTO `pa_images` VALUES ('137','product','DS-600-01CB-AT.jpg','/Uploads/image/product/20150712/DS-600-01CB-AT.jpg','1436617607');
INSERT INTO `pa_images` VALUES ('138','product','DS-600-01CB-RP.jpg','/Uploads/image/product/20150712/DS-600-01CB-RP.jpg','1436617608');
INSERT INTO `pa_images` VALUES ('139','product','DS-600-02BB.jpg','/Uploads/image/product/20150712/DS-600-02BB.jpg','1436617610');
INSERT INTO `pa_images` VALUES ('140','product','DS-600-05GB.jpg','/Uploads/image/product/20150712/DS-600-05GB.jpg','1436617611');
INSERT INTO `pa_images` VALUES ('141','product','DS-600-35AC.jpg','/Uploads/image/product/20150712/DS-600-35AC.jpg','1436617612');
INSERT INTO `pa_images` VALUES ('142','product','DS-62G-01MR-D-AT-AW.jpg','/Uploads/image/product/20150712/DS-62G-01MR-D-AT-AW.jpg','1436617613');
INSERT INTO `pa_images` VALUES ('143','product','DS-720-356T.jpg','/Uploads/image/product/20150712/DS-720-356T.jpg','1436617614');
INSERT INTO `pa_images` VALUES ('146','product','DS-9820.jpg','/Uploads/image/product/20150712/DS-9820.jpg','1436617772');
INSERT INTO `pa_images` VALUES ('147','product','DS-008VC.jpg','/Uploads/image/product/20150712/DS-008VC.jpg','1436617818');
INSERT INTO `pa_images` VALUES ('148','product','DS-1302.jpg','/Uploads/image/product/20150712/DS-1302.jpg','1436617819');
INSERT INTO `pa_images` VALUES ('149','product','DS-1433PSM.jpg','/Uploads/image/product/20150712/DS-1433PSM.jpg','1436617820');
INSERT INTO `pa_images` VALUES ('150','product','DS-1508P.jpg','/Uploads/image/product/20150712/DS-1508P.jpg','1436617822');
INSERT INTO `pa_images` VALUES ('151','product','DS-2000C.jpg','/Uploads/image/product/20150712/DS-2000C.jpg','1436617823');
INSERT INTO `pa_images` VALUES ('152','product','5800.jpg','/Uploads/image/product/20150712/5800.jpg','1436617835');
INSERT INTO `pa_images` VALUES ('153','product','700.jpg','/Uploads/image/product/20150712/700.jpg','1436617839');
INSERT INTO `pa_images` VALUES ('154','product','747.jpg','/Uploads/image/product/20150712/747.jpg','1436617842');
INSERT INTO `pa_images` VALUES ('155','product','800.jpg','/Uploads/image/product/20150712/800.jpg','1436617844');
INSERT INTO `pa_images` VALUES ('156','product','988.jpg','/Uploads/image/product/20150712/988.jpg','1436617851');
INSERT INTO `pa_images` VALUES ('157','product','DS-28.jpg','/Uploads/image/product/20150712/DS-28.jpg','1436617854');
INSERT INTO `pa_images` VALUES ('158','product','MX6125.jpg','/Uploads/image/product/20150712/MX6125.jpg','1436617857');
INSERT INTO `pa_images` VALUES ('159','product','DS-20U23D.jpg','/Uploads/image/product/20150712/DS-20U23D.jpg','1436617873');
INSERT INTO `pa_images` VALUES ('160','product','DS-20U43.jpg','/Uploads/image/product/20150712/DS-20U43.jpg','1436617879');
INSERT INTO `pa_images` VALUES ('161','product','DS-2284.jpg','/Uploads/image/product/20150712/DS-2284.jpg','1436617884');
INSERT INTO `pa_images` VALUES ('162','product','DS927-928.jpg','/Uploads/image/product/20150712/DS927-928.jpg','1436617892');
INSERT INTO `pa_images` VALUES ('163','product','DS-801.jpg','/Uploads/image/product/20150712/DS-801.jpg','1436617901');
INSERT INTO `pa_images` VALUES ('164','product','DS-26-1A.jpg','/Uploads/image/product/20150712/DS-26-1A.jpg','1436617927');
INSERT INTO `pa_images` VALUES ('165','product','DS-810.jpg','/Uploads/image/product/20150712/DS-810.jpg','1436617936');
INSERT INTO `pa_images` VALUES ('166','product','DS-32-62-82.jpg','/Uploads/image/product/20150712/DS-32-62-82.jpg','1436617946');
INSERT INTO `pa_images` VALUES ('167','product','DS-1380.jpg','/Uploads/image/product/20150712/DS-1380.jpg','1436617954');
INSERT INTO `pa_images` VALUES ('168','product','DS-9060-8060-1080-1060.jpg','/Uploads/image/product/20150712/DS-9060-8060-1080-1060.jpg','1436617958');
INSERT INTO `pa_images` VALUES ('169','product','DS-310.jpg','/Uploads/image/product/20150712/DS-310.jpg','1436617967');
INSERT INTO `pa_images` VALUES ('170','product','DS-520.jpg','/Uploads/image/product/20150712/DS-520.jpg','1436617969');
INSERT INTO `pa_images` VALUES ('171','product','DS-6PC-1.jpg','/Uploads/image/product/20150712/DS-6PC-1.jpg','1436617972');
INSERT INTO `pa_images` VALUES ('172','product','DS-94A.jpg','/Uploads/image/product/20150712/DS-94A.jpg','1436617976');
INSERT INTO `pa_images` VALUES ('173','product','yundouxue.jpg','/Uploads/image/product/20150712/yundouxue.jpg','1436617978');
INSERT INTO `pa_images` VALUES ('174','product','DS-RC-100-110.jpg','/Uploads/image/product/20150712/DS-RC-100-110.jpg','1436617991');
INSERT INTO `pa_images` VALUES ('175','product','DS-CZD-3-103.jpg','/Uploads/image/product/20150712/DS-CZD-3-103.jpg','1436617993');
INSERT INTO `pa_images` VALUES ('176','product','DS-CZD-3-103.jpg','/Uploads/image/product/20150712/DS-CZD-3-103.jpg','1436617994');
INSERT INTO `pa_images` VALUES ('177','product','DS-911.jpg','/Uploads/image/product/20150712/DS-911.jpg','1436617995');
INSERT INTO `pa_images` VALUES ('178','product','DS-888.jpg','/Uploads/image/product/20150712/DS-888.jpg','1436617996');
INSERT INTO `pa_images` VALUES ('179','product','DS-10S.jpg','/Uploads/image/product/20150712/DS-10S.jpg','1436618007');
INSERT INTO `pa_images` VALUES ('180','product','DS-20S-40C.jpg','/Uploads/image/product/20150712/DS-20S-40C.jpg','1436618008');
INSERT INTO `pa_images` VALUES ('181','product','DS-20-2B.jpg','/Uploads/image/product/20150712/DS-20-2B.jpg','1436618021');
INSERT INTO `pa_images` VALUES ('182','product','2014102482059349.jpg','/Uploads/image/product/20150712/2014102482059349.jpg','1436618025');
INSERT INTO `pa_images` VALUES ('183','product','DS-9630D-3.jpg','/Uploads/image/product/20150712/DS-9630D-3.jpg','1436620109');
INSERT INTO `pa_images` VALUES ('184','product','DS-9620QGD-3.jpg','/Uploads/image/product/20150712/DS-9620QGD-3.jpg','1436620109');
INSERT INTO `pa_images` VALUES ('185','product','DS-9610QGD-3.jpg','/Uploads/image/product/20150712/DS-9610QGD-3.jpg','1436620110');
INSERT INTO `pa_images` VALUES ('186','product','DS-9600QGD-3.jpg','/Uploads/image/product/20150712/DS-9600QGD-3.jpg','1436620112');
INSERT INTO `pa_images` VALUES ('187','product','DS-7200D-3.jpg','/Uploads/image/product/20150712/DS-7200D-3.jpg','1436620114');
INSERT INTO `pa_images` VALUES ('188','product','2014102482059349.jpg','/Uploads/image/product/20150712/2014102482059349.jpg','1436620286');
INSERT INTO `pa_images` VALUES ('189','product','DS-9630D-3.jpg','/Uploads/image/product/20150712/DS-9630D-3.jpg','1436622585');
INSERT INTO `pa_images` VALUES ('190','product','DS-9620QGD-3.jpg','/Uploads/image/product/20150712/DS-9620QGD-3.jpg','1436622588');
INSERT INTO `pa_images` VALUES ('191','product','DS-9610QGD-3.jpg','/Uploads/image/product/20150712/DS-9610QGD-3.jpg','1436622591');
INSERT INTO `pa_images` VALUES ('192','product','DS-9600QGD-3.jpg','/Uploads/image/product/20150712/DS-9600QGD-3.jpg','1436622592');
INSERT INTO `pa_images` VALUES ('193','product','DS-7200D-3.jpg','/Uploads/image/product/20150712/DS-7200D-3.jpg','1436622593');
INSERT INTO `pa_images` VALUES ('194','product','DS-6202D-3.jpg','/Uploads/image/product/20150712/DS-6202D-3.jpg','1436622596');
INSERT INTO `pa_images` VALUES ('195','product','DS-0303D-5.jpg','/Uploads/image/product/20150712/DS-0303D-5.jpg','1436622600');
INSERT INTO `pa_images` VALUES ('196','product','DS-6202QGD-3.jpg','/Uploads/image/product/20150712/DS-6202QGD-3.jpg','1436622602');
INSERT INTO `pa_images` VALUES ('197','product','DS-20-2B.jpg','/Uploads/image/product/20150712/DS-20-2B.jpg','1436622751');
INSERT INTO `pa_images` VALUES ('198','product','2014102482059349.jpg','/Uploads/image/product/20150712/2014102482059349.jpg','1436622759');
INSERT INTO `pa_images` VALUES ('199','product','DS-20-2B.jpg','/Uploads/image/product/20150712/DS-20-2B.jpg','1436622907');
INSERT INTO `pa_images` VALUES ('200','product','DS-9630D-3.jpg','/Uploads/image/product/20150712/DS-9630D-3.jpg','1436622955');
INSERT INTO `pa_images` VALUES ('201','product','DS-9620QGD-3.jpg','/Uploads/image/product/20150712/DS-9620QGD-3.jpg','1436622965');
INSERT INTO `pa_images` VALUES ('202','product','DS-9610QGD-3.jpg','/Uploads/image/product/20150712/DS-9610QGD-3.jpg','1436622967');
INSERT INTO `pa_images` VALUES ('203','product','DS-9600QGD-3.jpg','/Uploads/image/product/20150712/DS-9600QGD-3.jpg','1436622969');
INSERT INTO `pa_images` VALUES ('204','product','DS-7200D-3.jpg','/Uploads/image/product/20150712/DS-7200D-3.jpg','1436622970');
INSERT INTO `pa_images` VALUES ('205','product','DS-6202D-3.jpg','/Uploads/image/product/20150712/DS-6202D-3.jpg','1436622973');
INSERT INTO `pa_images` VALUES ('206','product','DS-0303D-5.jpg','/Uploads/image/product/20150712/DS-0303D-5.jpg','1436622976');
INSERT INTO `pa_images` VALUES ('207','product','DS-6202QGD-3.jpg','/Uploads/image/product/20150712/DS-6202QGD-3.jpg','1436622978');
INSERT INTO `pa_images` VALUES ('208','product','DS-0303D-5.jpg','/Uploads/image/product/20150712/DS-0303D-5.jpg','1436622980');
INSERT INTO `pa_images` VALUES ('209','product','DS-9600QGD-3N.jpg','/Uploads/image/product/20150712/DS-9600QGD-3N.jpg','1436622987');
INSERT INTO `pa_images` VALUES ('210','product','DS-9610QGD-3.jpg','/Uploads/image/product/20150712/DS-9610QGD-3.jpg','1436622990');
INSERT INTO `pa_images` VALUES ('211','product','DS-5550.jpg','/Uploads/image/product/20150712/DS-5550.jpg','1436622993');
INSERT INTO `pa_images` VALUES ('212','product','DS-0302.jpg','/Uploads/image/product/20150712/DS-0302.jpg','1436623028');
INSERT INTO `pa_images` VALUES ('213','product','DS-111QG.jpg','/Uploads/image/product/20150712/DS-111QG.jpg','1436623030');
INSERT INTO `pa_images` VALUES ('214','product','DS-5550.jpg','/Uploads/image/product/20150712/DS-5550.jpg','1436623036');
INSERT INTO `pa_images` VALUES ('215','product','DS-6-28.jpg','/Uploads/image/product/20150712/DS-6-28.jpg','1436623041');
INSERT INTO `pa_images` VALUES ('216','product','DS-6150QG.jpg','/Uploads/image/product/20150712/DS-6150QG.jpg','1436623044');
INSERT INTO `pa_images` VALUES ('217','product','DS-6202.jpg','/Uploads/image/product/20150712/DS-6202.jpg','1436623049');
INSERT INTO `pa_images` VALUES ('218','product','DS-8500.jpg','/Uploads/image/product/20150712/DS-8500.jpg','1436623052');
INSERT INTO `pa_images` VALUES ('219','product','DS-8600-J.jpg','/Uploads/image/product/20150712/DS-8600-J.jpg','1436623055');
INSERT INTO `pa_images` VALUES ('220','product','DS-8700.jpg','/Uploads/image/product/20150712/DS-8700.jpg','1436623058');
INSERT INTO `pa_images` VALUES ('221','product','DS-8800.jpg','/Uploads/image/product/20150712/DS-8800.jpg','1436623061');
INSERT INTO `pa_images` VALUES ('222','product','DS-8900.jpg','/Uploads/image/product/20150712/DS-8900.jpg','1436623064');
INSERT INTO `pa_images` VALUES ('223','product','DS-0058-3.jpg','/Uploads/image/product/20150712/DS-0058-3.jpg','1436623077');
INSERT INTO `pa_images` VALUES ('224','product','DS-0058.jpg','/Uploads/image/product/20150712/DS-0058.jpg','1436623087');
INSERT INTO `pa_images` VALUES ('225','product','DS-8420.jpg','/Uploads/image/product/20150712/DS-8420.jpg','1436623090');
INSERT INTO `pa_images` VALUES ('226','product','DS-8450.jpg','/Uploads/image/product/20150712/DS-8450.jpg','1436623092');
INSERT INTO `pa_images` VALUES ('227','product','DS-900T-4AT.jpg','/Uploads/image/product/20150712/DS-900T-4AT.jpg','1436623112');
INSERT INTO `pa_images` VALUES ('228','product','DS-900-4S.jpg','/Uploads/image/product/20150712/DS-900-4S.jpg','1436623114');
INSERT INTO `pa_images` VALUES ('229','product','DS-900-4BK.jpg','/Uploads/image/product/20150712/DS-900-4BK.jpg','1436623118');
INSERT INTO `pa_images` VALUES ('230','product','DS-900-4.jpg','/Uploads/image/product/20150712/DS-900-4.jpg','1436623123');
INSERT INTO `pa_images` VALUES ('231','product','DS-5200-4AT.jpg','/Uploads/image/product/20150712/DS-5200-4AT.jpg','1436623127');
INSERT INTO `pa_images` VALUES ('232','product','800-4.jpg','/Uploads/image/product/20150712/800-4.jpg','1436623131');
INSERT INTO `pa_images` VALUES ('233','product','DS-900-4.jpg','/Uploads/image/product/20150712/DS-900-4.jpg','1436623139');
INSERT INTO `pa_images` VALUES ('234','product','900-4AT-EUT.jpg','/Uploads/image/product/20150712/900-4AT-EUT.jpg','1436623147');
INSERT INTO `pa_images` VALUES ('235','product','MX5200-4.jpg','/Uploads/image/product/20150712/MX5200-4.jpg','1436623151');
INSERT INTO `pa_images` VALUES ('236','product','DS-700-3-17PK-SP.jpg','/Uploads/image/product/20150712/DS-700-3-17PK-SP.jpg','1436623154');
INSERT INTO `pa_images` VALUES ('237','product','DS-700-3.jpg','/Uploads/image/product/20150712/DS-700-3.jpg','1436623163');
INSERT INTO `pa_images` VALUES ('238','product','DS-700-4-BK.jpg','/Uploads/image/product/20150712/DS-700-4-BK.jpg','1436623170');
INSERT INTO `pa_images` VALUES ('239','product','DS-800-4AT-EUT.jpg','/Uploads/image/product/20150712/DS-800-4AT-EUT.jpg','1436623191');
INSERT INTO `pa_images` VALUES ('240','product','DS-787-33AC.jpg','/Uploads/image/product/20150712/DS-787-33AC.jpg','1436623192');
INSERT INTO `pa_images` VALUES ('241','product','DS-787-01CB-EUT.jpg','/Uploads/image/product/20150712/DS-787-01CB-EUT.jpg','1436623193');
INSERT INTO `pa_images` VALUES ('242','product','DS-1500.jpg','/Uploads/image/product/20150712/DS-1500.jpg','1436623195');
INSERT INTO `pa_images` VALUES ('243','product','DS-500-01CB-AT-EUT.jpg','/Uploads/image/product/20150712/DS-500-01CB-AT-EUT.jpg','1436623199');
INSERT INTO `pa_images` VALUES ('244','product','DS-600-01CB-RP.jpg','/Uploads/image/product/20150712/DS-600-01CB-RP.jpg','1436623202');
INSERT INTO `pa_images` VALUES ('245','product','DS-500-01CB.jpg','/Uploads/image/product/20150712/DS-500-01CB.jpg','1436623206');
INSERT INTO `pa_images` VALUES ('246','product','DS-500-02BB.jpg','/Uploads/image/product/20150712/DS-500-02BB.jpg','1436623208');
INSERT INTO `pa_images` VALUES ('247','product','DS-500-04CB.jpg','/Uploads/image/product/20150712/DS-500-04CB.jpg','1436623215');
INSERT INTO `pa_images` VALUES ('248','product','DS-500-05BB.jpg','/Uploads/image/product/20150712/DS-500-05BB.jpg','1436623223');
INSERT INTO `pa_images` VALUES ('249','product','DS-600-02BB.jpg','/Uploads/image/product/20150712/DS-600-02BB.jpg','1436623228');
INSERT INTO `pa_images` VALUES ('250','product','DS-600-0CB-EUT.jpg','/Uploads/image/product/20150712/DS-600-0CB-EUT.jpg','1436623230');
INSERT INTO `pa_images` VALUES ('251','product','DS-9816.jpg','/Uploads/image/product/20150712/DS-9816.jpg','1436623244');
INSERT INTO `pa_images` VALUES ('252','product','DS-373AT.jpg','/Uploads/image/product/20150712/DS-373AT.jpg','1436623245');
INSERT INTO `pa_images` VALUES ('253','product','DS-1377.jpg','/Uploads/image/product/20150712/DS-1377.jpg','1436623246');
INSERT INTO `pa_images` VALUES ('254','product','DS-1790.jpg','/Uploads/image/product/20150712/DS-1790.jpg','1436623248');
INSERT INTO `pa_images` VALUES ('255','product','DS-1850.jpg','/Uploads/image/product/20150712/DS-1850.jpg','1436623249');
INSERT INTO `pa_images` VALUES ('256','product','DS-1900ASS.jpg','/Uploads/image/product/20150712/DS-1900ASS.jpg','1436623250');
INSERT INTO `pa_images` VALUES ('257','product','DS-1903A.jpg','/Uploads/image/product/20150712/DS-1903A.jpg','1436623251');
INSERT INTO `pa_images` VALUES ('258','product','DS-210D.jpg','/Uploads/image/product/20150712/DS-210D.jpg','1436623253');
INSERT INTO `pa_images` VALUES ('259','product','DS-2516.jpg','/Uploads/image/product/20150712/DS-2516.jpg','1436623260');
INSERT INTO `pa_images` VALUES ('260','product','DS-373.jpg','/Uploads/image/product/20150712/DS-373.jpg','1436623263');
INSERT INTO `pa_images` VALUES ('261','product','DS-781.jpg','/Uploads/image/product/20150712/DS-781.jpg','1436623267');
INSERT INTO `pa_images` VALUES ('262','product','DS-808.jpg','/Uploads/image/product/20150712/DS-808.jpg','1436623272');
INSERT INTO `pa_images` VALUES ('263','product','DS-1201.jpg','/Uploads/image/product/20150712/DS-1201.jpg','1436623281');
INSERT INTO `pa_images` VALUES ('264','product','DS-1204.jpg','/Uploads/image/product/20150712/DS-1204.jpg','1436623286');
INSERT INTO `pa_images` VALUES ('265','product','DS-1208.jpg','/Uploads/image/product/20150712/DS-1208.jpg','1436623287');
INSERT INTO `pa_images` VALUES ('266','product','DS-1212.jpg','/Uploads/image/product/20150712/DS-1212.jpg','1436623289');
INSERT INTO `pa_images` VALUES ('267','product','DS-008VC.jpg','/Uploads/image/product/20150712/DS-008VC.jpg','1436623325');
INSERT INTO `pa_images` VALUES ('268','product','DS-1302.jpg','/Uploads/image/product/20150712/DS-1302.jpg','1436623329');
INSERT INTO `pa_images` VALUES ('269','product','DS-1433PSM.jpg','/Uploads/image/product/20150712/DS-1433PSM.jpg','1436623335');
INSERT INTO `pa_images` VALUES ('270','product','DS-1508P.jpg','/Uploads/image/product/20150712/DS-1508P.jpg','1436623340');
INSERT INTO `pa_images` VALUES ('271','product','DS-2000C.jpg','/Uploads/image/product/20150712/DS-2000C.jpg','1436623343');
INSERT INTO `pa_images` VALUES ('272','product','5800.jpg','/Uploads/image/product/20150712/5800.jpg','1436623356');
INSERT INTO `pa_images` VALUES ('273','product','700.jpg','/Uploads/image/product/20150712/700.jpg','1436623362');
INSERT INTO `pa_images` VALUES ('274','product','747.jpg','/Uploads/image/product/20150712/747.jpg','1436623369');
INSERT INTO `pa_images` VALUES ('275','product','800.jpg','/Uploads/image/product/20150712/800.jpg','1436623372');
INSERT INTO `pa_images` VALUES ('276','product','988.jpg','/Uploads/image/product/20150712/988.jpg','1436623386');
INSERT INTO `pa_images` VALUES ('277','product','DS-28.jpg','/Uploads/image/product/20150712/DS-28.jpg','1436623390');
INSERT INTO `pa_images` VALUES ('278','product','MX6125.jpg','/Uploads/image/product/20150712/MX6125.jpg','1436623395');
INSERT INTO `pa_images` VALUES ('279','product','DS-20U23D.jpg','/Uploads/image/product/20150712/DS-20U23D.jpg','1436623422');
INSERT INTO `pa_images` VALUES ('280','product','DS-20U43.jpg','/Uploads/image/product/20150712/DS-20U43.jpg','1436623448');
INSERT INTO `pa_images` VALUES ('281','product','DS-2284.jpg','/Uploads/image/product/20150712/DS-2284.jpg','1436623452');
INSERT INTO `pa_images` VALUES ('282','product','DS-927.jpg','/Uploads/image/product/20150712/DS-927.jpg','1436623469');
INSERT INTO `pa_images` VALUES ('283','product','DS-801.jpg','/Uploads/image/product/20150712/DS-801.jpg','1436623509');
INSERT INTO `pa_images` VALUES ('284','product','DS-26-1A.jpg','/Uploads/image/product/20150712/DS-26-1A.jpg','1436623560');
INSERT INTO `pa_images` VALUES ('285','product','DS-810.jpg','/Uploads/image/product/20150712/DS-810.jpg','1436623607');
INSERT INTO `pa_images` VALUES ('286','product','DS-32-62-82.jpg','/Uploads/image/product/20150712/DS-32-62-82.jpg','1436623618');
INSERT INTO `pa_images` VALUES ('287','product','DS-1380.jpg','/Uploads/image/product/20150712/DS-1380.jpg','1436623627');
INSERT INTO `pa_images` VALUES ('288','product','DS-9060-8060-1080-1060.jpg','/Uploads/image/product/20150712/DS-9060-8060-1080-1060.jpg','1436623674');
INSERT INTO `pa_images` VALUES ('289','product','DS-310.jpg','/Uploads/image/product/20150712/DS-310.jpg','1436623696');
INSERT INTO `pa_images` VALUES ('290','product','DS-520.jpg','/Uploads/image/product/20150712/DS-520.jpg','1436623702');
INSERT INTO `pa_images` VALUES ('291','product','DS-6PC-1.jpg','/Uploads/image/product/20150712/DS-6PC-1.jpg','1436623709');
INSERT INTO `pa_images` VALUES ('292','product','DS-94A.jpg','/Uploads/image/product/20150712/DS-94A.jpg','1436623713');
INSERT INTO `pa_images` VALUES ('293','product','yundouxue.jpg','/Uploads/image/product/20150712/yundouxue.jpg','1436623716');
INSERT INTO `pa_images` VALUES ('294','product','DS-20S-40S.jpg','/Uploads/image/product/20150712/DS-20S-40S.jpg','1436623741');
INSERT INTO `pa_images` VALUES ('295','product','DS-10S.jpg','/Uploads/image/product/20150712/DS-10S.jpg','1436623745');
INSERT INTO `pa_images` VALUES ('296','product','DS-RC-100-110.jpg','/Uploads/image/product/20150712/DS-RC-100-110.jpg','1436623770');
INSERT INTO `pa_images` VALUES ('297','product','DS-CZD-3-103.jpg','/Uploads/image/product/20150712/DS-CZD-3-103.jpg','1436623774');
INSERT INTO `pa_images` VALUES ('298','product','DS-888.jpg','/Uploads/image/product/20150712/DS-888.jpg','1436623779');
INSERT INTO `pa_images` VALUES ('299','product','DS-911A.jpg','/Uploads/image/product/20150712/DS-911A.jpg','1436623782');
INSERT INTO `pa_images` VALUES ('300','product','DS-20-2B.jpg','/Uploads/image/product/20150712/DS-20-2B.jpg','1436623821');
INSERT INTO `pa_images` VALUES ('301','product','20140414160894309430.jpg','/Uploads/image/product/20150712/20140414160894309430.jpg','1436623855');
INSERT INTO `pa_images` VALUES ('302','product','DS-9910QGD-3.jpg','/Uploads/image/product/20150712/DS-9910QGD-3.jpg','1436623928');
INSERT INTO `pa_images` VALUES ('303','product','DS-5550.jpg','/Uploads/image/product/20150712/DS-5550.jpg','1436623931');
INSERT INTO `pa_images` VALUES ('304','product','DS-700-4.jpg','/Uploads/image/product/20150712/DS-700-4.jpg','1436624052');
INSERT INTO `pa_images` VALUES ('305','product','DS-700-4-AT.jpg','/Uploads/image/product/20150712/DS-700-4-AT.jpg','1436624055');
INSERT INTO `pa_images` VALUES ('306','product','DS-700-5.jpg','/Uploads/image/product/20150712/DS-700-5.jpg','1436624059');
INSERT INTO `pa_images` VALUES ('307','product','DS-737F.jpg','/Uploads/image/product/20150712/DS-737F.jpg','1436624062');
INSERT INTO `pa_images` VALUES ('308','product','DS-737FS.jpg','/Uploads/image/product/20150712/DS-737FS.jpg','1436624069');
INSERT INTO `pa_images` VALUES ('309','product','DS-747F-AT.jpg','/Uploads/image/product/20150712/DS-747F-AT.jpg','1436624074');
INSERT INTO `pa_images` VALUES ('310','product','DS-747F-BK.jpg','/Uploads/image/product/20150712/DS-747F-BK.jpg','1436624082');
INSERT INTO `pa_images` VALUES ('311','product','DS-747F-PK-SP.jpg','/Uploads/image/product/20150712/DS-747F-PK-SP.jpg','1436624086');
INSERT INTO `pa_images` VALUES ('312','product','DS-747F.jpg','/Uploads/image/product/20150712/DS-747F.jpg','1436624097');
INSERT INTO `pa_images` VALUES ('313','product','DS-600-05GB.jpg','/Uploads/image/product/20150712/DS-600-05GB.jpg','1436624106');
INSERT INTO `pa_images` VALUES ('314','product','DS-600-35AC.jpg','/Uploads/image/product/20150712/DS-600-35AC.jpg','1436624116');
INSERT INTO `pa_images` VALUES ('315','product','DS-62G-01MR-D-AT-AW.jpg','/Uploads/image/product/20150712/DS-62G-01MR-D-AT-AW.jpg','1436624120');
INSERT INTO `pa_images` VALUES ('316','product','DS-720-356T.jpg','/Uploads/image/product/20150712/DS-720-356T.jpg','1436624122');
INSERT INTO `pa_images` VALUES ('317','product','600-01CB-AT.jpg','/Uploads/image/product/20150712/600-01CB-AT.jpg','1436624124');
INSERT INTO `pa_images` VALUES ('318','product','DS-600-02BB.jpg','/Uploads/image/product/20150712/DS-600-02BB.jpg','1436624126');
INSERT INTO `pa_images` VALUES ('319','product','DS-600-01CB-RP.jpg','/Uploads/image/product/20150712/DS-600-01CB-RP.jpg','1436624134');
INSERT INTO `pa_images` VALUES ('320','product','DS-9820.jpg','/Uploads/image/product/20150712/DS-9820.jpg','1436624346');
INSERT INTO `pa_images` VALUES ('321','product','0303D-5.jpg','/Uploads/image/product/20150712/0303D-5.jpg','1436626363');
INSERT INTO `pa_images` VALUES ('322','product','9600QGD-3N.jpg','/Uploads/image/product/20150712/9600QGD-3N.jpg','1436626364');
INSERT INTO `pa_images` VALUES ('323','product','9610QGD-3.jpg','/Uploads/image/product/20150712/9610QGD-3.jpg','1436626366');
INSERT INTO `pa_images` VALUES ('324','product','DS-9900QGD-3.jpg','/Uploads/image/product/20150712/DS-9900QGD-3.jpg','1436626368');
INSERT INTO `pa_images` VALUES ('325','product','9910QGD-3.jpg','/Uploads/image/product/20150712/9910QGD-3.jpg','1436626369');
INSERT INTO `pa_images` VALUES ('326','product','DS-6202QGD-3.jpg','/Uploads/image/product/20150712/DS-6202QGD-3.jpg','1436626371');
INSERT INTO `pa_images` VALUES ('327','product','DS-0302.jpg','/Uploads/image/product/20150712/DS-0302.jpg','1436626373');
INSERT INTO `pa_images` VALUES ('328','product','DS-111QG.jpg','/Uploads/image/product/20150712/DS-111QG.jpg','1436626377');
INSERT INTO `pa_images` VALUES ('329','product','DS-5550-Grey.jpg','/Uploads/image/product/20150712/DS-5550-Grey.jpg','1436626381');
INSERT INTO `pa_images` VALUES ('330','product','DS-5550.jpg','/Uploads/image/product/20150712/DS-5550.jpg','1436626384');
INSERT INTO `pa_images` VALUES ('331','product','DS-6-28.jpg','/Uploads/image/product/20150712/DS-6-28.jpg','1436626387');
INSERT INTO `pa_images` VALUES ('332','product','DS-6150QG.jpg','/Uploads/image/product/20150712/DS-6150QG.jpg','1436626394');
INSERT INTO `pa_images` VALUES ('333','product','DS-6202.jpg','/Uploads/image/product/20150712/DS-6202.jpg','1436626400');
INSERT INTO `pa_images` VALUES ('334','product','DS-8500.jpg','/Uploads/image/product/20150712/DS-8500.jpg','1436626404');
INSERT INTO `pa_images` VALUES ('335','product','DS-8600-J.jpg','/Uploads/image/product/20150712/DS-8600-J.jpg','1436626407');
INSERT INTO `pa_images` VALUES ('336','product','DS-8700.jpg','/Uploads/image/product/20150712/DS-8700.jpg','1436626413');
INSERT INTO `pa_images` VALUES ('337','product','DS-8800.jpg','/Uploads/image/product/20150712/DS-8800.jpg','1436626417');
INSERT INTO `pa_images` VALUES ('338','product','DS-0058-3.jpg','/Uploads/image/product/20150712/DS-0058-3.jpg','1436626419');
INSERT INTO `pa_images` VALUES ('339','product','DS-0058.jpg','/Uploads/image/product/20150712/DS-0058.jpg','1436626424');
INSERT INTO `pa_images` VALUES ('340','product','DS-8450.jpg','/Uploads/image/product/20150712/DS-8450.jpg','1436626429');
INSERT INTO `pa_images` VALUES ('341','product','DS-8420.jpg','/Uploads/image/product/20150712/DS-8420.jpg','1436626442');
INSERT INTO `pa_images` VALUES ('342','product','DS-700-3-17PK-SP.jpg','/Uploads/image/product/20150712/DS-700-3-17PK-SP.jpg','1436626446');
INSERT INTO `pa_images` VALUES ('343','product','DS-700-3.jpg','/Uploads/image/product/20150712/DS-700-3.jpg','1436626450');
INSERT INTO `pa_images` VALUES ('344','product','DS-700-4-BK.jpg','/Uploads/image/product/20150712/DS-700-4-BK.jpg','1436626457');
INSERT INTO `pa_images` VALUES ('345','product','DS-700-4.jpg','/Uploads/image/product/20150712/DS-700-4.jpg','1436626459');
INSERT INTO `pa_images` VALUES ('346','product','DS-700-4-AT.jpg','/Uploads/image/product/20150712/DS-700-4-AT.jpg','1436626466');
INSERT INTO `pa_images` VALUES ('347','product','DS-700-5.jpg','/Uploads/image/product/20150712/DS-700-5.jpg','1436626471');
INSERT INTO `pa_images` VALUES ('348','product','DS-737F.jpg','/Uploads/image/product/20150712/DS-737F.jpg','1436626474');
INSERT INTO `pa_images` VALUES ('349','product','DS-737FS.jpg','/Uploads/image/product/20150712/DS-737FS.jpg','1436626480');
INSERT INTO `pa_images` VALUES ('350','product','DS-747F-AT.jpg','/Uploads/image/product/20150712/DS-747F-AT.jpg','1436626483');
INSERT INTO `pa_images` VALUES ('351','product','DS-747F-BK.jpg','/Uploads/image/product/20150712/DS-747F-BK.jpg','1436626487');
INSERT INTO `pa_images` VALUES ('352','product','DS-747F-PK-SP.jpg','/Uploads/image/product/20150712/DS-747F-PK-SP.jpg','1436626492');
INSERT INTO `pa_images` VALUES ('353','product','DS-747F.jpg','/Uploads/image/product/20150712/DS-747F.jpg','1436626501');
INSERT INTO `pa_images` VALUES ('354','product','DS-1500.jpg','/Uploads/image/product/20150712/DS-1500.jpg','1436626507');
INSERT INTO `pa_images` VALUES ('355','product','DS-500-01CB-EUT.jpg','/Uploads/image/product/20150712/DS-500-01CB-EUT.jpg','1436626512');
INSERT INTO `pa_images` VALUES ('356','product','500-01CB-AT.jpg','/Uploads/image/product/20150712/500-01CB-AT.jpg','1436626519');
INSERT INTO `pa_images` VALUES ('357','product','DS-500-01CB.jpg','/Uploads/image/product/20150712/DS-500-01CB.jpg','1436626522');
INSERT INTO `pa_images` VALUES ('358','product','DS-500-02BB.jpg','/Uploads/image/product/20150712/DS-500-02BB.jpg','1436626524');
INSERT INTO `pa_images` VALUES ('359','product','DS-500-04CB.jpg','/Uploads/image/product/20150712/DS-500-04CB.jpg','1436626530');
INSERT INTO `pa_images` VALUES ('360','product','DS-500-05BB.jpg','/Uploads/image/product/20150712/DS-500-05BB.jpg','1436626536');
INSERT INTO `pa_images` VALUES ('361','product','DS-500-10SZ.jpg','/Uploads/image/product/20150712/DS-500-10SZ.jpg','1436626542');
INSERT INTO `pa_images` VALUES ('362','product','600-01CB-AT-EUT.jpg','/Uploads/image/product/20150712/600-01CB-AT-EUT.jpg','1436626545');
INSERT INTO `pa_images` VALUES ('363','product','DS-600-01CB-AT.jpg','/Uploads/image/product/20150712/DS-600-01CB-AT.jpg','1436626547');
INSERT INTO `pa_images` VALUES ('364','product','DS-600-01CB-RP.jpg','/Uploads/image/product/20150712/DS-600-01CB-RP.jpg','1436626552');
INSERT INTO `pa_images` VALUES ('365','product','DS-600-02BB.jpg','/Uploads/image/product/20150712/DS-600-02BB.jpg','1436626558');
INSERT INTO `pa_images` VALUES ('366','product','DS-1377.jpg','/Uploads/image/product/20150712/DS-1377.jpg','1436626561');
INSERT INTO `pa_images` VALUES ('367','product','DS-1790.jpg','/Uploads/image/product/20150712/DS-1790.jpg','1436626562');
INSERT INTO `pa_images` VALUES ('368','product','DS-1850.jpg','/Uploads/image/product/20150712/DS-1850.jpg','1436626564');
INSERT INTO `pa_images` VALUES ('369','product','DS-1900ASS.jpg','/Uploads/image/product/20150712/DS-1900ASS.jpg','1436626567');
INSERT INTO `pa_images` VALUES ('370','product','DS-1903A.jpg','/Uploads/image/product/20150712/DS-1903A.jpg','1436626568');
INSERT INTO `pa_images` VALUES ('371','product','DS-210D.jpg','/Uploads/image/product/20150712/DS-210D.jpg','1436626571');
INSERT INTO `pa_images` VALUES ('372','product','DS-2516.jpg','/Uploads/image/product/20150712/DS-2516.jpg','1436626574');
INSERT INTO `pa_images` VALUES ('373','product','DS-373.jpg','/Uploads/image/product/20150712/DS-373.jpg','1436626579');
INSERT INTO `pa_images` VALUES ('374','product','DS-781.jpg','/Uploads/image/product/20150712/DS-781.jpg','1436626583');
INSERT INTO `pa_images` VALUES ('375','product','DS-808.jpg','/Uploads/image/product/20150712/DS-808.jpg','1436626590');
INSERT INTO `pa_images` VALUES ('376','product','DS-9820.jpg','/Uploads/image/product/20150712/DS-9820.jpg','1436626593');
INSERT INTO `pa_images` VALUES ('377','product','DS-1201.jpg','/Uploads/image/product/20150712/DS-1201.jpg','1436626597');
INSERT INTO `pa_images` VALUES ('378','product','DS-1204.jpg','/Uploads/image/product/20150712/DS-1204.jpg','1436626600');
INSERT INTO `pa_images` VALUES ('379','product','DS-1208.jpg','/Uploads/image/product/20150712/DS-1208.jpg','1436626603');
INSERT INTO `pa_images` VALUES ('380','product','DS-1212.jpg','/Uploads/image/product/20150712/DS-1212.jpg','1436626605');
INSERT INTO `pa_images` VALUES ('381','product','DS-008VC.jpg','/Uploads/image/product/20150712/DS-008VC.jpg','1436626608');
INSERT INTO `pa_images` VALUES ('382','product','DS-1302.jpg','/Uploads/image/product/20150712/DS-1302.jpg','1436626612');
INSERT INTO `pa_images` VALUES ('383','product','DS-1433PSM.jpg','/Uploads/image/product/20150712/DS-1433PSM.jpg','1436626614');
INSERT INTO `pa_images` VALUES ('384','product','DS-1508P.jpg','/Uploads/image/product/20150712/DS-1508P.jpg','1436626620');
INSERT INTO `pa_images` VALUES ('385','product','DS-2000C.jpg','/Uploads/image/product/20150712/DS-2000C.jpg','1436626623');
INSERT INTO `pa_images` VALUES ('386','product','5800.jpg','/Uploads/image/product/20150712/5800.jpg','1436626627');
INSERT INTO `pa_images` VALUES ('387','product','700.jpg','/Uploads/image/product/20150712/700.jpg','1436626629');
INSERT INTO `pa_images` VALUES ('388','product','747.jpg','/Uploads/image/product/20150712/747.jpg','1436626632');
INSERT INTO `pa_images` VALUES ('389','product','800.jpg','/Uploads/image/product/20150712/800.jpg','1436626638');
INSERT INTO `pa_images` VALUES ('390','product','988.jpg','/Uploads/image/product/20150712/988.jpg','1436626641');
INSERT INTO `pa_images` VALUES ('391','product','DS-28.jpg','/Uploads/image/product/20150712/DS-28.jpg','1436626643');
INSERT INTO `pa_images` VALUES ('392','product','MX6125.jpg','/Uploads/image/product/20150712/MX6125.jpg','1436626647');
INSERT INTO `pa_images` VALUES ('393','product','DS-20U23D.jpg','/Uploads/image/product/20150712/DS-20U23D.jpg','1436626650');
INSERT INTO `pa_images` VALUES ('394','product','DS-20U43.jpg','/Uploads/image/product/20150712/DS-20U43.jpg','1436626653');
INSERT INTO `pa_images` VALUES ('395','product','DS-2284.jpg','/Uploads/image/product/20150712/DS-2284.jpg','1436626658');
INSERT INTO `pa_images` VALUES ('396','product','DS927-928.jpg','/Uploads/image/product/20150712/DS927-928.jpg','1436626659');
INSERT INTO `pa_images` VALUES ('397','product','DS-801.jpg','/Uploads/image/product/20150712/DS-801.jpg','1436626662');
INSERT INTO `pa_images` VALUES ('398','product','DS-26-1A.jpg','/Uploads/image/product/20150712/DS-26-1A.jpg','1436626664');
INSERT INTO `pa_images` VALUES ('399','product','DS-810.jpg','/Uploads/image/product/20150712/DS-810.jpg','1436626668');
INSERT INTO `pa_images` VALUES ('400','product','DS-32-62-82.jpg','/Uploads/image/product/20150712/DS-32-62-82.jpg','1436626670');
INSERT INTO `pa_images` VALUES ('401','product','DS-1380.jpg','/Uploads/image/product/20150712/DS-1380.jpg','1436626672');
INSERT INTO `pa_images` VALUES ('402','product','DS-9060-8060-1080-1060.jpg','/Uploads/image/product/20150712/DS-9060-8060-1080-1060.jpg','1436626679');
INSERT INTO `pa_images` VALUES ('403','product','DS-310.jpg','/Uploads/image/product/20150712/DS-310.jpg','1436626683');
INSERT INTO `pa_images` VALUES ('404','product','DS-520.jpg','/Uploads/image/product/20150712/DS-520.jpg','1436626686');
INSERT INTO `pa_images` VALUES ('405','product','DS-6PC-1.jpg','/Uploads/image/product/20150712/DS-6PC-1.jpg','1436626688');
INSERT INTO `pa_images` VALUES ('406','product','DS-94A.jpg','/Uploads/image/product/20150712/DS-94A.jpg','1436626694');
INSERT INTO `pa_images` VALUES ('407','product','yundouxue.jpg','/Uploads/image/product/20150712/yundouxue.jpg','1436626700');
INSERT INTO `pa_images` VALUES ('408','product','DS-888.jpg','/Uploads/image/product/20150712/DS-888.jpg','1436626704');
INSERT INTO `pa_images` VALUES ('409','product','DS-CZD-3-103.jpg','/Uploads/image/product/20150712/DS-CZD-3-103.jpg','1436626708');
INSERT INTO `pa_images` VALUES ('410','product','DS-RC-100-110.jpg','/Uploads/image/product/20150712/DS-RC-100-110.jpg','1436626713');
INSERT INTO `pa_images` VALUES ('411','product','DS-CZD-3-103.jpg','/Uploads/image/product/20150712/DS-CZD-3-103.jpg','1436626716');
INSERT INTO `pa_images` VALUES ('412','product','DS-911.jpg','/Uploads/image/product/20150712/DS-911.jpg','1436626719');
INSERT INTO `pa_images` VALUES ('413','product','DS-10S.jpg','/Uploads/image/product/20150712/DS-10S.jpg','1436626721');
INSERT INTO `pa_images` VALUES ('414','product','DS-20S-40C.jpg','/Uploads/image/product/20150712/DS-20S-40C.jpg','1436626725');
INSERT INTO `pa_images` VALUES ('415','product','DS-20-2B.jpg','/Uploads/image/product/20150712/DS-20-2B.jpg','1436626728');
INSERT INTO `pa_images` VALUES ('416','product','DS-6202QGD-3.jpg','/Uploads/image/product/20150712/DS-6202QGD-3.jpg','1436626732');
INSERT INTO `pa_images` VALUES ('417','product','DS-0302.jpg','/Uploads/image/product/20150712/DS-0302.jpg','1436626735');
INSERT INTO `pa_images` VALUES ('418','product','DS-111QG.jpg','/Uploads/image/product/20150712/DS-111QG.jpg','1436626738');
INSERT INTO `pa_images` VALUES ('419','product','DS-5550.jpg','/Uploads/image/product/20150712/DS-5550.jpg','1436626740');
INSERT INTO `pa_images` VALUES ('420','product','DS-5550-Grey.jpg','/Uploads/image/product/20150712/DS-5550-Grey.jpg','1436626744');
INSERT INTO `pa_images` VALUES ('421','product','DS-6-28.jpg','/Uploads/image/product/20150712/DS-6-28.jpg','1436626747');
INSERT INTO `pa_images` VALUES ('422','product','DS-6150QG.jpg','/Uploads/image/product/20150712/DS-6150QG.jpg','1436626751');
INSERT INTO `pa_images` VALUES ('423','product','DS-6202.jpg','/Uploads/image/product/20150712/DS-6202.jpg','1436626755');
INSERT INTO `pa_images` VALUES ('424','product','DS-8500.jpg','/Uploads/image/product/20150712/DS-8500.jpg','1436626757');
INSERT INTO `pa_images` VALUES ('425','product','DS-8600-J.jpg','/Uploads/image/product/20150712/DS-8600-J.jpg','1436626759');
INSERT INTO `pa_images` VALUES ('426','product','DS-8700.jpg','/Uploads/image/product/20150712/DS-8700.jpg','1436626762');
INSERT INTO `pa_images` VALUES ('427','product','DS-8800.jpg','/Uploads/image/product/20150712/DS-8800.jpg','1436626764');
INSERT INTO `pa_images` VALUES ('428','product','DS-700-3-17PK-SP.jpg','/Uploads/image/product/20150712/DS-700-3-17PK-SP.jpg','1436626770');
INSERT INTO `pa_images` VALUES ('429','product','DS-700-3.jpg','/Uploads/image/product/20150712/DS-700-3.jpg','1436626774');
INSERT INTO `pa_images` VALUES ('430','product','500-01CB-AT.jpg','/Uploads/image/product/20150712/500-01CB-AT.jpg','1436626776');
INSERT INTO `pa_images` VALUES ('431','product','DS-700-4.jpg','/Uploads/image/product/20150712/DS-700-4.jpg','1436626778');
INSERT INTO `pa_images` VALUES ('432','product','DS-700-4-AT.jpg','/Uploads/image/product/20150712/DS-700-4-AT.jpg','1436626783');
INSERT INTO `pa_images` VALUES ('433','product','DS-700-5.jpg','/Uploads/image/product/20150712/DS-700-5.jpg','1436626787');
INSERT INTO `pa_images` VALUES ('434','product','DS-737FS.jpg','/Uploads/image/product/20150712/DS-737FS.jpg','1436626791');
INSERT INTO `pa_images` VALUES ('435','product','DS-737F.jpg','/Uploads/image/product/20150712/DS-737F.jpg','1436626796');
INSERT INTO `pa_images` VALUES ('436','product','DS-747F-AT.jpg','/Uploads/image/product/20150712/DS-747F-AT.jpg','1436626801');
INSERT INTO `pa_images` VALUES ('437','product','DS-747F-BK.jpg','/Uploads/image/product/20150712/DS-747F-BK.jpg','1436626807');
INSERT INTO `pa_images` VALUES ('438','product','DS-747F-PK-SP.jpg','/Uploads/image/product/20150712/DS-747F-PK-SP.jpg','1436626812');
INSERT INTO `pa_images` VALUES ('439','product','DS-747F.jpg','/Uploads/image/product/20150712/DS-747F.jpg','1436626821');
INSERT INTO `pa_images` VALUES ('440','product','DS-1500.jpg','/Uploads/image/product/20150712/DS-1500.jpg','1436626829');
INSERT INTO `pa_images` VALUES ('441','product','DS-500-01CB-EUT.jpg','/Uploads/image/product/20150712/DS-500-01CB-EUT.jpg','1436626832');
INSERT INTO `pa_images` VALUES ('442','product','DS-500-01CB.jpg','/Uploads/image/product/20150712/DS-500-01CB.jpg','1436626836');
INSERT INTO `pa_images` VALUES ('443','product','DS-500-02BB.jpg','/Uploads/image/product/20150712/DS-500-02BB.jpg','1436626838');
INSERT INTO `pa_images` VALUES ('444','product','DS-500-04CB.jpg','/Uploads/image/product/20150712/DS-500-04CB.jpg','1436626842');
INSERT INTO `pa_images` VALUES ('445','product','DS-500-05BB.jpg','/Uploads/image/product/20150712/DS-500-05BB.jpg','1436626845');
INSERT INTO `pa_images` VALUES ('446','product','DS-600-02BB.jpg','/Uploads/image/product/20150712/DS-600-02BB.jpg','1436626849');
INSERT INTO `pa_images` VALUES ('447','product','DS-600-0CB-EUT.jpg','/Uploads/image/product/20150712/DS-600-0CB-EUT.jpg','1436626854');
INSERT INTO `pa_images` VALUES ('448','product','DS-600-05GB.jpg','/Uploads/image/product/20150712/DS-600-05GB.jpg','1436626859');
INSERT INTO `pa_images` VALUES ('449','product','DS-600-35AC.jpg','/Uploads/image/product/20150712/DS-600-35AC.jpg','1436626865');
INSERT INTO `pa_images` VALUES ('450','product','DS-62G-01MR-D-AT-AW.jpg','/Uploads/image/product/20150712/DS-62G-01MR-D-AT-AW.jpg','1436626870');
INSERT INTO `pa_images` VALUES ('451','product','DS-720-356T.jpg','/Uploads/image/product/20150712/DS-720-356T.jpg','1436626871');
INSERT INTO `pa_images` VALUES ('452','product','DS-1790.jpg','/Uploads/image/product/20150712/DS-1790.jpg','1436626873');
INSERT INTO `pa_images` VALUES ('453','product','DS-1903A.jpg','/Uploads/image/product/20150712/DS-1903A.jpg','1436626874');
INSERT INTO `pa_images` VALUES ('454','product','DS-1900ASS.jpg','/Uploads/image/product/20150712/DS-1900ASS.jpg','1436626879');
INSERT INTO `pa_images` VALUES ('455','product','DS-210D.jpg','/Uploads/image/product/20150712/DS-210D.jpg','1436626881');
INSERT INTO `pa_images` VALUES ('456','product','DS-2516.jpg','/Uploads/image/product/20150712/DS-2516.jpg','1436626885');
INSERT INTO `pa_images` VALUES ('457','product','DS-373.jpg','/Uploads/image/product/20150712/DS-373.jpg','1436626890');
INSERT INTO `pa_images` VALUES ('458','product','DS-781.jpg','/Uploads/image/product/20150712/DS-781.jpg','1436626893');
INSERT INTO `pa_images` VALUES ('459','product','DS-808.jpg','/Uploads/image/product/20150712/DS-808.jpg','1436626896');
INSERT INTO `pa_images` VALUES ('460','product','DS-9820.jpg','/Uploads/image/product/20150712/DS-9820.jpg','1436626901');
INSERT INTO `pa_images` VALUES ('461','product','DS-1903A.jpg','/Uploads/image/product/20150712/DS-1903A.jpg','1436626907');
INSERT INTO `pa_images` VALUES ('462','product','DS-008VC.jpg','/Uploads/image/product/20150712/DS-008VC.jpg','1436626909');
INSERT INTO `pa_images` VALUES ('463','product','DS-008VC.jpg','/Uploads/image/product/20150712/DS-008VC.jpg','1436626913');
INSERT INTO `pa_images` VALUES ('464','product','DS-1302.jpg','/Uploads/image/product/20150712/DS-1302.jpg','1436626918');
INSERT INTO `pa_images` VALUES ('465','product','DS-1433PSM.jpg','/Uploads/image/product/20150712/DS-1433PSM.jpg','1436626921');
INSERT INTO `pa_images` VALUES ('466','product','DS-1508P.jpg','/Uploads/image/product/20150712/DS-1508P.jpg','1436626925');
INSERT INTO `pa_images` VALUES ('467','product','DS-2000C.jpg','/Uploads/image/product/20150712/DS-2000C.jpg','1436626927');
INSERT INTO `pa_images` VALUES ('468','product','DS-20U23D.jpg','/Uploads/image/product/20150712/DS-20U23D.jpg','1436626931');
INSERT INTO `pa_images` VALUES ('469','product','DS-20U43.jpg','/Uploads/image/product/20150712/DS-20U43.jpg','1436626935');
INSERT INTO `pa_images` VALUES ('470','product','DS-2284.jpg','/Uploads/image/product/20150712/DS-2284.jpg','1436626940');
INSERT INTO `pa_images` VALUES ('471','product','DS-CZD-3-103.jpg','/Uploads/image/product/20150712/DS-CZD-3-103.jpg','1436626942');
INSERT INTO `pa_images` VALUES ('472','product','DS-CZD-3-103.jpg','/Uploads/image/product/20150712/DS-CZD-3-103.jpg','1436626946');
INSERT INTO `pa_images` VALUES ('473','product','DS-888.jpg','/Uploads/image/product/20150712/DS-888.jpg','1436626950');
INSERT INTO `pa_images` VALUES ('474','product','DS-CZD-3-103.jpg','/Uploads/image/product/20150712/DS-CZD-3-103.jpg','1436626954');
INSERT INTO `pa_images` VALUES ('475','product','DS-RC-100-110.jpg','/Uploads/image/product/20150712/DS-RC-100-110.jpg','1436626960');
INSERT INTO `pa_images` VALUES ('476','product','DS-310.jpg','/Uploads/image/product/20150712/DS-310.jpg','1436626964');
INSERT INTO `pa_images` VALUES ('477','product','DS-520.jpg','/Uploads/image/product/20150712/DS-520.jpg','1436626966');
INSERT INTO `pa_images` VALUES ('478','product','DS-6PC-1.jpg','/Uploads/image/product/20150712/DS-6PC-1.jpg','1436626968');
INSERT INTO `pa_images` VALUES ('479','product','DS-94A.jpg','/Uploads/image/product/20150712/DS-94A.jpg','1436626971');
INSERT INTO `pa_images` VALUES ('480','product','yundouxue.jpg','/Uploads/image/product/20150712/yundouxue.jpg','1436626973');
INSERT INTO `pa_images` VALUES ('481','product','DS-1380.jpg','/Uploads/image/product/20150712/DS-1380.jpg','1436626977');
INSERT INTO `pa_images` VALUES ('482','product','DS-9060-8060-1080-1060.jpg','/Uploads/image/product/20150712/DS-9060-8060-1080-1060.jpg','1436626982');
INSERT INTO `pa_images` VALUES ('483','product','DS-10S.jpg','/Uploads/image/product/20150712/DS-10S.jpg','1436626984');
INSERT INTO `pa_images` VALUES ('484','product','DS-20S-40C.jpg','/Uploads/image/product/20150712/DS-20S-40C.jpg','1436626986');
INSERT INTO `pa_images` VALUES ('485','product','DS-1201.jpg','/Uploads/image/product/20150712/DS-1201.jpg','1436626990');
INSERT INTO `pa_images` VALUES ('486','product','DS-1204.jpg','/Uploads/image/product/20150712/DS-1204.jpg','1436626994');
INSERT INTO `pa_images` VALUES ('487','product','DS-1208.jpg','/Uploads/image/product/20150712/DS-1208.jpg','1436626996');
INSERT INTO `pa_images` VALUES ('488','product','DS-1212.jpg','/Uploads/image/product/20150712/DS-1212.jpg','1436626999');
INSERT INTO `pa_images` VALUES ('489','product','DS927-928.jpg','/Uploads/image/product/20150712/DS927-928.jpg','1436627001');
INSERT INTO `pa_images` VALUES ('490','product','0303D-5.jpg','/Uploads/image/product/20150712/0303D-5.jpg','1436627004');
INSERT INTO `pa_images` VALUES ('491','product','9600QGD-3N.jpg','/Uploads/image/product/20150712/9600QGD-3N.jpg','1436627005');
INSERT INTO `pa_images` VALUES ('492','product','9610QGD-3.jpg','/Uploads/image/product/20150712/9610QGD-3.jpg','1436627007');
INSERT INTO `pa_images` VALUES ('493','product','DS-9900QGD-3.jpg','/Uploads/image/product/20150712/DS-9900QGD-3.jpg','1436627008');
INSERT INTO `pa_images` VALUES ('494','product','9910QGD-3.jpg','/Uploads/image/product/20150712/9910QGD-3.jpg','1436627009');
INSERT INTO `pa_images` VALUES ('495','product','DS-26-1A.jpg','/Uploads/image/product/20150712/DS-26-1A.jpg','1436627010');
INSERT INTO `pa_images` VALUES ('496','product','DS-810.jpg','/Uploads/image/product/20150712/DS-810.jpg','1436627014');
INSERT INTO `pa_images` VALUES ('497','product','DS-0058-3.jpg','/Uploads/image/product/20150712/DS-0058-3.jpg','1436627016');
INSERT INTO `pa_images` VALUES ('498','product','DS-0058.jpg','/Uploads/image/product/20150712/DS-0058.jpg','1436627019');
INSERT INTO `pa_images` VALUES ('499','product','DS-8420.jpg','/Uploads/image/product/20150712/DS-8420.jpg','1436627022');
INSERT INTO `pa_images` VALUES ('500','product','DS-8450.jpg','/Uploads/image/product/20150712/DS-8450.jpg','1436627028');
INSERT INTO `pa_images` VALUES ('501','product','DS-801.jpg','/Uploads/image/product/20150712/DS-801.jpg','1436627032');
INSERT INTO `pa_images` VALUES ('502','product','DS-32-62-82.jpg','/Uploads/image/product/20150712/DS-32-62-82.jpg','1436627036');
INSERT INTO `pa_images` VALUES ('503','product','5800.jpg','/Uploads/image/product/20150712/5800.jpg','1436627038');
INSERT INTO `pa_images` VALUES ('504','product','700.jpg','/Uploads/image/product/20150712/700.jpg','1436627043');
INSERT INTO `pa_images` VALUES ('505','product','800.jpg','/Uploads/image/product/20150712/800.jpg','1436627046');
INSERT INTO `pa_images` VALUES ('506','product','747.jpg','/Uploads/image/product/20150712/747.jpg','1436627050');
INSERT INTO `pa_images` VALUES ('507','product','DS-28.jpg','/Uploads/image/product/20150712/DS-28.jpg','1436627053');
INSERT INTO `pa_images` VALUES ('508','product','MX6125.jpg','/Uploads/image/product/20150712/MX6125.jpg','1436627055');
INSERT INTO `pa_images` VALUES ('509','product','747.jpg','/Uploads/image/product/20150712/747.jpg','1436627058');


# 数据库表：pa_input 数据信息


# 数据库表：pa_link 数据信息


# 数据库表：pa_member 数据信息
INSERT INTO `pa_member` VALUES ('351','','','','','','a106079595@qq.com','a106079595','c1465355888299eb69608e9b8344f95f','','','0','','','','','','','','','','','','','','','15355688333','','','','','');
INSERT INTO `pa_member` VALUES ('352','','','','','','215654740@qq.com','xiaoyong030107','8338ba013bacee7b716ca1ad322721b0','','','0','','','','','','','','','','','','','','','undefined','','','','','');
INSERT INTO `pa_member` VALUES ('353','','','','','','a200@11.com','a285837634','2544db87d6a443abf3334d3fac77273a','','','0','','','','','','','','','','','','','','','15355688333','','','','','');
INSERT INTO `pa_member` VALUES ('358','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5YhjO4dC797ZOVAsibpln6rHgDpkSiaannl9HsZibnLaOZCXRJDO7OmAxje9XTia091DL8LtoQtdJbrgyhvnAoYoLhd/0','40','oXU1ruKrST1KKNNky4pIk130BrcY','','','HYL','123456','','','0','','','','','','','','','','','四川','成都','','','','','','','','');
INSERT INTO `pa_member` VALUES ('359','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5Z0ibDprKmI2WaFkgThq5JbXMX0qxc6dP8JrSoXrP8c7SQTdjHeaacAsUY4JbcE8D9Fibg19WaCCFhVtmTGcPicSMB/0','0','oXU1ruLhAmixwec7GDSuIFCmToLk','','','D_dream','123456','','','0','','','','','','','','','','','山东','临沂','','','','','','','','');
INSERT INTO `pa_member` VALUES ('360','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyR6K1ibl7iaQof7so7P0OnvkCOVxGZvl98hKZBaFkpENTvlX1khZxGeiccz5VlsiaDAHcNrdJPoo2jkI/0','0','oXU1ruGfMYICdPFnxuhxTed8zhGI','','','牟新芬','123456','','','0','','','','','','','','','','','浙江','杭州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('361','','','0','oXU1ruBY_qKKz_fWXkrxbR27aXI8','','','enhua chen','123456','','','0','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `pa_member` VALUES ('362','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6BHrqe0OZI5XGpia9B8BHibSBLWACdfWOcMw0KTNhcsSv4X51aicdmC84DXv03mibhPpbrpZViauJ1N5N/0','80','oXU1ruN88VbykbpFtL_fzQ8kvds0','','','修身齐家¥知足常乐','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('363','','http://wx.qlogo.cn/mmopen/McYMgia19V0VHxjnuPh5w6H5Q1spALU8W1rpibljsqSww7vhBKP8NQItgWyIuiaDo9ePUML9ogSic23BBSwicO8PGN5kKX3xY95SK/0','0','oXU1ruPp2bhUJTIEPKEBeFiWCVPE','','','阿华','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('364','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqbVjWIbw8ZJPYpeAPZCciaLEPXicX9YSicbCcpmJa7C5DGbbDXMBia3JTUekbnIjWFjv0RWhgT4aN0WT/0','0','oXU1ruG5tFiWrRVQvdh1LmCHtU_w','','','海阔天空','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('365','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6593ia0LFCzsRRia4s39ZiblZLjgdeOqmfp0MPe4vThWAqaJLgSmHVHwWibeM13CicdENBNjpkpCIu4j8Bt/0','0','oXU1ruPbucEcD4nYYzvos6nSNYOE','','','小贾','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('366','','http://wx.qlogo.cn/mmopen/ajNVdqHZLLCcwCDz0ibG8g1rtVkrXBaFDZp6fbAJwaict0n8JF7g9icQiahpib5ZTf0Rsq009uqhCJ6UiagL1uo1zJuA/0','0','oXU1ruMYmzzTEvZskMD0ieo3_PNY','','','潇洒哥','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('367','','http://wx.qlogo.cn/mmopen/BcQRZIbPSiamFjMicGH9LkqUxiadRDThR9VMNmuVBSAHXbNmZVQiaSIArSow5GhbCASPGXkicqWiaaOhewhiaWVwibbUCwp87yoNZC0U/0','0','oXU1ruITBF27t6B55KTsViC5cGKM','','','无锡凯利达防爆机电有限公司','123456','','','0','','','','','','','','','','','江苏','无锡','','','','','','','','');
INSERT INTO `pa_member` VALUES ('368','','http://wx.qlogo.cn/mmopen/4tpkVGWUO5bpQFN2Bw5WyZ1E5RZHm30pqo8aFLqUqbHMbyZN6Lh1SI3WeeICmXza4FrqbyzK54AIicNUibFkurSQBTLaWBnhCv/0','0','oXU1ruKgWBQLm6AHw3lxY1VMkfk0','','','黄冰冰','123456','','','0','','','','','','','','','','','浙江','丽水','','','','','','','','');
INSERT INTO `pa_member` VALUES ('369','','http://wx.qlogo.cn/mmopen/Q3auHgzwzM7nWecDSNwOYdicYDx4CRqXibnNxxHPd56BM3EBkUUbc5zZYicRIVAVzoeic7O9DO3VaETibqhZPMvsbKw/0','0','oXU1ruNkEv4tzXOysYOdqWpkqpyc','','','xixihappy','123456','','','0','','','','','','','','','','','浙江','台州','','','','','','','','');
INSERT INTO `pa_member` VALUES ('370','','http://wx.qlogo.cn/mmopen/3hsWdj2E9tukSnFcoI6590K5djAdnia0j1oiansUiaULdkI8R0OslicAOzZVQPia3SuZaxZoranRpoDPzjvQN9mjG9NkoQJzxkuTo/0','0','oXU1ruKrQ6xIig6Xtjg_oijnbpOM','','','你好大爷','123456','','','0','','','','','','','','','','','四川','成都','','','','','','','','');


# 数据库表：pa_message 数据信息
INSERT INTO `pa_message` VALUES ('14','a106079595','a106079595@qq.com','15355688333','0','1437144254','118','非常好，谢谢','','','');
INSERT INTO `pa_message` VALUES ('15','黄杨侣','hylxinlang@sina.cn','18382307097','0','1437146028','157','留言7月17号','','','');
INSERT INTO `pa_message` VALUES ('16','xiaoyong030107','215654740@qq.com','undefined','0','1437296410','157','不错','','','');
INSERT INTO `pa_message` VALUES ('17','陈恩华','15355688333@189.cn','15355688333','0','1437338019','63','测试下','','','');


# 数据库表：pa_model 数据信息


# 数据库表：pa_nav 数据信息
INSERT INTO `pa_nav` VALUES ('52','page','走进大森','0','20','middle','/index.php/page/index/name/zjds','zh-cn','12','0');
INSERT INTO `pa_nav` VALUES ('53','page','公司简介','52','21','middle','/index.php/page/index/name/gsjj','zh-cn','11','0');
INSERT INTO `pa_nav` VALUES ('54','page','董事长致词','52','22','middle','/index.php/page/index/name/dszzc','zh-cn','10','0');
INSERT INTO `pa_nav` VALUES ('55','page','大森优势','52','23','middle','/index.php/page/index/name/dsys','zh-cn','9','0');
INSERT INTO `pa_nav` VALUES ('56','page','企业文化','52','24','middle','/index.php/page/index/name/qywh','zh-cn','8','0');
INSERT INTO `pa_nav` VALUES ('57','page','公司荣誉','52','25','middle','/index.php/page/index/name/gsryt','zh-cn','7','0');
INSERT INTO `pa_nav` VALUES ('58','page','组织结构','52','26','middle','/index.php/page/index/name/zzjig','zh-cn','6','0');
INSERT INTO `pa_nav` VALUES ('59','page','大森足迹','52','27','middle','/index.php/page/index/name/dszjg','zh-cn','5','0');
INSERT INTO `pa_nav` VALUES ('60','page','企业一角','52','28','middle','/index.php/page/index/name/qyyjd','zh-cn','4','0');
INSERT INTO `pa_nav` VALUES ('61','page','历年展会','52','29','middle','/index.php/page/index/name/lnzhg','zh-cn','3','0');
INSERT INTO `pa_nav` VALUES ('62','page','服装样板工厂','52','30','middle','/index.php/page/index/name/fsdfg','zh-cn','1','0');
INSERT INTO `pa_nav` VALUES ('63','page','大森视频展示','52','31','middle','/index.php/page/index/name/dsship','zh-cn','5','0');
INSERT INTO `pa_nav` VALUES ('64','news','新闻动态','0','0','middle','/index.php/news/index','zh-cn','10','0');
INSERT INTO `pa_nav` VALUES ('65','news','大森动态','64','1','middle','/index.php/news/index/cid/1','zh-cn','3','0');
INSERT INTO `pa_nav` VALUES ('66','news','专题活动','64','2','middle','/index.php/news/index/cid/2','zh-cn','2','0');
INSERT INTO `pa_nav` VALUES ('67','news','展会信息','64','3','middle','/index.php/news/index/cid/3','zh-cn','1','0');
INSERT INTO `pa_nav` VALUES ('68','news','缝纫知识','64','4','middle','/index.php/news/index/cid/4','zh-cn','7','0');
INSERT INTO `pa_nav` VALUES ('69','product','产品中心','0','0','middle','/index.php/product/index','zh-cn','11','0');
INSERT INTO `pa_nav` VALUES ('70','product','电脑平缝机系列','69','52','middle','/index.php/product/index/cid/52','zh-cn','19','0');
INSERT INTO `pa_nav` VALUES ('71','product','平缝机系列','69','55','middle','/index.php/product/index/cid/55','zh-cn','18','0');
INSERT INTO `pa_nav` VALUES ('72','product','双针机','69','56','middle','/index.php/product/index/cid/56','zh-cn','17','0');
INSERT INTO `pa_nav` VALUES ('73','product','包缝机系列','69','57','middle','/index.php/product/index/cid/57','zh-cn','16','0');
INSERT INTO `pa_nav` VALUES ('74','product','绷缝机系列','69','58','middle','/index.php/product/index/cid/58','zh-cn','15','0');
INSERT INTO `pa_nav` VALUES ('75','product','特种机、花样机','69','59','middle','/index.php/product/index/cid/59','zh-cn','14','0');
INSERT INTO `pa_nav` VALUES ('76','product','绣花机系列','69','60','middle','/index.php/product/index/cid/60','zh-cn','13','0');
INSERT INTO `pa_nav` VALUES ('77','product','多针机','69','61','middle','/index.php/product/index/cid/61','zh-cn','12','0');
INSERT INTO `pa_nav` VALUES ('78','product','节能电机电控','69','62','middle','/index.php/product/index/cid/62','zh-cn','11','0');
INSERT INTO `pa_nav` VALUES ('79','product','曲折缝','69','63','middle','/index.php/product/index/cid/63','zh-cn','10','0');
INSERT INTO `pa_nav` VALUES ('80','product','曲腕机','69','64','middle','/index.php/product/index/cid/64','zh-cn','9','0');
INSERT INTO `pa_nav` VALUES ('81','product','削皮机','69','65','middle','/index.php/product/index/cid/65','zh-cn','8','0');
INSERT INTO `pa_nav` VALUES ('82','product','缝包机','69','66','middle','/index.php/product/index/cid/66','zh-cn','7','0');
INSERT INTO `pa_nav` VALUES ('83','product','高头机','69','67','middle','/index.php/product/index/cid/67','zh-cn','6','0');
INSERT INTO `pa_nav` VALUES ('84','product','压画机','69','68','middle','/index.php/product/index/cid/68','zh-cn','5','0');
INSERT INTO `pa_nav` VALUES ('85','product','激光机','69','69','middle','/index.php/product/index/cid/69','zh-cn','4','0');
INSERT INTO `pa_nav` VALUES ('86','product','熨斗','69','70','middle','/index.php/product/index/cid/70','zh-cn','3','0');
INSERT INTO `pa_nav` VALUES ('87','product','断布机、裁剪机','69','71','middle','/index.php/product/index/cid/71','zh-cn','1','0');
INSERT INTO `pa_nav` VALUES ('88','product','分线机','69','72','middle','/index.php/product/index/cid/72','zh-cn','1','0');
INSERT INTO `pa_nav` VALUES ('89','product','地毯包边机','69','73','middle','/index.php/product/index/cid/73','zh-cn','1','0');
INSERT INTO `pa_nav` VALUES ('90','product','全自动模板缝纫机','69','74','middle','/index.php/product/index/cid/74','zh-cn','20','0');
INSERT INTO `pa_nav` VALUES ('91','page','人力资源','0','32','middle','/index.php/page/index/name/rlzy','zh-cn','8','0');
INSERT INTO `pa_nav` VALUES ('92','page','人才招聘','91','33','middle','/index.php/page/index/name/rczpp','zh-cn','7','0');
INSERT INTO `pa_nav` VALUES ('93','page','员工关怀','91','34','middle','/index.php/page/index/name/yggh','zh-cn','6','0');
INSERT INTO `pa_nav` VALUES ('94','page','人才战略','91','35','middle','/index.php/page/index/name/rczl','zh-cn','5','0');
INSERT INTO `pa_nav` VALUES ('95','page','简介投递','91','36','middle','/index.php/page/index/name/jltd','zh-cn','4','0');
INSERT INTO `pa_nav` VALUES ('96','page','服务中心','0','37','middle','/index.php/page/index/name/fwzx','zh-cn','9','0');
INSERT INTO `pa_nav` VALUES ('97','page','全球销售网络','96','38','middle','/index.php/page/index/name/qqyxwl','zh-cn','2','0');
INSERT INTO `pa_nav` VALUES ('98','page','国内销售网络','96','39','middle','/index.php/page/index/name/gnxswl','zh-cn','1','0');
INSERT INTO `pa_nav` VALUES ('99','page','企业VI形象','96','40','middle','/index.php/page/index/name/qyvixx','zh-cn','9','0');
INSERT INTO `pa_nav` VALUES ('100','page','售后服务','96','41','middle','/index.php/page/index/name/shfw','zh-cn','8','0');
INSERT INTO `pa_nav` VALUES ('101','page','大森资料下载','96','42','middle','/index.php/page/index/name/dszlxz','zh-cn','7','0');
INSERT INTO `pa_nav` VALUES ('102','page','视频中心','96','43','middle','/index.php/page/index/name/spzx','zh-cn','6','0');
INSERT INTO `pa_nav` VALUES ('103','page','联系我们','0','44','middle','/index.php/page/index/name/lxwm','zh-cn','7','0');
INSERT INTO `pa_nav` VALUES ('104','page','联系方式','103','45','middle','/index.php/page/index/name/lxfs','zh-cn','4','0');
INSERT INTO `pa_nav` VALUES ('105','page','地理位置','103','46','middle','/index.php/page/index/name/dlwz','zh-cn','3','0');
INSERT INTO `pa_nav` VALUES ('106','page','在线反馈','103','47','middle','/index.php/page/index/name/zxfk','zh-cn','2','0');
INSERT INTO `pa_nav` VALUES ('107','page','法律声明','103','48','middle','/index.php/page/index/name/flsm','zh-cn','1','0');
INSERT INTO `pa_nav` VALUES ('108','page','About us','0','49','middle','/index.php/page/eindex/name/abuy','en-us','9','0');
INSERT INTO `pa_nav` VALUES ('109','page','About doso','108','94','middle','/index.php/page/eindex/name/omfoot','en-us','8','0');
INSERT INTO `pa_nav` VALUES ('110','page','Speech','108','52','middle','/index.php/page/eindex/name/advt','en-us','7','0');
INSERT INTO `pa_nav` VALUES ('111','page','Advantage','108','55','middle','/index.php/page/eindex/name/stru','en-us','6','0');
INSERT INTO `pa_nav` VALUES ('112','page','Culture','108','56','middle','/index.php/page/eindex/name/dev','en-us','5','0');
INSERT INTO `pa_nav` VALUES ('113','page','Honor','108','57','middle','/index.php/page/eindex/name/wksp','en-us','4','0');
INSERT INTO `pa_nav` VALUES ('114','page','Structure','108','58','middle','/index.php/page/eindex/name/exh','en-us','3','0');
INSERT INTO `pa_nav` VALUES ('115','page','Development','108','59','middle','/index.php/page/eindex/name/mf','en-us','2','0');
INSERT INTO `pa_nav` VALUES ('116','page','Workshop','108','60','middle','/index.php/page/eindex/name/vod','en-us','1','0');
INSERT INTO `pa_nav` VALUES ('117','page','Exhibition','108','61','middle','/index.php/page/eindex/name/jb','en-us','5','0');
INSERT INTO `pa_nav` VALUES ('118','page','Model factory','108','62','middle','/index.php/page/eindex/name/wk','en-us','4','0');
INSERT INTO `pa_nav` VALUES ('119','page','Doso VOD','108','63','middle','/index.php/page/eindex/name/ca','en-us','3','0');
INSERT INTO `pa_nav` VALUES ('120','news','Special events','124','158','middle','/index.php/news/eindex/cid/158','en-us','2','0');
INSERT INTO `pa_nav` VALUES ('121','news','Exhibition','124','159','middle','/index.php/news/eindex/cid/159','en-us','1','0');
INSERT INTO `pa_nav` VALUES ('122','news','Sewing knowledge','124','160','middle','/index.php/news/eindex/cid/160','en-us','7','0');
INSERT INTO `pa_nav` VALUES ('123','news','Dynamic','124','3','middle','/index.php/news/eindex/cid/3','en-us','6','0');
INSERT INTO `pa_nav` VALUES ('124','news','News','0','0','middle','/index.php/news/eindex','en-us','5','0');
INSERT INTO `pa_nav` VALUES ('125','product','product','0','0','middle','/index.php/product/eindex','en-us','4','0');
INSERT INTO `pa_nav` VALUES ('126','product','Bag closer machine','125','108','middle','/index.php/product/eindex/cid/108','en-us','3','0');
INSERT INTO `pa_nav` VALUES ('127','product','Leather skiving machine','125','107','middle','/index.php/product/eindex/cid/107','en-us','2','0');
INSERT INTO `pa_nav` VALUES ('128','product','Fee-off-the-arm chainstitch machine','125','106','middle','/index.php/product/eindex/cid/106','en-us','1','0');
INSERT INTO `pa_nav` VALUES ('129','product','Zigzag sewing machine','125','105','middle','/index.php/product/eindex/cid/105','en-us','5','0');
INSERT INTO `pa_nav` VALUES ('130','product','Servo motor system','125','104','middle','/index.php/product/eindex/cid/104','en-us','4','0');
INSERT INTO `pa_nav` VALUES ('131','product','Mulit-needle sewing machine','125','103','middle','/index.php/product/eindex/cid/103','en-us','3','0');
INSERT INTO `pa_nav` VALUES ('132','product','Embroidery machine','125','102','middle','/index.php/product/eindex/cid/102','en-us','2','0');
INSERT INTO `pa_nav` VALUES ('133','product','Special/synchronized sewing machine','125','101','middle','/index.php/product/eindex/cid/101','en-us','1','0');
INSERT INTO `pa_nav` VALUES ('134','product','Interlock machine','125','100','middle','/index.php/product/eindex/cid/100','en-us','5','0');
INSERT INTO `pa_nav` VALUES ('135','product','Overlock sewing machine','125','99','middle','/index.php/product/eindex/cid/99','en-us','4','0');
INSERT INTO `pa_nav` VALUES ('136','product','Double needle sewing machine','125','98','middle','/index.php/product/eindex/cid/98','en-us','3','0');
INSERT INTO `pa_nav` VALUES ('137','product','Lockstitch sewing machine','125','97','middle','/index.php/product/eindex/cid/97','en-us','2','0');
INSERT INTO `pa_nav` VALUES ('138','product','Computerised lockstitch sewing machine','125','96','middle','/index.php/product/eindex/cid/96','en-us','1','0');
INSERT INTO `pa_nav` VALUES ('139','product','Postbed machine','125','109','middle','/index.php/product/eindex/cid/109','en-us','7','0');
INSERT INTO `pa_nav` VALUES ('140','product','Heat transfer machine','125','110','middle','/index.php/product/eindex/cid/110','en-us','6','0');
INSERT INTO `pa_nav` VALUES ('141','product','Laser cutting machine','125','111','middle','/index.php/product/eindex/cid/111','en-us','5','0');
INSERT INTO `pa_nav` VALUES ('142','product','Iron','125','112','middle','/index.php/product/eindex/cid/112','en-us','4','0');
INSERT INTO `pa_nav` VALUES ('143','product','Thread distributor','125','113','middle','/index.php/product/eindex/cid/113','en-us','3','0');
INSERT INTO `pa_nav` VALUES ('144','product','Cutting machine','125','114','middle','/index.php/product/eindex/cid/114','en-us','2','0');
INSERT INTO `pa_nav` VALUES ('145','product','Blanket overedging sewing machine','125','115','middle','/index.php/product/eindex/cid/115','en-us','1','0');
INSERT INTO `pa_nav` VALUES ('146','product','Automatic template sewing machine','125','116','middle','/index.php/product/eindex/cid/116','en-us','5','0');
INSERT INTO `pa_nav` VALUES ('147','page','Job','0','64','middle','/index.php/page/eindex/name/ts','en-us','4','0');
INSERT INTO `pa_nav` VALUES ('148','page','Job doso','147','65','middle','/index.php/page/eindex/name/ade','en-us','3','0');
INSERT INTO `pa_nav` VALUES ('149','page','Care','147','66','middle','/index.php/page/eindex/name/sc','en-us','2','0');
INSERT INTO `pa_nav` VALUES ('150','page','Talent Strategy','147','67','middle','/index.php/page/eindex/name/sa','en-us','1','0');
INSERT INTO `pa_nav` VALUES ('151','page','About delivery','147','68','middle','/index.php/page/eindex/name/sn','en-us','5','0');
INSERT INTO `pa_nav` VALUES ('152','page','Salesnet','0','69','middle','/index.php/page/eindex/name/vii','en-us','4','0');
INSERT INTO `pa_nav` VALUES ('153','page','Salesnet doso','153','70','middle','/index.php/page/eindex/name/ass','en-us','3','0');
INSERT INTO `pa_nav` VALUES ('154','page','Sales Network','153','71','middle','/index.php/page/eindex/name/dl','en-us','2','0');
INSERT INTO `pa_nav` VALUES ('155','page','VI image','153','72','middle','/index.php/page/eindex/name/vid','en-us','1','0');
INSERT INTO `pa_nav` VALUES ('156','page','After-sales service','153','73','middle','/index.php/page/eindex/name/cu','en-us','7','0');
INSERT INTO `pa_nav` VALUES ('157','page','Download','153','74','middle','/index.php/page/eindex/name/addr','en-us','6','0');
INSERT INTO `pa_nav` VALUES ('158','page','Doso VOD','153','75','middle','/index.php/page/eindex/name/fb','en-us','5','0');
INSERT INTO `pa_nav` VALUES ('159','page','Contact us','0','76','middle','/index.php/page/eindex/name/ln','en-us','4','0');
INSERT INTO `pa_nav` VALUES ('160','page','Contact','159','77','middle','/index.php/page/eindex/name/kh','en-us','3','0');
INSERT INTO `pa_nav` VALUES ('161','page','Address','159','78','middle','/index.php/page/eindex/name/ny','en-us','2','0');
INSERT INTO `pa_nav` VALUES ('162','page','Feedback','159','79','middle','/index.php/page/eindex/name/nok','en-us','1','0');
INSERT INTO `pa_nav` VALUES ('163','page','Legal Notices','159','80','middle','/index.php/page/eindex/name/retwer','en-us','5','0');
INSERT INTO `pa_nav` VALUES ('164','page','в Большой  Сен','0','81','middle','/index.php/page/rindex/name/ra','ru','4','0');
INSERT INTO `pa_nav` VALUES ('165','page','компания введение','164','82','middle','/index.php/page/rindex/name/mos','ru','3','0');
INSERT INTO `pa_nav` VALUES ('166','page','Выступление Председателя Совета','164','83','middle','/index.php/page/rindex/name/con','ru','2','0');
INSERT INTO `pa_nav` VALUES ('167','page','Omori  преимущества','164','88','middle','/index.php/page/rindex/name/ino','ru','1','0');
INSERT INTO `pa_nav` VALUES ('168','page','корпоративной культуры ','164','89','middle','/index.php/page/rindex/name/comp','ru','11','0');
INSERT INTO `pa_nav` VALUES ('169','page','компания  честь','164','90','middle','/index.php/page/rindex/name/greet','ru','10','0');
INSERT INTO `pa_nav` VALUES ('170','page','Организационная структура','164','91','middle','/index.php/page/rindex/name/oadv','ru','20','0');
INSERT INTO `pa_nav` VALUES ('171','page','Omori  след','164','92','middle','/index.php/page/rindex/name/comcul','ru','19','0');
INSERT INTO `pa_nav` VALUES ('172','page','предприятия  один  угол','164','93','middle','/index.php/page/rindex/name/hon','ru','18','0');
INSERT INTO `pa_nav` VALUES ('173','page','календарного года  выставка','164','95','middle','/index.php/page/rindex/name/enc','ru','21','0');
INSERT INTO `pa_nav` VALUES ('174','page','модели одежды  завод','164','96','middle','/index.php/page/rindex/name/shc','ru','17','0');
INSERT INTO `pa_nav` VALUES ('175','page','Omori  видео  показать','164','97','middle','/index.php/page/rindex/name/omvideo','ru','16','0');
INSERT INTO `pa_nav` VALUES ('176','product','продукт','0','0','middle','/index.php/product/rindex','ru','15','0');
INSERT INTO `pa_nav` VALUES ('177','product','Машина швейная компьютера','176','117','middle','/index.php/product/rindex/cid/117','ru','14','0');
INSERT INTO `pa_nav` VALUES ('178','product','швейная машина','176','118','middle','/index.php/product/rindex/cid/118','ru','13','0');
INSERT INTO `pa_nav` VALUES ('179','product','Двухместный машина иглы','176','119','middle','/index.php/product/rindex/cid/119','ru','12','0');
INSERT INTO `pa_nav` VALUES ('180','product','Оверлоки Швейные машины','176','120','middle','/index.php/product/rindex/cid/120','ru','11','0');
INSERT INTO `pa_nav` VALUES ('181','product','Estire máquina де Козер','176','121','middle','/index.php/product/rindex/cid/121','ru','10','0');
INSERT INTO `pa_nav` VALUES ('182','product','Специальные машины','176','122','middle','/index.php/product/rindex/cid/122','ru','9','0');
INSERT INTO `pa_nav` VALUES ('183','product','Вышивка машины','176','123','middle','/index.php/product/rindex/cid/123','ru','8','0');
INSERT INTO `pa_nav` VALUES ('184','product','Multi-игла машины','176','124','middle','/index.php/product/rindex/cid/124','ru','7','0');
INSERT INTO `pa_nav` VALUES ('185','product','Электрическое управление','176','125','middle','/index.php/product/rindex/cid/125','ru','6','0');
INSERT INTO `pa_nav` VALUES ('186','product','зигзага Козер','176','126','middle','/index.php/product/rindex/cid/126','ru','5','0');
INSERT INTO `pa_nav` VALUES ('187','product','Цюй запястье машины','176','127','middle','/index.php/product/rindex/cid/127','ru','4','0');
INSERT INTO `pa_nav` VALUES ('188','product','Пилинг машины','176','128','middle','/index.php/product/rindex/cid/128','ru','3','0');
INSERT INTO `pa_nav` VALUES ('189','product','Совместный устав','176','129','middle','/index.php/product/rindex/cid/129','ru','2','0');
INSERT INTO `pa_nav` VALUES ('190','product','Высокая головка машины','176','130','middle','/index.php/product/rindex/cid/130','ru','2','0');
INSERT INTO `pa_nav` VALUES ('191','product','Машина давления картину','176','131','middle','/index.php/product/rindex/cid/131','ru','1','0');
INSERT INTO `pa_nav` VALUES ('192','product','Лазерные машины','176','132','middle','/index.php/product/rindex/cid/132','ru','11','0');
INSERT INTO `pa_nav` VALUES ('193','product','железо','176','133','middle','/index.php/product/rindex/cid/133','ru','10','0');
INSERT INTO `pa_nav` VALUES ('194','product','автомат для резки','176','134','middle','/index.php/product/rindex/cid/134','ru','21','0');
INSERT INTO `pa_nav` VALUES ('195','product','Sub-лайн машины','176','135','middle','/index.php/product/rindex/cid/135','ru','19','0');
INSERT INTO `pa_nav` VALUES ('196','product','Ковры окантовку машины','176','136','middle','/index.php/product/rindex/cid/136','ru','20','0');
INSERT INTO `pa_nav` VALUES ('197','news','новости ','0','0','middle','/index.php/news/rindex','ru','18','0');
INSERT INTO `pa_nav` VALUES ('198','news','Большой  Сен  динамический ','197','161','middle','/index.php/news/rindex/cid/161','ru','17','0');
INSERT INTO `pa_nav` VALUES ('199','news',' Специальные мероприятия ','197','162','middle','/index.php/news/rindex/cid/162','ru','16','0');
INSERT INTO `pa_nav` VALUES ('200','news','выставка информации ','197','163','middle','/index.php/news/rindex/cid/163','ru','15','0');
INSERT INTO `pa_nav` VALUES ('201','news','швейная  знаний ','197','164','middle','/index.php/news/rindex/cid/164','ru','14','0');
INSERT INTO `pa_nav` VALUES ('202','page','людских  ресурсов','0','98','middle','/index.php/page/rindex/name/clothmf','ru','13','0');
INSERT INTO `pa_nav` VALUES ('203','page','набора персонала','202','99','middle','/index.php/page/rindex/name/coninf','ru','12','0');
INSERT INTO `pa_nav` VALUES ('204','page','уход сотрудников','202','100','middle','/index.php/page/rindex/name/eno','ru','11','0');
INSERT INTO `pa_nav` VALUES ('205','page','стратегии талантов','202','101','middle','/index.php/page/rindex/name/pdle','ru','10','0');
INSERT INTO `pa_nav` VALUES ('206','page','введение  доставки','202','102','middle','/index.php/page/rindex/name/Sal','ru','9','0');
INSERT INTO `pa_nav` VALUES ('207','page','центр обслуживания','0','103','middle','/index.php/page/rindex/name/ven','ru','8','0');
INSERT INTO `pa_nav` VALUES ('208','page','глобальная сеть продаж','207','104','middle','/index.php/page/rindex/name/lcdle','ru','7','0');
INSERT INTO `pa_nav` VALUES ('209','page','внутренние продажи  сети','207','105','middle','/index.php/page/rindex/name/hon','ru','6','0');
INSERT INTO `pa_nav` VALUES ('210','page','VI','207','106','middle','/index.php/page/rindex/name/eso','ru','5','0');
INSERT INTO `pa_nav` VALUES ('211','page','послепродажное обслуживание','207','107','middle','/index.php/page/rindex/name/hdo','ru','4','0');
INSERT INTO `pa_nav` VALUES ('212','page','Omori  загрузки данных','207','108','middle','/index.php/page/rindex/name/ese','ru','3','0');
INSERT INTO `pa_nav` VALUES ('213','page','Центр  видео','207','109','middle','/index.php/page/rindex/name/mec','ru','2','0');
INSERT INTO `pa_nav` VALUES ('214','page','обращаться к нам','0','110','middle','/index.php/page/rindex/name/mdrdf','ru','1','0');
INSERT INTO `pa_nav` VALUES ('215','page','контакты','214','111','middle','/index.php/page/rindex/name/infdc','ru','3','0');
INSERT INTO `pa_nav` VALUES ('216','page','географическое положение','214','112','middle','/index.php/page/rindex/name/rh','ru','11','0');
INSERT INTO `pa_nav` VALUES ('217','page','онлайн  обратной связи','214','113','middle','/index.php/page/rindex/name/recl','ru','10','0');
INSERT INTO `pa_nav` VALUES ('218','page','Закон  заявление','214','114','middle','/index.php/page/rindex/name/aae','ru','21','0');
INSERT INTO `pa_nav` VALUES ('219','page','En el gran Sen','0','115','middle','/index.php/page/sindex/name/edt','spain','20','0');
INSERT INTO `pa_nav` VALUES ('220','page','El perfil de la empresa','219','116','middle','/index.php/page/sindex/name/re','spain','19','0');
INSERT INTO `pa_nav` VALUES ('221','page','Presidente.','219','117','middle','/index.php/page/sindex/name/hre','spain','18','0');
INSERT INTO `pa_nav` VALUES ('222','page','gran ventaja Sen','219','118','middle','/index.php/page/sindex/name/rt','spain','17','0');
INSERT INTO `pa_nav` VALUES ('223','page','La cultura de la empresa','219','119','middle','/index.php/page/sindex/name/eca','spain','16','0');
INSERT INTO `pa_nav` VALUES ('224','page','honor.','219','120','middle','/index.php/page/sindex/name/rd','spain','15','0');
INSERT INTO `pa_nav` VALUES ('225','page','La estructura de la organización','219','121','middle','/index.php/page/sindex/name/bo','spain','14','0');
INSERT INTO `pa_nav` VALUES ('226','page','gran huella Sen','219','122','middle','/index.php/page/sindex/name/npo','spain','13','0');
INSERT INTO `pa_nav` VALUES ('227','page','Empresas de un ángulo','219','123','middle','/index.php/page/sindex/name/npb','spain','12','0');
INSERT INTO `pa_nav` VALUES ('228','page','La exposición a lo largo de los años','219','124','middle','/index.php/page/sindex/name/omp','spain','11','0');
INSERT INTO `pa_nav` VALUES ('229','page','Modelo de fábricas de prendas de vestir','219','125','middle','/index.php/page/sindex/name/kyk','spain','10','0');
INSERT INTO `pa_nav` VALUES ('230','page','Omori video muestra','219','126','middle','/index.php/page/sindex/name/aggtm','spain','9','0');
INSERT INTO `pa_nav` VALUES ('231','news','Noticias','0','0','middle','/index.php/news/sindex','spain','8','0');
INSERT INTO `pa_nav` VALUES ('232','news','La gran dinámica de Sen','231','165','middle','/index.php/news/sindex/cid/165','spain','7','0');
INSERT INTO `pa_nav` VALUES ('233','news','El tema de la actividad','231','166','middle','/index.php/news/sindex/cid/166','spain','6','0');
INSERT INTO `pa_nav` VALUES ('234','news','La exposición de la información','231','167','middle','/index.php/news/sindex/cid/167','spain','5','0');
INSERT INTO `pa_nav` VALUES ('235','news','De conocimientos','231','168','middle','/index.php/news/sindex/cid/168','spain','4','0');
INSERT INTO `pa_nav` VALUES ('236','product','Por subespecie','257','137','middle','/index.php/product/sindex/cid/137','spain','3','0');
INSERT INTO `pa_nav` VALUES ('237','product','pespunte máquina de coser','257','138','middle','/index.php/product/sindex/cid/138','spain','2','0');
INSERT INTO `pa_nav` VALUES ('238','product','Máquina de coser overlock','257','139','middle','/index.php/product/sindex/cid/139','spain','1','0');
INSERT INTO `pa_nav` VALUES ('239','product','Estire máquina de coser','257','140','middle','/index.php/product/sindex/cid/140','spain','11','0');
INSERT INTO `pa_nav` VALUES ('240','product','Máquina especial, máquina sincronizada','257','141','middle','/index.php/product/sindex/cid/141','spain','10','0');
INSERT INTO `pa_nav` VALUES ('241','product','Multi-aguja de la máquina','257','142','middle','/index.php/product/sindex/cid/142','spain','21','0');
INSERT INTO `pa_nav` VALUES ('242','product','zigzag coser','257','143','middle','/index.php/product/sindex/cid/143','spain','20','0');
INSERT INTO `pa_nav` VALUES ('243','product','Máquina de corte, máquina de corte','257','144','middle','/index.php/product/sindex/cid/144','spain','19','0');
INSERT INTO `pa_nav` VALUES ('244','product','hierro','257','145','middle','/index.php/product/sindex/cid/145','spain','18','0');
INSERT INTO `pa_nav` VALUES ('245','product','Laser máquina','257','146','middle','/index.php/product/sindex/cid/146','spain','17','0');
INSERT INTO `pa_nav` VALUES ('246','product','Sub-línea de la máquina','257','147','middle','/index.php/product/sindex/cid/147','spain','16','0');
INSERT INTO `pa_nav` VALUES ('247','product','máquina de bordar','257','148','middle','/index.php/product/sindex/cid/148','spain','15','0');
INSERT INTO `pa_nav` VALUES ('248','product','Qu máquina muñeca','257','149','middle','/index.php/product/sindex/cid/149','spain','15','0');
INSERT INTO `pa_nav` VALUES ('249','product','Alfombra Canteadora','257','150','middle','/index.php/product/sindex/cid/150','spain','14','0');
INSERT INTO `pa_nav` VALUES ('250','product','Computer máquina de coser','257','151','middle','/index.php/product/sindex/cid/151','spain','13','0');
INSERT INTO `pa_nav` VALUES ('251','product','carta conjunta','257','152','middle','/index.php/product/sindex/cid/152','spain','12','0');
INSERT INTO `pa_nav` VALUES ('252','product','High-cabeza de la máquina','257','153','middle','/index.php/product/sindex/cid/153','spain','11','0');
INSERT INTO `pa_nav` VALUES ('253','product','máquina de doble aguja','257','154','middle','/index.php/product/sindex/cid/154','spain','10','0');
INSERT INTO `pa_nav` VALUES ('254','product','Peeling máquina','257','155','middle','/index.php/product/sindex/cid/155','spain','9','0');
INSERT INTO `pa_nav` VALUES ('255','product','Presión máquina de pintar','257','156','middle','/index.php/product/sindex/cid/156','spain','8','0');
INSERT INTO `pa_nav` VALUES ('256','product','Ahorro de energía de control eléctrico','257','157','middle','/index.php/product/sindex/cid/157','spain','7','0');
INSERT INTO `pa_nav` VALUES ('257','product','Los productos','0','0','middle','/index.php/product/sindex','spain','6','0');
INSERT INTO `pa_nav` VALUES ('258','page','Los recursos humanos','0','127','middle','/index.php/page/sindex/name/aggym','spain','5','0');
INSERT INTO `pa_nav` VALUES ('259','page','La contratación de personal','258','128','middle','/index.php/page/sindex/name/aggjm','spain','4','0');
INSERT INTO `pa_nav` VALUES ('260','page','Personal de atención','258','129','middle','/index.php/page/sindex/name/aggmh','spain','3','0');
INSERT INTO `pa_nav` VALUES ('261','page','La estrategia de recursos humanos','258','130','middle','/index.php/page/sindex/name/aghgm','spain','2','0');
INSERT INTO `pa_nav` VALUES ('262','page','La introducción de entrega','258','131','middle','/index.php/page/sindex/name/agwgm','spain','1','0');
INSERT INTO `pa_nav` VALUES ('263','page','El Centro de servicios','0','132','middle','/index.php/page/sindex/name/jhkus','spain','50','0');
INSERT INTO `pa_nav` VALUES ('264','page','Red de ventas global','263','133','middle','/index.php/page/sindex/name/jhksus','spain','50','0');
INSERT INTO `pa_nav` VALUES ('265','page','La red de ventas','263','134','middle','/index.php/page/sindex/name/jhhkus','spain','50','0');
INSERT INTO `pa_nav` VALUES ('266','page','La imagen de la empresa.','263','135','middle','/index.php/page/sindex/name/uerwqs','spain','50','0');
INSERT INTO `pa_nav` VALUES ('267','page','Servicios de post - venta','263','136','middle','/index.php/page/sindex/name/jhkukus','spain','50','0');
INSERT INTO `pa_nav` VALUES ('268','page','Omori descarga de datos','263','137','middle','/index.php/page/sindex/name/jhkwqus','spain','50','0');
INSERT INTO `pa_nav` VALUES ('269','page','Centro de vídeo','263','138','middle','/index.php/page/sindex/name/jhnjkus','spain','50','0');
INSERT INTO `pa_nav` VALUES ('270','page','en contacto con nosotros','0','139','middle','/index.php/page/sindex/name/consd','spain','50','0');
INSERT INTO `pa_nav` VALUES ('271','page','Medios de contacto','270','140','middle','/index.php/page/sindex/name/cofnsd','spain','50','0');
INSERT INTO `pa_nav` VALUES ('272','page','La ubicación geográfica','270','141','middle','/index.php/page/sindex/name/cjonsd','spain','50','0');
INSERT INTO `pa_nav` VALUES ('273','page','Información en línea','270','142','middle','/index.php/page/sindex/name/conskd','spain','50','0');
INSERT INTO `pa_nav` VALUES ('274','page','La Declaración de la ley','270','143','middle','/index.php/page/sindex/name/conesd','spain','50','0');


# 数据库表：pa_news 数据信息
INSERT INTO `pa_news` VALUES ('19','1','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌”','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌','为客户提供大森的相关的企业资讯，让客户更了解【贪吃宝贝】','1','　中国梦•品牌梦——10月21日大森全自动模板机相约浦东，大森凭借专业和专注的精神与行业买家相聚浦东嘉里大酒店共享自动化缝制的喜悦，大森人勇于开拓，勇于创新，执着追求，致力于缝制自动化及智能化的研发和创新，一路走来十五年，一路坚信与拼搏十五年。　　大森人孜孜不倦辛劳的付出，同时欣喜收获 “用户优选十大缝纫机潜力品牌”甚感动力与责任，让我们的自动化更好地服务于世界服装生产领域，让我们相约11月11-…','1436936280','1436936432','<p>
	　中国梦•品牌梦——10月21日大森全自动模板机相约浦东，大森凭借专业和专注的精神与行业买家相聚浦东嘉里大酒店共享自动化缝制的喜悦，大森人勇于开拓，勇于创新，执着追求，致力于缝制自动化及智能化的研发和创新，一路走来十五年，一路坚信与拼搏十五年。
</p>
<p>
	　　大森人孜孜不倦辛劳的付出，同时欣喜收获 
“用户优选十大缝纫机潜力品牌”甚感动力与责任，让我们的自动化更好地服务于世界服装生产领域，让我们相约11月11-13日台州国际博览中心 
展位号：AT12大森自动化缝纫机期待您莅临分享与指导!
</p>
<img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125733_84207.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125733_60388.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125733_62866.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125733_22041.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125733_20703.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125733_33106.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125733_24826.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125734_25597.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125734_42379.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125734_49133.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125734_99401.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125734_46504.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125734_17954.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125734_30898.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125734_88500.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125734_36433.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125735_85259.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125735_81402.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125735_68658.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125750_94179.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715125750_87687.jpg" alt="" />','18','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('20','1','台州市弘硕电子商务有限公司成立十二周年暨新品发布会全国经销商合影','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌”','为客户提供大森的相关的企业资讯，让客户更了解【贪吃宝贝】','1','　　台州市弘硕电子商务有限公司成立十二周年暨新品发布会全国经销商合影。','1436936422','','<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/heying.jpg" width="700" height="284" />
<p>
	　　台州市弘硕电子商务有限公司成立十二周年暨新品发布会全国经销商合影。
</p>','19','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('21','1','2012台州国际缝制设备展览会','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌”','为客户提供大森的相关的企业资讯，让客户更了解【贪吃宝贝】','1','　　公司副总经理：阮林峰(左1)，被邀请为中国(台州)国际缝制设备展览会特别嘉宾.　　大森展台人流涌动，颇受客户欢迎.　　总经理叶仙冲先生(右)接收协会记着团采访。　　总经理叶仙冲先生(右)与客户之间亲密洽谈。　　总经理叶先生为客户详细介绍机器功能。　　业务经理李先生为客户演示机器性能(右1)。　　官方模特持我司商标走秀　　公司节能电机系列展台。　　外贸业务员与还外客户洽谈。　　技术员为客户详细解…','1436936504','1436936512','<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image001.jpg" width="553" height="369" /> 
<p>
	　　公司副总经理：阮林峰(左1)，被邀请为中国(台州)国际缝制设备展览会特别嘉宾.
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image002.jpg" width="553" height="369" /> 
<p>
	　　大森展台人流涌动，颇受客户欢迎.
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image003.jpg" width="553" height="369" /> 
<p>
	　　总经理叶仙冲先生(右)接收协会记着团采访。
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image004.jpg" width="553" height="369" /> 
<p>
	　　总经理叶仙冲先生(右)与客户之间亲密洽谈。
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image005.jpg" width="553" height="369" /> 
<p>
	　　总经理叶先生为客户详细介绍机器功能。
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image006.jpg" width="553" height="369" /> 
<p>
	　　业务经理李先生为客户演示机器性能(右1)。
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image007.jpg" width="553" height="369" /> 
<p>
	　　官方模特持我司商标走秀
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image008.jpg" width="553" height="369" /> 
<p>
	　　公司节能电机系列展台。
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image009.jpg" width="553" height="369" /> 
<p>
	　　外贸业务员与还外客户洽谈。
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image010.jpg" width="553" height="369" /> 
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image011.jpg" width="553" height="369" /> 
<p>
	　　技术员为客户详细解说我司产品性能与特点。
</p>','19','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('22','1','浅谈自动化缝纫机的发展','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌”','为客户提供大森的相关的企业资讯，让客户更了解【贪吃宝贝】','1','　　服装业工艺需求千变万化，全自动缝纫机不仅造价太高，其适用范围往往受到服装工艺的限制，而不能将其各项优势发挥到极致。而反观半自动缝纫机，对服装工艺的适应性较强，造价相对低廉，在用户可承受的范围之内，因此近年来受到服装企业等客户的普遍欢迎。　　从缝纫机的发展历史来看，人们一直希望发明功能强大的缝纫机代替普通缝纫机，把人们从繁重的劳动中解脱出来，解决用工紧张的实际矛盾;从缝纫机发展的趋势来看，这种缝…','1436936718','1436936815','<p>
	　　服装业工艺需求千变万化，全自动缝纫机不仅造价太高，其适用范围往往受到服装工艺的限制，而不能将其各项优势发挥到极致。而反观半自动缝纫机，对服装工艺的适应性较强，造价相对低廉，在用户可承受的范围之内，因此近年来受到服装企业等客户的普遍欢迎。
</p>
<p>
	　　从缝纫机的发展历史来看，人们一直希望发明功能强大的缝纫机代替普通缝纫机，把人们从繁重的劳动中解脱出来，解决用工紧张的实际矛盾;从缝纫机发展的趋势来看，这种缝纫机有两种趋势：一种是全自动缝制设备，另一种是半自动缝制设备;而从实际使用效果来看，全自动缝纫机在激烈的市场竞争中不如半自动缝纫机有优势;从理论推断上看，缝纫机设备的自动化程度越高，操作越简便，理应越受欢迎。
</p>
<p>
	　　但现实给出的结果是：服装业工艺需求千变万化，全自动缝纫机不仅造价太高，其适用范围往往受到服装工艺的限制，而不能将其各项优势发挥到极致。
</p>
<p>
	　　而反观半自动缝纫机，对服装工艺的适应性较强，造价相对低廉，在用户可承受的范围之内，因此近年来受到服装企业等客户的普遍欢迎。
</p>
<p>
	　　全自动缝纫机特点
</p>
<p>
	　　众所周知，由操作人员将缝料放到合适的位置并按开始键，缝制机械就可以自动完成缝纫过程。缝纫过程完成后，全自动缝纫机进行剪线并通过收料系统将缝料依次叠放整齐。如果更进一步的话，设备的循环上料环节也可以自动完成。
</p>
<p>
	　　一般情况下，一名操作人员可以操作2台至3台全自动缝纫机设备。全自动缝纫机的特点为：工作人员将布料放好，按开始键，机械自动控制布料，缝制完剪线后将缝制品依次叠好;一个缝纫循环可以完成比较复杂的缝纫过程;缝纫机自动拣起布料，能感知有无布料，自动放好并完成缝制品;部分机器还带有循环上料系统。
</p>
<p>
	　　此外，全自动缝纫机的机器本身有较强的针对性，生产效率高、缝纫质量好。如：开袋机、贴袋机等。
</p>
<p>
	　　半自动缝纫机特点
</p>
<p>
	　　由操作人员将缝料放到缝纫位置附近放好，并通过脚踩半自动缝纫机的启动按钮或通过感应装置自动启动，在人工辅助下完成缝纫过程。缝纫过程完成后，半自动缝纫机进行剪线并人工收料。
</p>
<p>
	　　一般情况下，一名操作人员可以操作1台设备半自动缝纫机。据笔者总结，半自动缝纫机的特点有：半自动缝纫机需要操作人员将缝料放到缝纫位置附近放好;整个缝纫过程在人工辅助下完成;具备自动切线等装置。
</p>
<p>
	　　半自动缝纫机同样具有生产效率高、缝纫质量好等优点，如：自动包缝机、自动花样机等。
</p>','20','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('23','1','平缝机布料走动不规则调整','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌”','为客户提供大森的相关的企业资讯，让客户更了解【贪吃宝贝】','1','　　在使用缝纫机缝制衣料过程中，有时出现衣料运动速度不均匀，针迹时长时短的不规则现象。　　对于这种故障现象，笔者分析，衣料走动全靠送布牙和压脚的配合向前输送，因此，当衣料出现上述不规则运动时，我们就可以断定是牙齿和压脚发生了故障或压力调节不当。如压脚压力太小，压不紧布料，就会造成走动不规则。这时我们只要把调压螺丝向下旋动，以压紧衣料。　　另外，压脚太高，平缝机压脚同样无法压住衣料，也会造成衣料任意&hellip;','1436936807','','<p>
	<span>　　</span>在使用缝纫机缝制衣料过程中，有时出现衣料运动速度不均匀，针迹时长时短的不规则现象。
</p>
<p>
	　　对于这种故障现象，笔者分析，衣料走动全靠送布牙和压脚的配合向前输送，因此，当衣料出现上述不规则运动时，我们就可以断定是牙齿和压脚发生了故障或压力调节不当。如压脚压力太小，压不紧布料，就会造成走动不规则。这时我们只要把调压螺丝向下旋动，以压紧衣料。
</p>
<p>
	　　另外，压脚太高，平缝机压脚同样无法压住衣料，也会造成衣料任意走动，或者根本不走动。调整时，我们应该先把压脚扳手抬起，松开导架螺丝，再把压脚杆由上向下打动，使压脚与针板的距离调整到7mm-8mm的高度以后，随即把螺丝拧紧，再开车使用。
</p>
<p>
	　　值得注意的是，还有一种原因：是由于平缝机的牙齿螺丝松动，运转时造成牙齿左右摇动，使衣料也不能有规则地向前移动。对此，我们建议的处理方法是：我们将平缝机的针板卸下来，并把两个牙齿螺丝拧紧。拧紧后，我们可以把针板安装好，检查一下牙齿两边，是否一与针板槽的边沿发生磨擦。如果有磨擦，那么会引起杂音和机重现象，这时只有再卸去针板，松开牙齿螺丝，把牙齿位置调整到针板槽的中间，拧紧牙齿螺丝以后，再装好针板。
</p>','21','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('24','1','我国缝纫机专业市场期待更多转行升级','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌” ','为客户提供大森的相关的企业资讯，让客户更了解【贪吃宝贝】','1','　　作为世界最大的缝制机械生产国，我国缝机的年产量占到了世界缝机总产量的八成以上。　　20世纪90年代，国内已有了对缝制机械行业专业化市场的探索。随着服装产业的发展，主要的服装产区对缝制机械的需求大幅增长，因而各种形式的缝机售卖市场不断涌现。　　目前，业内具有一定规模和影响力的缝机专业市场有：东阳市虎鹿镇的浙江缝配城、上海服装机械城、广州(国际)缝制设备城、“仕多宝”缝纫机城等等;服装产业的兴旺发&hellip;','1436936887','','<p>
	　　作为世界最大的缝制机械生产国，我国缝机的年产量占到了世界缝机总产量的八成以上。
</p>
<p>
	　　20世纪90年代，国内已有了对缝制机械行业专业化市场的探索。随着服装产业的发展，主要的服装产区对缝制机械的需求大幅增长，因而各种形式的缝机售卖市场不断涌现。
</p>
<p>
	　　目前，业内具有一定规模和影响力的缝机专业市场有：东阳市虎鹿镇的浙江缝配城、上海服装机械城、广州(国际)缝制设备城、“仕多宝”缝纫机城等等;服装产业的兴旺发展推动着缝机专业市场的建设，越来越多的缝机专业市场正在兴建或筹建中———2008年4月18日，福建缝制设备专业市场(“海博会”缝制设备馆)正式揭牌。该市场坐落于石狮市最著名的服装城商圈内，总建筑面积达25万平方米。目前，该市场首期6000多平方米的展馆面积已被全部预定，30余家缝制设备厂商签订了入驻协议。
</p>
<p>
	　　而2008年春动工的“北京国际服装设备轻纺城”则着力打造“航母”级的现代化缝制设备轻纺城。有关负责人表示，该“城”为纺织服装行业和缝制机械行业研制开发新技术、新产品的同时，将更好地为“三北”地区的市场服务，推动“三北”地区纺织服装行业和缝制机械行业的发展，并辐射东南亚和周边国际市场。
</p>
<p>
	　　此外，正在建设中的专业市场还有东阳国际缝制机械市场、浙江义乌原材料机械市场等。
</p>
<p>
	　　毫无疑问，越来越多的专业市场的起用和兴建，为众多的缝机企业开拓市场提供了机会和更多的空间，它对我国缝机商业设施的改造，商业环境的改善和商业文化的建设，以及提升市场的管理和服务，增强应对国际市场竞争的能力等，都起到了积极促进作用。
</p>
<p>
	　　目前，国内缝机专业市场还不成熟，仍然需要慢慢培育。在过去短短十几年的发展过程中，缝机专业市场建设出现了许多问题。
</p>
<p>
	　　缝机专业市场的建设是一个持久的、发展的过程。有的投资者缺乏长远目光，仅把市场做为地产项目，为销售而开发。市场成形后，对于如何发展缺乏考虑。
</p>
<p>
	　　纵观投资行业专业市场的建设者。可以分为两类：一类是以投资地产开发为主的房地产开发商。他们看到了缝机行业的大好前景，便积极地把缝机专业市场和房地产开发结合起来。这类投资者多数是在开发、建设、销售后就完全退出市场后期管理，转向其他的项目。另一类投资者本身就是缝机制造商或者经销商，他们在经营中发现行业利润空间越来越小，便开始尝试进入潜力巨大的专业市场。
</p>
<p>
	　　缝机专业市场在建设中存在着盲目性、市场发展不平衡、重复建设、同质化竞争等问题。日前，当笔者在义乌原材料机械市场走访一些缝机经销商家时就了解到，大家都认为义乌本地的缝机市场很小。把“近邻”东阳缝配市场的关系网及客商吸引过来，才是市场兴旺的动力源泉。而据了解，借助义乌小商品商圈的优势，一个新的缝机专业市场正在兴建中。
</p>
<p>
	　　尽管缝机专业市场的发展还处于培育阶段，但随着行业由热到冷的转变以及金融危机带来的影响，不管是传统的还是正在兴建的专业市场，都面临着提升竞争力的问题。
</p>
<p>
	　　缝制设备专业化市场能够提供一站式采购，它品种丰富、门类齐全，既能基本满足国内需求，又有一定的国际竞争能力。随着人类科技进步，社会化分工越来越细，客户的利益需求、市场竞争的需要、新经济模式的多元化呼唤专业化市场通路的诞生，专业化市场销售模式成为一种必然。
</p>
<p>
	　　我们有理由期待，专业市场能为行业培育出民族品牌，做出效益。同时，我们也希望在不久的将来随着专业市场成熟和发展，能使国产缝制机械在国内外市场上大放异彩。
</p>','34','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('25','1','我国缝纫机出口及国际市场需求','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌” ','为客户提供大森的相关的企业资讯，让客户更了解【贪吃宝贝】','1','　　从市场现状看发展　　从产品出口来看，国际市场对缝纫机整机的需求仍将集中于工业缝纫机方面，绣花机出口很可能持续走低。另一方面，美国金融危机影响还将持续，这意味着美国及部分欧洲国家对家用缝纫机的购买欲望还将受到压制，家用机出口增幅将持续下滑。而零部件方面，我国产品“物美价廉”的优势将进一步影响市场，其出口预计还将呈现两位数增长。就目前形势而言，今年下半年国际纺织服装市场的巨大需求依然存在，从市场区&hellip;','1436936955','','<p>
	　　从市场现状看发展
</p>
<p>
	　　从产品出口来看，国际市场对缝纫机整机的需求仍将集中于工业缝纫机方面，绣花机出口很可能持续走低。另一方面，美国金融危机影响还将持续，这意味着美国及部分欧洲国家对家用缝纫机的购买欲望还将受到压制，家用机出口增幅将持续下滑。而零部件方面，我国产品“物美价廉”的优势将进一步影响市场，其出口预计还将呈现两位数增长。就目前形势而言，今年下半年国际纺织服装市场的巨大需求依然存在，从市场区域来看，部分发展中国家和地区纺织服装产业的发展使其对缝制机械的需求持续增长，并将直接带动我国缝机出口增长。但下半年，我国缝机出口的增幅不会大幅上升，预计仍将保持个位数增幅。
</p>
<p>
	　　亚洲：零部件出口稳步上升
</p>
<p>
	　　亚洲是我国主要的缝机出口市场，其出口份额占全国出口总额的一半以上。出口地区集中于印度、日本，以及中国香港，分别位居我国第一、三、五大出口市场。
</p>
<p>
	　　下半年，我国对亚洲市场的出口将仍以工业机和绣花机等整机产品为主，但由于近期印度市场调整、越南经济不景气、泰国政治环境不稳定等影响，工业机及绣花机需求将有一定幅度的下滑。家用机方面，日本市场需求的回升直接促进了家用机市场的回暖。零部件方面，新加坡等转口加工市场的复苏将有力地保障我国出口的稳步上升，预计增幅将保持在两位数。
</p>
<p>
	　　非洲：工业机需求迅涨
</p>
<p>
	　　非洲缝机市场于近年兴起，随着尼日利亚、埃及等国服装业的快速发展，其对缝机需求与日俱增，尤其是对工业缝纫机需求不断增长。
</p>
<p>
	　　近年来，非洲部分国家经济快速发展，尤其是尼日利亚、埃及等国传统纺织服装业发展日新月异，随着对欧美出口订单的增加，非洲将加快引进缝制机械，而“物美价廉”的中国产品将成为非洲纺织服装企业的首选。下半年，我国对非洲尼日利亚、埃及等市场的出口重心还将放在工业机、绣花机等工业设备上，而零部件由于现有设备的定期维修及少数整机加工厂的采购还将呈现出两位数的增长。
</p>
<p>
	　　欧洲：绣花机出口持续升温
</p>
<p>
	　　我国对欧洲的出口向来以家用机为主，但近年欧洲对家用缝纫机的需求锐减，而对绣花机的需求却不断增长，尤其是帽绣机等特种绣花机。目前，我国对欧洲绣花机出口集中于意大利、俄罗斯、德国等国。
</p>
<p>
	　　南美洲：出口全面快速增长
</p>
<p>
	　　我国对南美洲缝制机械产品的出口集中于巴西等国，其中我国对巴西的出口额占对南美洲出口总额的近一半。
</p>
<p>
	　　2007年底至今，南美的巴西、阿根廷等国纺织服装市场迅速发展，对工业机、零部件的需求明显增强，而中国产品的性价比优势成为南美企业的购买首选。下半年，南美的经济大环境不会发生变化，而巴西、阿根廷等国纺织服装市场的高速发展还将继续保持，预计南美缝机出口市场仍将全面开花，迎来我国出口小高潮。
</p>
<p>
	　　北美洲：家用机需求回暖
</p>
<p>
	　　我国出口北美洲的缝机产品以家用机为主，出口集中于美国。原因是金融危机，家庭主妇只好在家里自己做点东西，减少开支。造成美家用机市场需求日渐升温，家用机购买呈现回暖迹象。预计下半年以美国为主的北美市场家用机需求将会继续回暖。
</p>','30','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('26','2','如何科学调试三针五线绷缝机','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌” ','为客户提供大森的相关的企业资讯，让客户更了解【贪吃宝贝】','1','　　在调试三针五线绷缝机之前，首先，我们要确认机器精度符合使用要求。对于配合间隙离出厂状态相差较大的设备，要先更换原厂正宗合格零件，使机器精度保持在比较接近出厂时的状态。然后可依据使用说明书的要求检查各部位的定位尺寸以及相互的配合时机。　　下面，笔者根据个人经验，对使用说明书中调整要求的重点整理和补充(有的提法可能与说明书中叙述有所出入)。　　机针与弯针配合时机的调整　　机针与弯针配合时机的调整中…','1436937116','1436937234','<p>
	　　在调试三针五线绷缝机之前，首先，我们要确认机器精度符合使用要求。对于配合间隙离出厂状态相差较大的设备，要先更换原厂正宗合格零件，使机器精度保持在比较接近出厂时的状态。然后可依据使用说明书的要求检查各部位的定位尺寸以及相互的配合时机。
</p>
<p>
	　　下面，笔者根据个人经验，对使用说明书中调整要求的重点整理和补充(有的提法可能与说明书中叙述有所出入)。
</p>
<p>
	　　机针与弯针配合时机的调整
</p>
<p>
	　　机针与弯针配合时机的调整中，最为重要也最容易被人忽略的是，当机针下降到最低点时弯针必须向右移动到最远的极限位置，同样当机针上升到最高点时弯针必须向左移动到最远的极限位置，这要反复观察确认。
</p>
<p>
	　　除了有左右的动作，弯针还有前(朝向操作者)后(远离操作者)的动作。这时我们要注意使弯针前后移动最快的时候放在弯针左右移动的极限位置，要使弯针前后移动的动作在弯针向左移动到达机针位置时达到最小。
</p>
<p>
	　　此时，我们要注意兼顾左右极限位置，既要防止弯针向左移动时刮蹭机针，又要防止弯针向右移动时刮蹭机针过多。当然，我们还可以配合调节弯针前后移动量大小和稍微顺时针旋转一点针杆角度来达到最佳效果。有的机器可以调整弯针前后移动的范围，有的机器则不能。
</p>
<p>
	　　当机针下降到最低位置时，弯针尖距离右机针为3mm-4mm。当机针上升，弯针向左移动，弯针尖到达右机针中心时弯针尖下面位于机针针眼上边2.5mm。此时弯针与机针之间的间隙为0~0.05mm。
</p>
<p>
	　　当机针下降到达弯针背面时，使左机针针眼和弯针头部穿线孔相遇。此时，允许弯针背面轻微接触机针，但最好不刮蹭，或越轻微越好。
</p>
<p>
	　　前后护针的调整
</p>
<p>
	　　调整前后护针需要遵循的原则是：前后护针从操作者方向看上轮廓线应与机针针尖的连线一致，为了防止机针抖动扎在护针上，护针靠近机针的一侧应适当倒角。前面(靠近操作者)的护针既要起护针作用也同时起阻挡缝纫线在机针针眼前面(靠近操作者)形成线环，使机针针眼后面的线环顺利形成的作用。后护针既要起护针的作用又不可以阻挡线环的顺利形成。
</p>
<p>
	　　由于生产企业的不同和机器型号的差异，前后护针的形状、可允许调整范围的不同与理想状态存在一定差距，要求维修人员在具体情况下尽可能地向需要遵循的原则靠拢。
</p>
<p>
	　　当机针向下移动时，前后护针要向远离机针方向移动;当机针从最低位置上升时，前后护针要向靠近机针方向移动。
</p>
<p>
	　　当机针下降到护针位置时，护针应躲开机针，避免与机针刮蹭。
</p>
<p>
	　　此外，当弯针尖向左移动到右机针位置时，前后护针起作用，前(靠近操作者一侧)护针与机针之间的间隙为0.1mm-0.3mm，后护针与机针之间的间隙为0~0.1mm。
</p>
<p>
	　　弯针线挑线凸轮的调整
</p>
<p>
	　　弯针线挑线凸轮因为各厂设计而有所不同，有的与实际需要的大小和形状可能有些差距，差距过大也容易造成跳线和增加维修难度。
</p>
<p>
	　　弯针线挑线凸轮的作用是：当弯针向左移动时适时地给弯针提供它移动和编织线迹需要的缝纫线的线量，当弯针向右移动时适时地收回多余的缝纫线。
</p>
<p>
	　　需要特别注意的是：为了便于机针进入弯针背面的三角线环，需要借助弯针线挑线凸轮在机针进入三角线环时，使弯针线处于紧张的状态。但是紧张过度会造成弯针线断线和在缝料背面显得弯针线过紧。
</p>
<p>
	　　弯针线挑线凸轮的正确调整标准是：当机针向下，左机针针尖到达弯针下沿，也就是正好稳妥进入三角线环时，弯针线挑线凸轮上的弯针线位于挑线凸轮的最高点。
</p>
<p>
	　　弯针线挑线凸轮快慢可以在上述标准的基础上做轻微调整，按照自身旋转方向调快则缝料背面的线迹显得弯针线张力较为松弛，反之，则显得弯针线张力较紧。
</p>
<p>
	　　绷针和绷针过线板的调整
</p>
<p>
	　　有些品牌的机器，绷针与机针的配合时机可以调整。例如通宇F007三针五线绷缝机就可以通过调整绷针凸轮(F00710004)相对于上轴前节(F00708001)的角度来达到调整绷针与机针的配合时机的目的。最佳的配合时机是，当机针下降以后，右机针进入绷针线环时绷针才开始向右移动。
</p>
<p>
	　　绷针摆动幅度必须确保：当绷针摆动到最右极限位置向左返回时能钩住绷针线，当绷针摆动到最左边时绷针尖到左针的距离为4.5mm-5.5mm。
</p>
<p>
	　　绷针的安装高度应尽可能靠上，但是绷针上面和绷针过线板下面之间的间隙应能使绷针线顺利通过。
</p>
<p>
	　　绷针过线板的安装高度应能使绷针线在机针上升到最高点时，在右机针下顺畅的滑到右机针针尖的后面(远离操作者一侧)，使右机针下降时容易地别住绷针线。
</p>
<p>
	　　当绷针尖摆动到左机针前面时，左机针与绷针尖之间的间隙应为0.5mm-0.8mm。
</p>
<p>
	　　送布动作的协调
</p>
<p>
	　　绷缝机准确的送布动作可以降低跳针现象出现的概率。影响设备的日常送布动作主要跟送布牙高度、压脚压力、差动送布、针距密度、使用速度密切相关。
</p>
<p>
	　　提出这一条的主要理论是：弯针背面三角线环的稳定取决于送布动作的稳定和挑线凸轮的正确配合。如果送布动作不稳定，三角线环就会变形或者忽大忽小，使机针不能进入三角线环。
</p>
<p>
	　　调整送布牙高度要掌握的原则是：当送布动作完成时送布牙要完全从针板下面返回，任何使缝料倒退的动作都不许有。压脚压力要保证缝料没有往操作者一侧打滑的动作。缝制弹性大的缝料或操作者往怀里拉缝料的力量过大时，我们都要加大设备差动送布量。针距小三角线环也小，所以密度要适当，并且在可能的范围内宜大不宜小。速度过快会使缝料发飘或瞬间没有被压脚压住，从而影响线环的稳定。
</p>
<p>
	<p>
		　　　　随着信息时代的到来，电脑缝制设备越来越冲击着旧式的纯机械设备，维修人员也愈来愈急需了解、掌握保养与维护这种设备的新技术。对此，企业深感不安，维修人员心急失魂，笔者也是一个修理工，对此同样感触很深，特将近10年来在电脑缝制设备维护与保养比较成熟的经验、技术、知识等编成一文。
	</p>
	<p>
		　　保证系统正常运行的前提
	</p>
	<p>
		　　一、让电脑缝制设备良好的使用环境
	</p>
	<p>
		　　(一)电脑缝制设备合理的工作环境，首先是不要在有强烈电力声音或有高频率烧电焊器的地方安装设备，强力电力声音会影响设备或造成设备不能正常工作。
	</p>
	<p>
		　　(二)车间应保持室内温度5～35℃为宜，气温过高或过低都会影响设备的正常运作。
	</p>
	<p>
		　　(三)潮湿会引起机内短路，相对的湿度应保持在45～85%为佳，不可与有水蒸汽的缝制设备安装在一起。
	</p>
	<p>
		　　(四)灰尘容易腐蚀电路板，所以设备要保持干净，车间也同样要保持干净。
	</p>
	<p>
		　　(五)必须使用稳压电源(供电局或装稳压器)，具接地功能(如须切断电源必须先关机)。如必须严禁在380V的三相四线的三相火线上任搭一根火线，再搭一根零线作为220V的电源，作为电脑缝制设备的电源线，这样常常造成设备事故频繁或死机等故障(主要是电压过高或过低产生的原因)。维修人员往往不会注意这一点，而拼命去调整设备，由此造成许多不必要的麻烦，其实只需稳定电源，设备马上就恢复正常。
	</p>
	<p>
		　　(六)任何电脑缝制设备必须维持在供电局额定电压条件下，不可超过10%，过大或不足都会影响设备不能正常工作，但供电量必须大于缝纫机所需的耗电量。
	</p>
	<p>
		　　(七)机器应避免直接暴露在室外斜照的阳光下，光照在机头上产生的温度容易烧坏显示器，光照在机架上容易烧坏主机内的芯片，造成重大事故，所以阳光可照进来的车间，须安门、窗帘。
	</p>
	<p>
		　　(八)雷电天气应关掉电源，因为闪电会直接影响设备的正常运作。
	</p>
	<p>
		　　二.养成正确使用电脑缝制设备的习惯。
	</p>
	<p>
		　　(一)开机顺序：外设(电源开关)显示器主机。
	</p>
	<p>
		　　(二)关机顺序：主机显示器外设。
	</p>
	<p>
		　　(三)不要频繁地开关机，否则电流容易冲击硬件，电脑工作时突然关机，容易损坏电脑。
	</p>
	<p>
		　　(四)关机时须关闭所有运行程序启动开关后，再按正常顺序退出，否则容易破坏系统，无法启动。
	</p>
	<p>
		　　三、电源软硬件状况
	</p>
	<p>
		　　(一)开机后，操作者应观察设备自查情况，自查时不要触碰电脑(主机)
	</p>
	<p>
		　　(二)点击设备的各个系统查看设备运行情况。硬件的基本维护与保养一、 板卡6[+C O.b m e K 
防静电，静电能烧毁芯片。人体静电为几万伏到十几万伏，带电接触电脑，将击穿任何芯片，空气干燥或化纤纯毛衣物等都能造成静电，注意，产生静电时，千万不要用手接触主机。
	</p>
	<p>
		　　二、CPU的日常保养缝纫机技术 CPU超过Ig时，硬件散热问题将导致电脑故障、系统崩溃、CPU烧毁，在超过一定湿度时会自动休眠，设备无法起动。
	</p>
	<p>
		　　(一)散热：保证机内风扇运行良好，如发现频繁死机，立即关机，检查风扇是否运行。中国缝纫机技术网
	</p>
	<p>
		　　(二)防震：设备运动与风扇的运动产生共振，容易使风扇磨损。缝纫机技术
	</p>
	<p>
		　　(三)减压：确保空气的流通，使CPU的内核压力减轻。
	</p>
	<p>
		　　(四)安居：确保电源稳定，才不会产生事故。
	</p>
	<p>
		　　(五)除尘：清除机内灰尘，防止线路板等短路。
	</p>
	<p>
		　　(六)自诊：设备出现异常声响、频繁死机、异味，要时刻留意电脑配件的运行情况，严禁在死机状态下长时间保持通电，检查设备声音是否正常。
	</p>
	<p>
		　　一、电脑缝制设备使用的操作人员，必须要接受安全和操作培训后，才可上机，以确保设备的安全操作与正确使用。
	</p>
	<p>
		　　二、启动设备前应安装所有安全装置，否则可能会导致伤害事件的发生，因此，为了您与他人的安全，千万别拆安全装置。
	</p>
	<p>
		　　三、设备使用过程中，切勿触摸任何启动部分或把任何物件压于机器上，否则可能对操作人员或设备本身造成损害。
	</p>
	<p>
		　　四、如果设备带有自动压脚杆，切勿触摸电磁线圈部分，否则可能会引起火灾清理。
	</p>
	<p>
		　　保养与检修
	</p>
	<p>
		　　一、进行清理前应先关掉开关，否则若开关不慎被按下，机器便会立即启动而造成伤害。
	</p>
	<p>
		　　二、注意保持环境卫生，防止灰尘进入控制箱。
	</p>
	<p>
		　　三、减少空气中的潮湿与含尘。
	</p>
	<p>
		　　四、防止温度过高或过低，温度过高或过低容易损害设备。
	</p>
	<p>
		　　五、不能将盛水的容器放在机台上，以免水流入控制箱内。
	</p>
	<p>
		　　六、除尘时须拔下电源线，确保人员安全。
	</p>
	<p>
		　　七、拔掉电源线前，应先关掉内开关，再关总开关，以免烧坏接口元件。 只要认真地做好准备工作，电脑缝制设备会乖乖地听您的话，完成您的所需要求。
	</p>
</p>','20','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('27','2','电脑缝制设备日常维护与保养','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌” ','为客户提供大森的相关的企业资讯，让客户更了解【贪吃宝贝】','1','　台州市弘硕电子商务有限公司成立十二周年暨新品发布会　　台州市弘硕电子商务有限公司成立十二周年暨新品发布会','1436937201','','<p>
	　台州市弘硕电子商务有限公司成立十二周年暨新品发布会
</p>
<p>
	　　台州市弘硕电子商务有限公司成立十二周年暨新品发布会
</p>','17','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('28','2','排除套结机长套结时断底线','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌”','为客户提供大森的相关的企业资讯，让客户更了解【贪吃宝贝】','1','　　通常情况下，目前市场上常见的套结机不会出现套长套结时断底线的情况。　　对这种情况，建议将底线调松些，检查梭心是否歪斜，底线经过处是否有毛刺，摆梭轴是否缠上线头，梭心内是否有线头等杂物，这些原因都可能妨碍了梭心的转动，影响了底线的张力。　　我们不妨将摆梭拆下清扫干净，或用运转正常机器上的摆梭换上试试。','1436937288','','<p>
	　　通常情况下，目前市场上常见的套结机不会出现套长套结时断底线的情况。
</p>
<p>
	　　对这种情况，建议将底线调松些，检查梭心是否歪斜，底线经过处是否有毛刺，摆梭轴是否缠上线头，梭心内是否有线头等杂物，这些原因都可能妨碍了梭心的转动，影响了底线的张力。
</p>
<p>
	　　我们不妨将摆梭拆下清扫干净，或用运转正常机器上的摆梭换上试试。
</p>','25','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('29','4','2012广州国际服装节暨广州时装周','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌”','为客户提供大森的相关的企业资讯，让客户更了解【贪吃宝贝】','1','　　2012广州国际服装节暨广州时装周','1436937349','','<p>
	　　2012广州国际服装节暨广州时装周
</p>','20','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('30','4','2012第十三届中国(青岛)国际缝制设备展览会','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌”','为客户提供大森的相关的企业资讯，让客户更了解【贪吃宝贝】','1','2012第十三届中国(青岛)国际缝制设备展览会','1436937403','1436937414','2012第十三届中国(青岛)国际缝制设备展览会','25','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('31','4','台州市弘硕电子商务有限公司成立十二周年暨新品发布会','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌”','为客户提供大森的相关的企业资讯，让客户更了解【贪吃宝贝】','1','台州市弘硕电子商务有限公司成立十二周年暨新品发布会','1436937461','1436937475','台州市弘硕电子商务有限公司成立十二周年暨新品发布会','18','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('32','4','2012第九届宁波国际缝制设备展览会','热烈祝贺贪吃宝贝荣获：“用户优选十大缝纫机潜力品牌”','为客户提供大森的相关的企业资讯，让客户更了解【贪吃宝贝】','1','2012第九届宁波国际缝制设备展览会','1436937682','','2012第九届宁波国际缝制设备展览会','32','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('33','3','Development of Talking automation sewing machine','Development of Talking automation sewing machine ','Relevant corporate information to provide customers Omori, give customers more understanding.','1','　　Garment industry technology needs of the ever-changing, fully automatic sewing machine is not only too expensive, its scope is often subject to the restrictions of clothing technology, rather than b&hellip;','1436937786','','<p>
	　　Garment industry technology needs of the ever-changing, fully automatic 
sewing machine is not only too expensive, its scope is often subject to the 
restrictions of clothing technology, rather than be the advantage to the limit. 
Semi-automatic sewing machine while the other hand, strong adaptability of 
clothing technology, relatively inexpensive, widely welcomed by the garment 
enterprises and customers within the affordable range, so in recent years.
</p>
<p>
	　　From the historical point of view of the development of the sewing machine, 
people have been hoping powerful invention of the sewing machine instead of an 
ordinary sewing machine, and people from the heavy labor freed to address the 
the labor tensions actual contradiction; from the trend of the development of 
the sewing machine, sewing machines have two kinds of trends: a fully automatic 
sewing equipment, and other semi-automatic sewing equipment;, fully automatic 
sewing machine from the practical effects of view better than semi-automatic 
sewing machine has an advantage in the fierce market competition; inferred from 
the theoretical point of view, the higher the degree of automation of the sewing 
machine equipment, the operation is simple, it is something that gets 
popular.
</p>
<p>
	　　But the reality given: garment industry technology needs of the 
ever-changing, fully automatic sewing machine is not only too expensive, its 
scope is often subject to the restrictions of clothing technology, to maximize 
its advantages can be without.
</p>
<p>
	　　Semi-automatic sewing machine while the other hand, strong adaptability of 
clothing technology, relatively inexpensive, widely welcomed by the garment 
enterprises and customers within the affordable range, so in recent years.
</p>
<p>
	　　Automatic sewing machine characteristics
</p>
<p>
	　　As we all know, the sewing material in the right place by the operator will 
press the start key, the sewing machine can automatically complete the sewing 
process. After the sewing process is completed, automatic sewing machines cut 
line sewing sequentially stacked neatly by the receiving system. If further, the 
cycle on material aspects can also be done automatically.
</p>
<p>
	　　Under normal circumstances, an operator can operate the 2 to 3 automatic 
sewing equipment. Automatic sewing machine features: staff put away the fabric, 
press the start button, the mechanical automatic control fabric, sewn products 
sewing the cut line will turn folded; a sewing cycle can be completed to a more 
complicated sewing process; sewing machine automatically picked up the fabric 
can sense the presence or absence of the fabric, put away and completed the sewn 
products; part of the machine with a loop on the feeding system.
</p>
<p>
	　　In addition, fully automatic sewing machine machine highly targeted, high 
production efficiency, good quality sewing. : A bag machine, patch pockets.
</p>
<p>
	　　Characteristics of semi-automatic sewing machine
</p>
<p>
	　　Placed near the sewing position by the operator will be sewing away, by 
foot semi-automatic sewing machine start button or by sensing device start 
automatically, complete the sewing process under artificial. Sewing process is 
complete, the shear line semi-automatic sewing machine and manual receipts.
</p>
<p>
	　　Under normal circumstances, an operator can operate a station apparatus 
with semi-automatic sewing machine. The author summarizes the characteristics of 
the semi-automatic sewing machine: semi-automatic sewing machine operator to put 
away the sewing on the sewing position near; entire sewing process in 
artificial; equipped devices such as automatic tangent.
</p>
<p>
	　　The semi-automatic sewing machine also has the advantages of high 
production efficiency, good quality sewing, such as: automatic bag sewing 
machine, automatic pattern machine.
</p>','3','1','0','0','en-us');
INSERT INTO `pa_news` VALUES ('34','3','Lockstitch sewing machine the fabric move around irregular adjustment','Development of Talking automation sewing machine','Relevant corporate information to provide customers Omori, give customers more understanding.','1','　　In the process of using the sewing machine sewing cloth, sometimes cloth movement speed uneven stitch length short irregularities.　　For this failure phenomenon, the author analyzes cloth move around…','1436937853','1436938024','<p>
	<span>　　</span>In the process of using the sewing machine sewing cloth, sometimes cloth 
movement speed uneven stitch length short irregularities.
</p>
<p>
	　　For this failure phenomenon, the author analyzes cloth move around thanks 
to send the dog and presser foot with forward transport, when clothing such 
irregular movement, we can conclude that the teeth and presser foot fault or 
pressure improperly adjusted. The presser foot pressure is too low, the pressure 
is not tight fabric, it will cause to move around irregular. At this time we 
just put down the regulator screw rotating, to press the cloth.
</p>
<p>
	　　In addition, the presser foot is too high, lockstitch sewing machine the 
same presser foot can not suppress the cloth, can also cause any clothing walk 
around, or do not move around. After adjustment, we should first get a presser 
foot wrench lift, loosen the screws of the guide bracket, then impress presser 
foot lever from the top down, so that the distance of the presser foot and the 
needle plate is adjusted to the height of 7mm-8mm, then screw tighten, and then 
drive to use.
</p>
<p>
	　　It is worth noting that there is a reason: lockstitch sewing machine teeth 
loose screws, running around the teeth caused shaking, so that the cloth can not 
be moved forward rules. In this regard, we proposed approach: we will remove the 
lockstitch sewing machine needle plate, and tighten the screws of the two teeth. 
Tighten the needle plate is installed, check the teeth on both sides, one with 
the edge of the needle plate slot conflicts. Friction caused by the noise and 
the machine re-phenomenon, this time only lifted the needle plate, loosen teeth 
screws, adjust the tooth position to the middle of the needle plate slot, 
tighten teeth screw, and then loaded the needle plate.
</p>','4','1','0','0','en-us');
INSERT INTO `pa_news` VALUES ('35','3','Sewing machine professional market in China look forward to more career change upgrade','Development of Talking automation sewing machine','Relevant corporate information to provide customers Omori, give customers more understanding.','1','　　As the world's largest producer of sewing machinery, accounted for more than 80% of the world's the sewing machine total output of the annual output of my sewing machine.　　In the 1990s, China has be&hellip;','1436937949','','<p>
	　　As the world's largest producer of sewing machinery, accounted for more 
than 80% of the world's the sewing machine total output of the annual output of 
my sewing machine.
</p>
<p>
	　　In the 1990s, China has been the exploration of the sewing machinery 
industry specialization market. With the development of the garment industry, 
the main producing areas of the clothing, sewing machinery demand growth, and 
thus all forms of sewing machine sale market continue to emerge.
</p>
<p>
	　　At present, the industry has a certain size and influence of the sewing 
machine professional market: Hulu town, Dongyang City, Zhejiang the slit City, 
Shanghai Garment Machinery city, the city of Guangzhou (International) sewing 
equipment, "Shi Treasure" Sewing Machine City, and so ; thriving development of 
the garment industry to promote the construction of the sewing machine 
professional market, more and more of the sewing machine professional market 
being built or under construction --- April 18, 2008, Fujian sewing equipment 
and professional market (STCF the "sewing equipment hall) was officially 
inaugurated. The market is located in Shishi City, the most famous clothing city 
shopping district, with a total construction area of 250,000 square meters. 
Currently, the first phase of the market over 6000 square meters of exhibition 
area has been fully booked more than 30 sewing equipment manufacturers signed 
the agreement settled.
</p>
<p>
	　　To start in the spring of 2008, "Beijing International clothing equipment 
Textile City is focused on creating a" carrier-class modern sewing equipment 
Textile City. The official said, the "city" for the textile and apparel industry 
and sewing machinery industry research and the development of new technologies, 
new products, better service market for the "Three North" region to promote the 
"Three North" regional textile and garment industry and the development of the 
sewing machinery industry, and radiation Southeast Asia and international 
market.
</p>
<p>
	　　In addition, under construction in the professional market there Dongyang 
International Sewing Machinery Market, Yiwu, Zhejiang, raw materials, machinery 
market.
</p>
<p>
	　　There is no doubt that the only use and construction of more and more 
professional market, open up the market for many sewing machine companies 
provide opportunities and more space, facilities for the transformation of its 
sewing machine business in China, the improvement of the business environment 
and business culture The building, as well as to enhance the management of the 
market and services, and enhance the ability to respond to competition in the 
international market, have played a positive role in promoting.
</p>
<p>
	　　Currently, domestic sewing machine market is not mature, professional and 
still need to slowly cultivate. In a few more than a decade in the development 
process, the sewing machine professional market building has many problems.
</p>
<p>
	　　Sewing machine professional market building is a long-lasting, and the 
process of development. Some investors lack long-term vision, only the market as 
real estate projects, sales and development. Lack of consideration for how to 
develop the market after forming.
</p>
<p>
	　　Throughout the builders of the investment industry professional market. Can 
be divided into two categories: one is based on investment in real estate 
development based real estate developer. They see good prospects of the sewing 
machine industry, they actively combine sewing machine professional market and 
real estate development. The majority of these investors in the development, 
construction, sales, after completely withdraw from the market late management, 
turn to other projects. And those investors itself is a sewing machine 
manufacturers or distributors, they found in the operating profit margins of the 
industry is getting smaller and smaller, and began to try to enter the huge 
potential for the professional market.
</p>
<p>
	　　Sewing machine professional market in construction there is blindness, 
market development is unbalanced, repeated construction, the homogenization of 
competition and other issues. A few days ago, when the author visited the home 
of some of the sewing machine dealer in Yiwu raw materials and machinery market 
learned that we all think the Yiwu local sewing machine market is very small. 
The lure of the "near abroad" Dongyang slit with market relationships and 
merchants, is a thriving market power source. It is understood that, with the 
advantages of Yiwu business district, a new sewing machine professional market 
is now under construction.
</p>
<p>
	　　Sewing machine professional market development is still in the incubation 
stage, but with the impact of the industry from hot to cold changes as well as 
the financial crisis, whether it is traditional or are being built for the 
professional market, are facing the problem of enhancing competitiveness.
</p>
<p>
	　　Sewing equipment specialized market able to provide one-stop shopping, it 
is a variety, a complete range of both basically meet the domestic demand, there 
are certain international competitiveness. With the progress of human science 
and technology, the social division of labor is getting smaller, the interests 
and needs of the client, the needs of the market competition, the 
diversification of the new economic model calls for the birth of the 
professional market access, specialized market sales model has become a 
necessity.
</p>
<p>
	　　We have every reason to expect that the professional market for the 
industry to nurture a national brand, made effective. The same time, we also 
hope that in the near future with the maturation and development of the 
professional market, domestic sewing machine can shine in the domestic and 
foreign markets.
</p>','3','1','0','0','en-us');
INSERT INTO `pa_news` VALUES ('36','3','The country sewing machine exports and international market demand','Development of Talking automation sewing machine','Relevant corporate information to provide customers Omori, give customers more understanding.','1','　　Exports from the product point of view, the demand of the international market on the sewing machine will continue to focus on the industrial sewing and embroidery machine exports are likely to cont&hellip;','1436938014','','<p>
	　　Exports from the product point of view, the demand of the international 
market on the sewing machine will continue to focus on the industrial sewing and 
embroidery machine exports are likely to continue to decline. The other hand, 
the impact of the U.S. financial crisis will continue, which means that the 
United States and some European countries will also be suppressed desire to buy 
household sewing, the home machine export growth will continue to decline. Parts 
and components, the advantage of our products "affordable" will further 
influence the market, its exports is expected to show double-digit growth. The 
purposes of the current situation in the second half of this year, the huge 
demand of the international textile and garment market still exists region from 
the market point of view, some developing countries and regions in the 
development of the textile and garment industry demand continues to grow it on 
the sewing machine, and direct export growth led our sewing machine. However, 
the second half of the year, China's sewing machine exports increase does not 
significantly increase in the single-digit growth is expected to remain.
</p>
<p>
	　　Asia: parts exports increased steadily
</p>
<p>
	　　Asian sewing machine is our main export market, and its share of exports 
accounted for more than half of the country's total exports. Export areas are 
concentrated in India, Japan, and Hong Kong, China, respectively, ranked first 
in the country, three, five major export markets.
</p>
<p>
	　　The second half of the year, China's exports to the Asian markets will 
still mainly industrial machines and other machine embroidery machine, but due 
to the recent demand of the Indian market adjustment of the economic downturn in 
Vietnam, Thailand, the political environment is unstable, industrial machines 
and embroidery machines there will be a certain level of decline. Home machine, 
the needs of the Japanese market rebounded directly promote the console market 
rebound. Parts and components, Singapore and other re-processing market recovery 
will be effectively ensured the steady rise of China's exports, is expected to 
increase will remain in the double digits.
</p>
<p>
	　　Africa: Industrial the machine needs Xun up
</p>
<p>
	　　Sewing machine market in Africa is on the rise in recent years, with the 
rapid development of the garment industry in Nigeria, Egypt and other countries, 
increasing demand on the sewing machine, in particular, the growing demand for 
industrial sewing machines.
</p>
<p>
	　　In recent years, parts of Africa country's economic rapid development, 
especially Nigeria, Egypt and other countries, the rapid development of the 
traditional textile and garment industry, with the increase in export orders to 
Europe and the United States, Africa will accelerate the introduction of the 
sewing machine, and "affordable" will become the first choice of the textile and 
garment enterprises in Africa. The second half of the year, China's exports to 
the markets of Africa and Nigeria, Egypt, the center of gravity will also be 
placed on industrial machines, embroidery machines and other industrial 
equipment, and parts due to regular maintenance of existing equipment and the 
procurement of a small number of the whole processing plant will also be showing 
double-digit growth.
</p>
<p>
	　　Europe: embroidery machine exports continues to heat up
</p>
<p>
	　　China's exports to Europe has always been the main home machine, but the 
sharp drop in demand for household sewing machines in Europe in recent years, 
and increasing demands on the embroidery machine, especially the cap embroidery 
machine and special embroidery machine. At present, China's exports to the 
European embroidery machine in Italy, Russia, Germany and other countries.
</p>
<p>
	　　South America: the comprehensive and rapid export growth
</p>
<p>
	　　Exports are concentrated in South America sewing machinery products in 
China, Brazil and other countries, which accounted for nearly half of South 
America's total exports of the country's exports to Brazil.
</p>
<p>
	　　Since the end of 2007, the textile and garment market in South America, 
Brazil, Argentina and other countries the rapid development of industrial 
machine parts significantly increased demand, and the cost advantage of Chinese 
products into the South American businesses to buy preferred. The second half of 
the South American economic environment will not change, and the rapid 
development of the textile and garment market in Brazil, Argentina and other 
countries will continue to remain the South American the seamer export market is 
expected to remain full bloom, and usher in China's exports of small climax.
</p>
<p>
	　　North America: home machine needs to pick up
</p>
<p>
	　　In North America the sewing machine of China's export products to the home 
machine mainly exports are concentrated in the United States. The reasons for 
the financial crisis, housewives had to do something at home themselves, to 
reduce expenses. Cause the U.S. console market demand gradually heated up to buy 
home machine showing signs of warming. Is expected that the second half of the 
US-based North American market demand will continue to pick up the home 
machine.
</p>','4','1','0','0','en-us');
INSERT INTO `pa_news` VALUES ('37','158','How scientific debug three needle five lines stretch sewing machine','Development of Talking automation sewing machine','Relevant corporate information to provide customers Omori, give customers more understanding.','1','　　Before commissioning three needle five thread stretch sewing machine, first of all, we want to confirm the accuracy of the machine to meet the use requirements. First replace the original authentic &hellip;','1436938098','','<p>
	　　Before commissioning three needle five thread stretch sewing machine, first 
of all, we want to confirm the accuracy of the machine to meet the use 
requirements. First replace the original authentic qualified parts, so that the 
accuracy of the machine to keep the state close to the factory with the gap from 
the difference between the larger equipment factory state. You can then check 
the positioning of the various parts of the size as well as mutual cooperation 
opportunity accordance with the requirements of the manual.
</p>
<p>
	　　Here, the author based on personal experience, manual adjustment 
requirements focus on finishing and supplemented (some references may differ) 
described in the description.
</p>
<p>
	　　Needle and looper meet the timing adjustment
</p>
<p>
	　　Machine needle and looper meet timing adjustment, the most important and 
most easily overlooked when the needle dropped to the lowest point of the looper 
must move to the right to the farthest limit positions, rising to the highest 
Similarly, when the needle curved needle point must be moved to the left limit 
position to the farthest this repeated observation confirmed.
</p>
<p>
	　　Addition to have about the operation of the curved needle (toward the 
operator) before (away from the action of the operator). Then we should pay 
attention to the movement limit position in the fastest time to move around the 
curved needle placed around the curved needle, make curved needle before and 
after moving action in the bent needle is moved leftward to reach the position 
of the machine needle minimum.
</p>
<p>
	　　At this point, we should pay attention to the balance between the left and 
right limit position, is necessary to prevent the looper moves to the left 
Guaceng needle, but also to prevent the the curved needle moves to the right 
Guaceng needle too much. Of course, we can also match the size of the amount of 
movement and slightly clockwise rotation of a little needle bar before and after 
adjusting looper angle to achieve the best results. Range of some machines can 
adjust the looper moves back and forth, some machines can not.
</p>
<p>
	　　When the needle dropped to the lowest position, bend the needle tip from 
the right needle 3mm-4mm. When the rising needle looper moves to the left, bend 
the needle tip reaches the right center of the needle bend the needle tip in the 
needle below the eye of a needle on top 2.5mm. The gap between looper and needle 
0 ~ 0.05mm.
</p>
<p>
	　　When the needle down to reach the back of the looper, the left needle eye 
of a needle and curved needle threading hole meet. At this point, the back of 
the looper allows slight contact with needle but best not Guaceng, or as slight 
as possible.
</p>
<p>
	　　The Rear Guards needle adjustment
</p>
<p>
	　　Need to follow the principles of the needle guard before and after 
adjustment fancy contour: front and rear needle guard from the direction of the 
operator should be consistent with the connection of the needle tip, one side in 
order to prevent the machine needle jitter bar near the needle, the needle guard 
on the needle guard should be appropriate chamfer. The front (close to the 
operator) of the needle guard should play both the role of the needle guard also 
play a role in blocking the smooth formation of the sewing thread in the machine 
in front of the needle eye of the needle (close operation) to form a wire loop, 
the wire loop behind the machine needle pinholes. After the needle guard both 
played the role of the needle guard can not block the smooth formation of the 
Central Line.
</p>
<p>
	　　Since the differences of different producers and machine model, the shape 
of the front and rear needle guard allows the adjustment range of different 
ideal state there are some gaps, maintenance personnel in specific cases, as 
much as possible to move closer to the need to follow the principle of.
</p>
<p>
	　　When the needle is moved downward, the front and rear needle guard to the 
direction away from the machine needle movement; When the machine needle is 
rising from the lowest position, the front and rear needle guard to the close to 
the direction of the needle movement.
</p>
<p>
	　　Needle guard should escape the needle when the needle down to the location 
of the needle guard to avoid Guaceng needle.
</p>
<p>
	　　In addition, when bending tip is moved to the left to the right needle 
position, the gap between the needle guard and the needle of the needle guard 
before and after work, the front (close to the side of the operator) is 
0.1mm-0.3mm, the needle guard and machine The gap between the needle 0 ~ 
0.1mm.
</p>
<p>
	　　Looper thread take-up cam adjustment
</p>
<p>
	　　Looper thread take-up cam design because each plant is different, some with 
the actual size and shape may be some gap, the gap is too large, are likely to 
cause the jumper and increase maintenance difficulty.
</p>
<p>
	　　Role looper thread take-up cam: mobile and braided wire a timely manner to 
the looper when the looper moves to the left line of sewing thread trace need, 
when curved needle moves to the right in a timely manner to recover the excess 
sewing thread .
</p>
<p>
	　　Need to pay special attention to the need to use: In order to facilitate 
the triangular wire loop of the needle into the back of the looper, the looper 
thread take-up cam needle into triangular wire loop, looper state of tension. 
But tension over cause the looper thread disconnection and looper thread tight 
in the back of the sewing material seems.
</p>
<p>
	　　The right to adjust the standard of the looper thread take-up cam: When the 
needle down, left needle tip reaches the looper edge is just securely enter 
triangular wire loop, looper thread take-up cam on the looper thread take-up cam 
the highest point.
</p>
<p>
	　　Speed of looper thread take-up cam can do minor adjustments on the basis 
of the above criteria, in accordance with its own direction of rotation tune 
fast sewing the back stitch seemed more relaxed looper thread tension, on the 
contrary, it appears that bend the needle thread tension is tight.
</p>
<p>
	　　Stretch needle and stretched the needle thread board of adjustment
</p>
<p>
	　　Some brands of machines, stretch needle and needle with timing can be 
adjusted. The Tongyu F007 three needle five lines stretch sewing machine, for 
example, by adjusting the stretch needle cam (F00710004) relative to the axis of 
the front section (F00708001) angle to adjust the timing baste and machine 
needles with purpose. The best time to tie stretched the needle began to move to 
the right when entering the stretch needlework ring when the decline of the 
needle, right needle.
</p>
<p>
	　　The the stretch needle swing amplitude must ensure that: when hooked 
stretched needlework, returns to the left of the the stretch needle swing to the 
right-most limit position to stretch when the stretch needle swing to the 
left-most point of a needle to the left needle distance of 4.5mm-5.5mm.
</p>
<p>
	　　Stretched needle mounting height should be possible to rely on but the gap 
between the stretched needle above and stretched the needle over the line board 
following should enable stretched needlework successfully passed.
</p>
<p>
	　　When the stretch needle over the line board mounting height should enable 
stretched needlework in the needle up to the highest point, the right needle 
smooth slide into the back of the right needle tip (away from the operator's 
side), so that the right needle drops easily pinned stretched needlework.
</p>
<p>
	　　When stretched the point of a needle to swing to the left in front of the 
needle, the gap between the left needle and stretched needlepoint 
0.5mm-0.8mm.
</p>
<p>
	　　Feed motor coordination
</p>
<p>
	　　Stretch Sewing Machine accurate feed action can reduce the probability of 
the needle jump phenomenon. The impact equipment daily feed action with the 
height of the feed dog, presser foot pressure, differential feed, stitch length 
density is closely related to the use of speed.
</p>
<p>
	　　Propose a theory: the the looper back of the triangular wire loop stability 
depends on the stability and the thread take-up cam feed action correctly with. 
If the feed action is unstable, triangular wire loop is deformed or suddenly big 
and small, so that the needle can not enter triangular wire loop.
</p>
<p>
	　　Adjust the feed dog height to grasp the principle is: when the feed dog to 
completely return from the needle plate, feed action is completed any sewing 
regressive actions are not allowed. The presser foot pressure to ensure that the 
the sewing material does not slip to the operator side action. Sewing elastic 
sewing or operator sewing excessive force to pull his arms, we should increase 
the device differential feed amount. Needle ring also from the small triangle 
line, so the density should be appropriate, and in the extent possible, should 
not small. Too fast will make sewing flighty or instant suppress the presser 
foot, thus affecting the stability of the Central Line.
</p>','5','1','0','0','en-us');
INSERT INTO `pa_news` VALUES ('38','158','Daily Maintenance of computer sewing equipment','Development of Talking automation sewing machine','Relevant corporate information to provide customers Omori, give customers more understanding.','1','　　With the advent of the information age, computer sewing equipment more and more impact on the old purely mechanical equipment, maintenance personnel are also increasingly need to understand the new …','1436938171','1436938179','<p>
	　　With the advent of the information age, computer sewing equipment more and 
more impact on the old purely mechanical equipment, maintenance personnel are 
also increasingly need to understand the new technology to master the care and 
maintenance of this equipment. In this regard, the enterprise deeply disturbed 
the maintenance personnel impatient Lost Souls, the author is also a mechanic, 
this same strong feelings, especially for nearly 10 years in computer sewing 
equipment maintenance and maintenance of mature experience, technology, 
knowledge compiled into a text .
</p>
<p>
	　　Ensure system uptime premise
</p>
<p>
	　　Computer sewing equipment to good use
</p>
<p>
	　　(A) a reasonable working environment of the computer sewing equipment, 
first of all it is not installed in place a strong electrical sound or high 
frequency burning welding equipment, strong power sound will affect the 
equipment or cause equipment is not working properly.
</p>
<p>
	　　(B) The workshop should keep the indoor temperature 5 ~ 35 ℃ is 
appropriate, the temperature is too high or too low will affect the normal 
operation of the equipment.
</p>
<p>
	　　(C) moisture can cause a short circuit inside the relative humidity should 
be maintained at 45 to 85% better, can not be installed together with the water 
vapor sewing equipment.
</p>
<p>
	　　(D) the dust prone to corrosion board, so the equipment to keep it clean, 
the workshop is also to keep clean.
</p>
<p>
	　　(E) must use a regulated power supply (Power Supply Bureau, or mounted 
regulator), with ground features (such as to cut off the power must be shut 
down). If it is necessary to a 380V three-phase, four-wire three-phase line of 
fire took office take the line of fire, and then take a zero line as 220V power 
supply, power cord as computer sewing equipment, so often frequent cause 
equipment accident or crash is strictly prohibited fault (mainly the voltage is 
too high or too low to produce the reason). Maintenance personnel often do not 
pay attention to this, while trying desperately to adjust the device, which 
caused a lot of unnecessary trouble, in fact, simply stable power equipment 
immediately return to normal.
</p>
<p>
	　　(F) any computer sewing equipment must be maintained at the rated voltage 
power supply bureau under the conditions, not more than 10% of the excess or 
deficiency will affect the device is not working, but the power supply must be 
greater than the power consumption of the sewing machine required.
</p>
<p>
	　　(Vii) the machine should avoid direct exposure to outdoor shines the sun, 
the temperature of the light generated in the machine head is easy to burn out 
displays, light easy to burn out on the rack inside the main chip, causing a 
major accident, so the sun can shine come in the workshop, to Tiananmen Square, 
curtains.
</p>
<p>
	　　(H) and lightning weather should turn off the power, because lightning will 
directly affect the normal operation of the equipment.
</p>
<p>
	　　Develop proper use computer habits of sewing equipment.
</p>
<p>
	　　(A) the boot sequence: peripheral (power switch) monitor host.
</p>
<p>
	　　(B) the shutdown sequence: host display peripherals.
</p>
<p>
	　　(C) do not frequently switch machines, or current easy shock hardware, 
computer work when suddenly shut down, easy to damage the computer.
</p>
<p>
	　　(D) shutdown shall close all running programs start switch, then the normal 
order of exit, otherwise easily damage the system can not start.
</p>
<p>
	　　Third, the power of hardware and software status
</p>
<p>
	　　(A) after the boot, the operator should observe the device 
self-examination, self-examination, do not touch the computer (host)
</p>
<p>
	　　(B) click on the various systems of the equipment to view the equipment 
operation. Basic care and maintenance of the hardware, board [+ C Ob me K 
anti-static, static electricity can be burned chip. The human body electrostatic 
tens of thousands of volts to hundreds of thousands of volts, charged access to 
computers will break down any chips, dry air or synthetic wool clothing, etc. 
can be caused by static electricity, pay attention, to generate static 
electricity, do not touch the host.
</p>
<p>
	　　CPU's day-to-day maintenance of sewing machine technology CPU exceeds Ig 
hardware and cooling problems will result in computer failure, system crash, CPU 
burned over a certain humidity automatically hibernate, the device can not 
start.
</p>
<p>
	　　(A) heat: to ensure that within the fan is running well, such as frequent 
crashes, immediately shut down, check the fan is running. China sewing machine 
technology
</p>
<p>
	　　(B) shock: the resonance of equipment movement and the movement of the fan, 
easy to make the fan wear.Sewing machine technology
</p>
<p>
	　　(C) decompression: to ensure that the flow of air, pressure to reduce the 
CPU kernel.
</p>
<p>
	　　(D) place to live: to ensure stable power supply, it will not produce the 
accident.
</p>
<p>
	　　(E) dust: dust, clear the machine and prevent the short circuit of the 
circuit board.
</p>
<p>
	　　(F) self-diagnosis: device abnormal sounds, frequent crashes, smell, should 
always pay attention to the operation of computer accessories, non-crash state 
remains energized for a long time, check whether the device sound normal.
</p>
<p>
	　　, Computer sewing equipment operator, must accept the safety and operation 
training on the machine before, in order to ensure the safe operation of the 
equipment and the proper use.
</p>
<p>
	　　Boot device should be installed all of the security device, otherwise it 
may lead to injury incidents, therefore, to you and the safety of others, do not 
dismantle safety devices.
</p>
<p>
	　　Third, the use of process equipment, Do not touch any the boot part or any 
object pressure in the machine, or it may cause damage to the operating 
personnel or equipment.
</p>
<p>
	　　Fourth, if the equipment with automatic presser foot lever, do not touch 
the part of the electromagnetic coil, otherwise it may cause a fire cleanup.
</p>
<p>
	　　Maintenance and repair
</p>
<p>
	　　First, clean up before you turn off the switch, otherwise accidentally 
switch is pressed, the machine will start immediately harm.
</p>
<p>
	　　Second, pay attention to maintaining environmental hygiene to prevent dust 
from entering the control box.
</p>
<p>
	　　Third, to reduce the moisture in the air with dust.
</p>
<p>
	　　Fourth, to prevent the temperature is too high or too low, the temperature 
is too high or too easy to damage the equipment.
</p>
<p>
	　　Five, not the water container on the machine table, so that the water flows 
into the control box.
</p>
<p>
	　　VI dust must unplug the power cord to ensure the safety of personnel.
</p>
<p>
	　　, Unplug the power cord, you should turn off within the switch, then turn 
off the master switch, so as not to burn interface components. Seriously ready, 
computer sewing equipment will obediently listen to your words, complete the 
necessary requirements.
</p>','4','1','0','0','en-us');
INSERT INTO `pa_news` VALUES ('39','158','the doso Sewing Machine Co., Ltd. was established twelve Anniversary new conference','Development of Talking automation sewing machine','Relevant corporate information to provide customers Omori, give customers more understanding.','1','　　the doso Sewing Machine Co., Ltd. was established twelve Anniversary new conference','1436938248','','<p>
	　　the doso Sewing Machine Co., Ltd. was established twelve Anniversary new 
conference
</p>','5','1','0','0','en-us');
INSERT INTO `pa_news` VALUES ('40','158','Exclusion Bartacking captain tacking off the bottom line','Development of Talking automation sewing machine','Relevant corporate information to provide customers Omori, give customers more understanding.','1','　　Under normal circumstances, the common market tacking machine does not appear the sets long tacking offthe bottom line.　　This case, it is recommended to loosen the bottom line, check the bobbin skew…','1436938308','1436938317','<p>
	　　Under normal circumstances, the common market tacking machine does not 
appear the sets long tacking offthe bottom line.
</p>
<p>
	　　This case, it is recommended to loosen the bottom line, check the bobbin 
skew, the bottom line at whether there are glitches, oscillating shuttle axis 
wrap thread bobbins are wired paramount debris of these reasons may hinderthe 
bobbin rotation, affects the thread tension.
</p>
<p>
	　　We might as well be placed shuttle remove cleaned or with oscillating 
shuttle machine operating normally puttry.
</p>','4','1','0','0','en-us');
INSERT INTO `pa_news` VALUES ('41','159','2012 Guangzhou International Festival and Guangzhou Fashion Week','Development of Talking automation sewing machine','Relevant corporate information to provide customers Omori, give customers more understanding.','1','　　2012 Guangzhou International Festival and Guangzhou Fashion Week','1436938374','1436938496','<p>
	　　2012 Guangzhou International Festival and Guangzhou Fashion Week
</p>','5','1','0','0','en-us');
INSERT INTO `pa_news` VALUES ('42','159','2012 the Thirteenth China (Qingdao) International Sewing Equipment Exhibition','Development of Talking automation sewing machine','Relevant corporate information to provide customers Omori, give customers more understanding.','1','2012 the Thirteenth China (Qingdao) International Sewing Equipment Exhibition','1436938421','1436938489','2012 the Thirteenth China (Qingdao) International Sewing Equipment Exhibition','5','1','0','0','en-us');
INSERT INTO `pa_news` VALUES ('43','159','Third China International Sewing Equipment Exhibition (Zhengzhou)','Development of Talking automation sewing machine','Relevant corporate information to provide customers Omori, give customers more understanding.','1','　　Third China International Sewing Equipment Exhibition (Zhengzhou)','1436938474','1436938482','<p>
	　　Third China International Sewing Equipment Exhibition (Zhengzhou)
</p>','5','1','0','0','en-us');
INSERT INTO `pa_news` VALUES ('44','159','Third China International Sewing Equipment Exhibition (Zhengzhou)','Development of Talking automation sewing machine','Relevant corporate information to provide customers Omori, give customers more understanding.','1','Third China International Sewing Equipment Exhibition (Zhengzhou)','1436938569','1437026196','Third China International Sewing Equipment Exhibition (Zhengzhou)','7','1','0','0','en-us');
INSERT INTO `pa_news` VALUES ('45','161','Теплые поздравления Он Taisen машина выиграла: ','Корпоративная информация, Омори Новости','Предоставление клиентам Омори информационных предприятий, связанных, чтобы позволить клиентам, чтобы лучше понять [Омори швейная машина]','1','Китайский Мечта Мечта • Марка - 21 октября Омори автомат похож шаблон Пудун, Омори с профессиональной и специальной духа вместе с покупателями промышленности Kerry Hotel Pudong, разделили радость авто…','1436939538','1437026166','<p>
	Китайский Мечта Мечта • Марка - 21 октября Омори автомат похож шаблон Пудун, Омори с профессиональной и специальной духа вместе с покупателями промышленности Kerry Hotel Pudong, разделили радость автоматизированной шитья, Омори людей мужество, чтобы исследовать и инновационной , постоянные преследования, стремится к автоматизации швейного и интеллектуального развития и инноваций, по пути пятнадцать лет, всю дорогу полагать, и трудолюбие пятнадцать лет.<br />
Омори, которые неустанно трудятся, чтобы заплатить, в то время как урожай радости "Предпочтения пользователя Десять потенциал бренда швейная машина", я действительно власть и ответственность, давайте лучше обслуживать автоматизированные производственные площади в мире одежды, давайте встретимся на 11-13 ноября Тайчжоу международной не выставочный центр Стенд №: AT12 Омори автоматизированная швейная машина с нетерпением ждем вашего визита, чтобы поделиться и руководством!
</p>
<p>
	<img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135102_93166.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135102_80680.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135102_32565.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135102_44933.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135102_84855.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135102_15748.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135102_80905.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135102_57521.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135102_59600.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135102_37995.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135103_42687.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135103_32620.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135103_84871.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135103_74794.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135103_61512.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135103_77357.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135103_70485.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135103_18105.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135104_22233.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135104_99868.jpg" alt="" /><img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715135111_28940.jpg" alt="" /> 
</p>','5','1','0','0','ru');
INSERT INTO `pa_news` VALUES ('46','161','Швейные машины Co., ООО Чжэцзян Омори вторая годовщина создания нового конференц национальный дистрибьютор фото','Корпоративная информация, Омори Новости','Предоставление клиентам Омори информационных предприятий, связанных, чтобы позволить клиентам, чтобы лучше понять [Омори швейная машина]','1','　　Омори Швейные машины Co., ООО Чжэцзян вторая годовщина создания новых дилеров конференция фото в национальном масштабе.','1436939637','1437026157','<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/heying.jpg" width="700" height="284" /> 
<p>
	　　Омори Швейные машины Co., ООО Чжэцзян вторая годовщина создания новых 
дилеров конференция фото в национальном масштабе.
</p>','5','1','0','0','ru');
INSERT INTO `pa_news` VALUES ('47','161','Говоря о развитии автоматизированных швейных машин','Корпоративная информация, Омори Новости','Предоставление клиентам Омори информационных предприятий, связанных, чтобы позволить клиентам, чтобы лучше понять [Омори швейная машина]','1','','1436939776','1437026147','Производство одежды изменяющимся требованиям процесса, автоматическая швейная машина только цена слишком высока, сфера его применения часто ограничивается процесс одежды, и не в состоянии максимизировать свои преимущества. Для сравнения, полуавтоматические швейные машины, сильная приспособляемость технологии одежды, стоимость является относительно низким, в доступной круга пользователей, так и в последние годы в целом приветствовали одежды предприятий и других клиентов.<br />
<br />
&nbsp;Из истории точки машинного зрения, было бы желательно изобретение мощная машина, а не обычной швейной машине, люди, освобожденные от тяжелых работ из, решение конфликтов плотно труда; с точки зрения тенденций развития в машине, эта машина имеет два Виды тенденции: одна автоматическая швейная машина, другой полуавтоматической швейное оборудование, а из практических последствий зрения, Автоматические швейные машины в условиях жесткой конкуренции на рынке, лучше иметь преимущество полуавтоматической швейной машины; вывести из теории точки зрения, выше степень автоматизации швейного оборудования, работающего более простой, якобы более популярным.<br />
Но результат дается реальность: ремесло одежды постоянно меняющихся потребностей, автоматическая швейная машина только стоимость слишком высока, сфера его применения часто ограничивается процесс одежды, и не в состоянии максимизировать свои преимущества.<br />
Для сравнения, полуавтоматические швейные машины, сильная приспособляемость технологии одежды, стоимость является относительно низким, в доступной круга пользователей, так и в последние годы в целом приветствовали одежды предприятий и других клиентов.<br />
&nbsp;Особенности автоматической швейных машин<br />
&nbsp;Как мы все знаем, нажмите кнопку пуска швейных материалов оператором будет в нужном месте, швейная машина может автоматически завершить процесс шитья. После процесса шитья полная автоматическая обрезка нити и швейные машины, собирая система будет последовательно уложены аккуратно шитье материалы. Если в дальнейшем, если утилизация часть устройства также может быть сделано автоматически.<br />
&nbsp; При нормальных обстоятельствах, оператор может работать 2:58 автоматическое швейное оборудование. Автоматические функции для швейных машин являются: персонал убрал ткань, нажмите кнопку Пуск, механическая автоматическая ткань управления, швейная обрезка нити будет завершена последовательно сложить швейные изделия; швейные цикл может быть завершен относительно сложный процесс шитья, автоматическое швейная машина взял ткань, чувствую ли ткань, прошитая автоматически убрать и полная; части машины также поставляется с системой подачи петли.<br />
Кроме того, автоматическая швейная машина сама высоко целевой, высокую эффективность производства, хорошее качество шитья. Такие, как: открытый мешок машины, упаковочные машины.<br />
Особенности Полуавтомат<br />
&nbsp; Швейная материал оператором в положении около шитья далеко, пешком полуавтоматической кнопки пуска машины или автоматически, регистрируя устройства, завершить процесс шитья искусственно помогали. После процесса шитья завершится, полуавтоматическая швейная машина обрезка нити искусственные и поступления.<br />
&nbsp; При нормальных обстоятельствах, оператор может управлять устройством полуавтоматической швейную машину. По сводке автора, полу-автоматические функции для швейных машин являются: полуавтоматическая оператор швейная машина необходимо будет шить материал в положении около шитья отверг; весь процесс шитья завершится в условиях искусственного; с автоматической резки резьбы и других устройств.<br />
&nbsp;Полуавтоматическая швейная машина также имеет высокую эффективность производства, хорошие преимущества качества швейных, такие как: автоматический мешок швейные машины, автоматические модели машин.<br />','4','1','0','0','ru');
INSERT INTO `pa_news` VALUES ('48','161','Швейные машины ткани ходить неправильную регулировку','Корпоративная информация, Омори Новости','Предоставление клиентам Омори информационных предприятий, связанных, чтобы позволить клиентам, чтобы лучше понять [Омори швейная машина]','1','В процессе использования машины пошив одежды, одежда иногда неравномерно скорости, когда по долгосрочным и краткосрочным неровности строчек. Для этого явления недостаточности, автор анализирует, …','1436939856','1437026135','В процессе использования машины пошив одежды, одежда иногда неравномерно скорости, когда по долгосрочным и краткосрочным неровности строчек.<br />
&nbsp;Для этого явления недостаточности, автор анализирует, благодаря свободную одежду выгул собак и лапки вперед доставку, поэтому, когда над одежда нерегулярные движения, мы можем сделать вывод, что зубы и прижимная лапка неисправен или давление неправильно отрегулирован. Как давление лапки слишком мал, давление не плотно ткани, то это вызовет неправильную ход. Тогда мы просто поставить регулятор давления вниз вращающимся шнеком для сжатия одежды.<br />
Кроме того, прижимная лапка слишком высоко, швейная машина прижимной же не может подавить одежду, одежду также может вызвать произвольную ход, или не двигаться. При регулировке, мы должны сначала поднять лапки ключ, ослабьте направляющие винты, а затем переместите вниз рычаг фиксатора на расстоянии лапку и иглу пластины регулируется на высоту 7 мм 8 мм-позже, а затем положить болт Затянуть, затем проехать в использовании.<br />
&nbsp;Стоит отметить, что есть причина: Это происходит из-за швейной машиной винт потерять зубы, вызывая зубы во время работы о дрожь, так одежда не может иметь правила для продвижения вперед. В связи с этим, мы рекомендуем подход: Мы швейная машина игольной пластины разгрузки, и два винта зуба. После затяжки, мы можем поставить установлен игольной пластины, проверить зубы по обе стороны, происходят ли трения с краю игольной пластины канавок. Если есть трение, то это вызовет шум и тяжелый явление машины, то только тогда поднял игольную пластину, ослабьте винт зубы, отрегулировать положение зубов в средней канавке игольной пластины и затяните винты после зубов, а затем установили игольную пластину.<br />','5','1','0','0','ru');
INSERT INTO `pa_news` VALUES ('49','161','Ожидайте больше машины для переключения обновить профессиональный рынок','Корпоративная информация, Омори Новости','Предоставление клиентам Омори информационных предприятий, связанных, чтобы позволить клиентам, чтобы лучше понять [Омори швейная машина]','1','Являясь крупнейшим в мире по производству швейных машин страны, годовой объем производства Китая швейных машин счетов швейная машина для восьмидесяти процентов или более от общего числа в мире.В 1990-…','1436940053','1437026126','Являясь крупнейшим в мире по производству швейных машин страны, годовой объем производства Китая швейных машин счетов швейная машина для восьмидесяти процентов или более от общего числа в мире.<br />
В 1990-е годы, страна имеет исследование швейной машины промышленности профессиональных рынках. С развитием швейной промышленности, основные направления спроса на швейной швейной машины существенный рост, и поэтому все формы развивающихся рынках Швейная машина для продажи.<br />
В настоящее время, отрасль имеет определенный размер и влияние на рынке профессиональной швейной машины являются: Чжэцзян шов с городом Dongyang City тигр оленя города, Шанхай одежды Машины Город, Гуанчжоу (International) Швейные машины Город ", Ши сокровищ" швейная город и т.п. ; процветать швейной промышленности в целях содействия строительству профессионального рынка швейной машины, более профессиональной швейная машина строится или под строительном рынке --- 18 апреля 2008, Фуцзянь швейное оборудование профессионального рынка ("Haibo "Швейные машины музей) был официально открыт. Рынок расположен в самой известной одежды районе города Шиши, в общей строительной площадью 250000 квадратных метров. В настоящее время, рынок первый этап из более чем 6000 квадратных метров выставочной площади все было предопределено, более 30 производителей швейных оборудование подписали соглашение поселились.<br />
Весной 2008 года началась "Пекинский международный Одежда оборудования текстильной Сити" будет стремиться к созданию "авианосец" класс современное швейное оборудование Текстиль-Сити. Сказал чиновник, "Город" для текстильной и швейной промышленности и швейных машин промышленных исследований и развития новых технологий, и новые продукты будут лучше для "Три Севера" области рыночных услуг, в целях содействия "Три Север» площадь ткани и одежда Развитие промышленности и швейной отрасли машиностроения и излучения в Юго-Восточной Азии и во всем международном рынке.<br />
Кроме того, в стадии строительства в профессиональном рынке, а также Dongyang Международного Швейные машины рынка, рынка Иу и других сырьевых материалов, машин.<br />
Существует никаких сомнений, работу и строить больше и больше профессиональных участников рынка, так как многие из швейной машины бизнеса дает возможность осваивать новые рынки и больше места, превращая свой бизнес швейных объектов, улучшение бизнес-среды и бизнес-культуры строительство и повысить эффективность управления рынка и услуг, повысить способность справляться с международным конкуренции на рынке, сыграли положительную роль в продвижении.<br />
В настоящее время, на внутреннем рынке не зрелый профессиональный швейную машину, еще нужно медленно совершенствоваться. Только за последние десять лет развития, швейная машина специализированных рынках было много проблем.<br />
Строительство швейная машина профессионального рынок длительный процесс развития. Некоторые инвесторы имеют долгосрочное видение, только рынок как проектов в сфере недвижимости, продаж и развития. После формирования рынка, отсутствие рассмотрения о том, как развиваться.<br />
На протяжении инвестиционной индустрии профессионалов рынка строителей. Она может быть разделена на две категории: одна инвестиции в развитие недвижимости разработчик недвижимости. Они видят хорошие перспективы швейная машина промышленность, швейная машина будет активно развивать профессиональный рынок и недвижимость вместе. Большинство из этих инвесторов в развитии, строительство, продажи, полностью отказаться от позднего рынке управления, других проектов. Еще сам инвестор швейная производитель или дилер, они нашли в бизнес-индустрии прибыли становятся меньше, они стали пытаться ввести огромный потенциал на профессиональном рынке.<br />
Шитье профессиональное присутствие на рынке строительства слепоты, развитие рынка является несбалансированным, конструкцию с резервированием, однородную конкуренции и другие вопросы. Недавно, когда я посетил рынок в Иу сырой механической швейной машины дилер домашний номер, когда я узнал, что каждый думает, Иу небольшой местный рынок швейная машина. "Ближнего зарубежья" Dongyang шва рыночных отношений и торговцев заманить рынок находится на подъеме источник власти. Мы понимаем, что, с преимуществом Иу делового района, новый швейной машины профессиональном рынке строящегося.<br />
Несмотря на развитие профессионального рынка швейной машины все еще находится в стадии подготовки, но с влиянием перехода отрасли от горячей к холодной и финансового кризиса, будь то традиционный или под строительство на профессиональном рынке, сталкиваются с проблемами повышения конкурентоспособности.<br />
Швейное оборудование профессиональных участников рынка может обеспечить один-стоп магазинам, она богата разнообразием и полным, и в основном удовлетворения внутреннего спроса, есть определенные международной конкурентоспособности. С технического прогресса человечества, общественное разделение труда становится все меньше, интересы и потребности клиентов, потребности, разнообразные вызовы рыночной конкуренции для рождения новой экономической модели, специализирующихся доступа на рынок, профессиональный маркетинг модель стала необходимостью.<br />
У нас есть основания смотреть в будущее с, профессиональных участников рынка для промышленности, чтобы питать национальный бренд может сделать его эффективным. В то же время, мы также надеемся, что в ближайшем будущем, так как рынок созревает и профессиональное развитие, что позволяет внутреннего швейную машину на внутреннем рынке блеск.<br />','5','1','0','0','ru');
INSERT INTO `pa_news` VALUES ('50','161','Экспорт Китая швейной машины и международный спрос на рынке','Корпоративная информация, Омори Новости','Предоставление клиентам Омори информационных предприятий, связанных, чтобы позволить клиентам, чтобы лучше понять [Омори швейная машина]','1','Развитие ситуации на рынкеОт экспорта, международного рынка спрос на швейной машине будет продолжать фокусироваться на аспектах промышленных швейных машин, вышивальные машины экспорт, вероятно, продол…','1436940143','1437026117','Развитие ситуации на рынке<br />
От экспорта, международного рынка спрос на швейной машине будет продолжать фокусироваться на аспектах промышленных швейных машин, вышивальные машины экспорт, вероятно, продолжит снижаться. С другой стороны, влияние финансового кризиса в США будет продолжаться, это означает, что США и некоторые европейские страны хотят, чтобы купить швейные машины будут подавлены, рост экспорта домашняя машина будет продолжать снижаться. Детали и компоненты, наши продукты "недорогие" преимущества будут в дальнейшем влиять на рынок, который, как ожидается, двузначный рост экспорта. О текущей ситуации, во второй половине этого года, огромный спрос в международной текстильной и швейной рынке по-прежнему существует, от рыночной площади, развитие текстильной и швейной промышленности некоторых развивающихся странах и регионах, чтобы сделать дальнейший рост спроса на швейные машины, и прямой Наш рост экспорта приводом швейную машину. Но вторая половина, увеличение экспорта швейных машин не будет расти значительно, как ожидается, останется один-значный рост.<br />
Азия: части экспорта неуклонно растет<br />
Азия Китай основные экспортные рынки швейные машины, ее доля экспорта приходится более половины общего объема экспорта страны. Экспорт сосредоточиться на Индии, Японии и Гонконге, Китае, были ранжированы Китая первый, третий, пять основных экспортных рынков.<br />
Вторая половина, экспорт Китая в азиатском рынке будет по-прежнему промышленных машин и вышивальные машины и другие продукты машина, но из-за недавней коррекции рынка, Индия, Вьетнам и экономический спад, Таиланда нестабильная политическая обстановка и другие факторы, промышленные машины и вышивальные машины спрос будет определенный уровень спада. Сторона консоли, взял на японском рынке спрос способствовал непосредственно к консоли на рынке отскок. Детали и узлы, Сингапур и другие восстановления повторно обработки рынка будет эффективно гарантировать устойчивый рост экспорта Китая, как ожидается, увеличится до оставаться в двузначных цифрах.<br />
Африка: Промышленные машины требуют быстрый рост<br />
Африка Швейная машина рынок расти в последние годы, с быстрым развитием страны, Нигерия, Египет и другие швейная промышленность, ее растущий спрос на шитье, особенно растет спрос на промышленных швейных машинах.<br />
В последние годы быстрое экономическое развитие в некоторых странах Африки, особенно в Нигерии, Египта и других традиционных текстильной и швейной промышленности быстро развивается, с увеличением экспортных заказов в Европу и Африку ускорит введение швейной машины, и "недорогих" китайской продукции Африка станет первым выбором текстильной и швейной предприятий. Вторая половина, фокус нашего экспорта в Африку и Нигерии, Египта и других рынках также будет размещена на промышленных машин, вышивальных машин и другого промышленного оборудования, и запасных частей из-за регулярного технического обслуживания существующего оборудования и приобрести небольшое количество машинного завода будет проявлять двузначный рост.<br />
Европа: Экспорт вышивка машина продолжала нагреваться<br />
Экспорт Китая в Европу всегда была основной дом машина, но в последние годы спрос в Европе для бытовых швейных резкого падения спроса на машины вышивки продолжает расти, особенно крышка вышивки машины и другие специальные машины вышивки. В настоящее время экспорт Китая сосредоточены в Европе машинной вышивки в Италии, России, Германии и других стран.<br />
Южная Америка: быстрый рост объема экспорта<br />
Экспорт Китая в Южной Америке швейная машиностроительной продукции сосредоточены на Бразилии и других странах, в том числе экспорт Китая в Бразилии составляли почти половину от общего объема экспорта в страны Южной Америки.<br />
Пока, Бразилия, Аргентина и другие страны Южной Америки текстильной и швейной рынке быстро развивается к концу 2007 года, спрос на промышленных машин, запасных частей, значительно усиливается, и ценовое преимущество китайской продукции, чтобы стать южноамериканские компании для покупки выбор. Вторая половина, экономическая среда не изменится в Южной Америке, и быстрое развитие Бразилии, Аргентины и других стран в текстильной и швейной рынке будет оставаться, швейная экспорт машина рынок в Южной Америке, как ожидается, останется в полном расцвете, открыла в экспорте Китая малого кульминации.<br />
Северная Америка: восстановление спроса консоли<br />
Китайский экспорт бытовой химии в Северной Америке швейных машин основных экспортных сосредоточены в Соединенных Штатах. Причина в том, что финансовый кризис, домохозяйка должен был сделать что-то в своем собственном доме, снижая затраты. В результате чего колеблется спроса США консольный рынок, консоль позже появились признаки улучшения. В основном США, как ожидается, во второй половине спроса североамериканском рынке будет продолжаться, чтобы забрать консоль.<br />','5','1','0','0','ru');
INSERT INTO `pa_news` VALUES ('51','162','Как научно отладки три пять линий растянуть швейные иглы машины','Корпоративная информация, Омори Новости','Предоставление клиентам Омори информационных предприятий, связанных, чтобы позволить клиентам, чтобы лучше понять [Омори швейная машина]','1','Перед вводом в эксплуатацию три иглы пять линии простирания швейную машину, в первую очередь, мы должны подтвердить точность станка соответствует требованиям. Для с зазором совершенно отличное от заво…','1436940216','1437026108','Перед вводом в эксплуатацию три иглы пять линии простирания швейную машину, в первую очередь, мы должны подтвердить точность станка соответствует требованиям. Для с зазором совершенно отличное от заводского состояния устройства, сначала заменить оригинальные аутентичные хорошие части, точность машина поддерживается на относительно близко до заводского состояния. Вы можете проверить размер и расположение каждой части сотрудничества в соответствии с требованиями о сроках эксплуатации.<br />
<br />
Здесь автор на основе личного опыта, использование ручной фокусировки требуется организовать и дополнить (некоторые формулировки могут отличаться от описания спецификации).<br />
<br />
С регулировкой иглы и петлителя синхронизации<br />
<br />
Отрегулируйте иглу и петлитель со сроками, самым важным и, скорее всего, следует упускать из виду, что, когда игла упала до самой низкой точки петлителя должен двигаться вправо к дальней позиции предельной, а также при игла поднимается высокая Когда точка петлителя должен двигаться влево до самого дальнего крайнего положения, которое наблюдалось повторять, чтобы подтвердить.<br />
Кроме того, есть о действии, есть петлителя спереди (с видом на оператора) и после (от оператора) операции. В это время мы должны обратить внимание на спину и вперед движения петлителя петлителя лучшее время на ходу вокруг предельного положения до и после операции, чтобы сделать движение петлителя до минимума, когда петлитель движется влево, чтобы добраться до места иглы.<br />
На данный момент, мы должны обратить внимание на левой и правой позиции предельной это необходимо для предотвращения петлителя трется игольчатые движется влево, а также для предотвращения петлителя движется вправо, когда игла поцарапана тоже. Конечно, мы также можем регулировать передние и задние с изогнутой спицы и количества движения игловодителя немного угол по часовой стрелке, чтобы достичь наилучших результатов. Некоторые машины могут настроить диапазон движения передней и задней петлителя, и некоторые машины не являются.<br />
Когда игла до самой низкой позиции, согните кончик иглы расстояние между правом на 3мм 4мм-. Когда игла поднимается, Looper движется влево, согните кончик достигает середины правой иглы, когда игла согнута кончик иглы находится ниже верхнего 2,5 мм. В это время разрыв между изогнутой иглы, и игла 0 ~ 0,05 мм.<br />
Когда игла достигает задней снижение петлителя, так что левый глаз иглы, а игла изогнутая часть заправки встречаются иглы отверстие. В это время, позволяя петлитель слегка касается задней иглы, но это лучше, не царапается, или чуть больше, тем лучше.<br />
<br />
До и после корректировки предохранителя иглы<br />
<br />
Принципы, которым необходимо следовать до и после регулировки иглы гвардии: передний предохранитель иглы заметил очертания от оператора должна быть направлена на кончике иглы и последовательной связи, для того, чтобы предотвратить игловодитель в игольного предохранителя, трясти, сторона охраны иглу рядом с иглой Следует правильно скошенными. Передняя (рядом с оператором) иглы охранник предохранителя иглы необходимо также играют роль в блокировании швейная машина иглы в игольное ушко спереди (рядом с оператором) петель формы, действуя ушко иглы нить петли за гладкой образования. После предохранитель иглы необходимо действовать как барьер, защищающий иглу не может успешно формировать линии кольцо.<br />
Из-за различий разных производителей и модели машины, форма передней и задней предохранителя иглы, которая позволяет различный диапазон регулировки идеального государства есть определенный разрыв, попросите специалиста, чтобы приблизиться к принципам необходимо следовать, насколько это возможно в конкретных случаях.<br />
Когда игла перемещается вниз, передний и задний предохранитель иглы хотел бы перейти от направления иглы, а когда игла поднимается из самого нижнего положения до предохранителя иглы Чтобы закрыть направление иглы.<br />
Когда игла до иглы охраны положении, предохранитель иглы должен избежать иглу, и иглы почесал избежать.<br />
Кроме того, когда изогнутые иглы перемещается в левой до правой позиции иглы, разрыв между иглой и предохранителем иглы передней и задней иглы охраны труда, раньше (близко к стороне оператора) 0,1 мм-0,3 мм, после караула иглы и машины Зазор между иглой 0 ~ 0,1 мм.<br />
<br />
Отрегулируйте петлителя тейк-камеры<br />
<br />
Лупер нитепритягиватель кулачок, поскольку конструкция установки отличается, некоторые размеры и форма реальных потребностей может быть некоторым зазором, зазор слишком большой и может вызвать перемычку и повысить трудность обслуживания.<br />
Looper нитепритягивателя камерой действия: Когда петлитель движется влево своевременно предоставлять свой мобильный и петлителя вязать стежка швейной необходимое количество линии, когда петлитель движется вправо своевременно восстановить дополнительные нитки ,<br />
Особое внимание необходимо: Для того, чтобы облегчить иглу в задней части петлителя треугольника кольца, она должна петлителя нитепритягивателя камерой исхитриться в треугольной кольца, так петлителя Натяжение нити в государстве. Однако чрезмерное усилие может привести к поломке нити петлителя и швейных материалов в задней части нити петлителя появляется жесткой.<br />
Правильно настроенные стандарт петлителя бери камерой: Когда игла вниз, кончик иглы слева достигает нижнего петлителя вперед, это просто звук петли в треугольник, в петлителя петлителя нитепритягивателя кулачком на выбор Cam Самая высокая точка.<br />
Looper нитепритягивателя скорость камерой может внести незначительные коррективы в указанных выше критериев, на основе направления вращения в соответствии с их собственной мелодии быстро на задней части швейной шовный материал петлителя натяжения нити более рыхлой, кажется, наоборот, кажется, что нить петлителя Натяжение крепче.<br />
Бенг Бенг регулировка иглы и иглы на линии борту<br />
Некоторые марки машин, с возможностью растянуть иглу и игла могут быть скорректированы. Например Tongyu F007 три иглы пять линии простирания швейная машина игла может быть растянут, регулируя кулачок (F00710004) относительно оси передней части (F00708001), чтобы отрегулировать угол, чтобы растянуть по времени с иглой и целей игл. Лучший матч времени является то, что, когда иглы, игла право, когда игла входит Бенг Beng швейную кольцо начал двигаться вправо.<br />
Натяжные качели иглы должны гарантировать, что: Когда качели иглы, чтобы протянуть правое положение возврата предел может быть подключен к левой при шитье растягивать растягивать левую иглу, когда игла слева качели иглы при растяжении в 4.5mm-5,5 мм.<br />
Стретч игла высота установки должна быть столь же далеко, но разрыв между верхней и натянутой тугой иглы иглы на линии борту должны включить следующие нить растягивается прошло.<br />
Стретч игольная пластина установлена на высоте линии должны позволить Бенг швейная машина иглы подняться до самой высокой точки в правом нижнем углу иглы скользить после закрытия наконечника (от стороны оператора) иглы, так что право иглы При шитье участок легко удержал.<br />
Когда качели иглы к передней левой растягивается иглу, иглу и потянулся разрыв остается между кончиком должны быть 0,5-0,8.<br />
<br />
Координация движения поток<br />
<br />
Стретч Швейные точным действия корма может уменьшить вероятность перемычки явления. Действия повлияет на повседневную оборудование подачи с главной высоте подачи собаки, давление прижимной лапки, дифференциальной подачи, плотность стежка, она тесно связана с использованием скорости.<br />
Это одна из основных теорий, выдвинутых является: стабильный треугольник на задней стороне петли петлителя зависит от правильной работы корма со стабильностью и нити кулачка. Если корма нестабильной работе, треугольные проволочное кольцо деформируется или внезапно вдруг мало, так что игла не может войти треугольные петли.<br />
Отрегулируйте подачу принцип высоты собаки, чтобы понять: когда операция подачи завершается полностью вернуться гребенки из игольной пластины, любое движение в обратном направлении, чтобы сделать швейные материалы не разрешается иметь. Давление прижимной лапки, чтобы убедиться, что нет швейная материал стороны оператора не поскользнуться действия. Шва при шитье эластичный материал или оператора тянуть оружия чрезмерное усилие швейные материалы, оборудование, мы должны увеличить количество дифференциальной подачи. Шаг маленький треугольник проволочное кольцо мала, так плотность должна быть адекватной и в максимально возможной степени должны быть большими, не мало. Слишком быстро сделает шитье материал не ветреной или мгновенное лапка нажатии, тем самым влияя на стабильность проволочной петли.<br />','5','1','0','0','ru');
INSERT INTO `pa_news` VALUES ('52','162','Компьютер швейное оборудование ежедневный уход и обслуживание','Корпоративная информация, Омори Новости','Предоставление клиентам Омори информационных предприятий, связанных, чтобы позволить клиентам, чтобы лучше понять [Омори швейная машина]','1','С появлением информационного века, компьютер все больше и больше влияет на старомодной швейной машины чисто механического оборудования, обслуживающий персонал более настоятельная необходимость понять …','1436940297','1437026098','С появлением информационного века, компьютер все больше и больше влияет на старомодной швейной машины чисто механического оборудования, обслуживающий персонал более настоятельная необходимость понять и освоить уход и обслуживание данного оборудования новой технологии. Но дело глубоко обеспокоен обслуживающего персонала нетерпеливый Lost Souls, автор также механик, одинаково сильные чувства, особенно, собранные в течение почти 10 лет, в своей статье в обслуживании и поддержании более зрелого опыта, технологий, знаний компьютера швейного оборудования, и т.д. ,<br />
<br />
Убедитесь, что нормальное функционирование помещения<br />
<br />
Во-первых, эффективно использовать компьютер швейная машина среде<br />
() Компьютер Оборудование швейное разумные условия труда, Первый не установить устройство сильным голосом или высоких частот сварки электроэнергии сжечь место, сильный голос повлияет оборудование электричество или устройства могут не работать должным образом.<br />
(B), семинар должен быть температура воздуха в помещении 5 ~ 35 ℃ уместно, температура слишком высокая или слишком низкая повлияет на нормальную работу устройства.<br />
(С) влажность может привести к короткому замыканию внутри машины, относительная влажность воздуха должна поддерживаться на уровне от 45 до 85 процентов лучше, не с водяной пар в швейного оборудования монтируются вместе.<br />
(IV) пыль легко коррозии плат, так устройство должно быть чистым, семинар также будет содержаться в чистоте.<br />
(Е) необходимо использовать источник питания (источник питания бюро или установленный регулятор), с наземных функций (например, для отсечения питания должен быть выключен). Как должны быть строго запрещены в 380 трехфазный четырехпроводный трехфазной линии огня вступил в должность взять линию огня, а затем взять нулевую линию в качестве 220В, как линии питания компьютера швейного оборудования, такое оборудование часто приводят к частых аварий или сбоев и других сбоев (Основной причиной этого является слишком высокая или слишком низкое напряжение генерируется). Обслуживающий персонал часто не обращают на это внимание, но трудно настроить оборудование, тем самым вызывая много ненужных неприятностей, на самом деле, только стабильное энергоснабжение, устройство немедленно возвращается в нормальное русло.<br />
(F) Любой компьютер швейное оборудование должно поддерживаться на номинальных условиях напряжения Бюро питания, не должна превышать 10% избыток или дефицит повлияет устройство не работает должным образом, но питание должно быть больше, чем требуется энергопотребления машины.<br />
(VII) машина должна избегать прямого воздействия солнца светит снаружи, температура, генерируемых светом в головке машины горят легко контролировать, свет легко выгорают на стойке внутри основной чип, в результате чего крупной аварии, так что солнце может светить Семинар пришел должны на площади Тяньаньмэнь, шторы.<br />
(VIII) погода должна отключить питание молнии, потому что молния будет непосредственно влиять на нормальную работу устройства.<br />
II. Для разработки правильных привычек компьютер швейного оборудования.<br />
() Последовательность загрузки: Компьютерная периферия (выключатель питания) дисплей хозяина.<br />
(Б) последовательность отключения: периферийные устройства отображения хозяева.<br />
(С) у часто не включается, в противном случае последствия нынешнего легких металлоконструкций, работа на компьютере, когда вдруг выключения, легко повредить компьютер.<br />
(D), должны быть закрыты все запущенные программы после начала переключателя, то нормальная последовательность выходит, в противном случае легко разрушить систему не может начать.<br />
В-третьих, поставка оборудования и программного обеспечения статуса<br />
() После загрузки, оператор должен соблюдать самопроверки устройства, не прикасайтесь к компьютеру (хост), когда самоанализ<br />
Каждая система (б) нажать на устройстве для просмотра работы устройства. Основное содержание оборудования и ремонт один совет 6 [+ C Обь мне K антистатический, электростатический энергии сожгли чип. Тело статического десятков тысяч до сотен тысяч вольт вольт, живой доступ к компьютерам, отказ любого чипов, воздушно-сухой шерсти или синтетического одежды может быть вызвано статическим электричеством, обратите внимание, когда статическое электричество, не прикасайтесь хозяина.<br />
Во-вторых, когда текущее техническое обслуживание машины технологий Процессор Процессор превышает Ig, аппаратные проблемы охлаждения приведет к компьютерным неудач, системные сбои, процессор сожгли более определенной влажности будет автоматически сна, устройство не может начать.<br />
() Охлаждение: обеспечить, чтобы вентилятор внутри машины под управлением хорошо, если найдены частые сбои, немедленно закрыли, проверить вентилятор работает. Китай Швейные машины Technology Network<br />
(Б) Землетрясение: Оборудование для спорта и спортивных болельщиков резонировать легко износ вентилятора. Швейные технологии<br />
(С) давление: Убедитесь, что циркуляция воздуха, так что снижение давления ядра процессора.<br />
(IV) дома: Убедитесь, что питание является стабильным, он не будет производить в аварию.<br />
(V) Пыль: удалить пыль внутри машины, чтобы предотвратить плат короткое замыкание.<br />
(F), самодиагностики: прибор постороннего шума, частые сбои, запах, следует всегда обращать внимание на работы компьютерных аксессуаров, строго запрещено в аварии остается под напряжением состояние в течение длительного времени, проверьте звучит ли устройство нормально.<br />
Во-первых, обслуживающий персонал использовать компьютерную швейное оборудование, оно должно быть принято после того, безопасности и эксплуатации обучения, доступных на машине, для того, чтобы обеспечить безопасную эксплуатацию оборудования и правильного использования.<br />
Во-вторых, устройство должно быть установлено до начала всех устройств безопасности, это может привести к в случае травмы, так и для вашей безопасности и других, не демонтировать устройства безопасности.<br />
В-третьих, во время использования устройства не прикасайтесь любой части или начало толкать что-нибудь на машине, оператор или это может привести к повреждению самого устройства.<br />
В-четвертых, если устройство с автоматическим бар прижимной не прикасайтесь электромагнитный раздел, в противном случае это может привести к пожару очистки.<br />
<br />
Уход и обслуживание<br />
<br />
Во-первых, выключите, чтобы очистить должна предшествовать, или, если кнопка будет нажата случайно, машина сразу же начала и привести к травме.<br />
Во-вторых, обратите внимание на поддержание экологической гигиены для предотвращения попадания пыли в блок управления.<br />
В-третьих, уменьшить влажность воздуха и пыли.<br />
В-четвертых, чтобы температура слишком высока или слишком низка, температура слишком высокой или слишком низкой, легко повредить оборудование.<br />
Пять контейнер для воды не могут быть размещены на столе станка, так что вода течет в блок управления.<br />
В-шестых, отсоедините сетевой шнур, когда прах обеспечения безопасности персонала.<br />
Семь бывший отсоедините шнур питания, выключить внутренний переключатель, а затем включите главный выключатель, он будет гореть элемент интерфейса. Просто тщательно готовиться, компьютерная швейная машина послушно слушать вас, вы должны выполнить требования.<br />','6','1','0','0','ru');
INSERT INTO `pa_news` VALUES ('53','162','Омори Швейные машины Co., ООО Чжэцзян вторая годовщина создания новой конференции','Корпоративная информация, Омори Новости','Предоставление клиентам Омори информационных предприятий, связанных, чтобы позволить клиентам, чтобы лучше понять [Омори швейная машина]','1','Омори Швейные машины Co., ООО Чжэцзян вторая годовщина создания новой конференции','1436940359','1437026088','Омори Швейные машины Co., ООО Чжэцзян вторая годовщина создания новой конференции','6','1','0','0','ru');
INSERT INTO `pa_news` VALUES ('54','162','Нижняя разрыв строки, когда капитан исключить лавируя лавируя','Корпоративная информация, Омори Новости','Предоставление клиентам Омори информационных предприятий, связанных, чтобы позволить клиентам, чтобы лучше понять [Омори швейная машина]','0','При нормальных обстоятельствах, ток общий рынок лавировать машина не сломается нижнюю линию, когда лавировать ситуации длина рукава.   Эта ситуация, рекомендуется, чтобы ослабить некоторые и…','1436940418','1437026080','При нормальных обстоятельствах, ток общий рынок лавировать машина не сломается нижнюю линию, когда лавировать ситуации длина рукава.<br />
&nbsp; &nbsp;Эта ситуация, рекомендуется, чтобы ослабить некоторые из нижней строке, проверьте шпулька перекос, будь то на нижней строке через заусенцев, ось трансфер обертывание нить, будь проводной верхнюю мусора внутри катушки, эти причины могут помешать шпульку вращение, влияющие на нижнюю линию напряженности.<br />
&nbsp; Мы, возможно, пожелает, чтобы удалить трансфер очистить, или трансфер работает нормально попробовать поставить на машину.<br />','0','1','0','0','ru');
INSERT INTO `pa_news` VALUES ('55','163','2012 Гуанчжоу Международный фестиваль и Гуанчжоу Неделя моды','Корпоративная информация, Омори Новости','Предоставление клиентам Омори информационных предприятий, связанных, чтобы позволить клиентам, чтобы лучше понять [Омори швейная машина]','1','2012 Гуанчжоу Международный фестиваль и Гуанчжоу Неделя моды','1436940546','1437026067','2012 Гуанчжоу Международный фестиваль и Гуанчжоу Неделя моды','5','1','0','0','ru');
INSERT INTO `pa_news` VALUES ('56','163','2012 13 Китай Выставка (Циндао) Международная Швейное оборудование','Корпоративная информация, Омори Новости','Предоставление клиентам Омори информационных предприятий, связанных, чтобы позволить клиентам, чтобы лучше понять [Омори швейная машина]','1','2012 13 Китай Выставка (Циндао) Международная Швейное оборудование','1436940599','1437026033','2012 13 Китай Выставка (Циндао) Международная Швейное оборудование<br />','5','1','0','0','ru');
INSERT INTO `pa_news` VALUES ('57','163','В-третьих Китай Выставка (Чжэнчжоу) Международная Швейное оборудование','Корпоративная информация, Омори Новости','Предоставление клиентам Омори информационных предприятий, связанных, чтобы позволить клиентам, чтобы лучше понять [Омори швейная машина]','1','В-третьих Китай Выставка (Чжэнчжоу) Международная Швейное оборудование','1436940653','1437026023','В-третьих Китай Выставка (Чжэнчжоу) Международная Швейное оборудование','5','1','0','0','ru');
INSERT INTO `pa_news` VALUES ('58','164','2012 Выставка Девятая Международная Нинбо Швейное оборудование','Корпоративная информация, Омори Новости','Предоставление клиентам Омори информационных предприятий, связанных, чтобы позволить клиентам, чтобы лучше понять [Омори швейная машина]','1','2012 Выставка Девятая Международная Нинбо Швейное оборудование','1436940688','1437026010','2012 Выставка Девятая Международная Нинбо Швейное оборудование','4','1','0','0','ru');
INSERT INTO `pa_news` VALUES ('59','167','2012 Festival Internacional de Guangzhou y la Semana de la Moda de Guangzhou','Corporativo, Omori Noticias','Proporcionar a los clientes con información Omori negocios relacionados, para permitir a los clientes a entender mejor [Omori máquina de coser]','1','2012 Festival Internacional de Guangzhou y la Semana de la Moda de Guangzhou','1436940797','1436943830','2012 Festival Internacional de Guangzhou y la Semana de la Moda de Guangzhou<br />','5','1','0','0','spain');
INSERT INTO `pa_news` VALUES ('60','167','2012 El 13 de China de Exposiciones (Qingdao) Equipo Internacional de coser','Corporativo, Omori Noticias','Proporcionar a los clientes con información Omori negocios relacionados, para permitir a los clientes a entender mejor [Omori máquina de coser]','1','2012 El 13 de China de Exposiciones (Qingdao) Equipo Internacional de coser','1436940835','1436943824','2012 El 13 de China de Exposiciones (Qingdao) Equipo Internacional de coser<br />','5','1','0','0','spain');
INSERT INTO `pa_news` VALUES ('61','167','Tercera Exposición de China (Zhengzhou) Equipo Internacional de coser','Corporativo, Omori Noticias','Proporcionar a los clientes con información Omori negocios relacionados, para permitir a los clientes a entender mejor [Omori máquina de coser]','1','Tercera Exposición de China (Zhengzhou) Equipo Internacional de coser','1436940896','1436943816','Tercera Exposición de China (Zhengzhou) Equipo Internacional de coser<br />','6','1','0','0','spain');
INSERT INTO `pa_news` VALUES ('62','167',' 2012 Exposición Novena Ningbo Equipo Internacional de coser','Corporativo, Omori Noticias','Proporcionar a los clientes con información Omori negocios relacionados, para permitir a los clientes a entender mejor [Omori máquina de coser]','1','2012 Exposición Novena Ningbo Equipo Internacional de coser','1436940929','1436943809','<br />
2012 Exposición Novena Ningbo Equipo Internacional de coser','7','1','0','0','spain');
INSERT INTO `pa_news` VALUES ('63','166','Cómo científica depuración tres de cinco líneas se extienden agujas para máquinas de coser','Corporativo, Omori Noticias','Proporcionar a los clientes con información Omori negocios relacionados, para permitir a los clientes a entender mejor [Omori máquina de coser]','1','Antes de la puesta en marcha de tres de cinco línea de aguja de la máquina de costura recta final, en primer lugar, tenemos que confirmar la precisión de la máquina de cumplir con los requisitos. Porq…','1436941024','1436943801','Antes de la puesta en marcha de tres de cinco línea de aguja de la máquina de costura recta final, en primer lugar, tenemos que confirmar la precisión de la máquina de cumplir con los requisitos. Porque con la brecha bastante diferente al estado de fábrica del dispositivo, primero reemplace las partes buenas auténticos originales, la precisión de la máquina se mantiene relativamente cerca al estado de fábrica. A continuación, puede comprobar el tamaño y la posición de cada parte de la cooperación de acuerdo con los requisitos de tiempo de las instrucciones de funcionamiento.<br />
<br />
Aquí, el autor sobre la base de la experiencia personal, el uso de los ajustes de enfoque manual requerido para organizar y suplemento (algunos redacción puede variar de la descripción de la especificación).<br />
<br />
Con el ajuste de la aguja y el momento looper<br />
<br />
Ajuste la aguja y el garfio con el momento, lo más importante y lo más probable es que se pasa por alto es que cuando la aguja cayó al punto más bajo del garfio debe moverse hacia la derecha hasta la posición límite más lejano, también cuando la aguja se eleva a más alto Cuando el punto del garfio debe mover hacia la izquierda a la posición extrema más lejana, que se observó que repetirse para confirmar.<br />
Además hay cerca de la acción, no looper delante (hacia el operador) y después (lejos del operador) operación. En este momento debemos prestar atención al movimiento de vaivén del garfio garfio tiempo más rápido en movimiento alrededor de la posición final antes y después de la operación para que el movimiento de la lanzadera al mínimo cuando la lanzadera se desplaza a la izquierda para llegar a la posición de la aguja.<br />
En este punto, debemos prestar atención tanto a la izquierda y la posición límite de la derecha, es necesario para evitar que el looper frota la aguja se mueve a la izquierda, pero también para evitar que la lanzadera se desplaza a la derecha cuando la aguja se rascó también. Por supuesto, también podemos ajustar la parte delantera y trasera con el tamaño de aguja curva y la cantidad de movimiento de la barra de la aguja un ángulo de giro a la derecha poco para lograr los mejores resultados. Algunas máquinas pueden ajustar el rango de movimiento de la lanzadera delante y detrás, y algunas máquinas no lo son.<br />
Cuando la aguja a la posición más baja, doblar la distancia punta de la aguja entre el derecho a 3 mm, 4 mm. Cuando la aguja se levanta, mueve looper hacia la izquierda, doblar la punta llega al centro de la aguja derecha cuando la punta de la aguja doblada aguja se encuentra por debajo de la parte superior de 2,5 mm. En este tiempo la brecha entre la aguja curva y la aguja es de 0 ~ 0,05 mm.<br />
Cuando la aguja llega a la parte posterior de la disminución del garfio, de manera que el ojo izquierdo de una aguja, y la parte doblada de la aguja de enhebrar el reúnen agujero de la aguja. En este momento, permitiendo que el looper ligeramente toque la parte posterior de la aguja, pero es mejor no rayado, o un poco más, mejor.<br />
<br />
Antes y después del ajuste de la protección de la aguja<br />
<br />
Los principios que se deben seguir antes y después del ajuste de la protección de la aguja son: protección de la aguja delante vio el contorno del operador deben ser dirigidas a la punta de la aguja y la conexión constante, con el fin de evitar que la barra de aguja en la protección de la aguja, agitar, aguja de protección lateral cerca de la aguja Cabe achaflanado correctamente. Frente (cerca del operador) del protector de aguja de la protección de la aguja es necesario para jugar también un papel en el bloqueo de la máquina de coser aguja ojo de un frente de aguja (cerca del operador) formar bucles, actuando ojo de la aguja de un bucle de hilo de la aguja detrás de la formación suave. Después de que el protector de la aguja es necesario actuar como barrera protectora de la aguja no se puede formar con éxito anillo de línea.<br />
Debido a las diferencias de los distintos fabricantes y modelo de la máquina, la forma de la protección de la aguja delantera y trasera, que permite diferentes margen de ajuste del estado ideal hay una cierta diferencia, pida al técnico que acercarse a los principios que deben seguir tanto como sea posible en los casos específicos.<br />
Cuando la aguja se mueve hacia abajo, protector de la aguja delantera y trasera le gustaría a alejarse de la dirección de la aguja; cuando la aguja se eleva desde la posición más baja antes de que el protector de la aguja Para cerrar la dirección de la aguja.<br />
Cuando la aguja a la posición de protección de la aguja, la protección de la aguja debe escapar de la aguja y la aguja evitar arañazos.<br />
Además, cuando la aguja se mueve curvas a la izquierda a la posición de la aguja derecha, la brecha entre la aguja y el frente de protección de la aguja y el trabajo protector de aguja trasera, antes (cerca del lado del operador) de 0.1mm-0.3mm, después de que el protector de la aguja y la máquina la brecha entre la aguja es de 0 ~ 0.1mm.<br />
<br />
Ajuste el hilo del garfio toma-cam<br />
<br />
Looper hilo de recogida leva debido a que el diseño de la planta es diferente, algunos del tamaño y forma de las necesidades reales puede haber alguna brecha, la brecha es demasiado grande y puede causar puente y aumentar la dificultad de mantenimiento.<br />
Looper tirahilos acción de leva es: Cuando la lanzadera se desplaza a la izquierda en el momento oportuno para ofrecer su importe móvil y looper tejer coser puntada requerido de la línea, cuando la lanzadera se desplaza a la derecha en el momento oportuno para recuperar el hilo de coser adicional .<br />
Se necesita una atención especial: Con el fin de facilitar la aguja en la parte posterior del anillo triángulo hilo del garfio, que necesita hilo inferior de recogida de levas enhebrar la aguja en el anillo triangular, por lo que la tensión del hilo del garfio en el estado. Sin embargo, el exceso de estrés puede causar materiales hilo del garfio rotura y costura en la parte posterior del hilo inferior aparece apretado.<br />
Correctamente ajustado hilo inferior toma-cam estándar es: Cuando la aguja hacia abajo, punta de la aguja izquierda llega al looper inferior a lo largo, eso es sólo el sonido de bucles en el triángulo, el hilo del garfio hilo inferior de recogida de leva situada en el pick Cam el punto más alto.<br />
Looper tirahilos velocidad leva puede hacer ajustes de menor importancia a los criterios anteriores, en base a la dirección de rotación de acuerdo a su propia melodía rápida en la parte posterior del material de costura del áncora de puntadas de hilo de tensión más suelto parece, por el contrario, parece que la tensión del hilo del garfio con más fuerza.<br />
Beng Beng aguja de ajuste y la aguja sobre el tablero de línea<br />
Algunas marcas de máquinas, con la oportunidad de estirar la aguja y la aguja se pueden ajustar. Por ejemplo Tongyu F007 tres cinco línea de costura de estiramiento aguja de la máquina de la aguja puede ser estirado mediante el ajuste de la leva (F00710004) con respecto al eje de la sección frontal (F00708001) para ajustar el ángulo para estirar con la temporización de la aguja y los fines de aguja. Mejor partido el momento es que cuando la bajada de la aguja, la aguja derecha cuando la aguja entra anillo de sutura Beng Beng comenzó a moverse hacia la derecha.<br />
Cambios de agujas de estiramiento deben asegurarse de que: Cuando los cambios de agujas para estirar la derecha límite de retorno a la posición se puede conectar a la izquierda para coser estirar, estirar la aguja izquierda cuando la aguja de la izquierda a la oscilación de la aguja cuando se estira hasta un 4.5mm-5.5mm.<br />
Altura de instalación de la aguja estiramiento debe estar lo más arriba, pero la brecha entre la aguja superior y estirada aguja tensa sobre el tablero línea debe permitir que se extendía pasó el siguiente hilo.<br />
Placa de la aguja Stretch se instala sobre la altura de la línea debe permitir aguja de la máquina Beng coser en aumento hasta el punto más alto en la parte inferior derecha de la diapositiva de la aguja sin problemas después del cierre de la punta de la aguja (lejos del lado del operador), por lo que la caída de la aguja derecha Al coser tramo fácilmente fijado.<br />
Cuando la aguja se mueva a la izquierda delante estiran la aguja, la aguja y estiran la brecha que queda entre la punta debe ser de 0.5mm-0.8mm.<br />
<br />
RSS coordinación de movimientos<br />
<br />
Coser la acción de alimentación precisa estiramiento puede reducir la probabilidad de fenómeno puente. Acciones afecten a equipos de alimentación diaria con el principal altura del alimentador, presión del prensatelas, arrastre diferencial, densidad de la puntada, está estrechamente relacionado con el uso de la velocidad.<br />
Esta es una de las principales teorías presentadas es: un triángulo estable en la parte posterior del bucle de hilo de la lanzadera depende del correcto funcionamiento de la alimentación con la estabilidad y el hilo de la leva. Si la operación de alimentación inestable, anillo de alambre triangular es deformado o de repente de repente pequeña, de modo que la aguja no puede entrar en los bucles triangulares.<br />
Ajuste el principio altura del alimentador de entender es: Cuando se completa la operación de alimentación para volver plenamente los dientes de arrastre de la placa de la aguja, cualquier movimiento hacia atrás para hacer materiales de costura no se les permite tener. La presión del prensatelas para asegurar que ningún material de coser para el lado del operador resbale acción. Costura para coser material elástico u operador para tirar de los brazos excesivos materiales vigor de coser, equipos debemos aumentar la cantidad de la alimentación diferencial. Pitch pequeño anillo de alambre triángulo es pequeña, por lo que la densidad debe ser apropiado y en lo posible no debe ser grande pequeña. Materiales Demasiado rápido coser hará no es frívola o instantánea prensatelas presionado, lo que afecta a la estabilidad del lazo de alambre.<br />','6','1','0','0','spain');
INSERT INTO `pa_news` VALUES ('64','166','Equipos de costura Computer cuidado y mantenimiento diario','Corporativo, Omori Noticias','Proporcionar a los clientes con información Omori negocios relacionados, para permitir a los clientes a entender mejor [Omori máquina de coser]','1','Con el advenimiento de la era de la información, la computadora más y más impacto en la antigua máquina de coser equipos puramente mecánica, personal de mantenimiento cada vez más urgente necesidad de…','1436941088','1436943788','Con el advenimiento de la era de la información, la computadora más y más impacto en la antigua máquina de coser equipos puramente mecánica, personal de mantenimiento cada vez más urgente necesidad de comprender y dominar el cuidado y mantenimiento de este equipo la nueva tecnología. Pero el negocio está profundamente perturbado por el personal de mantenimiento impaciente Lost Souls, el autor también es un mecánico, son sentimientos igualmente fuertes, especialmente compilados por casi 10 años, en un artículo en el mantenimiento y conservación de la experiencia más madura, la tecnología, el conocimiento equipos de costura ordenador, etc. .<br />
<br />
Asegurar el normal funcionamiento de la premisa<br />
<br />
En primer lugar, hacer un buen uso del entorno de la máquina de coser equipo<br />
(A) Equipo de cómputo coser condiciones de trabajo razonables, lo primero es no instalar el dispositivo en una voz fuerte o una alta frecuencia de soldadura eléctrica quemar el lugar, voz fuerte afectará electricidad equipo o dispositivos no funcionen correctamente.<br />
(B) el taller se debe mantener la temperatura interior 5 ~ 35 ℃ es apropiado, la temperatura es demasiado alta o demasiado baja afectará el funcionamiento normal del dispositivo.<br />
(C) la humedad puede causar un cortocircuito dentro de la máquina, la humedad relativa debe mantenerse a 45 a 85 por ciento mejor, no con el vapor de agua en el equipo de costura montado juntos.<br />
(Iv) el polvo corroe fácilmente las placas de circuitos, por lo que el dispositivo debe mantenerse limpio, el taller también debe mantenerse limpio.<br />
(E) debe utilizar la fuente de alimentación (oficina de fuente de alimentación o regulador montado), con las características del terreno (como ser cortado el suministro de energía debe estar apagado). Como debe ser estrictamente prohibido en el 380V trifásica de cuatro hilos trifásica línea de fuego entró en funciones para tomar una línea de fuego, luego tomar la línea cero de energía 220V, ya que el equipo de costura ordenador línea de energía, estos equipos suelen dar lugar a accidentes o accidentes frecuentes y otros fallos (la razón principal es demasiado alto o demasiado bajo se genera tensión). El personal de mantenimiento a menudo no prestan atención a esto, pero difícil de ajustar el equipo, lo que causa un montón de problemas innecesarios, de hecho, sólo un suministro estable de energía, el dispositivo de inmediato vuelve a la normalidad.<br />
(F) Cualquier equipo de costura equipo debe mantenerse en las condiciones de tensión nominal de alimentación de la Oficina de Suministros, no debe superar el 10% de exceso o deficiencia afectará el dispositivo no funciona correctamente, pero la fuente de alimentación debe ser mayor que la máquina de consumo de energía requerido.<br />
(Vii) la máquina debe evitar la exposición directa al sol brilla afuera, la temperatura generada por la luz en el cabezal de la máquina quemar controlar fácilmente, luz fácil de quemar en un estante en el interior del chip principal, causando un accidente grave, por lo que el sol puede brillar El taller llegó deberá Plaza de Tiananmen, cortinas.<br />
(Viii) el clima debe apagar el poder del rayo, porque un rayo afecta directamente al funcionamiento normal del dispositivo.<br />
II. Para desarrollar los hábitos correctos de equipos de costura ordenador.<br />
(A) la secuencia de arranque: Periféricos (interruptor de alimentación) anfitrión pantalla.<br />
(B) la secuencia de apagado: Host visualización periféricos.<br />
(C) no cambie con frecuencia, de lo contrario el impacto del hardware actual fácil, el trabajo de equipo cuando el apagado repentino, fácil de dañar el equipo.<br />
(D) se cierra todos los programas que se ejecutan después el interruptor de arranque, entonces la secuencia normal sale, si no fácil destruir el sistema no se puede iniciar.<br />
En tercer lugar, el suministro de estado de hardware y software<br />
(A) después del arranque, el operador debe observar dispositivo de auto-examen, no toque el ordenador (host) cuando el auto-examen<br />
Cada sistema (b) haga clic en el dispositivo para ver el funcionamiento del dispositivo. Mantenimiento de hardware básico y reparar una tabla 6 [+ C ob k me antiestático, la energía electrostática de chip quemado. Cuerpo decenas estática de miles a cientos de miles de voltios voltios, el acceso directo a las computadoras, la ruptura de cualquier fichas, lana de secado al aire o la ropa sintética puede ser causada por la electricidad estática, prestar atención, cuando la electricidad estática, no toque el anfitrión.<br />
En segundo lugar, cuando la rutina de la máquina de mantenimiento de tecnología de CPU CPU supera Ig, problemas de refrigeración de hardware dará lugar a fallos informáticos, fallos del sistema, CPU quemado más de una cierta humedad se auto-sueño, el dispositivo no puede iniciar.<br />
(A) de refrigeración: para asegurarse de que el ventilador dentro de la máquina funcionando bien, si los accidentes frecuentes que se encuentran, de inmediato cerraron, compruebe el ventilador está funcionando. China, coser la tecnología de red de la máquina<br />
(B) Terremoto: el deporte y los aficionados al deporte Equipo resuenan fácilmente el desgaste del ventilador. La tecnología de costura<br />
(C) Presión: Hacer la circulación de aire seguro, por lo que la reducción de la presión base de la CPU.<br />
(Iv) Casa: Asegúrese de que el poder es estable, no va a producir un accidente.<br />
(V) Polvo: eliminar el polvo dentro de la máquina, para evitar que las placas de circuitos de cortocircuito.<br />
(F) de autodiagnóstico: El dispositivo ruido anormal, accidentes frecuentes, olor, siempre debe prestar atención al funcionamiento de los accesorios de computadora, está estrictamente prohibido en el accidente sigue siendo estado energizado por un largo tiempo, compruebe si el dispositivo suena normal.<br />
En primer lugar, el personal que opera utilizan equipos de costura equipo, debe ser aceptada después de la capacitación en seguridad y operación, disponible en la máquina, con el fin de garantizar un funcionamiento seguro del equipo y el uso adecuado.<br />
En segundo lugar, el dispositivo se debe instalar antes del inicio de todos los dispositivos de seguridad, esto puede resultar en el caso de lesión, por lo que para su seguridad y la de otros, no desmantelar los dispositivos de seguridad.<br />
En tercer lugar, el dispositivo durante su uso, no toque ninguna parte o el inicio meter nada en la máquina, el operador o puede causar daños en el propio dispositivo.<br />
En cuarto lugar, si el dispositivo con barra de presión automático, no toque la sección del solenoide, de lo contrario puede causar una limpieza fuego.<br />
<br />
Cuidado y mantenimiento<br />
<br />
En primer lugar, apague el interruptor para limpiar debe ser precedida por, o si el interruptor se pulsa accidentalmente, la máquina comenzará de inmediato y causar lesiones.<br />
En segundo lugar, prestar atención a mantener la higiene del medio ambiente para evitar que entre polvo en la caja de control.<br />
En tercer lugar, reducir la humedad del aire y el polvo.<br />
En cuarto lugar, para evitar que la temperatura es demasiado alta o demasiado baja, la temperatura es demasiado alta o demasiado baja, fácil de dañar el equipo.<br />
Cinco recipiente de agua no se puede colocar sobre la mesa de la máquina, para que el agua fluye en la caja de control.<br />
En sexto lugar, desconecte el cable de alimentación cuando el polvo se velará por la seguridad del personal.<br />
Siete ex desconecte el cable de alimentación, apague el interruptor interno, y luego apagar el interruptor principal, quemaría elemento de la interfaz. Sólo tiene que preparar cuidadosamente, máquina de coser computadora obedientemente escuchar a usted, usted está obligado a cumplir con los requisitos.<br />','7','1','0','0','spain');
INSERT INTO `pa_news` VALUES ('65','166','Omori Sewing Machine Co., Ltd. Zhejiang segundo aniversario de la creación de la nueva conferencia','Omori Sewing Machine Co., Ltd. Zhejiang segundo an','Proporcionar a los clientes Omori de las empresas relacionadas con la información, que permiten a los clientes a entender mejor [Omori máquina de coser]','1','Omori Sewing Machine Co., Ltd. Zhejiang segundo aniversario de la creación de la nueva conferencia','1436942258','1436943781','Omori Sewing Machine Co., Ltd. Zhejiang segundo aniversario de la creación de la nueva conferencia','6','1','0','0','spain');
INSERT INTO `pa_news` VALUES ('66','166','Salto de línea de fondo cuando el capitán excluye viradas viradas','Omori Sewing Machine Co., Ltd. Zhejiang segundo an','Proporcionar a los clientes Omori de las empresas relacionadas con la información, que permiten a los clientes a entender mejor [Omori máquina de coser]','1','En circunstancias normales, la máquina de viradas común de mercado actual no va a romper la línea de fondo cuando la situación de viradas longitud de la manga.   Esta situación, se recomiend…','1436942452','1436943764','En circunstancias normales, la máquina de viradas común de mercado actual no va a romper la línea de fondo cuando la situación de viradas longitud de la manga.<br />
&nbsp; &nbsp;Esta situación, se recomienda para aflojar algunos de la línea de fondo, marque la canilla está sesgado, ya sea en la línea de fondo a través de una fresa, eje de transporte es el hilo abrigo, ya sea cableada escombros superior dentro de la bobina, estas razones puede dificultar la bobina rotación, que afecta a la línea inferior de la tensión.<br />
&nbsp; Podemos desear quitar el servicio de transporte limpia, o lanzadera operando normalmente tratar de poner en la máquina.<br />','8','1','0','0','spain');
INSERT INTO `pa_news` VALUES ('67','165','Cálidas felicitaciones máquina Él ganó Taisen: ','Omori Sewing Machine Co., Ltd. Zhejiang segundo an','Proporcionar a los clientes Omori de las empresas relacionadas con la información, que permiten a los clientes a entender mejor [Omori máquina de coser]','1','Chino Sueño • Marca Dream - 21 de octubre Omori máquina automática plantilla similares Pudong, Omori con espíritu profesional y dedicado, junto con compradores de la industria Kerry Hotel Pudong, comp…','1436942556','1436943746','Chino Sueño • Marca Dream - 21 de octubre Omori máquina automática plantilla similares Pudong, Omori con espíritu profesional y dedicado, junto con compradores de la industria Kerry Hotel Pudong, compartió la alegría de coser automática, la gente Omori el coraje de explorar y la innovación , la búsqueda persistente, se ha comprometido a la automatización de costura y el desarrollo inteligente y la innovación, en el camino quince años todo el camino a creer y el trabajo duro quince años.<br />
Omori que incansablemente trabajan duro para pagar, mientras que la cosecha de la alegría "Preferencias de Usuario Diez potencial de la máquina de coser de la marca," yo soy verdaderamente el poder y la responsabilidad, vamos a servir mejor a las zonas de producción automatizadas en el mundo de la ropa, vamos a cumplir en noviembre 11 a 13 Taizhou Internacional Expo Center stand No: AT12 Omori máquina de coser automática Esperamos su visita para compartir y orientación!<br />','6','1','0','0','spain');
INSERT INTO `pa_news` VALUES ('68','165','Sewing Machine Co., Ltd. Zhejiang Omori segundo aniversario de la creación de la nueva conferencia distribuidor nacional foto','Máquinas de coser, máquinas de coser Omori','Omori Sewing Machine Co., Ltd es la producción de la máquina de coser, el paquete de la máquina de coser, Beng máquina de coser, máquina de trucos electrónicos, máquinas y otros productos de maquinaria fabricante especializado de corte en la máquina de coser, la serie de la máquina de coser se resumen los diversos estilos de la máquina de coser','1','Omori Sewing Machine Co., Ltd. Zhejiang segundo aniversario de la creación de nuevos distribuidores conferencia de fotos en todo el país.','1436942991','1436943753','<p>
	<img src="/Public/kindeditor/php/../../../Uploads/image/news/20150715/20150715144814_38267.jpg" alt="" /> 
</p>
<p>
	Omori Sewing Machine Co., Ltd. Zhejiang segundo aniversario de la creación de nuevos distribuidores conferencia de fotos en todo el país.
</p>','7','1','0','0','spain');
INSERT INTO `pa_news` VALUES ('69','165','Gran Exposición 2012 Taizhou Equipo Internacional de coser','Máquinas de coser, máquinas de coser Omori','Omori Sewing Machine Co., Ltd es la producción de la máquina de coser, el paquete de la máquina de coser, Beng máquina de coser, máquina de trucos electrónicos, máquinas y otros productos de maquinaria fabricante especializado de corte en la máquina de coser, la serie de la máquina de coser se resumen los diversos estilos de la máquina de coser','1','　2012台州国际缝制设备展览会　　Director General Adjunto: Ruanlin Feng (izquierda), fue invitado a China invitado especial (Taizhou) Equipo Internacional de Exposiciones de coser.　　Stand Omori creciente multitud, e&hellip;','1436943297','','<p>
	　2012台州国际缝制设备展览会
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image001.jpg" width="553" height="369" />
<p>
	　　Director General Adjunto: Ruanlin Feng (izquierda), fue invitado a China 
invitado especial (Taizhou) Equipo Internacional de Exposiciones de coser.
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image002.jpg" width="553" height="369" />
<p>
	　　Stand Omori creciente multitud, el popular cliente de bienvenida.
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image003.jpg" width="553" height="369" />
<p>
	　　Gerente General Señor Ye Xianchong (derecha) recibe la asociación recuerda 
entrevista de grupo.
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image004.jpg" width="553" height="369" />
<p>
	　　Gerente General Señor Ye Xian Chong (derecha) entre el cliente y cerrar 
negociaciones.
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image005.jpg" width="553" height="369" />
<p>
	　　Yip, gerente general de las funciones de la máquina cliente en detalle.
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image006.jpg" width="553" height="369" />
<p>
	　　Gerente de Negocios de Lee para los clientes demuestran el rendimiento de 
la máquina (derecha).
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image007.jpg" width="553" height="369" />
<p>
	　　Oficial sostienen nuestro modelo de pasarela de marcas
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image008.jpg" width="553" height="369" />
<p>
	　　Empresa de ahorro de energía serie motores destaca.
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image009.jpg" width="553" height="369" />
<p>
	　　Las ventas al exterior y también las negociaciones de los clientes 
extranjeros.
</p>
<p>
	<br />
</p>
<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image010.jpg" width="553" height="369" />
<p>
	<p>
		　<img alt="" src="http://www.chinadoso.com/upload/Image/xinwen/image011.jpg" width="553" height="369" />
	</p>
	<p>
		　　Técnico al cliente una explicación detallada de nuestro desempeño y 
características de productos
	</p>
</p>','5','1','0','0','spain');
INSERT INTO `pa_news` VALUES ('70','165','Hablando sobre el desarrollo de máquinas de coser automáticas','Máquinas de coser, máquinas de coser Omori','Omori Sewing Machine Co., Ltd es la producción de la máquina de coser, el paquete de la máquina de coser, Beng máquina de coser, máquina de trucos electrónicos, máquinas y otros productos de maquinaria fabricante especializado de corte en la máquina de coser, la serie de la máquina de coser se resumen los diversos estilos de la máquina de coser
','1','Industria de la confección de cambiar los requisitos del proceso, la máquina de coser automática único costo es demasiado alto, su alcance es a menudo limitado proceso de la ropa, y no ser capaz de ma…','1436943504','1436943738','Industria de la confección de cambiar los requisitos del proceso, la máquina de coser automática único costo es demasiado alto, su alcance es a menudo limitado proceso de la ropa, y no ser capaz de maximizar sus ventajas. En comparación, las máquinas de coser semi-automáticas, adaptabilidad fuerte de la tecnología de la ropa, el costo es relativamente bajo, en el rango de alcance de los usuarios, por lo que en los últimos años ha sido en general la bienvenida a las empresas de prendas de vestir y otros clientes.<br />
<br />
&nbsp;De la historia de el punto de vista de la máquina, se ha deseado invención poderosa máquina en lugar de la máquina de coser ordinaria, el pueblo liberado de la pesada trabajo fuera, la solución de conflictos laborales apretada; desde el punto de vista de las tendencias de desarrollo en la máquina, esta máquina tiene dos tendencias especies: una es la máquina de coser automática, el otro es un equipo de coser semi-automática, y de los efectos prácticos de la vista, la máquina de coser automática en la feroz competencia en el mercado es mejor tener la ventaja de la máquina de coser semi-automática; inferidos desde el punto de vista de la teoría, Cuanto mayor sea el grado de automatización de los equipos de costura, operando más simple, supuestamente más popular.<br />
Pero el resultado se da la realidad: la confección artesanal necesidades en constante cambio, la máquina de coser automática único costo es demasiado alto, su alcance es a menudo limitado proceso de la ropa, y no ser capaz de maximizar sus ventajas.<br />
En comparación, las máquinas de coser semi-automáticas, adaptabilidad fuerte de la tecnología de la ropa, el costo es relativamente bajo, en el rango de alcance de los usuarios, por lo que en los últimos años ha sido en general la bienvenida a las empresas de prendas de vestir y otros clientes.<br />
&nbsp;Características de la máquina de coser automática<br />
&nbsp;Como todos sabemos, presione Inicio materiales botón de costura por el operador estará en el lugar correcto, la máquina de coser se puede completar automáticamente el proceso de costura. Después de que el proceso de costura se ha completado, el corte de hilo automático y la máquina de coser por el sistema de recogida de forma secuencial se apilan materiales cuidadosamente coser. Si aún más si la parte de reciclaje del dispositivo también se puede hacer de forma automática.<br />
&nbsp; En circunstancias normales, un operador puede operar dos y cincuenta y ocho equipos de costura automática. Funciones automáticas para máquinas de coser son: el personal le quitarás la tela, pulse el botón Inicio, la tela control automático mecánica, costura del corte de hilo se completará secuencialmente pliega productos cosidos, un ciclo de costura se puede completar el proceso de costura relativamente complejo; máquina de coser automática recogido la tela, puede detectar si la tela, cosidos pone automáticamente distancia y completa; partes de la máquina también viene con sistema de alimentación de bucle.<br />
Además, la propia máquina de coser automática es muy específica, de alta eficiencia de la producción, la buena calidad de costura. Tales como: máquina de bolsa abierta, máquinas de bolsas.<br />
Características de la máquina semi-automática<br />
&nbsp; El material de costura por el operador en su posición cerca de la costura de distancia, a pie botón semiautomática inicio de la máquina o de forma automática por el dispositivo de detección, complete el proceso de costura asistida artificialmente. Después de que el proceso de costura se ha completado, la máquina de coser el corte de hilo semiautomático y recibos artificiales.<br />
&nbsp; En circunstancias normales, un operador puede operar una máquina de coser semiautomática dispositivo. De acuerdo con el resumen autor, características semi-automáticas para máquinas de coser son: Operador de semi-automática máquina de coser tendría que coser el material en posición cerca de la costura guardar; todo el proceso de costura se completa en menos artificial, con corte automático del hilo y otros dispositivos.<br />
&nbsp;Máquina de coser semi-automática también tiene alta eficiencia de producción, buenas ventajas de calidad de costura, tales como: máquina de bolsa de coser automática, máquinas automáticas de patrones.<br />','5','1','0','0','spain');
INSERT INTO `pa_news` VALUES ('71','165','Tela de la máquina de coser caminando ajuste irregular','Máquinas de coser, máquinas de coser Omori','Omori Sewing Machine Co., Ltd es la producción de la máquina de coser, el paquete de la máquina de coser, Beng máquina de coser, máquina de trucos electrónicos, máquinas y otros productos de maquinaria fabricante especializado de corte en la máquina de coser, la serie de la máquina de coser se resumen los diversos estilos de la máquina de coser
','1','En el curso de la utilización de la ropa de la máquina de coser, ropa veces la velocidad desigual, cuando las irregularidades de la puntada a largo cortas.&nbsp;Por este fenómeno fracaso, analiza el a&hellip;','1436943591','','En el curso de la utilización de la ropa de la máquina de coser, ropa veces la velocidad desigual, cuando las irregularidades de la puntada a largo cortas.<br />
&nbsp;Por este fenómeno fracaso, analiza el autor, gracias a la holgada ropa de perro caminar y prensatelas a plazo, por lo tanto, cuando el movimiento irregular de ropa encima, podemos concluir que los dientes y el prensatelas está defectuoso o presión mal ajustada. Como la presión del prensatelas es demasiado pequeño, la presión no es tela apretada, causará un movimiento irregular. Luego sólo hay que poner el regulador de presión a la baja tornillo giratorio para comprimir la ropa.<br />
Además, el prensatelas demasiado alto, máquina de coser prensatelas misma no puede suprimir la ropa, la ropa puede también causar medida arbitraria, o no moverse. Al ajustar, debemos levantar primero la llave prensatelas, afloje las guías de tornillo, y luego bajar la palanca de fijación de la distancia el prensatelas y la placa de la aguja se ajusta a una altura de 7 mm, 8 mm más tarde, a continuación, poner el tornillo Apriete, luego en coche a utilizar.<br />
&nbsp;Vale la pena señalar que hay una razón: se debe a la máquina de coser tornillo dientes flojos, causando los dientes durante la operación sobre temblando, así que la ropa no puede tener reglas para avanzar. En este sentido, recomendamos enfoque es: Nos costura placa de la aguja de la máquina sin carga, y los dos tornillos de dientes. Después de apretar, podemos poner instalada la placa de la aguja, compruebe los dientes a cada lado, si una fricción con el borde de las ranuras de la placa de la aguja se produzca. Si hay fricción, hará que el ruido y el fenómeno de maquinaria pesada, entonces sólo luego levantó la placa de aguja, aflojar los dientes de los tornillos, ajuste la posición de los dientes a la ranura central de la placa de la aguja y apriete los tornillos después de los dientes, y luego instalar la placa de aguja.<br />','6','1','0','0','spain');
INSERT INTO `pa_news` VALUES ('72','165','Espere más de la máquina para cambiar a actualizar el mercado profesional','Máquinas de coser, máquinas de coser Omori','Omori Sewing Machine Co., Ltd es la producción de la máquina de coser, el paquete de la máquina de coser, Beng máquina de coser, máquina de trucos electrónicos, máquinas y otros productos de maquinaria fabricante especializado de corte en la máquina de coser, la serie de la máquina de coser se resumen los diversos estilos de la máquina de coser
','1','Como país más grande de la maquinaria de costura produciendo en el mundo, la producción anual de China de las cuentas de máquina de coser máquina de coser para el ochenta por ciento o más del total de…','1436943657','1436943727','Como país más grande de la maquinaria de costura produciendo en el mundo, la producción anual de China de las cuentas de máquina de coser máquina de coser para el ochenta por ciento o más del total del mundo.<br />
En la década de 1990, el país cuenta con la exploración de los mercados profesionales de la industria de costura maquinaria. Con el desarrollo de la industria del vestido, las principales áreas de la demanda de la máquina de coser la prenda un crecimiento sustancial, y por lo tanto todas las formas de los mercados emergentes de la máquina de coser para la venta.<br />
Actualmente, la industria tiene un cierto tamaño y la influencia del mercado de máquinas de coser profesional son: la costura de Zhejiang, con la ciudad de Dongyang ciudad ciervos tigre, Shanghai Garment Maquinaria City, Guangzhou (Internacional) Máquina de coser City, ciudad de costura "Shi tesoro", etc. ; prosperar la industria de prendas de vestir para promover la construcción del mercado de máquinas de coser profesional, más y más profesional de máquinas de coser en construcción o en mercado de la construcción --- 18 de abril 2008, Fujian equipo de costura mercado profesional ("Haibo "Museo de Máquina de coser) se inauguró oficialmente. El mercado se encuentra en el más famoso distrito de la ropa de la ciudad de Shishi, con una superficie total de construcción de 250.000 metros cuadrados. Actualmente, el mercado es la primera fase de más de 6.000 metros cuadrados de superficie de exposición han sido todos predeterminado, más de 30 fabricantes de equipos de costura firmaron un acuerdo establecido.<br />
La primavera de 2008 comenzó el "Beijing International Equipment Ropa Textile City" se esfuerzan por construir "portaaviones" moderno equipo de costura clase textil en la Ciudad. El funcionario dijo, la "Ciudad" para la industria textil y de prendas de vestir y la investigación y desarrollo de nuevas tecnologías de coser industria de la maquinaria, y los nuevos productos será mejor para la zona "Tres Norte" de los servicios de mercado, para promover el área textil "Tres Norte" y de la confección desarrollo de la industria y de la industria de la maquinaria de costura, y la radiación en el sudeste de Asia y en todo el mercado internacional.<br />
Además, en construcción en el mercado profesional, así como Dongyang International Máquinas de coser Market, el mercado de Yiwu y otras materias primas, maquinaria.<br />
No hay duda, contratado y construir más y más profesionales del mercado, ya que muchos de los negocios de máquinas de coser proporciona una oportunidad para desarrollar nuevos mercados y más espacio, transformando su negocio de instalaciones de costura, mejorar el entorno empresarial y la cultura empresarial construcción, y mejorar la gestión y los servicios de mercado, mejorar la capacidad para hacer frente a la competencia internacional en el mercado, han desempeñado un papel positivo en la promoción.<br />
En la actualidad, el mercado interno no está maduro máquina de coser profesional, todavía tienen que cultivar lentamente. Tan sólo en los últimos diez años de desarrollo, la máquina de coser especializada mercados ha habido muchos problemas.<br />
Construcción de máquinas de coser mercado profesional es un proceso de desarrollo duradero. Algunos inversores carecen de visión a largo plazo, sólo el mercado como proyectos de bienes raíces, ventas y desarrollo. Después de la configuración del mercado, la falta de consideración de cómo desarrollar.<br />
A lo largo de la industria de inversión del mercado constructores profesionales. Se puede dividir en dos categorías: una es la inversión en el desarrollo de bienes raíces con sede desarrollador de bienes raíces. Ellos ven buenas perspectivas de la industria de máquinas de coser, la máquina de coser se desarrollará activamente el mercado profesional y de bienes raíces juntos. La mayoría de estos inversores en el desarrollo, construcción, ventas, totalmente retirarse del mercado de gestión de tarde, para otros proyectos. Otro de los inversores en sí es fabricante de costura o distribuidor, que encontraron en los márgenes de beneficio de la industria de negocios se hacen más pequeños, comenzaron a tratar de entrar en el enorme potencial del mercado profesional.<br />
Costura presencia profesional en el mercado en la construcción de la ceguera, el desarrollo del mercado está desequilibrado, la construcción redundante, la competencia homogénea y otros temas. Recientemente, cuando visité el mercado en Yiwu máquina de coser número distribuidor casa mecánica cruda cuando me enteré de que todo el mundo piensa Yiwu pequeño mercado local de la máquina de coser. El "extranjero cercano" costura Dongyang con las relaciones de mercado y comerciantes atraer el mercado está en auge fuente de poder. Entendemos que, con la ventaja del distrito de negocios de Yiwu, una nueva máquina de coser mercado profesional en construcción.<br />
A pesar de la evolución del mercado de la máquina de coser profesional se encuentra todavía en la etapa de entrenamiento, pero con la influencia de la transición de la industria de la caliente para el frío y la crisis financiera, ya sea tradicional o en construcción en el mercado profesional, se enfrentan a problemas para mejorar la competitividad.<br />
El equipamento de costura mercado profesional puede proporcionar una ventanilla única, que es rico en variedad y completa, tanto básicamente satisfacer la demanda interna, hay cierta competitividad internacional. Con el avance tecnológico de la humanidad, la división social del trabajo es cada vez más pequeños, los intereses y necesidades de los clientes, las necesidades, las llamadas de competencia de mercado diversificados para el nacimiento de un nuevo modelo especializado de acceso al mercado económico, el modelo de marketing profesional se ha convertido en una necesidad.<br />
Tenemos razones para esperar, el mercado profesional de la industria para nutrir una marca nacional puede hacer efectiva. Al mismo tiempo, también esperamos que en un futuro próximo ya que el mercado madure y desarrollo profesional, permitiendo a la máquina de coser doméstica en el brillo mercado interno.<br />','6','1','0','0','spain');
INSERT INTO `pa_news` VALUES ('73','165','Las exportaciones de máquinas de coser de China y la demanda del mercado internacional','Máquinas de coser, máquinas de coser Omori','Omori Sewing Machine Co., Ltd es la producción de la máquina de coser, el paquete de la máquina de coser, Beng máquina de coser, máquina de trucos electrónicos, máquinas y otros productos de maquinaria fabricante especializado de corte en la máquina de coser, la serie de la máquina de coser se resumen los diversos estilos de la máquina de coser','1','El desarrollo de la situación del mercadoDe las exportaciones, la demanda del mercado internacional para la máquina de coser continuará centrándose en los aspectos de máquinas de coser industriales, l&hellip;','1436943717','','El desarrollo de la situación del mercado<br />
De las exportaciones, la demanda del mercado internacional para la máquina de coser continuará centrándose en los aspectos de máquinas de coser industriales, las exportaciones de máquinas del bordado es probable que siga disminuyendo. Por otro lado, el impacto de la crisis financiera de Estados Unidos va a continuar, lo que significa que los EE.UU. y algunos países europeos deseamos para comprar máquinas de coser domésticas será suprimido, crecimiento de las exportaciones máquinas de la casa seguirá disminuyendo. Las partes y componentes, nuestros productos ventajas "barato" afectarán aún más el mercado, que se espera que el crecimiento de las exportaciones de dos dígitos. En la situación actual, la segunda mitad de este año, una gran demanda en el mercado textil y de confección internacional todavía existe, de la zona del mercado, el desarrollo de la industria textil y de la confección de algunos países y regiones en desarrollo para que el crecimiento continuo de la demanda de máquinas de coser, y directo Nuestro crecimiento de las exportaciones impulsado máquina de coser. Pero el segundo tiempo, un aumento de las exportaciones de la máquina de coser no se elevará de manera significativa, se espera que se mantenga el crecimiento de un solo dígito.<br />
Asia: las exportaciones de piezas aumentó constantemente<br />
Asia es de China los principales mercados de exportación de la máquina de coser, su participación en las exportaciones representaron más de la mitad de las exportaciones totales del país. Mercados de exportación se centran en la India, Japón y Hong Kong, China, se clasificaron primero, tercero, cinco principales mercados de exportación de China.<br />
La segunda mitad, las exportaciones de China al mercado asiático seguirá máquinas y máquinas de bordado y otros productos de la máquina industrial, pero debido a la reciente corrección del mercado, la India, Vietnam y la crisis económica, el medio ambiente político inestable de Tailandia y otros factores, máquinas industriales y máquinas de bordado de la demanda habrá un cierto nivel de decadencia. Lado de la consola, recogió la demanda japonesa de mercado contribuido directamente a la recuperación del mercado de la consola. Piezas y componentes, Singapur y otros recuperación del mercado de reprocesamiento garantizarán efectivamente se espera un aumento constante de las exportaciones de China para aumentar permanecer en dobles dígitos.<br />
África: máquinas industriales exigen aumento rápido<br />
África mercado de máquinas de coser para subir en los últimos años, con el rápido desarrollo del país, Nigeria, Egipto y la industria de otras prendas de vestir, su creciente demanda de costura, en especial la creciente demanda de máquinas de coser industriales.<br />
En los últimos años, el rápido desarrollo económico en algunos países de África, especialmente en Nigeria, Egipto y otra textil tradicional y la industria de prendas de vestir está avanzando rápidamente, con el aumento en los pedidos de exportación a Europa y África se acelerará la introducción de la máquina de coser, y los productos chinos "barato" África se convertirá en la primera elección de los textiles y prendas de vestir empresas. La segunda mitad, el enfoque de nuestra exportación a África y Nigeria, Egipto y otros mercados también se colocará en las máquinas industriales, máquinas de bordado y otros equipos industriales y piezas de repuesto debido al mantenimiento regular del equipo existente y la compra de un pequeño número de fábrica de máquinas exhibirá un crecimiento de dos dígitos.<br />
Europa: las exportaciones de máquinas de bordado continuó calentándose<br />
Las exportaciones de China a Europa ha sido siempre la máquina principal casa, pero en los últimos años la demanda de Europa para la costura de la casa fuerte caída en la demanda de máquina del bordado ha seguido creciendo, especialmente cap máquinas de bordar y otra máquina especial bordado. En la actualidad, las exportaciones de China se concentran en Europa máquina de bordar en Italia, Rusia, Alemania y otros países.<br />
América del Sur: el rápido crecimiento de las exportaciones totales<br />
Las exportaciones de China a América del Sur productos de maquinaria de costura se concentraron en Brasil y otros países, de los cuales las exportaciones de China a Brasil representaron casi la mitad del total de exportaciones a América del Sur.<br />
Hasta el momento, Brasil, Argentina y otros países en el mercado textil y de la confección de América del Sur se desarrollaron rápidamente a finales de 2007, la demanda de máquinas industriales, piezas y mejora de forma significativa, y la ventaja de costos de los productos chinos para convertirse en las empresas de América del Sur para la compra de elección. La segunda mitad, el entorno económico no va a cambiar en América del Sur, y el rápido desarrollo de Brasil, Argentina y otros países en el mercado textil y de confección seguirá siendo, se espera que la costura mercado de exportación de la máquina en América del Sur para permanecer en flor, marcó el comienzo de las exportaciones de los pequeños clímax de China.<br />
América del Norte: la consola de recuperación de la demanda<br />
Las exportaciones chinas de productos para el hogar en las principales exportaciones de máquinas de coser América del Norte se concentran en los Estados Unidos. La razón es que la crisis financiera, el ama de casa tenía que hacer algo en su propia casa, lo que reduce los costos. Causando las vacila demanda estadounidense de mercado de la consola, la consola más tarde mostró signos de mejoría. Principalmente se espera que Estados Unidos en la segunda mitad de la demanda del mercado de América del Norte continuará a recoger la consola.<br />','5','1','0','0','spain');


# 数据库表：pa_node 数据信息
INSERT INTO `pa_node` VALUES ('1','Admin','后台管理','1','网站后台管理项目','10','0','1');
INSERT INTO `pa_node` VALUES ('2','Index','管理首页','1','','1','1','2');
INSERT INTO `pa_node` VALUES ('3','Member','注册会员管理','1','','3','1','2');
INSERT INTO `pa_node` VALUES ('4','Webinfo','系统管理','1','','4','1','2');
INSERT INTO `pa_node` VALUES ('5','index','默认页','1','','5','2','3');
INSERT INTO `pa_node` VALUES ('6','myInfo','我的个人信息','1','','6','2','3');
INSERT INTO `pa_node` VALUES ('7','index','会员首页','1','','7','3','3');
INSERT INTO `pa_node` VALUES ('8','index','管理员列表','1','','8','14','3');
INSERT INTO `pa_node` VALUES ('9','addAdmin','添加管理员','1','','9','14','3');
INSERT INTO `pa_node` VALUES ('10','index','系统设置首页','1','','10','4','3');
INSERT INTO `pa_node` VALUES ('11','setEmailConfig','设置系统邮件','1','','12','4','3');
INSERT INTO `pa_node` VALUES ('12','testEmailConfig','发送测试邮件','1','','0','4','3');
INSERT INTO `pa_node` VALUES ('13','setSafeConfig','系统安全设置','1','','0','4','3');
INSERT INTO `pa_node` VALUES ('14','Access','权限管理','1','权限管理，为系统后台管理员设置不同的权限','0','1','2');
INSERT INTO `pa_node` VALUES ('15','nodeList','查看节点','1','节点列表信息','0','14','3');
INSERT INTO `pa_node` VALUES ('16','roleList','角色列表查看','1','角色列表查看','0','14','3');
INSERT INTO `pa_node` VALUES ('17','addRole','添加角色','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('18','editRole','编辑角色','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('19','opNodeStatus','便捷开启禁用节点','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('20','opRoleStatus','便捷开启禁用角色','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('21','editNode','编辑节点','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('22','addNode','添加节点','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('23','addAdmin','添加管理员','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('24','editAdmin','编辑管理员信息','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('25','changeRole','权限分配','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('26','News','资讯管理','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('27','index','新闻列表','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('28','category','新闻分类管理','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('29','add','发布新闻','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('30','edit','编辑新闻','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('31','del','删除信息','0','','0','26','3');
INSERT INTO `pa_node` VALUES ('32','SysData','数据库管理','1','包含数据库备份、还原、打包等','0','1','2');
INSERT INTO `pa_node` VALUES ('33','index','查看数据库表结构信息','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('34','backup','备份数据库','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('35','restore','查看已备份SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('36','restoreData','执行数据库还原操作','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('37','delSqlFiles','删除SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('38','sendSql','邮件发送SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('39','zipSql','打包SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('40','zipList','查看已打包SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('41','unzipSqlfile','解压缩ZIP文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('42','delZipFiles','删除zip压缩文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('43','downFile','下载备份的SQL,ZIP文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('44','repair','数据库优化修复','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('46','Siteinfo','网站功能','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('47','index','菜单列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('48','add_nav','添加/编辑菜单','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('49','adindex','轮播列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('50','add_ad','添加/编辑轮播','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('51','page','单页列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('52','add_page','添加/编辑单页','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('53','tag_index','标签列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('54','add_tag','添加/编辑标签','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('55','create_tag','模版标签生成','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('56','file_index','文件管理','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('57','link_index','友情链接列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('58','add_link','添加/编辑友情链接','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('59','message','留言信息列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('60','Product','产品管理','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('61','delpage','删除单页','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('62','delad','删除轮播','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('63','dellink','删除友情链接','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('64','delmessage','删除留言','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('65','deltag','删除标签','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('66','selectCat','文章分类','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('67','index','产品列表','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('68','edit','编辑产品','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('69','add','添加产品','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('70','category','分类列表','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('71','del','删除产品','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('72','changeAttr','快速推荐','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('73','changeStatus','快速审核','0','','0','60','3');
INSERT INTO `pa_node` VALUES ('74','changePhoneStatus','手机推荐','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('75','checkProductTitle','标题检查','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('76','changeAttr','快速推荐','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('77','changeStatus','快速审核','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('78','Models','模型管理','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('79','index','模型列表','1','','0','78','3');
INSERT INTO `pa_node` VALUES ('80','add','添加模型','1','','0','78','3');


# 数据库表：pa_page 数据信息
INSERT INTO `pa_page` VALUES ('20','zjds','0','走进大森','<img class="imngs" src="/Uploads/image/product/20150712/s-1.jpg" /> 
<p>
	　　在祖国的东海之滨，坐落着一个美丽的滨海城市——台州。这里东临台州湾，南连雁荡，北倚天台，山水神秀。人文景观源远流长。数千年中华历史文化的传承积淀与现代世界文明的融合使得这片土地充满着勃勃生机。在这块肥沃土地上成长壮大的浙江贪吃宝贝，正以"乘风破浪"的激情全力打造一流缝纫机械生产企业。
</p>
<p>
	<img src="/Uploads/image/page/20150719/1-2.jpg" alt=""  style="width:100%;" /> 
</p>

<p>
	　　台州市弘硕电子商务有限公司创建于1999年，坐落于台州滨海工业园区，公司占地面积30000多平方米。公司以其独特的视角，以创建国际现代型服装机械企业，打造缝纫机械行业新品牌、创造人类服装新文化为目标，走上艰辛的创业之路。公司秉承"精、诚、稳"的经营哲学，即----精益求精，诚实经营，稳步前进，在市场经济大潮中成功站稳脚跟，并茁壮成长，多年来在中国服装机械行业积累了丰富经验。发展至今已成为一个集科研、开发、设计、生产、贸易、服务于一体专业服装机械和纺织机械设备供应商。其旗下品牌"大森、高林、金雀"产品---电子特种机系列，电子花样机系列，绷缝机系列，包缝机系列，平缝机系列，厚料机系列，全电脑横编织机，节能电机等八大类90余种产品畅销世界各地，深受广大客户好评。
</p>
<p>
	<img src="/Uploads/image/page/20150719/1-1.jpg" alt=""  style="width:100%;" /> 
</p>
<p>
	　　公司坚持"开拓创新，和谐共赢"的企业核心理念，稳步发展，做精做强，经过全体员工多年的不懈努力，目前已确立了公司在国内服装机械行业的领先地位。今天的大森公司，已是缝纫机行业的中流砥柱，在2003年就加入了中国缝制机械协会，成为协会会员单位，2008年成为浙江省缝纫机协会理事单位，2003年，被授予全国乡镇企业先进单位, 2006年，评为年度企业资信等级 AA+级,多次被评为重质量守信誉单位。今天的大森人明白，"质量第一，信誉至上"是公司得以立足的永恒追求!'工欲善其事,必先利其器。"多年来，公司在董事长叶仙冲先生的带领下，秉承"研制最好产品、提供最好服务"的精神，坚持"产品高质量，员工高素质，用户高满意"的质量方针，完成多项新型实用专利项目并荣获多项科研成果，先后通过ISO9001：2000质量管理体系认证和CE安全认证。 进入市场10年来，经历了设备引进-技术升级-人才战略-信息化建设阶段，导入CAD、ERP管理系统。公司十分注重科学管理和新产品开发，在巩固和发展原有产品的同时, 从普通工业缝纫机发展到机电一体化无油电脑控制缝纫机，伺服控制系统以及特种机等一系列高附加值产品, 进一步加大了各种新产品的制造和销售,保证了公司产品在服装机械领域的先进水平，并实现了公司走可持续发展道路的战略目标。 品质源于实力，科技铸就辉煌。公司通过自主研发，技术创新，多种高端设备相继投放市场;其生产的直驱平缝机，相比同行产品取得了"转速快，噪音低，功能强，效率高"的优势，又推出了电子套结机,电子订扣机，电子花样机，新款包缝机，全系列绷缝机,节能伺服电机等。 大森产品是以人为本和与国际未来标准相符合设计思想的全部体现，合理完善的结构，简捷可靠的操作性能，优美流畅的造型，体现着科学技术与审美文化的完美结合，再现着时代发展潮流与人类文明的进步，实践着领导服装机械发展潮流的宣言。
</p>
<p>
	　　大森公司凭借雄厚的技术力量，科技为本，不断求实创新，精益求精，将时刻为广大用户量身打造最佳的产品配置方案，提供更具人性化的产品和服务。公司产品覆盖了国内近三十个省市、自治区，并远销亚、非、拉美及欧洲等近40个国家和地区。
</p>
<p>
	　　公司自创立以来，坚持"以绩效为导向，培养高素质人才"战略，推行"以人为本"管理理念，形成了独具魅力的管理风格，我们的管理之道，已被实践所证实，为同行业所称道。现代化计算机生产管理系统在这里得到充分应用，各层次管理人员的聪明才智在这里得到充分发挥，他们在各自的位置上实施着计划、组织、协调、控制等以ERP管理工程为基础的各项具体职能。公司拥有大批技术精湛的资深技术人才和经验丰富的管理人才，这是一支具有高度凝聚力和忠诚度的员工队伍，这些是大森最重要的资产，是公司得以发展，登上国际竞争舞台的坚实动力!卓越、智慧、永不满足的大森人是值得赞美、值得自豪的，这就是今天的大森人，这也是未来的大森人。我们承诺：科技创新，为顾客创造价值、为员工创造机会、为社会创造效益。
</p>
<p>
	　　大森公司覆盖全国的销售服务网络、销售档案、用户档案的建立，准确收集不同国家、不同地区、不同用户的使用信息，为他们提供迅速、准确、高效的服务。"传承卓越，共创未来"，大森公司将继续以客户需求为关注点，不断研究创新，把世界上最先进的技术和设计理念带给客户。
</p>
<p>
	　　昨天的成绩已经成为过去，崭新的明天将带来更多的机遇与挑战，今天大森人将凭着诚信、智慧、胆略和实干，与我们的客户携手，共同构建欣欣向荣的事业空间，为服装机械工业做大、做强作出更大贡献，我们的明天一定更美好!
</p>','1','贪吃宝贝,走进大森','森缝纫机有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('21','gsjj','20','公司简介','<img class="imngs" src="/Uploads/image/product/20150712/s-1.jpg" /> 
<p>
	　　在祖国的东海之滨，坐落着一个美丽的滨海城市——台州。这里东临台州湾，南连雁荡，北倚天台，山水神秀。人文景观源远流长。数千年中华历史文化的传承积淀与现代世界文明的融合使得这片土地充满着勃勃生机。在这块肥沃土地上成长壮大的浙江贪吃宝贝，正以"乘风破浪"的激情全力打造一流缝纫机械生产企业。
</p>
<p>
	<img src="/Uploads/image/page/20150719/1-2.jpg" alt=""  style="width:100%;" /> 
</p>

<p>
	　　台州市弘硕电子商务有限公司创建于1999年，坐落于台州滨海工业园区，公司占地面积30000多平方米。公司以其独特的视角，以创建国际现代型服装机械企业，打造缝纫机械行业新品牌、创造人类服装新文化为目标，走上艰辛的创业之路。公司秉承"精、诚、稳"的经营哲学，即----精益求精，诚实经营，稳步前进，在市场经济大潮中成功站稳脚跟，并茁壮成长，多年来在中国服装机械行业积累了丰富经验。发展至今已成为一个集科研、开发、设计、生产、贸易、服务于一体专业服装机械和纺织机械设备供应商。其旗下品牌"大森、高林、金雀"产品---电子特种机系列，电子花样机系列，绷缝机系列，包缝机系列，平缝机系列，厚料机系列，全电脑横编织机，节能电机等八大类90余种产品畅销世界各地，深受广大客户好评。
</p>
<p>
	<img src="/Uploads/image/page/20150719/1-1.jpg" alt=""  style="width:100%;" /> 
</p>
<p>
	　　公司坚持"开拓创新，和谐共赢"的企业核心理念，稳步发展，做精做强，经过全体员工多年的不懈努力，目前已确立了公司在国内服装机械行业的领先地位。今天的大森公司，已是缝纫机行业的中流砥柱，在2003年就加入了中国缝制机械协会，成为协会会员单位，2008年成为浙江省缝纫机协会理事单位，2003年，被授予全国乡镇企业先进单位, 2006年，评为年度企业资信等级 AA+级,多次被评为重质量守信誉单位。今天的大森人明白，"质量第一，信誉至上"是公司得以立足的永恒追求!'工欲善其事,必先利其器。"多年来，公司在董事长叶仙冲先生的带领下，秉承"研制最好产品、提供最好服务"的精神，坚持"产品高质量，员工高素质，用户高满意"的质量方针，完成多项新型实用专利项目并荣获多项科研成果，先后通过ISO9001：2000质量管理体系认证和CE安全认证。 进入市场10年来，经历了设备引进-技术升级-人才战略-信息化建设阶段，导入CAD、ERP管理系统。公司十分注重科学管理和新产品开发，在巩固和发展原有产品的同时, 从普通工业缝纫机发展到机电一体化无油电脑控制缝纫机，伺服控制系统以及特种机等一系列高附加值产品, 进一步加大了各种新产品的制造和销售,保证了公司产品在服装机械领域的先进水平，并实现了公司走可持续发展道路的战略目标。 品质源于实力，科技铸就辉煌。公司通过自主研发，技术创新，多种高端设备相继投放市场;其生产的直驱平缝机，相比同行产品取得了"转速快，噪音低，功能强，效率高"的优势，又推出了电子套结机,电子订扣机，电子花样机，新款包缝机，全系列绷缝机,节能伺服电机等。 大森产品是以人为本和与国际未来标准相符合设计思想的全部体现，合理完善的结构，简捷可靠的操作性能，优美流畅的造型，体现着科学技术与审美文化的完美结合，再现着时代发展潮流与人类文明的进步，实践着领导服装机械发展潮流的宣言。
</p>
<p>
	　　大森公司凭借雄厚的技术力量，科技为本，不断求实创新，精益求精，将时刻为广大用户量身打造最佳的产品配置方案，提供更具人性化的产品和服务。公司产品覆盖了国内近三十个省市、自治区，并远销亚、非、拉美及欧洲等近40个国家和地区。
</p>
<p>
	　　公司自创立以来，坚持"以绩效为导向，培养高素质人才"战略，推行"以人为本"管理理念，形成了独具魅力的管理风格，我们的管理之道，已被实践所证实，为同行业所称道。现代化计算机生产管理系统在这里得到充分应用，各层次管理人员的聪明才智在这里得到充分发挥，他们在各自的位置上实施着计划、组织、协调、控制等以ERP管理工程为基础的各项具体职能。公司拥有大批技术精湛的资深技术人才和经验丰富的管理人才，这是一支具有高度凝聚力和忠诚度的员工队伍，这些是大森最重要的资产，是公司得以发展，登上国际竞争舞台的坚实动力!卓越、智慧、永不满足的大森人是值得赞美、值得自豪的，这就是今天的大森人，这也是未来的大森人。我们承诺：科技创新，为顾客创造价值、为员工创造机会、为社会创造效益。
</p>
<p>
	　　大森公司覆盖全国的销售服务网络、销售档案、用户档案的建立，准确收集不同国家、不同地区、不同用户的使用信息，为他们提供迅速、准确、高效的服务。"传承卓越，共创未来"，大森公司将继续以客户需求为关注点，不断研究创新，把世界上最先进的技术和设计理念带给客户。
</p>
<p>
	　　昨天的成绩已经成为过去，崭新的明天将带来更多的机遇与挑战，今天大森人将凭着诚信、智慧、胆略和实干，与我们的客户携手，共同构建欣欣向荣的事业空间，为服装机械工业做大、做强作出更大贡献，我们的明天一定更美好!
</p>','1','缝纫机,贪吃宝贝,公司简介','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('22','dszzc','20','董事长致词','<img class="imngs" src="/Uploads/image/product/20150712/s-2.jpg" /> 
<p>
	　　2009年是不平凡的一年，在全球金融危机的影响下，我们克服了重重困难，新的生产基地得以圆满建成。六月份是我们搬迁的日子，在此期间，全体员工不畏高温，不惧艰难，付出了许多的汗水和辛劳，使我们搬迁工作得以顺利完成。新环境新希望，大家充满着热情与激情，与公司一同搬迁，涌现许多感人的画面。许多员工举家搬迁，许多员工起早摸黑，我们由衷的感到自豪和欣慰!这也证明了全体员工对公司的发展支持和肯定。为此;谨代表公司(董事会)向全体员工表示衷心的感谢和问候：谢谢各位!大家辛苦了!向所有关心、支持公司成长和发展的各界人士表示衷心感谢!并希望得到大家一如继往的关注和支持，当然，只有努力工作，创造财富，回报社会才是我们的唯一做法。
</p>
<p>
	　　目前来说，新公司经过各部门领导及员工的辛勤工作，整个体系运作已基本正常，但离公司的目标还差很大的距离。因现在新公司刚刚运作，在安排员工来回接送、食宿、卫生、娱乐等方面可能有许多的问题，公司已在着手解决;在此我希望大家暂时克服困难，能够理解、支持，并提出合理化建议，共同把我们的工作做得更好!
</p>
<p>
	<img src="/Uploads/image/page/20150719/20150719162639_63066.jpg" style="width:100%;" alt="" /> 
</p>
<p>
	　　万事开头难。公司能够成就今天规模，提高产品质量是关键。而要提高产品质量，首先要提高员工素质，要有一颗爱岗敬业的心，更要有一定的技术素质与操作技能。在这方面我们厂的员工做的很好，你们以厂为家，抛弃家庭琐事，加班加点，勤奋工作，你们注重产品质量，认真细致，专心操作。但是，我们应该看到，随着市场竞争的激烈，客户对新产品的需求，对产品质量的挑剔，我们有必要进一步研发新产品，有必要对产品进行改良与优化，尤其在容易出现质量问题的地方、最容易损坏的零件，做些调整与改进，大幅度提高产品的质量，才能使得我厂产品在市场中更具竞争优势，这就要求大家要努力提高自身素质。新老员工要互相交流，新员工应多向老员工请教，老员工应不吝悉心帮助，“质量是企业的第一生命力”，各位员工应牢记这点。
</p>
<p>
	　　以人为本，是企业远航的风帆，也只有以人为本，企业才能走得更远，更高。 “企业的发展离不开工人，工人才是企业真正的主人。”在全厂上下要形成和谐的人际关系，工人之间要坦诚交流，互相关心帮助，公司管理层要关心每一个工人的工作、生活，对困难职工进行帮扶。一方面要充分调动工人的积极性、创造性，要评“优秀工人”，另一方面，要避免职工的抵触情绪，扶危济困、关心疾苦，把工人和公司的心贴得更紧。今天大家以厂为家，明天厂以大家为荣。
</p>
<p>
	　　我相信，在大森公司的正确领导下，在地方各级政府和社会各界同仁的支持下，在全体员工的共同努力下，开拓创新，扎实工作，我们一定能抓住机遇，迎接挑战，创出新的业绩，创造更大的辉煌!新环境、新起点、新思维、新高度;有句名言：“团结就是力量”。只要我们齐心协力，什么困难都能迎刃而解;为此，我们要把此次在新公司中的工作当做我们职业生涯中的二次腾飞，与时俱进，迎接新的挑战!我们看到，在公司各部门领导带领下，整个厂区每天都发生着明显的变化!我们有信心把大森建成一个“客户满意、员工稳定、环境优美、可持续发展”的先进企业!我相信----大森的明天一定会更好!
</p>
<p>
	　　谢谢大家!
</p>
<p>
	　　大森公司 总经理：叶仙冲
</p>
<p>
	　　二0 0九年七月八日
</p>','1','缝纫机,贪吃宝贝,董事长致词','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('23','dsys','20','大森优势','<img class="imngs" src="/Uploads/image/product/20150712/s-3.jpg" /> 
<p>
	<strong>品牌优势</strong>
</p>
<p>
	<strong><br />
</strong>
</p>
<p>
	　　大森至今成<span style="line-height:1.5;">立已有12年，市场美誉度好，品牌认知度高。</span>
</p>
<p>
	<span style="line-height:1.5;"><br />
</span>
</p>
<p>
	<strong>团队优势</strong>
</p>
<p>
	<strong><br />
</strong>
</p>
<p>
	　　大森拥有一个充满活力、积极肯干、敢于拼搏的团队。
</p>
<p>
	<br />
</p>
<p>
	<strong>服务优势</strong>
</p>
<p>
	<strong><br />
</strong>
</p>
<p>
	　　精益求精，诚信天下，服务到家，是大森公司的一贯宗旨。
</p>
<p>
	<br />
</p>
<p>
	<strong>区域优势</strong>
</p>
<p>
	<strong><br />
</strong>
</p>
<p>
	　　公司所在台州地区是我国最重要的缝纫机生产基地之一，有完整的供应链，为缝纫机产品降低了成本。产品优势
</p>
<p>
	　　公司生产的高林，金雀品牌缝纫机，凭借强大的研发实力，不断推陈出新，高科技含量和高附加值得新产品。
</p>
<p>
	<br />
</p>
<p>
	<strong>技术优势</strong>
</p>
<p>
	<strong><br />
</strong>
</p>
<p>
	　　公司极其重视产品研发，屹今为止，公司产品取得了多项中国国家专利，高附加值绿色产品，既节能、高效、绿色环保。质量优势
</p>
<p>
	　　公司一贯重视产品的质量，内容对产品进行严格检验，通过ISO9001/2008认证。
</p>
<p>
	<br />
</p>
<p>
	<strong>营销优势</strong>
</p>
<p>
	<strong><br />
</strong>
</p>
<p>
	　　拥有完善的销售体系，充分发挥经销商的销售潜力，提升经销售商的销售能力，保护经销商的核心权益，扩大经销商的销售收益，共同发展和 。
</p>','1','缝纫机,贪吃宝贝,大森优势','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('24','qywh','20','企业文化','<img class="imngs" src="/Uploads/image/product/20150712/s-5.jpg"/><P>　　企业核心理念：</P>
<P>　　开拓创新, 和谐共赢</P>
<P>　　企业目标：</P>
<P>　　打造一流品牌, 一流管理，一流质量， 一流信誉，一流服务</P>
<P>　　企业宗旨：</P>
<P>　　不断创新，真诚服务, 客户满意，追求卓越</P>
<P>　　企业精神：</P>
<P>　　精、诚、稳-----精益求精，诚实经营，稳步前进</P>
<P>　　企业承诺：</P>
<P>　　科技创新，为顾客创造价值, 为员工创造机会, 为社会创造效益</P>
<P>　　竞争策略：</P>
<P>　　创造竞争优势，建立品牌形象, 研制最好产品, 提供最好服务</P>
<P>　　人才战略：</P>
<P>　　以绩效为导向，培养高素质人才</P>
<P>　　质量方针：</P>
<P>　　(3G)产品高质量，员工高素质，用户高满意, 今天的质量，明天的市场</P>','1','电子花样机，订扣套结锁眼，节能伺服电机,企业文化','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('25','gsryt','20','公司荣誉','<img class="imngs" src="/Uploads/image/product/20150712/s-6.jpg"/>资料整理中....','1','缝纫机,贪吃宝贝,公司荣誉','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('26','zzjig','20','组织结构','<img class="imngs" src="/Uploads/image/product/20150712/s-7.jpg"/><P>　　新的管理模式要求扁平化管理的企业内部加强整体意识、全局意识和协作意识，强化一盘棋思想和团队精神。</P>
<P>　　决策是管理的核心内容，关系到管理的绩效，是管理者的主要职责。</P>
<P>　　以更好地适应以顾客、竞争、变化为特征的现代企业经营环境。</P>','1','缝纫机,贪吃宝贝,组织结构','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('27','dszjg','20','大森足迹','<img class="imngs" src="/Uploads/image/product/20150712/s-8.jpg"/><P>　　2009年是不平凡的一年，在全球金融危机的影响下，克服了重重困难，新的生产基地得以圆满建成。新基地位于台州滨海工业园区，公司占地面积30000多平方米，新环境、新起点、新思维、新高度，公司上下把在新公司中的工作当做职业生涯中的二次腾飞，与时俱进，迎接新的挑战!在公司各部门领导带领下，整个厂区每天都发生着明显的变化!公司管理体系上了一台阶，产量翻倍，质量稳定。</P>
<P>　　同时，面对肆虐危机，大森从容应对首先，大森公司强化内部管理，在外部环境不佳的时候，苦练内功，大力调整产品结构，向专、新、特、精方向发展，提高市场竞争力和抗风险能力。加强内部管理，降低生产成本，维护职工队伍的稳定;其次，公司加大自主创新，走向个性化、定制化、高附加值化,开发新产品，赢得产品最大利润空间。第三，依托国内市场，拓展海外业务，积极参加国内外缝制设备展览会，一是进行市场的定位和分析，针对不同的市场定位来进行市场营销策划。二是建立适应海外市场的产品质量控制体系及质量标准。</P>
<P>　　迎来两年一届的CISMA盛会，大森积极筹备，期待以全新的面貌，为客户带来惊喜，并为备受危机折磨的同业带来信心。为此，大森对参展设备、人员安排、邀请客户、展位的布局等方面进行了全方位的策划。</P>
<P>　　首先，公司确立“开拓创新，和谐共赢”参展主题，与CISMA展会“创新·提升”主题充分契合：</P>
<P>　　一、“开拓创新“是提高企业核心竞争力的最重要手段，开拓创新首先体现在企业文化和精神上,如果没有勇于创新的精神，大森公司就不可能在技术、产品、市场和企业管理上不断推陈出新。其次，表现在新技术和产品开发上，从普通工业缝纫机发展到机电一体化无油电脑控制缝纫机，伺服控制系统以及特种机等一系列高附加值产品, 进一步加大了各种新产品的制造和销售,保证了公司产品在服装机械领域的先进水平，并实现了公司走可持续发展道路的战略目标。</P>
<P>　　二、“和谐共赢”，企业的快速成长离不开和谐、融洽的内外环境。大森公司的企业承诺是科技创新，为顾客创造价值,为员工创造机会,为社会创造效益。六月份是我们搬迁的日子，在此期间，全体员工不畏高温，不惧艰难，付出了许多的汗水和辛劳，使我们搬迁工作得以顺利完成。新环境新希望，大家充满着热情与激情，与公司一同搬迁，大家都把企业当成家，涌现许多感人的画面。许多员工举家搬迁，许多员工起早摸黑，我们由衷的感到自豪和欣慰!这也证明了全体员工对公司的发展支持和肯定.“做企业和做人一样,既要考虑自己，又要为他人着想。”多年来, 大森公司以共赢的心态与供应商、和用户共做习题利益，一荣共荣、一损俱损，坚持诚信、互惠互利.</P>
<P>　　三、创新的意义在于产业升级，目前，缝纫机行业，生产效率低、能耗高，产品科技附加值低，同质化严重，市场竞争只能拼价位、拼成本、拼规模，这种恶性循环形成了目前缝纫机工业的低水平、低价位市场环境，企业利润低，便没有资金去搞科技创新，而没有科技创新，就只能维持低价位、低效益。一轮接一轮的价格战，已经证明低价位竞争行不通。因此，加大科研投入，增强产业集中度，提高生产效率、降低能源消耗，开发科技含量高、附加值高的优质新产品，实现产业升级，缝纫机行业的根本出路。</P>
<P>　　展会上，公司将终点展出新款电脑直驱平缝机JR9300D-2，新款包缝机JR998F, 电子订扣机JR1903A，电子套结机JR1900ASS，电子花样机JR210D。</P>
<P>　　产品采用直接驱动系统(DD系统)，缩短了传动的路线，起动平顺，反应敏捷，提供了快速启动和准确停机的功能，刺布效果优良。内藏式绕线机构，用户可根据不同的工艺要求进行可选择性的设定，大大提高了工作效率，送布牙的高度、倾斜度及相位均可容易调整。本机适用于中等厚料的棉，毛、麻、化织等织物.直接驱动方式，能将使动力无损耗地传递给主轴。与采用皮带传动的普通电脑车相比，耗电量更低，节能近50%。</P>
<P>　　电脑操作盘按操作目地进行色彩分类，让操作者一目了然容易掌握。缝纫机的缝纫速度，可通过操作盘轻松设定和变更。通过预设针数，更有助于精确加工。机身设计注重“人—机工程”原理。同步带传动，针杆、挑线杆、旋梭无油并有多项改良，使繁琐的调试过程简化，操作人员能够进行快速调节，既满足从薄料到中厚料的缝制需求，又提高的工作效率。</P>
<P>　　2009年CISMA展会意义非同寻常，更因为其是在金融危机持续过程中的交流盛会。危机导致全球经济逐步陷入衰退，消费需求也大幅萎缩，国家先后四次调高出口退税率，退税优惠的相当部分被外商拿走，缝纫机工厂的利润还是很少。行业面临诸多压力，主要有三方面：由于金融风暴并加上国内的原因，缝纫机原材料价格上涨、生产经营成本增加、人民币升大大挤压了企业的生存空间;工业缝纫机产品价格大幅下跌，企业盈利能力急剧下降;缝纫机市场明显疲软和萎缩，缝纫机的销售和资金结算也变得更加困难。大批企业在生存困境中挣扎。</P>
<img src="/Uploads/image/product/20150712/s-8.jpg"/><P>　　金融危机仍将持续，估计在两年后会恢复，2009年是最困难时期，相信2010下半年会好转，面包会有的，牛奶也会有的，一旦好转，我们国家将会又进入一个快速增长期。从长远看来，对于缝纫机行业很乐观的，衣、食、住、行，五样一个都不能少，衣排在第一位，没有缝纫机就是没有衣，所以注定这是个永恒的行业。从行业多年的发展状况来看,从市场竞争状况来看，平缝机、包缝机是产销量最大的机型,生产的企业众多，竞争相当激烈。在特种机市场,需求量小,产品保持较高的利润率，所以大森致力于开发特种新产品高附加值产品来进一步稳固市场。在全体员工的共同努力下，开拓创新，扎实工作，我们一定能抓住机遇，迎接挑战，创出新的业绩，创造更大的辉煌!我们有信心把大森建成一个“客户满意、员工稳定、环境优美、可持续发展”的先进企业。</P>','1','缝纫机,贪吃宝贝,大森足迹','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('28','qyyjd','20','企业一角','<img class="imngs" src="/Uploads/image/product/20150712/s-10.jpg"/><P>　　大森具有专业的各系列现代工业缝制生产设备，公司十分关重科学管理与新品研发，技术力量雄厚、设备齐全、工艺先进，具有严格的质量管理体系和精益求精的工作态度，产品质量稳定。时刻准备为您提供优良服务。</P>','1','缝纫机,贪吃宝贝,企业一角','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('29','lnzhg','20','历年展会','<img class="imngs" src="/Uploads/image/product/20150712/s-11.jpg"/><P>　　大森把国内外大型专业展会作为演绎精彩的平台，积极参加国内、国际专业展览会，进一步深度开拓全球市场，加快与世界服饰、服装行业的接轨速度。以统一的形象展现在全球客户的面前，使大森品牌深入每个人心中，赢得了广大客户的信赖，提高了自身的知名度与美誉度。</P>
<P>　　- 历届CISMA展会</P>
<P>　　- 2003CISMA 2003CISMA 2004CISMA 2004CISMA 2005CISMA 2005CISMA 2007CISMA 2007CISMA 2009CISMA 2009CISMA 2011CISMA 2011CISMA</P>
<P>　　- 其他国际展会</P>
<img src="/Uploads/image/product/20150712/s-11.jpg"/><P>　　- 孟加拉展览会 俄罗斯展览会 石狮展览会 埃及展览会 越南展览会</P>','1','缝纫机,贪吃宝贝,历年展会','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('30','fsdfg','20','服装样板工厂','<img class="imngs" src="/Uploads/image/product/20150712/s-12.jpg"/>资料整理中....','1','缝纫机,贪吃宝贝,服装样板工厂','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('31','dsship','20','大森视频','<img class="imngs" src="/Uploads/image/product/20150712/s-9.jpg"/>资料整理中....','1','缝纫机,贪吃宝贝,大森视频','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('32','rlzy','0','人力资源','<img class="imngs" src="/Uploads/image/product/20150712/s-19.jpg"/><p>
	　　大森注重人文关怀，关心丰富员工生活，帮助员工解决后顾之忧，使所有员工感受到公司的温暖。
</p>
<p>
	　　公司秉持“以人为本”的理念对员工实施多元化管理，尊重当地员工的风俗习惯。
</p>
<p>
	　　公司积极倡导“健康生活、快乐工作”的理念，推进企业文化建设，增强员工的归属感，丰富员工业余文化生活，满足员工多层次的需求。
</p>','1','缝纫机,贪吃宝贝,人力资源','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('33','rczpp','32','人才招聘','<img class="imngs" src="/Uploads/image/product/20150712/s-19.jpg"/><p>
	　　招聘职位:平面设计、市场推广发布时间:2012-2-4
</p>
<p>
	　　性别要求:不限年龄要求:18岁以上
</p>
<p>
	　　招聘人数:2学历要求:大学专科
</p>
<p>
	　　工作经验:1年以上薪水待遇:面议
</p>
<p>
	　　岗位要求:具有市场推广、推广，品牌运作经验，身体健康，思想端正。
</p>','1','缝纫机,贪吃宝贝,人才招聘','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('34','yggh','32','员工关怀','<img class="imngs" src="/Uploads/image/product/20150712/s-20.jpg"/><p>
	　　大森注重人文关怀，关心丰富员工生活，帮助员工解决后顾之忧，使所有员工感受到公司的温暖。
</p>
<p>
	　　公司秉持“以人为本”的理念对员工实施多元化管理，尊重当地员工的风俗习惯。
</p>
<p>
	　　公司积极倡导“健康生活、快乐工作”的理念，推进企业文化建设，增强员工的归属感，丰富员工业余文化生活，满足员工多层次的需求。
</p>','1','缝纫机,贪吃宝贝,员工关怀','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('35','rczl','32','人才战略','<img class="imngs" src="/Uploads/image/product/20150712/s-21.jpg"/><p>
	　　人才战略：长效激励机制
</p>
<p>
	　　知人善任、正确定位;人尽其才，创造价值;利益引导，全面发展，三个环节，环环相扣，有望实现对员工的长效激励。
</p>
<p>
	　　优化人员配置以保证用对人
</p>
<p>
	　　激励机制建设的第一步，是做好人力资源的有效配置，以尽可能保证合适的人在合适的岗位做合适的事。只有用对了人，才可能有效地激励他。
</p>
<p>
	　　强化绩效管理以保证用好人
</p>
<p>
	　　所谓“用好人”，也就是怎样才能把人用好，怎样才能做到“人尽其才”、从而实现“物尽其用”，即将企业的人力物力进行最有效的整合，创造最佳的公司业绩。实践中，往往是通过绩效管理来实现。
</p>
<p>
	　　全面薪酬策略实现利益引导
</p>
<p>
	　　需要通过公平的薪酬支付和全面的需求响应，进一步落实长效激励机制。绩效管理的关键环节之一，是对员工的能力提升和业绩贡献，进行持续的公正评价。
</p>','1','缝纫机,贪吃宝贝,人才战略','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('36','jltd','32','简介投递','<img class="imngs" src="/Uploads/image/product/20150712/s-22.jpg"/>资料整理中....','1','缝纫机,贪吃宝贝,简介投递','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。"','zh-cn');
INSERT INTO `pa_page` VALUES ('37','fwzx','0','服务中心','<img class="imngs" src="/Uploads/image/product/20150712/s-14.jpg"/><img src="/Uploads/image/page/20150715/20150715105012_34384.jpg" alt="" />','1','缝纫机,贪吃宝贝,服务中心','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。"','zh-cn');
INSERT INTO `pa_page` VALUES ('38','qqyxwl','37','全球营销网络','<img class="imngs" src="/Uploads/image/product/20150712/s-18.jpg"/><img src="/Public/kindeditor/php/../../../Uploads/image/page/20150715/20150715105500_66747.jpg" alt="" /><img src="/Uploads/image/page/20150715/20150715105441_73168.jpg" alt="" />','1','缝纫机,贪吃宝贝,全球营销网络','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('39','gnxswl','37','国内销售网络','<img class="imngs" src="/Uploads/image/product/20150712/s-17.jpg"/><img src="/Public/kindeditor/php/../../../Uploads/image/page/20150715/20150715105625_42341.jpg" alt="" />','1','缝纫机,贪吃宝贝,国内销售网络','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('40','qyvixx','37','企业Vl形象','<img class="imngs" src="/Uploads/image/product/20150712/s-13.jpg"/><span style="font-family:Arial;font-size:14px;line-height:21px;background-color:#FFFFFF;">资料正在准备中...</span>','1','贪吃宝贝,企业大森,企业Vl形象','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('41','shfw','37','售后服务','<img class="imngs" src="/Uploads/image/product/20150712/s-14.jpg"/><p>
	<img src="/Public/kindeditor/php/../../../Uploads/image/page/20150715/20150715105841_63176.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	　　建立健全各项规章制度并抓好执行力度
</p>
<p>
	　　抓各项服务流程的建设提高服务质量
</p>
<p>
	　　加强现场环境管理注重各服务环节的细节
</p>
<p>
	　　注重企业文化建设与员工的素质培养
</p>
<p>
	　　定期进行客户回访，建立客户档案
</p>
<p>
	　　多设服务网点，并尽力做到精细
</p>
<p>
	<br />
</p>
<p>
	<br />
</p>','1','缝纫机,贪吃宝贝,售后服务','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('42','dszlxz','37','大森资料下载','<img class="imngs" src="/Uploads/image/product/20150712/s-15.jpg"/><span style="font-family:Arial;font-size:14px;line-height:21px;background-color:#FFFFFF;">资料正在准备中...</span>','1','缝纫机,贪吃宝贝,大森资料下载','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('43','spzx','37','产品视频','<img class="imngs" src="/Uploads/image/product/20150712/s-16.jpg"/>资料准备中……','1','缝纫机,贪吃宝贝,视频中心','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('44','lxwm','0','联系我们','<img class="imngs" src="/Uploads/image/product/20150712/s-23.jpg"/><p>
	　　台州市弘硕电子商务有限公司
</p>
<p>
	　　地址：浙江 台州 椒江区 滨海工业园区 B区 海丰路2229号
</p>
<p>
	　　电话：0576-88027625
</p>
<p>
	　　400电话：400-926-0070
</p>
<p>
	　　QQ：
</p>
<img alt="联系我" src="http://wpa.qq.com/pa?p=2:2499013353:42" width="81" height="23" /> 
<p>
	　　传真：0576-88027656
</p>
<p>
	　　网址：http://www.chinadoso.com
</p>
<p>
	　　邮箱：info@chinadoso.com
</p>','1','缝纫机,贪吃宝贝,联系我们','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机','zh-cn');
INSERT INTO `pa_page` VALUES ('45','lxfs','44','联系方式','<img class="imngs" src="/Uploads/image/product/20150712/s-13.jpg"/><p>
	　　台州市弘硕电子商务有限公司
</p>
<p>
	　　地址：浙江 台州 椒江区 滨海工业园区 B区 海丰路2229号
</p>
<p>
	　　电话：0576-88027625
</p>
<p>
	　　400电话：400-926-0070
</p>
<p>
	　　QQ：
</p>
<img alt="联系我" src="http://wpa.qq.com/pa?p=2:2499013353:42" width="81" height="23" /> 
<p>
	　　传真：0576-88027656
</p>
<p>
	　　网址：http://www.chinadoso.com
</p>
<p>
	　　邮箱：info@chinadoso.com
</p>','1','缝纫机,贪吃宝贝,联系方式','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机','zh-cn');
INSERT INTO `pa_page` VALUES ('46','dlwz','44','地理位置','<img class="imngs" src="/Uploads/image/product/20150712/s-24.jpg"/>地图','1','缝纫机,贪吃宝贝,地理位置','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('47','zxfk','44','在线反馈','<img class="imngs" src="/Uploads/image/product/20150712/s-16.jpg"/>','1','缝纫机,贪吃宝贝,在线反馈','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('48','flsm','44','法律声明','<img class="imngs" src="/Uploads/image/product/20150712/s-27.jpg"/><p>
	　　本网站提供的任何内容(包括但不限于数据、文字、图表、图像、声音或录像等)的版权均属于贪吃宝贝(以下简称“我公司”)。未经我公司事先的书面许可，任何单位或个人不得以任何方式擅自复制、再造、传播、出版、转帖、改编或陈列本网站的内容。任何未经授权使用本网站内容的行为，我公司将依据《中华人民共和国著作权法》和其他法律法规要求实施该行为的相关人员或单位承担违法责任。
</p>
<p>
	　　本网站内容仅供仅限于为信息参考和非商业或个人之目的使用，修订及变更不作通知。我公司对于任何涉及本网页内容的准确性、可靠性、可使用程度、可浏览查阅程度或完备性所造成的损失或损害 
，我公司及附属公司概不承担任何责任，亦不就此作出任何明示或暗示的保证、担保、承诺或申明。
</p>
<p>
	　　我公司对任何登录、采用、参考或浏览本网页内容之人士可能直接或间接承受或引致之任何财物、经济或其他损失，概不承担任何责任或咎责，亦概不处理其后可能出现之任何索偿、行动或法律诉讼。
</p>
<p>
	　　本网站及使用条款，应适用中华人民共和国法律。任何有关本网站和使用条款的争议，应由我公司注册所在地中国杭州的法院管辖。
</p>
<p>
	　　我公司保留随时更改本网站和上述免责及条款的权利。
</p>','1','缝纫机,贪吃宝贝,法律声明','贪吃宝贝有限公司是以生产平缝机、包缝机、绷缝机、电子花样机、裁剪机等机械产品的专业缝纫机生产企业，缝纫机系列产品概括了各种不同样式的缝纫机。','zh-cn');
INSERT INTO `pa_page` VALUES ('49','abuy','0','About us','<P>　　ZHEJIANG DOSO SEWING MACHINE CO.,LTD. was established in 1999, is located in Taizhou Binhai Industrial Park, the company covers an area of more than 30,000 square meters. Its unique perspective to create a modern international garment machinery enterprises, to create a new brand of sewing machinery industry goal to create a new culture of human clothing and embarked on the arduous road of entrepreneurship. Companies adhering to the business philosophy of "fine, sincere, steady, ie ---- excellence, honest business, steady progress, success to gain a firm foothold in the market economy, and thrive, garment machinery industry in China over the years has accumulated a wealth experiences. Development has become a collection of scientific research, development, design, production, trade and services in one professional garment machinery and textile machinery and equipment suppliers. Its brand products Omori, Lin, siskin "--- Electronic special machine, electronic pattern machine, interlock sewing machine, Overlock Sewing Machine, Lockstitch Sewing Machine, thick material machine, computerized flat knitting machine , energy-saving motors, eight categories of 90 kinds of products sell well all over the world, and well received by our customers.</P>
<P>　　"Quality first,Credit foremost" is our permanent pursuit!</P>','1','About us','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('94','omfoot','49','About doso','<P>　　ZHEJIANG DOSO SEWING MACHINE CO.,LTD. was established in 1999, is located in Taizhou Binhai Industrial Park, the company covers an area of more than 30,000 square meters. Its unique perspective to create a modern international garment machinery enterprises, to create a new brand of sewing machinery industry goal to create a new culture of human clothing and embarked on the arduous road of entrepreneurship. Companies adhering to the business philosophy of "fine, sincere, steady, ie ---- excellence, honest business, steady progress, success to gain a firm foothold in the market economy, and thrive, garment machinery industry in China over the years has accumulated a wealth experiences. Development has become a collection of scientific research, development, design, production, trade and services in one professional garment machinery and textile machinery and equipment suppliers. Its brand products Omori, Lin, siskin "--- Electronic special machine, electronic pattern machine, interlock sewing machine, Overlock Sewing Machine, Lockstitch Sewing Machine, thick material machine, computerized flat knitting machine , energy-saving motors, eight categories of 90 kinds of products sell well all over the world, and well received by our customers.</P>
<P>　　"Quality first,Credit foremost" is our permanent pursuit!</P>','1','About doso','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('52','advt','49','Speech','<P>　　2009 was an extraordinary year, under the impact of the global financial crisis, we have to overcome the difficulties, the new production base to a successful completion. The day we moved in June, defying high temperature during this period, all employees, not afraid of hard to pay a lot of sweat and hard work to make our relocation has been completed smoothly. New environment, new hope, full of enthusiasm and passion, along with the company relocation, the emergence of many emotional scenes. Many employees moved with his family, many employees get up early, and we sincerely proud and pleased! This also proves that the development of all employees on the company's support and affirmation. ; Wish to express my heartfelt thanks and greetings to all the staff on behalf of the Company (the Board): Thank you!We worked hard! To express my sincere thanks to all concerned to support the company's growth and development, people from all walks of life! And want to get all the attention and support as always, of course, only work hard, create wealth, return to the community is our only practice.</P>
<P>　　Now, the new company after the leadership of the various departments and staff for their hard work, the operation of the system as a whole has been basically normal, but short of a great distance away from the company's goal. Just the operation of the new company, arranged for staff to shuttle back and forth, accommodation, health, entertainment, may have many problems, the company has addressed; I hope everyone temporarily overcome difficulties and be able to understand, support, and make reasonable suggested that we do a better job together!</P>
<P>　　All beginnings are hard. Company to accomplish scale, improve product quality is the key. To improve product quality, we must first improve staff quality, to have a heart of love and dedication, but also have a certain degree of technical quality and operational skills. In this regard we plant employees do well, your plant home, to abandon household chores, working overtime, work hard, and you pay attention to product quality, careful to concentrate on the operation. However, we should see, with the fierce market competition, customer demand for new products, product quality picky, we have a need for further research and development of new products, improvement and optimization of the product quality problems, especially in the prone place, the most easily damaged parts, make some adjustments and improvements to significantly improve the quality of the product, to make the factory more competitive products in the market, which requires that we must strive to improve their own quality. Old and new employees to communicate with each other, new employees should ask to older employees, older employees should not hesitate to carefully help, "Quality is the first vitality, that employees should keep this in mind.</P>
<P>　　People-oriented enterprise sails only people-oriented enterprises to go further and higher. "Enterprise development is inseparable from the workers, the workers are the real masters." Up and down the whole plant to form a harmonious interpersonal relationships, to be open and honest exchange between workers, care for each other to help the company's management should be concerned with the work of each worker , life, the difficulties workers helping. One hand to fully mobilize the enthusiasm of the workers, creativity, the rating "excellent workers, on the other hand, you want to avoid the resentment of the workers, the lives of the poor, concerned about the sufferings of the workers and the company's hearts closer. Everyone to plant at home today, tomorrow Factory proud of everyone.</P>
<P>　　I believe, in the the Omori company under the correct leadership, the support of the local government and community colleagues, under the joint efforts of all staff, innovation, solid work, we must be able to seize opportunities, meet challenges, reaching athe new results, and create greater glories! New environment, a new starting point, new thinking, new height; famous saying: "Unity is strength". What difficulties can be solved as long as we work together; For this reason, we want this work in the new company as secondary in our career take off with the times, to meet new challenges! We see leadership under the leadership of the various departments of the company, the entire factory every day with significant changes! We have the confidence to put the Omori into a "customer satisfaction, staff stability, a beautiful environment and sustainable development" advanced enterprise! I believe ---- Omori tomorrow will be better!</P>
<P>　　Thank you!</P>
<P>　　General manager: 叶仙冲</P>
<P>　　July 8, 2009</P>','1','Speech','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('55','stru','49','Advantage','<P>　　Brand advantage</P>
<P>　　DOSO has been established for 12 years, good market reputation, brand awareness is high.</P>
<P>　　Team advantage</P>
<P>　　DOSO have a vibrant, active work hard and dare to hard-working team.</P>
<P>　　Service Advantage</P>
<P>　　Excellence, integrity of the world, home services, which is purpose of Omori consistent.</P>
<P>　　Regional Advantage</P>
<P>　　The company is located in Taizhou region is one of our most important sewing machine production base, complete supply chain, and reduce the cost to the sewing machine products.</P>
<P>　　Product advantages</P>
<P>　　Gao Lin, Siluer brand sewing machine company, with a strong R &amp; D capabilities, innovation, high-tech and high added-worth of new products.</P>
<P>　　Technical advantages</P>
<P>　　The company attaches great importance to product development, Yi far, the company made ​​a number of national patents in China, high value-added green products, energy-saving, efficient and green.</P>
<P>　　Quality advantage</P>
<P>　　The company has always attached great importance to product quality, rigorous inspection of the contents of the product passed ISO9001/2008 certification.</P>
<P>　　Marketing advantage</P>
<P>　　Has a complete sales system, give full play to the dealer's sales potential, and enhance the ability of sales by the seller, and to protect the core interests of the dealers, expansion of the dealer's sales revenue, common development.</P>','1','Advantage','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('56','dev','49','Culture','<P>　　Their core philosophy：</P>
<P>　　Innovation, harmony and win-win</P>
<P>　　Corporate goals：</P>
<P>　　To create a first-class brand, first-class management, first-class quality, first-class reputation, first-class service.</P>
<P>　　Purpose of the enterprise：</P>
<P>　　Innovation, sincere service, customer satisfaction, and the pursuit of excellence.</P>
<P>　　Spirit of enterprise：</P>
<P>　　Fine, sincere, stable ----- excellence, honest business, steady progress</P>
<P>　　Corporate commitment：</P>
<P>　　Scientific and technological innovation, creating value for customers, creating opportunities for employees, creating benefits for society.</P>
<P>　　Competitive strategy：</P>
<P>　　Create competitive advantage, build brand image, develop the best products, the best service.</P>
<P>　　Talent Strategy：</P>
<P>　　Performance-oriented training high-quality talents</P>
<P>　　Quality Policy：</P>
<P>　　(3G) high-quality products, high-quality staff and the user satisfaction high, the quality of today's and tomorrow's market</P>','1','Culture','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('57','wksp','49','Honor','Data is being prepared ...','1','Honor','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('58','exh','49','Structure','<P>　　Strengthen the overall sense of global awareness and sense of collaboration within the new management model requires a flat management, strengthen the game thinking and teamwork.</P>
<P>　　Decision-making is the core content management, and related to the performance of the management, the main responsibilities of the managers.</P>
<P>　　To better adapt to the customers, competition, changes in the characteristics of the modern business environment.</P>','1','Structure','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('59','mf','49','Development','<P>　　2009 was an extraordinary year, under the impact of the global financial crisis, to overcome the difficulties, the new production base to a successful completion. The new base is located in Taizhou Binhai Industrial Park, the company covers an area of ​​over 30,000 square meters, the new environment, a new starting point, new thinking, new height, the company from top to bottom to work in the new company as a secondary career take off with the times forward, new challenges! Leadership under the leadership of the various departments of the company, the entire factory every day undergoing significant changes! Company management system on a higher level, double production, quality and stability.</P>
<P>　　At the same time, in the face of the raging crisis, Omori calmly deal First, Omori strengthen internal management, in the external environment is poor, hard skills, actively adjusting product structure, to specialized, new, unique, fine direction of development, improve market competitiveness and the ability to resist risks. Strengthen internal management, reduce production costs, and maintain the stability of the workforce; Secondly, increase innovation toward personalized, customized, high value-added technology, develop new products, to win the maximum profit space. Third, relying on the domestic market, to expand overseas business, and actively participate in domestic and Sewing Equipment Exhibition, market positioning and analysis, marketing planning for different market positioning. The second is to establish adapt to the overseas market, the product quality control system and quality standards.</P>
<P>　　CISMA usher in the biennial event, Omori actively preparing for and look forward to the new look for surprises and bring confidence to the highly crisis-afflicted peers. Omori exhibitors equipment, personnel arrangements, invite customers, booth layout for a full range of planning.</P>
<P>　　First, the company established the exhibition theme of "innovation, harmony and win-win" and the CISMA show "innovation and enhance the" theme fully fit:</P>
<P>　　"Innovation" is the most important means to improve the core competitiveness of enterprises, innovation is reflected in the corporate culture and spiritual, Omori impossible if there is no spirit of innovation in technology, product, market and corporate management and innovation. Second, the performance of the new technology and product development, development from ordinary industrial sewing machine the mechatronics oil computer control sewing machine, servo control system, and a special machine, a series of high value-added products, further increase the manufacture of a variety of new products and sales, to ensure that the advanced level of the company's products in the field of garment machinery, and to achieve the strategic goals of the company to the path of sustainable development.</P>
<P>　　Harmony and win-win ", the rapid growth of the enterprise is inseparable from harmony, harmonious internal and external environment. The Omori company's corporate commitment to technological innovation, creating value for customers, creating opportunities for employees, creating benefits for society. The day we moved in June, defying high temperature during this period, all employees, not afraid of hard to pay a lot of sweat and hard work to make our relocation has been completed smoothly. New environment, new hope, full of enthusiasm and passion, along with the company relocation, we regard the enterprise as a home, the emergence of many moving picture. Many employees moved with his family, many employees get up early, and we sincerely proud and pleased! This also proves that the support of all the staff of the company's development and certainly do man, should not only consider their own, but also for the sake of others. "Over the years, Omori's a win-win mentality with suppliers, and users of do exercises interests Ichiei common prosperity, a loss for both uphold the integrity and mutual benefit.</P>
<P>　　Third, the significance of innovation is that industrial upgrading, the sewing machine industry, low production efficiency, high energy consumption, low added value of product technology, serious homogeneity, market competition can only fight the price, to fight cost, scale fight, this vicious cycle the current low level of sewing machine industry, the low-cost market environment, corporate profits, and they do not have the funds to engage in technological innovation, and technological innovation, you can only maintain a low-cost, low efficiency. Wave after a round of price wars, low-cost competition has proved unworkable. Therefore, increase research investment, and enhance industrial concentration, improve production efficiency, reduce energy consumption, the development of scientific and technological content, high-quality new products with high added value, to achieve industrial upgrading, the fundamental way out of the sewing machine industry.</P>
<P>　　Show on display will be the end of a new computer direct drive lockstitch sewing machine JR9300D-2, new Overlock Sewing JR998F, electronic button sewing machines JR1903A, electronic bar tacking machine JR1900ASS electronic tricks machine JR210D.</P>
<P>　　The product uses a direct drive system (DD system), to shorten the route of transmission, starter smooth, responsive, Quick Start and accurate downtime, excellent effect of thorn cloth. Built-winding mechanism, users can selectively set according to different process requirements, greatly improving the efficiency of feed dog height, tilt and phase can be easily adjusted. This machine is suitable for medium thick material of cotton, wool, linen, chemical fiber and other fabrics. Direct drive, will power loss passed to the spindle. Compared to ordinary computer car with the belt drive, and lower power consumption, energy saving of nearly 50%.</P>
<P>　　Computer operating panel color classification by operating purposes, the operator at a glance easy to grasp. Sewing machine sewing speed, through the operation panel to easily set and change. By default pin number, more conducive to precision machining. The body design focus on the principle of "man - machine engineering. Synchronous belt drive, the needle bar and thread take-up, oil-free rotary hook and a number of enhancements to simplify the tedious process of debugging, the operator is able to quickly adjust, both to meet in the thick material sewing expect from the thin demand, but also improve the work efficiency.</P>
<P>　　2009 CISMA show extraordinary significance, but also because of its networking event in the ongoing process of the financial crisis. The crisis led to the gradual global economic recession, consumer demand is shrinking dramatically, the state has raised the export tax rebate rate of four foreign-away of a considerable part of the tax rebate, profit or as little of the sewing machine factory. The industry is facing a lot of pressure, mainly in three aspects: coupled with the financial turmoil and domestic reasons, sewing machines, raw material prices rise, the increase in production and operation costs, RMB appreciation pressure on the viability of enterprises greatly; industrial sewing machine products prices fell sharply, the profitability of the business sharp decline; pronounced weakness and atrophy of the sewing machine market, sewing machine sales and fund settlement also becomes more difficult. A large number of enterprises in the survival of the plight of struggling.</P>
<P>　　Financial crisis will continue, it is estimated will be restored in two years, is the most difficult period in 2009, I believe will get better in the second half of 2010, there will be bread, milk will be there, once improved, our country will also enter a fast growth period. The long run, very optimistic for the sewing machine industry, clothing, food, housing, transportation lines, five things one less clothing in the first row, no sewing machine is not the clothes, so doomed to eternal industry. From the state of development of the industry for many years, from the competition in the market situation in the sewing machine, overlock sewing machine is the largest production and sales models, production of many companies, the competition is fierce. Specialty machine market, the demand for small products to maintain high profit margins, Omori committed to the development of special new products with high added value products to further reinforces the market. The joint efforts of all staff, innovation, solid work, and we will certainly be able to seize opportunities, meet challenges, reaching a new performance, create greater glories! We have the confidence to put the Omori into a "customer satisfaction, stable staff, beautiful environment and sustainable development," advanced enterprises.</P>','1','Development','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('60','vod','49','Workshop','<P>　　DOSO professional series Modern industrial the sewing production equipment, the company is very vital importance to scientific management and development of new products, strong technical force, well-equipped, state-of-the-art technology, strict quality management system and better work attitude, product quality and stability. Always ready to provide you with excellent service.</P>','1','Workshop','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd..','en-us');
INSERT INTO `pa_page` VALUES ('61','jb','49','Exhibition','<P>　　DOSO large professional exhibitions at home and abroad as a to deductive wonderful platform, and actively participate in domestic and international professional exhibition, further depth to explore the global market, to accelerate the convergence speed world clothing, apparel industry. A unified image to show in front of customers around the world, the the Omori brand deep into the hearts of everyone, to win the trust of our customers, improve the visibility and reputation.</P>
<P>　　- Past CISMA show -</P>
<P>　　2003CISMA 2003CISMA</P>
<P>　　2004CISMA 2004CISMA</P>
<P>　　2005CISMA 2005CISMA</P>
<P>　　2007CISMA 2007CISMA</P>
<P>　　2009CISMA 2009CISMA</P>
<P>　　2011CISMA 2011CISMA</P>
<P>　　- Other international exhibition -</P>
<P>　　Bangladesh Exhibition Russia Exhibition</P>
<P>　　Shishi Exhibition Egypt exhibition</P>
<P>　　Vietnam exhibition</P>','1','Exhibition','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('62','wk','49','Model factory','Data is being prepared ...','1','Model factory','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('63','ca','49','Doso VOD','Data is being prepared ...','1','Doso VOD','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('64','ts','0','Job','Data is being prepared ...','1','Job','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('65','ade','64','Job doso','Data is being prepared ...','1','Job doso','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('66','sc','64','Care','<P>　　DOSO attention to human care, care for the rich staff of life, to help employees resolve worries, so that all employees feel the warmth.</P>
<P>　　Company uphold the "people-oriented" concept to the implementation of diversity management staff, and respect the customs of the local staff.</P>
<P>　　Companies actively promote the concept of healthy life, happy work ", promoting the building of enterprise culture, enhance their sense of belonging, rich amateur staff cultural life, to meet the needs of the staff level.</P>','1','Care','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('67','sa','64','Talent Strategy','<P>　　Talent strategy: long-term incentive mechanism</P>
<P>　　Restraining, correct positioning; People, create value; Interest guidance, all-round development, three links, and all linked with one another, is expected to achieve the long-term incentive for employees.</P>
<P>　　Optimize configuration of personnel to ensure the use of people</P>
<P>　　Incentive mechanism construction of the first step is to allocate human resources in an effective way, in order to ensure the best possible the right people in the right jobs to do the right things. It is only with the right people, is it possible to effectively motivate him.</P>
<P>　　Strengthen performance management to ensure that use the good</P>
<P>　　The so-called &amp; who With the good and throughout , namely how to put the people with good, how to do and who And people throughout , so as to realize and who Make &amp; throughout , the enterprise human resources are the most effective integration, create the best company performance. In practice, is often through the performance management to achieve.</P>
<P>　　Comprehensive compensation strategy to gain the guide</P>
<P>　　Need through the fair salary payment and overall demand response, further implement the long-term incentive mechanism. One of the key links in performance management, is to enhance the ability and performance of employees contribute, persistent fair evaluation.</P>','1','Talent Strategy','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('68','sn','64','About delivery','Data is being prepared ...','1','About delivery','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd..','en-us');
INSERT INTO `pa_page` VALUES ('69','vii','0','Salesnet','Data is being prepared ...','1','Salesnet','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('70','ass','69','Salesnet doso','Data is being prepared ...','1','Salesnet doso','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('71','dl','69','Sales Network','Data is being prepared ...','1','Sales Network','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('72','vid','69','VI image','Data is being prepared ...','1','VI image','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('73','cu','69','After-sales service','<p>
	　　<img src="/Uploads/image/page/20150717/20150717094602_11790.jpg" alt="" />
</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Establish and improve various rules and regulations, and to grasp the enforcement
</p>
<p>
	　　Grasping the construction of the various service processes to improve service quality
</p>
<p>
	　　Enhance on-site environmental management to focus on the details of various service links
</p>
<p>
	　　Focus on corporate culture and quality of staff training
</p>
<p>
	　　Regular customer visits, build customer profiles
</p>
<p>
	　　To set up more service outlets, and try to do fine
</p>','1','After-sales service','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('74','addr','69','Download','Data is being prepared ...','1','Download','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('75','fb','69','Doso VOD','Data is being prepared ...','1','Doso VOD','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('76','ln','0','Contact us','<P>　　ZHEJIANG DOSO SEWING MACHINE CO.,LTD</P>
<P>　　Add：No.2229 Haifeng Rd.B.Dist.Binhai Industrial Zone</P>
<P>　　Tel：0576-88027625 0086-576-88027650-8007</P>
<P>　　0576-88027650-8008 0086-576-88113700</P>
<P>　　Fax：0576-88027656</P>
<P>　　Web：http://www.chinadoso.com</P>
<P>　　E-mail：info@chinadoso.com</P>','1','Contact us','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('77','kh','76','Contact','<P>　　ZHEJIANG DOSO SEWING MACHINE CO.,LTD</P>
<P>　　Add：No.2229 Haifeng Rd.B.Dist.Binhai Industrial Zone</P>
<P>　　Tel：0576-88027625 0086-576-88027650-8007</P>
<P>　　0576-88027650-8008 0086-576-88113700</P>
<P>　　Fax：0576-88027656</P>
<P>　　Web：http://www.chinadoso.com</P>
<P>　　E-mail：info@chinadoso.com</P>','1','Contact','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('78','ny','76','Address','Data is being prepared ...','1','Address','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('79','nok','76','Feedback','<P>　　Dear Sir/Madam,</P>
<P>　　What do you think of our products, company , website, or anything else?Let us know please, as long as you can think of all.Welcome for your comments and suggestions. We will deal with the problem as soon as possible,and we are pleased to hear from you.</P>','1','Feedback','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('80','retwer','76','Legal Notices','<P>　　This web site provides any content (including but not limited to data, text, graphics, images, voice or video, etc.) copyright belong to big Sam sewing machine (hereinafter referred to as "and who I company &amp; rdquo; . I company without the prior written approval, no unit or individual may not, by any means, without authorization, copy, reconstruction, dissemination, publishing, post, adaptation or display the contents of this web site. Any unauthorized use of this web site or the content behavior, my company will be in accordance with the law of the People's Republic of China copyright law "and other laws and regulations for the implementation of the behavior of the relevant personnel or units shall bear the illegal responsibility.</P>
<P>　　The content of this website is only for limited to information for reference and non-commercial or the purpose of personal use, the revision and are subject to change without notice. I company for anyone involved in this web page content accuracy, reliability, can use degree, can browse refer to degree or completeness of the loss or damage caused, my company and subsidiary company shall not assume any responsibility, also not in this to make any express or implied assurance, guarantee, promise or statement.</P>
<P>　　I company for any login, use, reference or by browsing this web page content of people may be directly or indirectly caused by or under any property, economic or other losses, shall not be subject to any liability or blame, also is not possible to handle her any claims, actions or legal action.</P>
<P>　　The website and the terms of use, and should apply the law of the People's Republic of China. Any questions about this site and terms of use of the dispute, should by my company is located in hangzhou China registered under the jurisdiction of the court.</P>
<P>　　I company reserves change at any time this web site and the exceptions and conditions of rights.</P>','1','Legal Notices','Sewing Machine,Doso Sewing Machine-Zhejiang Doso Sewing Machine Co.,Ltd.','en-us');
INSERT INTO `pa_page` VALUES ('81','ra','0','в Большой  Сен','<P>　　В Восточно-Китайском море, дом, расположенный в красивом приморском городе - Taizhou. Восток Taizhou Bay, к югу от диких гусей, Северная крыш, Shenxiu пейзаж здесь. Культурный ландшафт имеет долгую историю. Тысячи лет китайской истории и культурного накопления и интеграции цивилизации в современном мире делает этот участок земли, полные жизненных сил. Выросший в этой плодородной земли Чжэцзян Омори швейных машин, это страсть от ветра и волны, чтобы создать первый класс швейных компаний машиностроения.</P>
<P>　　Омори Чжэцзян швейные машины Лтд была основана в 1999 году, расположен в Taizhou Binhai Industrial Park, компания занимает площадь более 30000 квадратных метров. Его уникальные перспективы для создания современного международного одежду техники бизнес, создать новые цели швейной машины промышленности, чтобы создать новую культуру мужской одежды и встали на трудный путь инициативы бизнеса. Компании придерживаясь философии бизнеса "хорошим, честным и последовательным совершенства, то есть, ----, честный бизнес, устойчивый прогресс, успех победы прочно закрепиться в рыночной экономике, и процветать , машины обрабатывающей промышленности в Китае в последние годы накопилось много опыта. Развитие стал сборник научных исследований, разработки, проектирования, производства, торговли и услуг в профессиональной техники одежды и текстильных машин и оборудования. своих фирменных продуктов Омори, Лин, щегол "--- специальные электронные машины, электронные машины картины, блокировки швейные машины оверлоки, швейные машины, швейные машины , швейная машины грубого материала, компьютерной плоские вязальные машины, энергосберегающие двигатели, восемь категорий 90 видов продукты хорошо продаются во всем мире, и хорошо воспринята нашими клиентами.</P>
<P>　　Основная философия компании присоединиться к "инновациям, гармонии и общего выигрыша" постоянном развитии, и сильнее себя хорошо, после многих лет неустанных усилий всех сотрудников, создана ведущая компания в отрасли создание отечественной техники. Омори, является основой промышленности швейных машин, а в 2003 году он вступил в Китай швейного объединения, членом Ассоциации, Чжэцзян Ассоциации блок швейной машины в 2008 году, в 2003 году был награжден передовых частей Township предприятий, 2006, назвал ежегодный рейтинг AA + корпоративный класс кредитного качества, тяжелые защищает престиж блок был награжден. Омори понять "качество первых, репутация первых" вечная погоня за компанию, чтобы закрепиться! "Мы должны в первую прибыли.« За эти годы компания во главе с Председателем Совета г-н Е. Xianchong, придерживаясь "развивать лучшие продукты и лучший сервис" дух придерживаться " высокое качество продукции и высокое качество персонала пользователям высокий уровень удовлетворенности "Политика в области качества, выполните ряд практических новых патентов и выиграла ряд научных исследований, прошло ISO9001: 2000 системы менеджмента качества сертификации и CE сертификации безопасности для входа в рынок на протяжении последних 10 лет, опыт внедрения оборудования - технологические усовершенствования - Стратегия - этап информация строительства, импорта CAD. ERP система управления компании придает большое значение научному управлению и развитию новых продуктов, развитие мехатроники в укрепление и развитие оригинального продукта от общих производственных швейных машин масло контролируемых швейных машин компьютер серво системы управления и специальные машины, а рядом с высокой добавленной стоимостью продукции, дальнейшему росту производства и реализации целого ряда новых продуктов, чтобы обеспечить современный уровень продукции компании в области швейная техника, и для достижения стратегических целей компании на путь устойчивого развития качества силы, технологий Brilliantness через независимых исследований и разработок, технологических инноваций, и разнообразные устройства высокого класса одна за другой рынок, производство швейных машин с прямым приводом "быстрая скорость, низкий уровень шума, сильной функции, высокую эффективность" преимущество по сравнению с теми же продуктами, но и начал закрепки машина Электронные кнопки электроники швейные машины, электронные трюки, новые швейные машины сумку, швейная машина растяжение двигателя диапазоне энергосбережения сервопривода. Омори это люди, ориентированные и дизайнерские идеи в соответствие с международными стандартами в полной мере отражают разумный совершенную структуру, выполнение простой и надежной эксплуатации, красивый и гладкий дизайн воплощает в себе идеальное сочетание науки и техники и эстетической культуры, воспроизведение с развитием тенденции времени и прогресса человеческой цивилизации, Декларация о практике ведущих швейных тенденции развития техники.</P>
<P>　　Омори компании с сильной технической силы, основанные на технологии, реалистичный продолжение передового опыта и инновационных продуктов всегда будет лучшей конфигурации программы, адаптированные для обеспечения продукт проще в использовании и услуг для большинства пользователей. Продукты, которые охватывает почти 30 провинциях, автономных районах и экспортируется в национальном почти 40 стран и регионов Азии, Африки, Латинской Америки и Европы.</P>
<P>　　С момента своего создания, придерживаться ", ориентированных на производительность, для подготовки высококвалифицированных сотрудников". Стратегический реализации "ориентированная на людей" философия управления, стиль управления очаровательная, наша управление Road, была подтверждена на практике самой отрасли, достойно похвалы. Современное управление производством компьютерной системы, которая в полной мере относится здесь на всех уровнях управления талантами в полной мере играть здесь, они планируют реализовать в каждом должность, организация, координация и контроль конкретных инженерных управления ERP функций. Компания имеет большое количество квалифицированных кадров и опытных управления талантами и опытом, это рабочая сила с высокой степенью сплоченности и преданности, они являются наиболее важным активом Омори, является солидной компании, которые развивают Мощность международном! Excellence, Омори ненасытной мудрость, которая достойна похвалы, чем гордиться, Омори сегодня, это будущее Омори. Мы будем: технологические инновации, создание ценности для клиентов, создание возможностей для сотрудников, создавая блага для общества.</P>
<P>　　Омори общенациональных продаж и обслуживания сети продаж, файлы, файлы пользователя, устанавливая точный набор различных странах и регионах, различная информация, которая используется, чтобы обеспечить быстрый, точный и эффективный. "Традиции качества и создать лучшее будущее, Омори продолжал проблемы клиента спроса, исследования и инновации, чтобы обеспечить клиентов с самыми передовыми технологиями в мире и дизайн-концепции.</P>
<P>　　Результаты Вчера стало делом прошлого, завтра принесет больше возможностей и проблем, сегодня Омори работающего с целостности, мудрости, мужества и трудолюбия с нашими клиентами работать вместе, чтобы построить процветающую карьеру пространстве Промышленное оборудование одежды больше, сильнее и сделать больший вклад в наше завтра наверняка будет еще лучше!</P>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('82','mos','81','компания введение','<P>　　В Восточно-Китайском море, дом, расположенный в красивом приморском городе - Taizhou. Восток Taizhou Bay, к югу от диких гусей, Северная крыш, Shenxiu пейзаж здесь. Культурный ландшафт имеет долгую историю. Тысячи лет китайской истории и культурного накопления и интеграции цивилизации в современном мире делает этот участок земли, полные жизненных сил. Выросший в этой плодородной земли Чжэцзян Омори швейных машин, это страсть от ветра и волны, чтобы создать первый класс швейных компаний машиностроения.</P>
<P>　　Омори Чжэцзян швейные машины Лтд была основана в 1999 году, расположен в Taizhou Binhai Industrial Park, компания занимает площадь более 30000 квадратных метров. Его уникальные перспективы для создания современного международного одежду техники бизнес, создать новые цели швейной машины промышленности, чтобы создать новую культуру мужской одежды и встали на трудный путь инициативы бизнеса. Компании придерживаясь философии бизнеса "хорошим, честным и последовательным совершенства, то есть, ----, честный бизнес, устойчивый прогресс, успех победы прочно закрепиться в рыночной экономике, и процветать , машины обрабатывающей промышленности в Китае в последние годы накопилось много опыта. Развитие стал сборник научных исследований, разработки, проектирования, производства, торговли и услуг в профессиональной техники одежды и текстильных машин и оборудования. своих фирменных продуктов Омори, Лин, щегол "--- специальные электронные машины, электронные машины картины, блокировки швейные машины оверлоки, швейные машины, швейные машины , швейная машины грубого материала, компьютерной плоские вязальные машины, энергосберегающие двигатели, восемь категорий 90 видов продукты хорошо продаются во всем мире, и хорошо воспринята нашими клиентами.</P>
<P>　　Основная философия компании присоединиться к "инновациям, гармонии и общего выигрыша" постоянном развитии, и сильнее себя хорошо, после многих лет неустанных усилий всех сотрудников, создана ведущая компания в отрасли создание отечественной техники. Омори, является основой промышленности швейных машин, а в 2003 году он вступил в Китай швейного объединения, членом Ассоциации, Чжэцзян Ассоциации блок швейной машины в 2008 году, в 2003 году был награжден передовых частей Township предприятий, 2006, назвал ежегодный рейтинг AA + корпоративный класс кредитного качества, тяжелые защищает престиж блок был награжден. Омори понять "качество первых, репутация первых" вечная погоня за компанию, чтобы закрепиться! "Мы должны в первую прибыли.« За эти годы компания во главе с Председателем Совета г-н Е. Xianchong, придерживаясь "развивать лучшие продукты и лучший сервис" дух придерживаться " высокое качество продукции и высокое качество персонала пользователям высокий уровень удовлетворенности "Политика в области качества, выполните ряд практических новых патентов и выиграла ряд научных исследований, прошло ISO9001: 2000 системы менеджмента качества сертификации и CE сертификации безопасности для входа в рынок на протяжении последних 10 лет, опыт внедрения оборудования - технологические усовершенствования - Стратегия - этап информация строительства, импорта CAD. ERP система управления компании придает большое значение научному управлению и развитию новых продуктов, развитие мехатроники в укрепление и развитие оригинального продукта от общих производственных швейных машин масло контролируемых швейных машин компьютер серво системы управления и специальные машины, а рядом с высокой добавленной стоимостью продукции, дальнейшему росту производства и реализации целого ряда новых продуктов, чтобы обеспечить современный уровень продукции компании в области швейная техника, и для достижения стратегических целей компании на путь устойчивого развития качества силы, технологий Brilliantness через независимых исследований и разработок, технологических инноваций, и разнообразные устройства высокого класса одна за другой рынок, производство швейных машин с прямым приводом "быстрая скорость, низкий уровень шума, сильной функции, высокую эффективность" преимущество по сравнению с теми же продуктами, но и начал закрепки машина Электронные кнопки электроники швейные машины, электронные трюки, новые швейные машины сумку, швейная машина растяжение двигателя диапазоне энергосбережения сервопривода. Омори это люди, ориентированные и дизайнерские идеи в соответствие с международными стандартами в полной мере отражают разумный совершенную структуру, выполнение простой и надежной эксплуатации, красивый и гладкий дизайн воплощает в себе идеальное сочетание науки и техники и эстетической культуры, воспроизведение с развитием тенденции времени и прогресса человеческой цивилизации, Декларация о практике ведущих швейных тенденции развития техники.</P>
<P>　　Омори компании с сильной технической силы, основанные на технологии, реалистичный продолжение передового опыта и инновационных продуктов всегда будет лучшей конфигурации программы, адаптированные для обеспечения продукт проще в использовании и услуг для большинства пользователей. Продукты, которые охватывает почти 30 провинциях, автономных районах и экспортируется в национальном почти 40 стран и регионов Азии, Африки, Латинской Америки и Европы.</P>
<P>　　С момента своего создания, придерживаться ", ориентированных на производительность, для подготовки высококвалифицированных сотрудников". Стратегический реализации "ориентированная на людей" философия управления, стиль управления очаровательная, наша управление Road, была подтверждена на практике самой отрасли, достойно похвалы. Современное управление производством компьютерной системы, которая в полной мере относится здесь на всех уровнях управления талантами в полной мере играть здесь, они планируют реализовать в каждом должность, организация, координация и контроль конкретных инженерных управления ERP функций. Компания имеет большое количество квалифицированных кадров и опытных управления талантами и опытом, это рабочая сила с высокой степенью сплоченности и преданности, они являются наиболее важным активом Омори, является солидной компании, которые развивают Мощность международном! Excellence, Омори ненасытной мудрость, которая достойна похвалы, чем гордиться, Омори сегодня, это будущее Омори. Мы будем: технологические инновации, создание ценности для клиентов, создание возможностей для сотрудников, создавая блага для общества.</P>
<P>　　Омори общенациональных продаж и обслуживания сети продаж, файлы, файлы пользователя, устанавливая точный набор различных странах и регионах, различная информация, которая используется, чтобы обеспечить быстрый, точный и эффективный. "Традиции качества и создать лучшее будущее, Омори продолжал проблемы клиента спроса, исследования и инновации, чтобы обеспечить клиентов с самыми передовыми технологиями в мире и дизайн-концепции.</P>
<P>　　Результаты Вчера стало делом прошлого, завтра принесет больше возможностей и проблем, сегодня Омори работающего с целостности, мудрости, мужества и трудолюбия с нашими клиентами работать вместе, чтобы построить процветающую карьеру пространстве Промышленное оборудование одежды больше, сильнее и сделать больший вклад в наше завтра наверняка будет еще лучше!</P>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('83','con','81','Выступление Председателя Совета','<span id="result_box" class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span>2009
 год был необычайно году под влиянием мирового финансового кризиса, мы 
преодолели трудности, новая производственная база для успешного 
завершения. </span><span>Июнь
 день мы переехали в то же время, сотрудники игнорирует высоких 
температур, боясь трудно, заплатил много пота и напряженной работы, 
чтобы сделать наш переезд был завершен гладко. </span><span>Новые
 условия Новая Надежда, все полны энтузиазма и страсти, вместе с 
компанией переехал, появление большого количества касаясь экрана. </span><span>Многие сотрудники переехал со своей семьей, многие сотрудники меньше спать, мы искренне горд и счастлив! </span><span>Это также доказывает, что при поддержке персонала для развития и утверждения компании. </span><span>Цель; имени компании (совет директоров), чтобы выразить сердечную благодарность и поздравления всем сотрудникам: Спасибо! </span><span>Мы упорно трудились! </span><span>Чтобы выразить искреннюю благодарность всех слоев жизни уход и поддержать рост и развитие компании! </span><span>И надеюсь, что, чтобы получить внимание и поддержку каждого, 
как всегда, конечно, только тяжелая работа, создавать богатство и 
социальные возвращается наш уникальный подход.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>В
 настоящее время, новая компания по тяжелой работы руководителей 
департаментов и сотрудников, вся система была в эксплуатации это 
нормально, но не хватает цели от компании большое расстояние. </span><span>Теперь
 только потому, что новая компания работает трансфер туда и обратно в 
расположении штаба, жилье, здравоохранение, развлечения и т.д., могут 
иметь много проблем, компания обратилась, и в этом я надеюсь, что вы 
временно преодолеть трудности, понимать, поддерживать и рационализация </span><span>Он предложил, чтобы мы работаем вместе, чтобы сделать лучшую работу!<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Все начинания трудны. </span><span>Сегодня масштабы достижений компании, чтобы улучшить качество продукции является ключевым. </span><span>И
 чтобы улучшить качество продукции, в первую очередь, чтобы улучшить 
качество персонала, должны быть посвящение сердца, но есть определенные 
технические качества и навыки. </span><span>В
 связи с этим, мы работники завода хорошо, вы должны посадить у себя 
дома, оставил семью делами, сверхурочные, работать, вы обратите внимание
 на качество продукции, тщательный, внимательный работы. </span><span>Тем
 не менее, мы должны видеть, что в качестве жесткой конкуренции на 
рынке, потребительский спрос на новые продукты, качество продукции 
является критическим, мы должны дальнейшие исследования и разработку 
новых продуктов, это необходимо для улучшения качества продукции и 
оптимизации, особенно склонны к проблемам качества </span><span>где
 наиболее легко поврежденные детали, некоторые коррективы и улучшения, 
значительно улучшить качество продукции, чтобы сделать наши продукты 
более конкурентоспособными растений на рынке, который требует, чтобы все
 стремимся улучшить свое качество. </span><span>Новые и старые сотрудникам общаться друг с другом, новых 
сотрудников должна быть более советы пожилых работников, пожилые 
работники должны быть обучены тщательного помощь, "Качество первое 
предприятие жизнеспособность", сотрудники должны иметь это в виду,.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Люди-ориентированной корпоративной парусной путешествие, только ориентированная на людей, бизнес может пойти дальше, выше. </span><span>"Развитие
 неотделимо от рабочих, рабочие настоящие мастера предприятия." В целом 
растений вверх и вниз, чтобы создать гармоничные отношения между 
работником, чтобы открыть сообщение, взаимный интерес и помочь, 
руководство компании должны быть обеспокоены работы каждого работника </span><span>Жизнь, как помочь работникам в трудном положении. </span><span>С
 одной стороны, в полной мере мобилизовать энтузиазм рабочих, 
творчества, хочу комментировать "отличный работник", с другой стороны, 
чтобы избежать обиды работников, помогают бедным, уход за страданий, 
рабочих и сердца компании близких. </span><span>Сегодня все, чтобы посадить у себя дома, завтра завод для всех гордым.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Я
 считаю, что под правильным руководством крупных лесных компаний, при 
поддержке местного правительства и сообщества коллег на всех уровнях, в 
рамках совместных усилий всех сотрудников, инновации, солидный труд, мы 
сможем захватить возможности, решать проблемы, создавать </span><span>новые достижения, создать большую славу! </span><span>Новая среда, новый старт, новое мышление, новая высота, есть поговорка: "Единство силы." </span><span>Пока
 мы работаем вместе, трудности могут быть решены, по этой причине, мы 
хотим работать в новой компании в нашей карьере как второй раз взлета, 
чтобы отвечать на новые вызовы! </span><span>Мы
 видим, что в лидеры различных ведомств под руководством компании, весь 
завод претерпевает значительные изменения каждый день! </span><span>У
 нас есть уверенность, чтобы построить большой-сумму "удовлетворенность 
клиентов, стабильность персонала, красивый окружающей среды, устойчивого
 развития," передовые предприятия! </span><span>Я считаю, ---- Омори завтра будет лучше!<br />
</span><span>Спасибо вам всем!<br />
</span><span>Омори, генеральный менеджер компании: Грех Е. Чонг<br />
</span><span>8 июля 2009</span></span><br />','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('88','ino','81','Omori  преимущества','<span id="result_box" class="">&nbsp; <span class="hps">Основы философии</span><span>:</span><br />
<span class="hps">Инновации,</span> <span class="hps">гармония и</span> <span class="hps">беспроигрышная</span><br />
&nbsp;<br />
<span class="hps">Бизнес</span> <span class="hps">цели:</span><br />
<span class="hps">Класс</span> <span class="hps">бренда</span><span>,</span> <span class="hps">первого класса управления</span><span>,</span> <span class="hps">первоклассное качество</span><span class="">, первоклассное</span> <span class="hps">репутацию,</span> <span class="hps">первоклассное обслуживание</span><br />
&nbsp;<br />
<span class="hps">Корпоративные</span> <span class="hps">цели:</span><br />
<span class="hps">Инновационные и</span> <span class="hps">искреннее служение</span><span>, удовлетворенность клиентов</span><span>,</span> <span class="hps">стремление к совершенству</span><br />
&nbsp;<br />
<span class="">Дух предпринимательства</span><span>:</span><br />
<span class="hps">Хорошо,</span> <span class="hps">искренне</span><span>, устойчивый</span> <span class="hps">-----</span> <span class="hps">совершенство</span><span>, честный</span> <span class="hps">управления</span><span>,</span> <span class="hps">устойчивый прогресс</span><br />
&nbsp;<br />
<span class="hps">Корпоративный</span> <span class="hps">обязательство:</span><br />
<span class="hps">Научные и технологические инновации</span><span>,</span> <span class="hps">создание ценности для</span> <span class="hps">клиентов</span><span class="">, создавая возможности</span> <span class="hps">для сотрудников</span><span>, создавая</span> <span class="hps">преимущества</span> <span class="hps">для сообщества</span><br />
&nbsp;<br />
<span class="hps">Конкурентная стратегия</span><span>:</span><br />
<span class="hps">Создать</span> <span class="hps">конкурентное преимущество</span><span>,</span> <span class="hps">построить</span> <span class="hps">имидж бренда</span><span>, разработка</span> <span class="hps">самые лучшие продукты,</span> <span class="hps">предоставлять лучший сервис</span><br />
&nbsp;<br />
<span class="hps">Талант</span> <span class="hps">Стратегия:</span><br />
<span class="hps">Производительность</span><span class="atn">-</span><span>ориентированных</span> <span class="hps">подготовка квалифицированных кадров</span><br />
&nbsp;<br />
<span class="hps">Качество:</span><br />
<span class="hps">(3G</span><span>)</span> <span class="hps">высокое качество продукции</span><span>,</span> <span class="hps">высокое качество</span> <span class="hps">персонала,</span> <span class="hps">высокий уровень удовлетворенности</span> <span class="hps">пользователей</span><span>,</span> <span class="hps">качество</span> <span class="hps">сегодня</span> <span class="hps">и</span> <span class="hps">завтра</span> <span class="hps">рынок</span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного',' Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('89','comp','81','корпоративной культуры  ','<span id="result_box" class="">&nbsp; <span class="hps">Основы философии</span><span>:</span><br />
<span class="hps">Инновации,</span> <span class="hps">гармония и</span> <span class="hps">беспроигрышная</span><br />
&nbsp;<br />
<span class="hps">Бизнес</span> <span class="hps">цели:</span><br />
<span class="hps">Класс</span> <span class="hps">бренда</span><span>,</span> <span class="hps">первого класса управления</span><span>,</span> <span class="hps">первоклассное качество</span><span>, первоклассное</span> <span class="hps">репутацию,</span> <span class="hps">первоклассное обслуживание</span><br />
&nbsp;<br />
<span class="hps">Корпоративные</span> <span class="hps">цели:</span><br />
<span class="hps">Инновационные и</span> <span class="hps">искреннее служение</span><span>, удовлетворенность клиентов</span><span>,</span> <span class="hps">стремление к совершенству</span><br />
&nbsp;<br />
<span>Дух предпринимательства</span><span>:</span><br />
<span class="hps">Хорошо,</span> <span class="hps">искренне</span><span>, устойчивый</span> <span class="hps">-----</span> <span class="hps">совершенство</span><span>, честный</span> <span class="hps">управления</span><span>,</span> <span class="hps">устойчивый прогресс</span><br />
&nbsp;<br />
<span class="hps">Корпоративный</span> <span class="hps">обязательство:</span><br />
<span class="hps">Научные и технологические инновации</span><span>,</span> <span class="hps">создание ценности для</span> <span class="hps">клиентов</span><span>, создавая возможности</span> <span class="hps">для сотрудников</span><span>, создавая</span> <span class="hps">преимущества</span> <span class="hps">для сообщества</span><br />
&nbsp;<br />
<span class="hps">Конкурентная стратегия</span><span>:</span><br />
<span class="hps">Создать</span> <span class="hps">конкурентное преимущество</span><span>,</span> <span class="hps">построить</span> <span class="hps">имидж бренда</span><span>, разработка</span> <span class="hps">самые лучшие продукты,</span> <span class="hps">предоставлять лучший сервис</span><br />
&nbsp;<br />
<span class="hps">Талант</span> <span class="hps">Стратегия:</span><br />
<span class="hps">Производительность</span><span class="atn">-</span><span>ориентированных</span> <span class="hps">подготовка квалифицированных кадров</span><br />
&nbsp;<br />
<span class="hps">Качество:</span><br />
<span class="hps">(3G</span><span>)</span> <span class="hps">высокое качество продукции</span><span>,</span> <span class="hps">высокое качество</span> <span class="hps">персонала,</span> <span class="hps">высокий уровень удовлетворенности</span> <span class="hps">пользователей</span><span>,</span> <span class="hps">качество</span> <span class="hps">сегодня</span> <span class="hps">и</span> <span class="hps">завтра</span> <span class="hps">рынок</span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного. ','ru');
INSERT INTO `pa_page` VALUES ('90','greet','81','компания  честь','<span id="result_box" class="short_text"><span class="hps">Информация</span> <span class="hps">готовится</span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного. ','ru');
INSERT INTO `pa_page` VALUES ('91','oadv','81','Организационная структура','<p>
	<img src="/Uploads/image/page/20150717/20150717093036_76747.jpg" alt="" />
</p>
<p>
	<span id="result_box" class=""><span>Новая модель</span> <span class="hps">управления требует</span> <span class="hps">плоским</span> <span class="hps">управление</span> <span class="hps">на предприятии</span> <span class="hps">повысить общую</span> <span class="hps">осведомленность,</span> <span class="hps">глобальной осведомленности</span> <span class="hps">и чувство</span> <span class="hps">сотрудничества</span><span class="">,</span> <span class="hps">укрепление</span> <span class="hps">игру</span> <span class="hps">шахматного мышления</span> <span class="hps">и работы в команде</span><span>.</span><br />
&nbsp; <span class="hps">Принятие решений является</span> <span class="hps">управление</span> <span class="hps">основное содержание</span><span>,</span> <span class="hps">связанные с управлением</span> <span class="hps">исполнения</span><span>, прежде всего,</span> <span class="hps">ответственность</span> <span class="hps">менеджеров.</span><br />
<br />
&nbsp; <span class="hps">Чтобы лучше</span> <span class="hps">адаптироваться к</span> <span class="hps">клиентов,</span> <span class="hps">конкуренции,</span> <span class="hps">изменений</span> <span class="hps">в характеристиках</span> <span class="hps">современной бизнес-среде</span><span class="">.</span></span>
</p>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного. ','ru');
INSERT INTO `pa_page` VALUES ('92','comcul','81','Omori  след','<span id="result_box" class=""><span>2009
 год был необычайно году под влиянием мирового финансового кризиса, 
преодолеть трудности, новый производственную базу для успешного 
завершения. </span><span>Новая
 база находится в Тайчжоу Binhai промышленного парка, компания занимает 
площадь более 30000 квадратных метров, в новой среде, новый старт, новое
 мышление, новую высоту, компания может заставить работать в новой 
компании в качестве карьеры во второй взлета, со временем </span><span>Джин, чтобы отвечать на новые вызовы! </span><span>Под руководством каждого отдела, привел весь завод претерпел значительные изменения каждый день! </span><span>Система управления компании на уровне, двойной производства, качества и стабильности.<br />
</span><span>В
 то же время, лицо бушует кризис, Омори спокойно-первых, компания 
укрепила свои Омори внутреннего управления, плохой внешней среды, когда 
жесткие навыки, активно регулируя структуру продукта, особый, новый, 
уникальный, прекрасный направление, повысить конкурентоспособность на 
рынке </span><span>и способность противостоять рискам. </span><span>Укрепление
 внутреннего управления, снижение издержек производства, поддержание 
стабильности рабочей силы, и, во-вторых, компания увеличила инноваций, к
 индивидуальной, настроенной, с высокой добавленной стоимостью, для 
разработки новых продуктов, продуктов выиграл крупнейший прибыли. </span><span>В-третьих,
 опираясь на внутреннем рынке, расширить бизнес за рубежом, а также 
активно участвовать в национальной выставке швейного оборудования, 
сначала найдите и анализировать рынок для различных позиционирование на 
рынке для маркетингового планирования. </span><span>Во-вторых, зарубежные рынки и установления системы контроля качества и стандартов качества.<br />
</span><span>CISMA
 вступить двухгодичного случае, Омори активно готовятся к и с 
нетерпением ждем нового взгляда, чтобы удивить наших клиентов, и 
принести уверенность кризисом страдающий сверстников. </span><span>Для этого, Омори экспонентов оборудование, персонал, пригласить 
клиентов, расположение и другие аспекты стенде для полного спектра 
планирования.<br />
</span><span>Во-первых, компания, основанная «инновация, гармонии и беспроигрышная"
 тема выставки и Cisma выставка «Инновации для повышения" тему полностью
 здоров:<br />
</span><span>Во-первых,
 "инновации" является улучшение конкурентоспособности основных важнейших
 средств инноваций находит свое отражение в корпоративной культуре и 
духу, если не новаторский дух, компания Омори не будет в технологии, 
продукты, рынки и предприятия управление </span><span>инновации. </span><span>Во-вторых,
 и в новой технологии и разработки продукции, развитие общих 
промышленных швейных машин в мехатронных компьютерным управлением без 
масла швейной машины, системы сервоуправления и специальных машин, и 
других продуктов с высокой добавленной стоимостью, а также повысить 
производство целого ряда новых продуктов </span><span>и продажи, чтобы гарантировать, что продукция компании в области 
одежды машин продвинутого уровня и достижения стратегической путь 
компании целей устойчивого развития.<br />
</span><span>Во-вторых,
 "гармоничный беспроигрышным", быстро растущие компании не могут 
обойтись без гармонии, гармоничного внутренней и внешней среды. </span><span>Корпоративные
 обязательства Омори на технологические инновации, создавать ценности 
для клиентов, создавая возможности для сотрудников, создавая 
преимущества для сообщества. </span><span>Июнь
 день мы переехали в то же время, сотрудники игнорирует высоких 
температур, боясь трудно, заплатил много пота и напряженной работы, 
чтобы сделать наш переезд был завершен гладко. </span><span>Новые
 условия Новая Надежда, все полны энтузиазма и страсти, и с переездом 
компании, мы рассматриваем бизнес, как семья, появление большого 
количества касаясь экрана. </span><span>Многие сотрудники переехал со своей семьей, многие сотрудники меньше спать, мы искренне горд и счастлив! </span><span>Это
 также доказывает, что все сотрудники поддержки и признания развития 
компании. "Для того, чтобы делать бизнес, и как человек, это необходимо 
учитывать самостоятельно, но также ради других." На протяжении многих 
лет, компания Омори, чтобы выиграть-выиграть менталитет и поставщиков, и
 пользователей </span><span>делать упражнения интерес, крыло и общего процветания, потери для 
обеих сторон, чтобы поддерживать целостность и взаимной выгоды.<br />
</span><span>В-третьих,
 инновации и модернизации промышленности значимость, в настоящее время, 
швейной машины промышленности, низкая производительность, высокое 
потребление энергии, низкие технологии продуктов с добавленной 
стоимостью, гомогенизации серьезной ценовой конкуренции на рынке может 
только бороться, бороться затраты, бороться масштаб, этот порочный цикл </span><span>формирование
 текущей низким уровнем промышленных швейных машин, рыночной среде 
недорогим, корпоративные прибыли низка, нет денег, чтобы участвовать в 
научных и технологических инноваций, но нет никаких научных и 
технологических инноваций, мы можем только поддерживать недорогой, 
низкая эффективность. </span><span>Волна за волной ценовых войн, конкуренция низкая стоимость оказалась неработоспособной. </span><span>Таким образом, увеличение инвестиций в исследования и повышения 
концентрации промышленности, повышения эффективности производства и 
снижения потребления энергии, развитие высоких технологий, с высокой 
добавленной стоимостью высокого качества новых продуктов, для достижения
 индустриальной модернизации, основным способом швейной машины 
промышленности.<br />
</span><span>Шоу, компания покажет новую конечную компьютер с прямым приводом 
швейную машину JR9300D-2, новый overedger JR998F, электронный вычет 
JR1903A, электронный лавируя машины JR1900ASS, электронные трюки JR210D.<br />
</span><span>Продукты,
 использующие прямой привод (система DD), сокращая линию передачи, 
начиная гладкой и отзывчивый, обеспечивая быстрый запуск и завершение 
работы функции точно, хорошие эффекты ткань ножевые. </span><span>Встроенный
 механизм намотки, пользователь может выбрать в соответствии с 
различными требованиями набора, значительно улучшая эффективность 
работы, высота гребенок, наклон и фазу можно легко регулировать. </span><span>Машина
 предназначена для средних толщиной материалов, как хлопок, шерсть, лен,
 химических волокон и других тканей. Прямой привод, сила воли может быть
 передан без потери шпинделя. </span><span>По сравнению с обычными приводной ремень компьютерных машин, низким энергопотреблением, экономя почти 50%.<br />
</span><span>Компьютер панель управления от операционной голову классификации цвета, позволяет оператору легко понять с первого взгляда. </span><span>Швейные скорость машины, можно легко управлять через набор дисков и изменения. </span><span>По умолчанию контактный номер, но также поможет точно механической обработке. </span><span>Тело дизайн акцент на "человек - машина" техники принципе. </span><span>Ремень
 газораспределения, иглодержатель, нитки взять, Роторно-крюк и ряд 
усовершенствований, чтобы сделать утомительный процесс отладки 
упрощается, оператор может быстро настроить, и ожидать, чтобы 
удовлетворить спрос толстый материал шитье тонкий и </span><span>повысить эффективность работы.<br />
</span><span>2009
 CISMA выставка чрезвычайной значимости, но и потому, что она находится в
 процессе финансового кризиса продолжали обмениваться событие. </span><span>Кризис
 мировой экономики в рецессию, потребительский спрос значительно 
снизился, государство повысило четыре раза налог на экспорт скидки 
ставки, значительная часть иностранных налоговых льгот забрали, или 
очень мало прибыль швейная машина завод. </span><span>Промышленность
 сталкивается много давления, в основном в трех аспектах: финансовый 
кризис, и в сочетании с внутренним причинам, швейная машина цен на сырье
 в, увеличения производства и эксплуатационных расходов, женьминьби 
значительно сжатых корпоративного выживания; промышленные швейные цены 
машины продукты резко упал, корпоративный рентабельность </span><span>резко; швейная машина рынок был слаб и атрофии, продажа швейных машин и финансовое урегулирование стало сложнее. </span><span>Большое количество компаний, стремящихся выжить невзгоды.<br />
</span><span>Финансовый
 кризис будет продолжаться, то, по оценкам, будет восстановлен после 
двух лет, 2009 год был самым трудным периодом, я считаю, что это улучшит
 во второй половине 2010 года, будет хлеб, и молоко будет там, когда 
лучше, наша страна будет введен быстро </span><span>рост. </span><span>В
 долгосрочной перспективе, очень оптимистично для швейной машины 
промышленности, одежды, продуктов питания, жилья, транспорта, пять 
вещей, один меньше, одежда занимает первое место, нет Пошив одежды, так 
что суждено вечное промышленности. </span><span>Годы
 развития от промышленности точки зрения, от рыночной конкуренции, 
швейной машины, швейная машина пакет является крупнейшим производства и 
продаж модели, многие компании-производители, конкуренция является 
жесткой. </span><span>В
 специальном рынке машины, спрос на небольшой, чтобы поддерживать 
высокую прибыль маржой, так Омори стремится к развитию новых продуктов с
 высокой добавленной стоимостью продуктов специальности для дальнейшего 
обеспечения рынка. </span><span>Под
 совместным усилиям всех сотрудников, инновации, солидный труд, мы 
сможем захватить возможности, решать проблемы и создавать новые 
достижения, создать большую славу! </span><span>У
 нас есть уверенность, чтобы построить большой-сумму "удовлетворенность 
клиентов, стабильность персонала, красивый окружающей среды, устойчивого
 развития," передовые предприятия.</span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного. ','ru');
INSERT INTO `pa_page` VALUES ('93','hon','81','предприятия  один  угол','<p>
	<span id="result_box" class="">&nbsp;&nbsp;&nbsp;&nbsp; <span class="hps">Омори</span> <span class="hps">имеет профессиональный</span> <span class="hps">производство</span> <span class="hps">серии</span> <span class="hps">современных</span> <span class="hps">промышленного швейного оборудования</span><span>,</span> <span class="hps">компания очень</span> <span class="hps">важно</span> <span class="hps">научное руководство</span> <span class="hps">и</span> <span class="hps">разработка новых продуктов</span><span>,</span> <span class="hps">сильные технические силы</span><span>, хорошо оборудованные</span><span class="">, передовые технологии,</span> <span class="hps">с строгой системой</span> <span class="hps">управления качеством</span> <span class="hps">и лучшей</span> <span class="hps">работы</span> <span class="hps">отношение</span><span>, качество продукции</span> <span class="hps">и стабильность</span><span>.</span> <span class="hps">Всегда</span> <span class="hps">готовы предоставить</span> <span class="hps">Вам отличный сервис</span><span class="">.</span></span>
</p>
<p>
	<img src="/Uploads/image/page/20150717/20150717092607_56164.jpg" alt="" /><img src="/Uploads/image/page/20150717/20150717092621_15957.jpg" alt="" /><img src="/Uploads/image/page/20150717/20150717092631_49627.jpg" alt="" /><img src="/Uploads/image/page/20150717/20150717092640_73014.jpg" alt="" /><img src="/Uploads/image/page/20150717/20150717092652_84009.jpg" alt="" /><img src="/Uploads/image/page/20150717/20150717092705_19503.jpg" alt="" /><br />
<span id="result_box" class=""></span>
</p>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('95','enc','81','календарного года  выставка','<P>　　DOSO отечественных и зарубежных крупномасштабных профессиональной выставки как прекрасное толкование платформы и активно участвовать во внутренней и международной профессиональной выставке дальнейшего углубленного изучения мирового рынка, увеличить скорость сближения с одеждой в мире, швейной промышленности. Единый образ, чтобы показать перед клиентами по всему миру, лучшие марки острова в глубине сердца все, чтобы завоевать доверие наших клиентов, повысить их популярность и репутацию.</P>
<P>　　- Предыдущее шоу CISMA-</P>
<P>　　2003CISMA 2003CISMA</P>
<P>　　2004CISMA 2004CISMA</P>
<P>　　2005CISMA 2005CISMA</P>
<P>　　2007CISMA 2007CISMA</P>
<P>　　2009CISMA 2009CISMA</P>
<P>　　2011CISMA 2011CISMA</P>
<P>　　- Другие международные выставки-</P>
<P>　　бенгальские выставка Россия Выставка</P>
<P>　　Львы выставки Египет выставка</P>
<P>　　Вьетнам выставка</P>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного. ','ru');
INSERT INTO `pa_page` VALUES ('96','shc','81','модели одежды  завод','<span id="result_box" class="short_text"><span class="hps">Информация</span> <span class="hps">готовится</span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного. ','ru');
INSERT INTO `pa_page` VALUES ('97','omvideo','81','Omori  видео  показать','<span id="result_box" class="short_text"><span class="hps">Информация</span> <span class="hps">готовится</span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного. ','ru');
INSERT INTO `pa_page` VALUES ('98','clothmf','0','людских  ресурсов','<span id="result_box" class=""><span class="hps">Работа:</span> <span class="hps">Графический дизайн,</span> <span class="hps">маркетинг</span> <span class="hps">Опубликовано:</span> <span class="hps">2012-2-4</span><br />
<span class="hps">Пол:</span> <span class="hps">Любой</span> <span class="hps">Возраст:</span> <span class="hps">18</span> <span class="hps">лет</span><br />
<span class="hps">Количество</span><span class="">:</span> <span class="hps">2 Образование</span><span>:</span> <span class="hps">Высшее</span><br />
<span class="hps">Опыт работы</span><span>:</span> <span class="hps">более 1 года</span> <span class="hps">лечение</span> <span class="hps">зарплата:</span> <span class="hps">договорная</span><br />
<span class="hps">Требования:</span> <span class="hps">маркетинг,</span> <span class="hps">продвижение</span><span>, опыт</span> <span class="hps">бренд-менеджмент,</span> <span class="hps">крепкого здоровья</span><span>, правильное</span> <span class="hps">мышление.</span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('99','coninf','98','набора персонала','<span id="result_box" class=""><span class="hps">Работа:</span> <span class="hps">Графический дизайн,</span> <span class="hps">маркетинг</span> <span class="hps">Опубликовано:</span> <span class="hps">2012-2-4</span><br />
<span class="hps">Пол:</span> <span class="hps">Любой</span> <span class="hps">Возраст:</span> <span class="hps">18</span> <span class="hps">лет</span><br />
<span class="hps">Количество</span><span>:</span> <span class="hps">2 Образование</span><span class="">:</span> <span class="hps">Высшее</span><br />
<span class="hps">Опыт работы</span><span>:</span> <span class="hps">более 1 года</span> <span class="hps">лечение</span> <span class="hps">зарплата:</span> <span class="hps">договорная</span><br />
<span class="hps">Требования:</span> <span class="hps">маркетинг,</span> <span class="hps">продвижение</span><span>, опыт</span> <span class="hps">бренд-менеджмент,</span> <span class="hps">крепкого здоровья</span><span>, правильное</span> <span class="hps">мышление.</span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного. ','ru');
INSERT INTO `pa_page` VALUES ('100','eno','98','уход сотрудников','<p>
	<img src="/Uploads/image/page/20150717/20150717091959_13045.jpg" alt="" />
</p>
<p>
	<span id="result_box" class=""><span class="hps">Омори</span> <span class="hps">гуманистическая</span><span class="">, уход</span> <span class="hps">обогатить свою жизнь</span><span>,</span> <span class="hps">чтобы помочь сотрудникам</span> <span class="hps">решить</span> <span class="hps">беспокоиться,</span> <span class="hps">так</span> <span class="hps">что все сотрудники</span> <span class="hps">чувствуют, что компания</span> <span class="hps">тепло</span><span>.</span><br />
<span class="hps">Компания отстаивать</span> <span class="hps">концепцию</span> <span class="hps atn">"</span><span>ориентированная на людей</span><span>"</span> <span class="hps">для</span> <span class="hps">реализации</span> <span class="hps">управленческих кадров</span> <span class="hps">разнообразие,</span> <span class="hps">уважать местные</span> <span class="hps">таможенного персонала</span><span>.</span><br />
<span class="hps">Компании</span> <span class="hps">активно содействовать</span> <span class="hps atn">"</span><span>здоровый образ жизни</span><span>, счастливой</span> <span class="hps">работы</span><span>" понятие</span><span>,</span> <span class="hps">чтобы</span> <span class="hps">продвигать строительство</span> <span class="hps">корпоративной культуры</span><span>, а также повысить</span> <span class="hps">их чувство принадлежности</span><span>, обогащают</span> <span class="hps">культурную жизнь</span> <span class="hps">любительских</span> <span class="hps">кадров,</span> <span class="hps">чтобы удовлетворить</span> <span class="hps">потребности сотрудников</span> <span class="hps">многоуровневых</span><span class="">.</span></span>
</p>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('101','pdle','98','стратегии талантов','<span id="result_box" class=""><span class="hps">Талант</span> <span class="hps">Стратегия:</span> <span class="hps">долгосрочные</span> <span class="hps">стимулы</span><br />
<span class="hps">Персонал</span><span>,</span> <span class="hps">правильное позиционирование</span><span>, их</span> <span class="hps">талант</span><span>, чтобы создать ценность</span><span>;</span> <span class="hps">руководящие</span> <span class="hps">интересы</span><span>, всестороннее</span> <span class="hps">развитие,</span> <span class="hps">три</span> <span class="hps">ссылки</span><span>,</span> <span class="hps">цепь</span><span>,</span> <span class="hps">как ожидается, достигнет</span> <span class="hps">долгосрочных стимулов</span> <span class="hps">для</span> <span class="hps">сотрудников</span><span>.</span><br />
<span class="hps">Оптимизация</span> <span class="hps">кадрового</span> <span class="hps">чтобы гарантировать, что</span> <span class="hps">использование человеком</span><br />
<span>Первый</span> <span class="hps">шаг в построении</span> <span class="hps">механизма</span> <span class="hps">мотивации</span><span>,</span> <span class="hps">чтобы</span> <span class="hps">сделать</span> <span class="hps">эффективное распределение</span> <span class="hps">человеческих ресурсов</span><span>,</span> <span class="hps">как можно больше</span><span>, чтобы</span> <span class="hps">убедиться, что</span> <span class="hps">правильные</span> <span class="hps">люди в</span> <span class="hps">правой позиции</span><span>, чтобы сделать</span> <span class="hps">правильную вещь</span><span>.</span> <span class="hps">Только с</span> <span class="hps">правильным человеком</span><span>,</span> <span class="hps">он может</span> <span class="hps">эффективно</span> <span class="hps">мотивировать его</span><span>.</span><br />
<span class="hps">Укрепление</span> <span class="hps">управления производительностью</span><span>, чтобы обеспечить</span> <span class="hps">с хорошими людьми</span><br />
<span>Так называемый</span> <span class="hps atn">"</span><span>хорошее применение</span><span>"</span><span>, то есть</span><span>,</span> <span class="hps">как могут</span> <span class="hps">люди</span> <span class="hps">с хорошим,</span> <span class="hps">как мы можем</span> <span class="hps">достичь</span> <span class="hps">"лучшего</span> <span class="hps">использования"</span><span>,</span> <span class="hps">в</span> <span class="hps">целях достижения</span> <span class="hps atn">"</span><span>оптимального использования</span><span>"</span><span>,</span> <span class="hps">о</span> <span class="hps">человеческих</span> <span class="hps">и материальных</span> <span class="hps">ресурсов компании</span> <span class="hps">для наиболее эффективной</span> <span class="hps">интеграции</span><span>,</span> <span class="hps">чтобы создать</span> <span class="hps">лучшую производительность</span> <span class="hps">компании.</span> <span class="hps">На практике</span><span>,</span> <span class="hps">часто через</span> <span class="hps">управление производительностью</span> <span class="hps">для достижения</span><span>.</span><br />
<span class="hps">Комплексная</span> <span class="hps">стратегия</span> <span class="hps">компенсации</span> <span class="hps">для достижения</span> <span class="hps">руководство</span> <span class="hps">интересы</span><br />
<span class="hps">Необходимо обратить</span> <span class="hps">справедливой компенсации и</span> <span class="hps">исчерпывающий ответ</span> <span class="hps">спроса</span><span>,</span> <span class="hps">в целях дальнейшего осуществления</span> <span class="hps">долгосрочных стимулов</span><span>.</span> <span class="hps">Одним из ключевых</span> <span class="hps">аспектов</span> <span class="hps">управления эффективностью</span> <span class="hps">является повышение</span> <span class="hps">способности</span> <span class="hps">сотрудников</span> <span class="hps">и способствовать</span> <span class="hps">производительности,</span> <span class="hps">продолжающегося</span> <span class="hps">справедливой</span> <span class="hps">оценки.</span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('102','Sal','98','введение  доставки','<span id="result_box" class=""><span class="hps"><span id="result_box" class="short_text"><span class="hps">Информация</span> <span class="hps">готовится</span></span></span><span class="hps"></span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('103','ven','0','центр обслуживания','<img src="/Uploads/image/page/20150717/20150717091648_59010.jpg" alt="" /><br />','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('104','lcdle','103','глобальная сеть продаж','<img src="/Uploads/image/page/20150717/20150717091156_58210.jpg" alt="" /><img src="/Uploads/image/page/20150717/20150717091249_99711.jpg" alt="" /><br />','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('105','honn','103','внутренние продажи  сети','<img src="/Uploads/image/page/20150717/20150717091541_57595.jpg" alt="" /><br />','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('106','eso','103','VI','<span id="result_box" class=""><span class="hps">Информация</span> <span class="hps">готовится</span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('107','hdo','103','послепродажное обслуживание','<p>
	<img src="/Uploads/image/page/20150717/20150717090914_96951.jpg" alt="" />
</p>
<p>
	<span id="result_box" class=""><span class="hps">Создание и улучшение</span> <span class="hps">различных</span> <span class="hps">норм и правил</span> <span class="hps">и</span> <span class="hps">исполнения</span> <span class="hps">хорошую работу</span><br />
<span class="hps">Строительство</span> <span class="hps">схватив</span> <span class="hps">процессы обслуживания</span><span>, чтобы улучшить</span> <span class="hps">качество обслуживания</span><br />
<span class="hps">Повышение</span> <span class="hps">экологического менеджмента</span> <span class="hps">и внимания</span> <span class="hps">на</span> <span class="hps">месте, чтобы</span> <span class="hps">подробно</span> <span class="hps">различные</span> <span class="hps">секторы услуг</span><br />
<span class="hps">Сосредоточьтесь на</span> <span class="hps">корпоративной культуры</span> <span class="hps">и</span> <span class="hps">качества подготовки</span> <span class="hps">персонала</span><br />
<span class="hps">Регулярные визиты</span> <span class="hps">покупателей,</span> <span class="hps">построить</span> <span class="hps">профили клиентов</span><br />
<span class="hps">Настройте</span> <span class="hps">несколько выходов</span><span class="">,</span> <span class="hps">и попытаться сделать</span> <span class="hps">нормально</span></span>
</p>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('108','ese','103','Omori  загрузки данных','<span id="result_box" class="short_text"><span class="hps">Информация</span> <span class="hps">готовится</span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('109','mec','103','Центр  видео','<span id="result_box" class="short_text"><span class="hps">Информация</span> <span class="hps">готовится</span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('110','mdrdf','0','обращаться к нам','<P>　　Zhejiang DOSO Sewing Machine Co., Ltd.</P>
<P>　　адрес：No.2229 Haifeng Rd.B.Dist.Binhai Industrial Zone</P>
<P>　　телефон：0576-88027625</P>
<P>　　Факс：0576-88027656</P>
<P>　　веб-сайт：http://www.chinadoso.com</P>
<P>　　почтовый ящик：info@chinadoso.com</P>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('111','infdc','110','контакты','<P>　　Zhejiang DOSO Sewing Machine Co., Ltd.</P>
<P>　　адрес：No.2229 Haifeng Rd.B.Dist.Binhai Industrial Zone</P>
<P>　　телефон：0576-88027625</P>
<P>　　Факс：0576-88027656</P>
<P>　　веб-сайт：http://www.chinadoso.com</P>
<P>　　почтовый ящик：info@chinadoso.com</P>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('112','rh','110','географическое положение','资料整理中【地图】','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('113','recl','110','онлайн  обратной связи','<span id="result_box" class="short_text"><span class="hps">Информация</span> <span class="hps">готовится</span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('114','aae','110','Закон  заявление','<span id="result_box" class=""><span>&nbsp;&nbsp;&nbsp; </span><span>Ничто
 на этом сайте (в том числе, но не ограничиваясь данных, текста, 
графики, изображений, звука или видео) принадлежат авторском Омори 
швейной машины (далее «Компания»). </span><span>Без
 нашего предварительного письменного разрешения, не организация или 
частное лицо не может быть воспроизведена в любом случае, 
воспроизводить, распространять, публиковать, перепечатывать, 
пересмотреть или отображения содержимого этого сайта. </span><span>Любое несанкционированное использование поведения этого веб-сайта,
 я буду на базе "Народной Республики Китая Закона об авторском праве» и 
другими законами и правилами в целях осуществления соответствующих 
физических или юридических лиц, которые действуют незаконной 
ответственность медведя.<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Этот
 сайт предназначен только для ограниченного использования информационных
 и некоммерческих или личных целей, пересмотреть и изменить без 
уведомления. </span><span>Я
 отношусь к точности любого этого содержания страницы, надежность, 
уровень использования, покупатели могут просматривать степень потери или
 ущерб, причиненный или полноте, моя компания и филиалы не несет 
ответственности и не делать какие-либо выразить это </span><span>либо подразумеваемых гарантий, гарантий, обещаний или подтверждены.<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Моя
 компания в любом входа, использования, ссылки или посетите веб-контента
 такое лицо может прямо или косвенно несут или любого имущества, 
финансовых или других потерь вызвано, не несет никакой ответственности 
или вины, но и не будет возможно позже переработка </span><span>какие-либо претензии, действия или юридические разбирательства.<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Условия использования этого сайта и закона должны применяться Народную Республику. </span><span>Любой спор, касающийся этого веб-сайта и термины, используемые 
Судом Я зарегистрировал компанию под юрисдикцию место Китая в городе 
Ханчжоу.<br />
&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Я всегда изменить этот сайт, и вышеуказанные исключения пунктах и права защищены.</span></span>','1','Машина шва - [DOSO] специализированный двигатель оборудования машинного','Машина шва - [DOSO] специализированный двигатель оборудования машинного.','ru');
INSERT INTO `pa_page` VALUES ('115','edt','0','En el gran Sen','<P>　　En el Mar de China Oriental, la patria, que se encuentra en una hermosa ciudad costera - Taizhou. Al este de Taizhou Bay, al sur de Ganso Salvaje, tejados del norte, Shenxiu paisaje aquí. Paisaje cultural tiene una larga historia. Miles de años de historia china y la acumulación de patrimonio cultural y la integración de la civilización del mundo moderno hace que este pedazo de tierra llena de vitalidad. Crecer en esta tierra fértil máquinas de coser Zhejiang Omori, es la pasión del viento y las olas para crear una primera clase de costura empresas de fabricación de maquinaria.</P>
<P>　　Zhejiang Omori Sewing Machine Co., Ltd. fue fundada en 1999, está situada en Taizhou Binhai Parque Industrial, la empresa cubre un área de más de 30.000 metros cuadrados. Su perspectiva única de crear una moderna maquinaria de las empresas internacionales de prendas de vestir, para crear una nueva marca de objetivo de coser industria de la maquinaria para crear una nueva cultura de la ropa de hombre y se embarcó en el arduo camino de la iniciativa empresarial. Las empresas que se adhieren a la filosofía empresarial de "bien, sincero y constante excelencia, es decir, ----, negocio honesto, el progreso constante, el éxito de ganar un punto de apoyo firme en la economía de mercado, y prosperar, maquinaria industria de la confección en China en los últimos años se ha acumulado una gran cantidad experiencias. Desarrollo se ha convertido en una colección de investigación científica, el desarrollo, el diseño, la producción, el comercio y los servicios en una maquinaria profesional de la indumentaria y de la maquinaria textil y proveedores de equipos. Sus productos de marca Omori, Lin, jilguero "--- máquina electrónica especial, máquina patrón electrónico, dispositivo de seguridad de la máquina de coser overlock, máquina de coser, máquinas de coser, máquinas de doble pespunte material grueso, computarizado máquina de punto plana , ahorro de energía motores, ocho categorías de 90 tipos de productos se venden bien en todo el mundo, y bien recibidos por nuestros clientes.</P>
<P>　　La filosofía central, la compañía se adhieren a la "innovación, la armonía y de ganar-ganar" desarrollo constante, haciendo bien y más fuerte, después de años de incansables esfuerzos de todo el personal, establecido en una empresa líder en la industria de la confección maquinaria doméstica. Omori, es el pilar de la industria de máquinas de coser, y en 2003 se unió a la de China Asociación de coser, miembro de la Asociación, Zhejiang máquina de coser Asociación unidad en 2008, en 2003, fue galardonado con las unidades avanzadas de las empresas del municipio, 2006, nombró las calificaciones anuales de crédito corporativas de AA + grado de calidad, pesado defiende la unidad de prestigio ha sido adjudicado. El Omori entender la "calidad primero, reputación primero" es la búsqueda eterna de la empresa para hacerse un hueco! "Debemos primero de sus beneficios. "A lo largo de los años, la empresa liderada por el presidente de la Junta, Sr. Ye Xianchong, adhiriendo a la" Desarrollar los mejores productos y el mejor servicio "espíritu, se adhieren a los" productos de alta calidad y de alta calidad de los usuarios del personal satisfacción alta "política de calidad, completos El número de nuevas patentes prácticos y ganó una serie de investigaciones científicas, ha pasado el ISO9001: 2000 de gestión de calidad del sistema de certificación y de certificación de seguridad CE entrar en el mercado durante los últimos 10 años, experimentó la introducción de equipos - mejoras tecnológicas - Estrategia - Información sobre los estadios de la construcción, importación CAD. ERP compañía del sistema de gestión concede una gran importancia a la gestión científica y el desarrollo de nuevos productos, el desarrollo de la mecatrónica en la consolidación y desarrollo del producto original a partir generales de coser industriales de la máquina sin aceite máquinas de coser controlados por computadora, sistema de servo control, y una máquina especial, como una serie de alta productos de valor añadido, aumentado aún más la fabricación y venta de una variedad de nuevos productos, para garantizar el nivel avanzado de productos de la compañía en el campo de la maquinaria del vestido, y para lograr los objetivos estratégicos de la compañía a la senda del desarrollo sostenible de la calidad de la fuerza, Brilliantness tecnología través de la investigación independiente y el desarrollo, la innovación tecnológica, y una variedad de dispositivos de gama alta, uno tras otro mercado, la producción de la máquina de coser de accionamiento directo, "velocidad rápida, bajo nivel de ruido, función fuerte, de alta eficiencia" ventaja en comparación a igual los productos, sino también puso en marcha el bar viradas máquina electrónica, electrónicos máquinas de coser botones, trucos electrónicos, máquinas de coser nueva bolsa, la máquina de coser estiramiento de toda la gama de motor servo de ahorro de energía. Omori está orientada a las personas y las ideas de diseño en consonancia con la norma internacional reflejen plenamente razonable estructura perfecta, el rendimiento de operación simple y confiable, diseño hermoso y suave encarna la perfecta combinación de la ciencia y la tecnología y la cultura estética, la reproducción con la tendencia de desarrollo de los tiempos y el progreso de la civilización humana, la Declaración de práctica que conduce tendencia prenda desarrollo de maquinaria.</P>
<P>　　Omori empresa con una fuerza técnica fuerte, basada en la tecnología, la excelencia continua realista e innovador será siempre el mejor producto de programa de configuración, adaptado para proporcionar un producto más fácil de usar y servicios para la mayoría de usuarios. Productos cubiertos casi 30 provincias, regiones autónomas nacionales y exportados a cerca de 40 países y regiones de Asia, África, América Latina y Europa.</P>
<P>　　Desde su creación, se adhieren a la "orientada al rendimiento, para capacitar a personal de alta calidad." Implementación estratégica de la "orientada a las personas" filosofía de gestión, el estilo de gestión encantador, nuestra gestión de la Calzada, ha sido confirmada por la práctica, por la misma industria digno de elogio. La producción moderna del sistema informático de gestión que se aplica plenamente aquí, en todos los niveles de la gestión de ingenio en pleno juego aquí, que planean implementar en cada posición, organización, coordinación y control de la gestión de ingeniería específico ERP funciones. La empresa cuenta con un gran número de personal técnico cualificado y con experiencia y talento directivo experimentado, esta es una fuerza de trabajo con un alto grado de cohesión y lealtad, estos son el activo más importante de Omori, es una empresa sólida que se desarrollan en el ámbito internacional poder! Excelencia, la sabiduría insaciable Omori que es digno de alabanza, a estar orgulloso, que es hoy Omori, este es el futuro Omori. Nos comprometemos a: la innovación tecnológica, la creación de valor para los clientes, la creación de oportunidades para los empleados, la creación de beneficios para la sociedad.</P>
<P>　　Omori ventas a nivel nacional y la red de servicio de ventas, archivos, archivos de usuario, el establecimiento de colección precisa de los diferentes países y regiones diferentes, la información diferente utilización que los usuarios, para ofrecerles un servicio rápido, preciso y eficiente. "La tradición de excelencia y crear un futuro mejor, Omori continuó preocupaciones de los clientes de la demanda, la investigación y la innovación, para ofrecer a los clientes la tecnología más avanzada del mundo y conceptos de diseño.</P>
<P>　　Los resultados de ayer se ha convertido en una cosa del pasado, el mañana traerá más oportunidades y desafíos, hoy Omori persona con trabajo de integridad, sabiduría, coraje y trabajo duro, con nuestros clientes para trabajar juntos para construir una próspera carrera espacio para la maquinaria prenda Industrial más grande, más fuerte y hacer una mayor contribución a nuestro mañana será sin duda mejor!</P>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('116','re','115','El perfil de la empresa','<P>　　En el Mar de China Oriental, la patria, que se encuentra en una hermosa ciudad costera - Taizhou. Al este de Taizhou Bay, al sur de Ganso Salvaje, tejados del norte, Shenxiu paisaje aquí. Paisaje cultural tiene una larga historia. Miles de años de historia china y la acumulación de patrimonio cultural y la integración de la civilización del mundo moderno hace que este pedazo de tierra llena de vitalidad. Crecer en esta tierra fértil máquinas de coser Zhejiang Omori, es la pasión del viento y las olas para crear una primera clase de costura empresas de fabricación de maquinaria.</P>
<P>　　Zhejiang Omori Sewing Machine Co., Ltd. fue fundada en 1999, está situada en Taizhou Binhai Parque Industrial, la empresa cubre un área de más de 30.000 metros cuadrados. Su perspectiva única de crear una moderna maquinaria de las empresas internacionales de prendas de vestir, para crear una nueva marca de objetivo de coser industria de la maquinaria para crear una nueva cultura de la ropa de hombre y se embarcó en el arduo camino de la iniciativa empresarial. Las empresas que se adhieren a la filosofía empresarial de "bien, sincero y constante excelencia, es decir, ----, negocio honesto, el progreso constante, el éxito de ganar un punto de apoyo firme en la economía de mercado, y prosperar, maquinaria industria de la confección en China en los últimos años se ha acumulado una gran cantidad experiencias. Desarrollo se ha convertido en una colección de investigación científica, el desarrollo, el diseño, la producción, el comercio y los servicios en una maquinaria profesional de la indumentaria y de la maquinaria textil y proveedores de equipos. Sus productos de marca Omori, Lin, jilguero "--- máquina electrónica especial, máquina patrón electrónico, dispositivo de seguridad de la máquina de coser overlock, máquina de coser, máquinas de coser, máquinas de doble pespunte material grueso, computarizado máquina de punto plana , ahorro de energía motores, ocho categorías de 90 tipos de productos se venden bien en todo el mundo, y bien recibidos por nuestros clientes.</P>
<P>　　La filosofía central, la compañía se adhieren a la "innovación, la armonía y de ganar-ganar" desarrollo constante, haciendo bien y más fuerte, después de años de incansables esfuerzos de todo el personal, establecido en una empresa líder en la industria de la confección maquinaria doméstica. Omori, es el pilar de la industria de máquinas de coser, y en 2003 se unió a la de China Asociación de coser, miembro de la Asociación, Zhejiang máquina de coser Asociación unidad en 2008, en 2003, fue galardonado con las unidades avanzadas de las empresas del municipio, 2006, nombró las calificaciones anuales de crédito corporativas de AA + grado de calidad, pesado defiende la unidad de prestigio ha sido adjudicado. El Omori entender la "calidad primero, reputación primero" es la búsqueda eterna de la empresa para hacerse un hueco! "Debemos primero de sus beneficios. "A lo largo de los años, la empresa liderada por el presidente de la Junta, Sr. Ye Xianchong, adhiriendo a la" Desarrollar los mejores productos y el mejor servicio "espíritu, se adhieren a los" productos de alta calidad y de alta calidad de los usuarios del personal satisfacción alta "política de calidad, completos El número de nuevas patentes prácticos y ganó una serie de investigaciones científicas, ha pasado el ISO9001: 2000 de gestión de calidad del sistema de certificación y de certificación de seguridad CE entrar en el mercado durante los últimos 10 años, experimentó la introducción de equipos - mejoras tecnológicas - Estrategia - Información sobre los estadios de la construcción, importación CAD. ERP compañía del sistema de gestión concede una gran importancia a la gestión científica y el desarrollo de nuevos productos, el desarrollo de la mecatrónica en la consolidación y desarrollo del producto original a partir generales de coser industriales de la máquina sin aceite máquinas de coser controlados por computadora, sistema de servo control, y una máquina especial, como una serie de alta productos de valor añadido, aumentado aún más la fabricación y venta de una variedad de nuevos productos, para garantizar el nivel avanzado de productos de la compañía en el campo de la maquinaria del vestido, y para lograr los objetivos estratégicos de la compañía a la senda del desarrollo sostenible de la calidad de la fuerza, Brilliantness tecnología través de la investigación independiente y el desarrollo, la innovación tecnológica, y una variedad de dispositivos de gama alta, uno tras otro mercado, la producción de la máquina de coser de accionamiento directo, "velocidad rápida, bajo nivel de ruido, función fuerte, de alta eficiencia" ventaja en comparación a igual los productos, sino también puso en marcha el bar viradas máquina electrónica, electrónicos máquinas de coser botones, trucos electrónicos, máquinas de coser nueva bolsa, la máquina de coser estiramiento de toda la gama de motor servo de ahorro de energía. Omori está orientada a las personas y las ideas de diseño en consonancia con la norma internacional reflejen plenamente razonable estructura perfecta, el rendimiento de operación simple y confiable, diseño hermoso y suave encarna la perfecta combinación de la ciencia y la tecnología y la cultura estética, la reproducción con la tendencia de desarrollo de los tiempos y el progreso de la civilización humana, la Declaración de práctica que conduce tendencia prenda desarrollo de maquinaria.</P>
<P>　　Omori empresa con una fuerza técnica fuerte, basada en la tecnología, la excelencia continua realista e innovador será siempre el mejor producto de programa de configuración, adaptado para proporcionar un producto más fácil de usar y servicios para la mayoría de usuarios. Productos cubiertos casi 30 provincias, regiones autónomas nacionales y exportados a cerca de 40 países y regiones de Asia, África, América Latina y Europa.</P>
<P>　　Desde su creación, se adhieren a la "orientada al rendimiento, para capacitar a personal de alta calidad." Implementación estratégica de la "orientada a las personas" filosofía de gestión, el estilo de gestión encantador, nuestra gestión de la Calzada, ha sido confirmada por la práctica, por la misma industria digno de elogio. La producción moderna del sistema informático de gestión que se aplica plenamente aquí, en todos los niveles de la gestión de ingenio en pleno juego aquí, que planean implementar en cada posición, organización, coordinación y control de la gestión de ingeniería específico ERP funciones. La empresa cuenta con un gran número de personal técnico cualificado y con experiencia y talento directivo experimentado, esta es una fuerza de trabajo con un alto grado de cohesión y lealtad, estos son el activo más importante de Omori, es una empresa sólida que se desarrollan en el ámbito internacional poder! Excelencia, la sabiduría insaciable Omori que es digno de alabanza, a estar orgulloso, que es hoy Omori, este es el futuro Omori. Nos comprometemos a: la innovación tecnológica, la creación de valor para los clientes, la creación de oportunidades para los empleados, la creación de beneficios para la sociedad.</P>
<P>　　Omori ventas a nivel nacional y la red de servicio de ventas, archivos, archivos de usuario, el establecimiento de colección precisa de los diferentes países y regiones diferentes, la información diferente utilización que los usuarios, para ofrecerles un servicio rápido, preciso y eficiente. "La tradición de excelencia y crear un futuro mejor, Omori continuó preocupaciones de los clientes de la demanda, la investigación y la innovación, para ofrecer a los clientes la tecnología más avanzada del mundo y conceptos de diseño.</P>
<P>　　Los resultados de ayer se ha convertido en una cosa del pasado, el mañana traerá más oportunidades y desafíos, hoy Omori persona con trabajo de integridad, sabiduría, coraje y trabajo duro, con nuestros clientes para trabajar juntos para construir una próspera carrera espacio para la maquinaria prenda Industrial más grande, más fuerte y hacer una mayor contribución a nuestro mañana será sin duda mejor!</P>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('117','hre','115','Presidente.','<span id="result_box" class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span>2009
 fue un año extraordinario, bajo la influencia de la crisis financiera 
mundial, hemos superado las dificultades, la nueva base de producción a 
una conclusión exitosa. </span><span>Junio
 es el día que nos mudamos, mientras tanto, el personal desafiando las
 altas temperaturas, temerosos de duro, pagó una gran cantidad de sudor y
 trabajo duro para hacer que nuestra reubicación se ha completado sin 
problemas. </span><span>Nuevo
 Ambiente de Nueva Esperanza, todo el mundo está lleno de entusiasmo y 
pasión, junto con la empresa reubicado, la aparición de una gran 
cantidad de tocar la pantalla. </span><span>Muchos empleados se mudaron con su familia, muchos empleados menos sueño, sinceramente orgulloso y feliz! </span><span>Esto también demuestra que el personal de apoyo para el desarrollo y la afirmación de la compañía. </span><span>Propósito;
 nombre de la empresa (consejo de administración) para expresar mi más 
sincero agradecimiento y saludos a todo el personal: ¡Gracias! </span><span>Hemos trabajado duro! </span><span>Para
 expresar mi sincero agradecimiento a todos los sectores de cuidado de 
la vida y apoyar el crecimiento y desarrollo de la compañía! </span><span>Y la esperanza de llamar la atención y el apoyo de todos, como
 siempre, por supuesto, sólo el trabajo duro, crean riqueza y 
rentabilidad social es nuestro enfoque único.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Por
 ahora, la nueva empresa a través de la ardua labor de los jefes de 
departamento y personal, todo el sistema ha estado en funcionamiento es 
normal, pero por debajo de la meta de la compañía de una gran distancia. </span><span>Ahora
 sólo porque la nueva compañía opera de traslado de ida y vuelta en la 
disposición del personal, alojamiento, salud, entretenimiento, etc., 
pueden tener muchos problemas, la compañía ha abordado, en este espero a
 superar temporalmente las dificultades, para entender, apoyar y la 
racionalización </span><span>Sugirió que trabajamos juntos para hacer un mejor trabajo!<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Todos los comienzos son difíciles. </span><span>Hoy en día la magnitud de los logros de la empresa para mejorar la calidad del producto es la clave. </span><span>Y
 para mejorar la calidad del producto, en primer lugar para mejorar la 
calidad del personal, tiene que haber una dedicación del corazón, pero 
para tener unas determinadas cualidades técnicas y habilidades. </span><span>En
 este sentido, los empleados de la planta hacemos bien, tienes que 
plantar en casa, abandonado las tareas familiares, las horas 
extraordinarias, el trabajo duro, se presta atención a la calidad del 
producto, operación atento cuidado. </span><span>Sin
 embargo, debemos ver que a medida que la competencia feroz del mercado,
 demanda de los clientes de nuevos productos, la calidad del producto es
 fundamental, necesitamos más investigación y desarrollo de nuevos 
productos, es necesario para la mejora del producto y optimización, 
especialmente propensos a problemas de calidad </span><span>donde
 las partes más fácilmente dañadas, algunos ajustes y mejoras, mejoran 
significativamente la calidad del producto con el fin de hacer que 
nuestros productos vegetales más competitivos en el mercado, lo que 
requiere que todo el mundo se esfuerzan por mejorar su propia calidad. </span><span>Los empleados nuevos y antiguos para comunicarse entre sí, los 
nuevos empleados deben ser más asesoramiento a los trabajadores de edad,
 trabajadores de edad avanzada deben ser educados ayuda cuidado, "La 
calidad es la primera vitalidad empresarial", los miembros del personal 
deben tener esto en cuenta.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Orientado a las personas travesía vela corporativa, sólo orientado a las personas, las empresas pueden ir más lejos, más alto. </span><span>"El
 desarrollo es inseparable de los trabajadores, los trabajadores son los
 dueños reales de la empresa." En toda la planta de arriba abajo para 
crear una relación armoniosa entre el trabajador para abrir la 
comunicación, interés mutuo y la ayuda, la dirección de la empresa debe 
estar preocupado por el trabajo de cada trabajador </span><span>La vida, que es ayudar a los trabajadores en dificultades. </span><span>Por
 un lado para movilizar plenamente el entusiasmo de los trabajadores, la
 creatividad, quiero comentar "excelente trabajador", por otro lado, 
para evitar el resentimiento de los trabajadores, ayudar a los pobres, 
el cuidado de los sufrimientos, los trabajadores y los corazones de la 
compañía más estrechas. </span><span>Hoy todo el mundo para plantar en casa, mañana la planta a todos orgullosos.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Creo
 que bajo la dirección correcta de las grandes empresas forestales, con 
el apoyo del gobierno local y la comunidad de colegas en todos los 
niveles, en los esfuerzos conjuntos de todo el personal, la innovación, 
el trabajo sólido, vamos a ser capaces de aprovechar las oportunidades, 
enfrentar los desafíos, crear </span><span>nuevos logros, crear mayor gloria! </span><span>Nuevo entorno, nuevo comienzo, un nuevo pensamiento, nueva altura, tiene un dicho: "La unión hace la fuerza." </span><span>Mientras
 trabajamos juntos, las dificultades pueden resolverse, por esta razón, 
queremos trabajar en la nueva empresa en nuestra carrera como un segundo
 momento de despegue, para afrontar nuevos retos! </span><span>Vemos
 que en los líderes de los distintos departamentos, bajo la dirección de
 la empresa, la planta entera está experimentando cambios importantes 
todos los días! </span><span>Tenemos
 la confianza para construir una gran suma "la satisfacción del cliente,
 la estabilidad del personal, un hermoso medio ambiente, el desarrollo 
sostenible," la empresa avanzada! </span><span>Creo ---- Omori será mejor mañana!<br />
</span><span>Gracias a todos!<br />
</span><span>Omori, gerente general de la empresa: Sin Vosotros Chong<br />
</span><span>08 de julio 2009</span><span></span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('118','rt','115','gran ventaja Sen','<span id="result_box" class=""><span>Ventajas de marca<br />
</span><span>Omori se ha establecido desde hace 12 años, una buena reputación en el mercado, la conciencia de marca es alta.<br />
</span><span>Equipo Advantage<br />
</span><span>Omori tiene un enérgico, trabajar duro, se atreven a luchar en equipo.<br />
</span><span>Ventaja Servicio<br />
</span><span>La excelencia, la integridad del mundo, servicios para el hogar, es la meta de la empresa Omori.<br />
</span><span>Ventaja regional<br />
</span><span>Taizhou región donde la compañía es una de la base de producción más 
importante de máquinas de coser, una cadena de suministro completa para 
productos de costura para reducir los costos.<br />
</span><span>Ventajas del producto<br />
</span><span>La compañía produce selva alta, la genisteína máquina de coser de la 
marca, con una fuerte investigación y desarrollo, la innovación, alta 
tecnología y alto valor de agregado de nuevos productos.<br />
</span><span>Ventajas técnicas<br />
</span><span>La compañía atribuye gran importancia al desarrollo de productos, Yi 
esta fecha, la compañía ha hecho una serie de productos chinos de 
patentes nacionales, productos verdes de alto valor añadido, tanto de 
energía eficiente, verde.<br />
</span><span>Ventajas de calidad<br />
</span><span>La empresa siempre ha atribuido importancia a la calidad del producto,
 el contenido del producto de una rigurosa inspección por la 
certificación ISO9001 / 2008.<br />
<br />
</span><span>Comercialización Advantage<br />
</span><span>Ha
 mejorado el sistema de ventas, poner en pleno juego el potencial de 
ventas del distribuidor, mejorar las ventas por vendedores capacidad de 
proteger los intereses fundamentales de los distribuidores, las ventas 
del distribuidor ampliaron los beneficios y el desarrollo común.</span><span></span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('119','eca','115','La cultura de la empresa','<span id="result_box" class=""> <span class="hps">Filosofía</span> <span class="hps">Core</span><span>:</span><br />
<span class="hps">La innovación</span><span>, la armonía y</span> <span class="hps">de ganar-ganar</span><br />
&nbsp;<br />
<span class="hps">Objetivos</span> <span class="hps">del negocio:</span><br />
<span class="hps">Marca</span> <span class="hps">de clase</span><span>,</span> <span class="hps">primera clase de gestión</span><span>,</span> <span class="hps">calidad de primera clase</span><span>,</span> <span class="hps">de primera clase reputación</span><span>,</span> <span class="hps">servicio de primera clase</span><br />
&nbsp;<br />
<span class="hps">Propósitos</span> <span class="hps">corporativos:</span><br />
<span class="hps">Servicio innovador</span> <span class="hps">y sincera</span><span class="">, satisfacción del cliente</span><span>,</span> <span class="hps">la</span> <span class="hps">búsqueda de la excelencia</span><br />
&nbsp;<br />
<span class="hps">El espíritu</span> <span class="hps">de la empresa:</span><br />
<span class="hps">Bellas</span><span>, sincero</span><span>, constante</span> <span class="hps">-----</span> <span class="hps">excelencia,</span> <span class="hps">gestión honesta</span><span>,</span> <span class="hps">constante progreso</span><br />
&nbsp;<br />
<span class="hps">El compromiso</span> <span class="hps">de las empresas:</span><br />
<span class="hps">La innovación científica</span> <span class="hps">y tecnológica</span><span class="">, la creación de</span> <span class="hps">valor para los clientes</span><span>,</span> <span class="hps">la creación de oportunidades</span> <span class="hps">para el personal</span><span>, la creación de</span> <span class="hps">beneficios</span> <span class="hps">para la comunidad</span><br />
&nbsp;<br />
<span class="hps">Estrategia Competitiva:</span><br />
<span class="hps">Crear</span> <span class="hps">una ventaja competitiva</span><span>, crear</span> <span class="hps">imagen de marca</span><span>, desarrollar</span> <span class="hps">los mejores productos,</span> <span class="hps">ofrecer el mejor servicio</span><br />
&nbsp;<br />
<span class="hps">Estrategia de</span> <span class="hps">Talento:</span><br />
<span class="hps">La formación</span> <span class="hps">orientada al rendimiento</span> <span class="hps">de personal calificado</span><br />
&nbsp;<br />
<span class="hps">Calidad:</span><br />
<span class="hps">(3G</span><span>)</span> <span class="hps">de productos de alta</span> <span class="hps">calidad,</span> <span class="hps">personal de alta calidad</span><span>,</span> <span class="hps">alta satisfacción del</span> <span class="hps">usuario, la</span> <span class="hps">calidad de hoy</span> <span class="hps">y el mercado</span> <span class="hps">de mañana</span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('120','rd','115','honor.','<span id="result_box" class=""><span class="hps">Información</span> <span class="hps">en la preparación de</span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('121','bo','115','La estructura de la organización','<p>
	<img src="/Uploads/image/page/20150717/20150717085943_88942.jpg" alt="" />
</p>
<p>
	<span id="result_box" class=""><span class="hps">El</span> <span class="hps">nuevo modelo de gestión</span> <span class="hps">requiere una gestión</span> <span class="hps">plana</span> <span class="hps">dentro de la empresa</span> <span class="hps">a mejorar</span> <span class="hps">el conocimiento</span> <span class="hps">general</span><span>,</span> <span class="hps">la conciencia global</span> <span class="hps">y el sentido</span> <span class="hps">de la colaboración</span><span class="">, el fortalecimiento de</span> <span class="hps">un juego de</span> <span class="hps">ajedrez</span> <span class="hps">pensamiento</span> <span class="hps">y trabajo en equipo</span><span>.</span><br />
&nbsp; <span class="hps">La toma de decisiones</span> <span class="hps">es la</span> <span class="hps">gestión de</span> <span class="hps">contenido básico</span><span>, en relación con</span> <span class="hps">la gestión</span> <span class="hps">del desempeño</span> <span class="hps">es</span> <span class="hps">principalmente responsabilidad de</span> <span class="hps">los administradores</span><span>.</span><br />
<br />
&nbsp; <span class="hps">Para</span> <span class="hps">adaptarse mejor a</span> <span class="hps">los</span> <span class="hps">clientes</span><span class="">, la competencia,</span> <span class="hps">los cambios en</span> <span class="hps">las características del</span> <span class="hps">entorno empresarial moderno</span><span class="">.</span></span>
</p>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('122','npo','115','gran huella Sen','<span id="result_box" class=""><span>2009
 fue un año extraordinario, bajo la influencia de la crisis financiera 
mundial, para superar las dificultades, la nueva base de producción a 
una conclusión exitosa. </span><span>La
 nueva base se encuentra en Taizhou Binhai Parque Industrial, la empresa
 cubre un área de más de 30.000 metros cuadrados, el nuevo entorno, 
nuevo comienzo, nuevo pensamiento, nueva altura, la empresa puede poner a
 trabajar en la nueva empresa como una carrera en el segundo despegue, 
con los tiempos </span><span>Jin, para cumplir con los nuevos retos! </span><span>Bajo el liderazgo de cada departamento, dirigido a toda la planta han sufrido cambios significativos todos los días! </span><span>Sistema de gestión de la empresa en un nivel, duplicar la producción, la calidad y la estabilidad.<br />
</span><span>Al
 mismo tiempo, el rostro de la crisis furiosa, Omori calma En primer 
lugar, la empresa Omori fortaleció su gestión interna, mala ambiente 
externo cuando las habilidades duras, ajustando activamente la 
estructura del producto, especial, nuevo, único sentido, bien, mejorar 
la competitividad del mercado </span><span>y la capacidad de resistir los riesgos. </span><span>Fortalecer
 la gestión interna, menores costos de producción, mantener la 
estabilidad de la fuerza de trabajo; y en segundo lugar, la empresa 
aumentó la innovación, a personalizado, modificado, de alto valor 
añadido, para desarrollar nuevos productos, producto ganó los márgenes 
de beneficios mayores. </span><span>En
 tercer lugar, confiando en el mercado interno, ampliar negocios en el 
extranjero, y participar activamente en doméstico exposición de equipos 
de costura, primero localizar y analizar el mercado de diferente 
posicionamiento en el mercado para la planificación de marketing. </span><span>En segundo lugar, los mercados de ultramar y el establecimiento de sistema de control de calidad y estándares de calidad.<br />
</span><span>CISMA
 ujier evento bienal, Omori preparando activamente y esperamos que la 
nueva imagen, para sorprender a nuestros clientes, y traer la confianza a
 los compañeros afectados por la crisis. </span><span>Con este fin, Omori expositores equipos, dotación de personal, invitar
 a los clientes, diseño y otros aspectos de la cabina para una gama 
completa de planificación.<br />
</span><span>En primer lugar, la compañía estableció "la innovación, la armonía y 
ganar-ganar" el tema de la exposición, y la exposición CISMA "Innovación
 para mejorar el" tema en plena forma:<br />
</span><span>En
 primer lugar, la "innovación" es mejorar la competitividad de la base 
de los medios más importantes de la innovación se refleja en la cultura 
de la empresa y el espíritu, si el espíritu no innovador, no lo haría en
 la tecnología, los productos, los mercados y la empresa de gestión de 
la empresa Omori </span><span>la innovación. </span><span>En
 segundo lugar, y en la nueva tecnología y desarrollo de productos, el 
desarrollo de las máquinas de coser industriales en general a 
mecatrónico máquina controlada por ordenador libre de aceite de costura,
 el sistema de control servo y máquinas especiales, y otros productos de
 alto valor añadido, y aumentar aún más la fabricación de una variedad 
de nuevos productos </span><span>y las ventas, para asegurar que los productos de la compañía en el 
campo de la maquinaria de la ropa de nivel avanzado y lograr camino 
estratégico de la compañía de los objetivos de desarrollo sostenible.<br />
</span><span>En
 segundo lugar, el "ganar-ganar armoniosa", las empresas de rápido 
crecimiento no puede prescindir de la armonía, ambiente interno y 
externo armonioso. </span><span>Compromiso
 corporativo de Omori a la innovación tecnológica, la creación de valor 
para los clientes, la creación de oportunidades para el personal, la 
creación de beneficios para la comunidad. </span><span>Junio
 es el día que nos mudamos, mientras tanto, el personal desafiando las
 altas temperaturas, temerosos de duro, pagó una gran cantidad de sudor y
 trabajo duro para hacer que nuestra reubicación se ha completado sin 
problemas. </span><span>Nuevo
 Ambiente de Nueva Esperanza, todo el mundo está lleno de entusiasmo y 
pasión, y con la reubicación de la empresa, que considera como un 
negocio familiar, la aparición de una gran cantidad de tocar la 
pantalla. </span><span>Muchos empleados se mudaron con su familia, muchos empleados menos sueño, sinceramente orgulloso y feliz! </span><span>Esto
 también demuestra que todos los empleados de apoyo al desarrollo de la 
empresa y el reconocimiento. "Para hacer negocios y como hombre, es 
necesario tener en cuenta su propia cuenta, sino también por el bien de 
los demás." Con los años, la compañía de Omori ganar-ganar mentalidad y 
los proveedores y los usuarios de la </span><span>hacer ejercicios de interés, un ala y la prosperidad común, una 
pérdida para ambas partes para mantener la integridad y el beneficio 
mutuo.<br />
</span><span>En
 tercer lugar, la innovación y la importancia modernización industrial 
es, en la actualidad, la industria de la máquina de coser, la baja 
productividad, el alto consumo de energía, productos de tecnología de 
bajo valor agregado, la homogeneización de la competencia de precios en 
serio en el mercado sólo puede luchar, luchar costos, luchar escala, 
este círculo vicioso </span><span>formación
 del bajo nivel actual de máquinas de coser industriales, el entorno del
 mercado de bajo costo, los beneficios empresariales baja, no hay dinero
 para invertir en la innovación científica y tecnológica, pero no hay 
innovación científica y tecnológica, sólo podemos mantener bajo costo, 
baja eficiencia. </span><span>Oleada tras oleada de guerras de precios, la competencia de bajo costo ha resultado inviable. </span><span>Por lo tanto, aumentar la inversión en investigación, y mejorar la 
concentración industrial, mejorar la eficiencia de la producción y 
reducir el consumo de energía, el desarrollo de alta tecnología, de alta
 de alta calidad nuevos productos de valor agregado, para lograr la 
modernización industrial, el camino fundamental para la industria de la 
máquina de coser.<br />
</span><span>El espectáculo, la compañía mostrará el nuevo extremo equipo de 
accionamiento directo de máquinas de coser JR9300D-2, el nuevo overedger
 JR998F, JR1903A deducción electrónica, electrónico viradas máquina 
JR1900ASS, trucos electrónicos JR210D.<br />
</span><span>Los
 productos que utilizan el sistema de accionamiento directo (sistema 
DD), el acortamiento de la línea de transmisión, empezando suave y 
sensible, que proporciona una forma rápida funciones de puesta en marcha
 y parada exactamente, buenos efectos de tela de arma blanca. </span><span>Mecanismo
 incorporado de bobinado, el usuario puede elegir de acuerdo a las 
diferentes necesidades del conjunto, lo que mejora la eficiencia en el 
trabajo, altura del alimentador, inclinación y fase se puede ajustar 
fácilmente. </span><span>La
 máquina es conveniente para los materiales de tamaño grueso como el 
algodón, lana, lino, fibra química y otras telas. Accionamiento directo,
 la fuerza de voluntad se puede transmitir sin pérdida en el cabezal. </span><span>En comparación con una transmisión por correa coches informáticos comunes, menor consumo de energía, el ahorro de casi el 50%.<br />
</span><span>Panel
 operativo del ordenador haciendo funcionar la cabeza a la clasificación
 de los colores, permite al operador captar fácilmente de un vistazo. </span><span>Velocidad de la máquina de coser, puede operar fácilmente a través del conjunto de discos y el cambio. </span><span>Por número de pin por defecto, sino que también ayudará precisamente a máquina. </span><span>Cuerpo enfoque de diseño en "el hombre - máquina de la ingeniería" principio. </span><span>Correa
 de distribución, la barra de aguja, toma de hilo, gancho rotatorio sin 
aceite y una serie de mejoras para hacer que el proceso de depuración 
tediosa se simplifica, el operador puede ajustar rápidamente, tanto 
esperan para satisfacer la demanda de gruesa costura material delgado y </span><span>mejorar la eficiencia en el trabajo.<br />
</span><span>2009
 Exposición CISMA de extraordinaria importancia, sino también porque se 
encuentra en el curso de la crisis financiera siguió intercambiando 
evento. </span><span>Crisis
 economía mundial en recesión, la demanda del consumidor se redujo 
significativamente, el Estado ha planteado cuatro veces la tasa de 
devolución de impuestos a la exportación, una parte considerable de los 
beneficios fiscales extranjeros se los llevaron, o muy poco fábrica de 
máquinas de coser de lucro. </span><span>Industria
 se enfrenta a una gran presión, principalmente en tres aspectos: la 
crisis financiera y, junto con razones de orden interno, las máquinas de
 coser precios de las materias primas, aumento de los costos de 
producción y operación, la apreciación del renminbi exprimidos 
enormemente la supervivencia de las empresas; coser industriales precios
 de los productos máquina cayeron fuertemente, la rentabilidad 
empresarial </span><span>bruscamente;
 mercado de máquinas de coser era débil y atrofia, las ventas de 
máquinas de coser y liquidación financiera se ha vuelto más difícil. </span><span>Un gran número de empresas que luchan por sobrevivir la adversidad.<br />
</span><span>La
 crisis financiera va a continuar, se estima será restaurado después de 
dos años, 2009 fue el período más difícil, creo que va a mejorar en el 
segundo semestre de 2010, no habrá pan y la leche estará allí, una vez 
más, nuestro país habrá entrado en un rápido </span><span>crecimiento. </span><span>A
 la larga, muy optimista para la industria de la máquina de coser, ropa,
 alimentación, vivienda, transporte, cinco cosas uno menos, ropa ocupó 
el primer lugar, no hay ropa de costura, por lo que se destina a la 
industria eterna. </span><span>Años
 de desarrollo desde el punto de vista de la industria, de la 
competencia en el mercado, la máquina de coser, el paquete de la máquina
 de coser es el más grande de modelos de producción y de ventas, muchas 
empresas manufactureras, la competencia es feroz. </span><span>En
 el mercado de máquina especial, la demanda para los pequeños, para 
mantener una alta rentabilidad productos de margen, por lo Omori 
comprometida con el desarrollo de nuevos productos con los productos de 
valor añadido de la especialidad altas para asegurar aún más el mercado. </span><span>En
 virtud de los esfuerzos conjuntos de todo el personal, la innovación, 
el trabajo sólido, vamos a ser capaces de aprovechar las oportunidades, 
enfrentar los desafíos y crear nuevos logros, crear mayor gloria! </span><span>Tenemos
 la confianza para construir una gran suma "la satisfacción del cliente,
 la estabilidad del personal, un hermoso medio ambiente, el desarrollo 
sostenible," las empresas avanzadas.</span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('123','npb','115','Empresas de un ángulo','<p>
	<span id="result_box" class="">&nbsp;&nbsp;&nbsp;&nbsp; <span class="hps">Omori</span> <span class="hps">tiene</span> <span class="hps">una producción profesional de</span> <span class="hps">la serie</span> <span class="hps">de equipos modernos</span> <span class="hps">de coser industrial</span><span>, la empresa</span> <span class="hps">es la gestión</span> <span class="hps">muy crucial</span> <span class="hps">científica y el desarrollo</span> <span class="hps">de nuevos productos,</span> <span class="hps">la fuerza técnica fuerte</span><span>,</span> <span class="hps">bien equipado</span><span>, tecnología avanzada,</span> <span class="hps">con</span> <span class="hps">estricto sistema</span> <span class="hps">de gestión de calidad</span> <span class="hps">y una mejor</span> <span class="hps">actitud hacia el trabajo</span><span>,</span> <span class="hps">la calidad del producto</span> <span class="hps">y la estabilidad.</span> <span class="hps">Siempre listo</span> <span class="hps">para ofrecerle</span> <span class="hps">un servicio excelente.</span></span>
</p>
<p>
	<img src="/Uploads/image/page/20150717/20150717085558_44617.jpg" alt="" /><img src="/Uploads/image/page/20150717/20150717085621_99178.jpg" alt="" /><img src="/Uploads/image/page/20150717/20150717085633_39525.jpg" alt="" /><img src="/Uploads/image/page/20150717/20150717085644_28704.jpg" alt="" /><img src="/Uploads/image/page/20150717/20150717085656_38602.jpg" alt="" /><img src="/Uploads/image/page/20150717/20150717085709_97300.jpg" alt="" /><br />
<span id="result_box" class=""></span>
</p>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('124','omp','115','La exposición a lo largo de los años','<P>　　DOSO Buena nacional y extranjera a gran escala de exposición profesional, como una interpretación maravillosa de la plataforma, y participar activamente en la profundidad de exposiciones nacionales e internacionales profesionales más para explorar el mercado mundial, acelerar la velocidad de convergencia con la ropa del mundo, la industria del vestido. Imagen unificada para mostrar delante de los clientes en todo el mundo, la mejor marca de la isla en profundidad los corazones de todos, para ganar la confianza de nuestros clientes, mejorar su popularidad y reputación.</P>
<P>　　-Anterior espectáculo CISMA-</P>
<P>　　2003CISMA 2003CISMA</P>
<P>　　2004CISMA 2004CISMA</P>
<P>　　2005CISMA 2005CISMA</P>
<P>　　2007CISMA 2007CISMA</P>
<P>　　2009CISMA 2009CISMA</P>
<P>　　2011CISMA 2011CISMA</P>
<P>　　- Otras exposiciones internacionales-</P>
<P>　　Exposición de Bengala exposiciones de Rusia</P>
<P>　　Leones de exposiciones Exposición Egipto</P>
<P>　　Exposición de Vietnam</P>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('125','kyk','115','Modelo de fábricas de prendas de vestir','<span id="result_box" class=""><span class="hps">Información</span> <span class="hps">en la preparación de</span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('126','aggtm','115','Omori video muestra','<span id="result_box" class=""><span class="hps">Información</span> <span class="hps">en la preparación de</span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('127','aggym','0','Los recursos humanos','<span id="result_box" class=""><span class="hps">Trabajos:</span> <span class="hps">Diseño</span> <span class="hps">gráfico, Marketing</span> <span class="hps">Publicado</span><span>:</span> <span class="hps">02/04/2012</span><br />
<span class="hps">Sexo:</span> <span class="hps">Cualquiera Edad:</span> <span class="hps">18 años</span><br />
<span class="hps">Número:</span> <span class="hps">2</span> <span class="hps">Educación:</span> <span class="hps">Título universitario</span><br />
<span class="hps">Experiencia laboral</span><span>: El tratamiento</span> <span class="hps">salarial</span> <span class="hps">más de 1 año</span><span>:</span> <span class="hps">Negociable</span><br />
<span class="hps">Requisitos: a</span> <span class="hps">la comercialización</span><span>,</span> <span class="hps">la promoción,</span> <span class="hps">la experiencia</span> <span class="hps">de gestión de marca</span><span>, buena</span> <span class="hps">salud</span><span class="">, pensamiento</span> <span class="hps">correcto</span><span class="">.</span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('128','aggjm','127','La contratación de personal','<span id="result_box" class=""><span class="hps">Trabajos:</span> <span class="hps">Diseño</span> <span class="hps">gráfico, Marketing</span> <span class="hps">Publicado</span><span>:</span> <span class="hps">02/04/2012</span><br />
<span class="hps">Sexo:</span> <span class="hps">Cualquiera Edad:</span> <span class="hps">18 años</span><br />
<span class="hps">Número:</span> <span class="hps">2</span> <span class="hps">Educación:</span> <span class="hps">Título universitario</span><br />
<span class="hps">Experiencia laboral</span><span>: El tratamiento</span> <span class="hps">salarial</span> <span class="hps">más de 1 año</span><span>:</span> <span class="hps">Negociable</span><br />
<span class="hps">Requisitos: a</span> <span class="hps">la comercialización</span><span>,</span> <span class="hps">la promoción,</span> <span class="hps">la experiencia</span> <span class="hps">de gestión de marca</span><span>, buena</span> <span class="hps">salud</span><span class="">, pensamiento</span> <span class="hps">correcto</span><span class="">.</span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('129','aggmh','127','Personal de atención','<p>
	<img src="/Uploads/image/page/20150717/20150717085022_41365.jpg" alt="" />
</p>
<p>
	<span id="result_box" class=""><span class="hps">Omori</span> <span class="hps">atención</span> <span class="hps">humanística</span><span>, la atención</span> <span class="hps">a enriquecer sus</span> <span class="hps">vidas</span><span>,</span> <span class="hps">para ayudar a</span> <span class="hps">los empleados a resolver</span> <span class="hps">de qué preocuparse,</span> <span class="hps">para que todos los</span> <span class="hps">empleados se sientan</span> <span class="hps">la calidez</span> <span class="hps">empresa.</span><br />
<span class="hps">Empresa defender</span> <span class="hps atn">el concepto de "</span><span>orientado a las personas</span><span>"</span> <span class="hps">para la implementación de</span> <span class="hps">personal de</span> <span class="hps">gestión de la diversidad</span><span>, el respeto</span> <span class="hps">del personal de aduanas</span> <span class="hps">local.</span><br />
<span class="hps">Las empresas</span> <span class="hps">promueven activamente</span> <span class="hps">la "vida</span> <span class="hps">sana</span><span>, feliz</span> <span class="hps">obra"</span> <span class="hps">concepto</span><span>,</span> <span class="hps">para promover la construcción</span> <span class="hps">de la cultura empresarial</span><span>,</span> <span class="hps">y mejorar su</span> <span class="hps">sentido de pertenencia,</span> <span class="hps">enriquecer la</span> <span class="hps">vida cultural de</span> <span class="hps">personal de</span> <span class="hps">aficionado,</span> <span class="hps">para satisfacer las</span> <span class="hps">necesidades de los empleados</span> <span class="hps">de niveles múltiples</span><span class="">.</span> <span class="hps">.</span></span>
</p>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('130','aghgm','127','La estrategia de recursos humanos','<span id="result_box" class=""><span class="hps">Estrategia de</span> <span class="hps">Talento:</span> <span class="hps">los incentivos</span> <span class="hps">a largo plazo</span><br />
<span class="hps">Se espera que</span> <span class="hps">los intereses</span> <span class="hps">rectores</span><span>,</span> <span class="hps">todos los aspectos</span> <span class="hps">de desarrollo</span><span>,</span> <span class="hps">los tres</span> <span class="hps">enlaces</span><span class="">,</span> <span class="hps">una</span> <span class="hps">cadena</span><span>, para lograr</span> <span class="hps">incentivos a largo plazo</span> <span class="hps">para los empleados</span><span>;</span> <span class="hps">Personal,</span> <span class="hps">posicionamiento</span> <span class="hps">correcto,</span> <span class="hps">su talento</span> <span class="hps">para crear valor</span><span>.</span><br />
<span class="hps">Optimizar</span> <span class="hps">la dotación de personal</span> <span class="hps">para asegurar que</span> <span class="hps">el uso humano</span><br />
<span class="hps">El primer paso en</span> <span class="hps">la construcción del</span> <span class="hps">mecanismo de incentivo</span><span>,</span> <span class="hps">es hacer</span> <span class="hps">una asignación</span> <span class="hps">eficaz de los recursos</span> <span class="hps">humanos,</span> <span class="hps">tanto como sea posible</span> <span class="hps">para garantizar que</span> <span class="hps">las personas adecuadas en</span> <span class="hps">las posiciones</span> <span class="hps">correctas para</span> <span class="hps">hacer lo correcto</span><span>.</span> <span class="hps">Sólo</span> <span class="hps">con la persona adecuada</span><span>, puede</span> <span class="hps">motivarlo</span> <span class="hps">de manera efectiva.</span><br />
<span class="hps">Fortalecer</span> <span class="hps">la gestión del rendimiento</span> <span class="hps">para asegurar que</span> <span class="hps">con buena gente</span><br />
<span class="hps">El llamado</span> <span class="hps atn">"</span><span>buen uso</span><span>"</span><span class="">, es decir,</span> <span class="hps">¿cómo pueden</span> <span class="hps">las</span> <span class="hps">personas con</span> <span class="hps">buena</span><span>, ¿cómo podemos</span> <span class="hps atn">lograr el "</span><span>mejor uso</span><span>"</span><span class="">,</span> <span class="hps">con el fin de</span> <span class="hps atn">lograr "</span><span>el mejor uso</span><span>"</span><span>,</span> <span class="hps">es</span> <span class="hps">sobre</span> <span class="hps">recursos humanos y materiales</span> <span class="hps">de la empresa para</span> <span class="hps">la integración</span> <span class="hps">más eficaz</span><span>,</span> <span class="hps">para crear el mejor</span> <span class="hps">desempeño de la empresa</span><span>.</span> <span class="hps">En la práctica</span><span>, a menudo</span> <span class="hps">a través de</span> <span class="hps">la gestión del rendimiento</span> <span class="hps">para lograr</span><span>.</span><br />
<span class="hps">Estrategia de compensación</span> <span class="hps">integral</span> <span class="hps">para lograr</span> <span class="hps">la guía de</span> <span class="hps">intereses</span><br />
<span class="hps">Usted tiene que pagar</span> <span class="hps">una indemnización justa y</span> <span class="hps">amplia</span> <span class="hps">respuesta de la demanda</span><span>,</span> <span class="hps">para seguir aplicando</span> <span class="hps">los</span> <span class="hps">incentivos a largo plazo</span><span>.</span> <span class="hps">Uno de los</span> <span class="hps">aspectos clave de</span> <span class="hps">la gestión del rendimiento</span> <span class="hps">es mejorar la</span> <span class="hps">capacidad de los empleados</span> <span class="hps">y contribuir al</span> <span class="hps">rendimiento,</span> <span class="hps">evaluación justa</span> <span class="hps">en curso.</span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('131','agwgm','127','La introducción de entrega','<span id="result_box" class=""><span class="hps">Información</span> <span class="hps">en la preparación de</span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('132','jhkus','0','El Centro de servicios','<img src="/Uploads/image/page/20150717/20150717084700_82218.jpg" alt="" /><br />','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('133','jhksus','132','Red de ventas global','<p>
	<img src="/Uploads/image/page/20150717/20150717084547_25661.jpg" alt="" />
</p>
<p>
	<img src="/Uploads/image/page/20150717/20150717084605_96770.jpg" alt="" />
</p>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('134','jhhkus','132','La red de ventas','<img src="/Uploads/image/page/20150717/20150717084004_48740.jpg" alt="" /><br />','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('135','uerwqs','132','La imagen de la empresa.','<span id="result_box" class="short_text"><span class="hps">Información</span> <span class="hps">en la preparación de</span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('136','jhkukus','132','Servicios de post - venta','<p>
	<img src="/Uploads/image/page/20150717/20150717083800_30560.jpg" alt="" />
</p>
<p>
	<div id="gt-src-c" class="g-unit">
		<div id="gt-src-p">
		</div>
	</div>
	<div id="gt-res-content" class="almost_half_cell">
		<div>
			<span id="result_box" class=""><span class="hps">Establecer y mejorar</span> <span class="hps">diversas normas y</span> <span class="hps">reglamentos y</span> <span class="hps">la aplicación de</span> <span class="hps">un buen trabajo</span><br />
<span class="hps">Construcción de</span> <span class="hps">captar</span> <span class="hps">los</span> <span class="hps">procesos de servicio</span> <span class="hps">para mejorar la</span> <span class="hps">calidad del servicio</span><br />
<span class="hps">Mejorar</span> <span class="hps">la gestión</span> <span class="hps">y la atención</span> <span class="hps">del medio ambiente</span> <span class="hps">en el lugar</span> <span class="hps">para detallar</span> <span class="hps">los diversos</span> <span class="hps">sectores de servicios</span><br />
<span class="hps">Centrarse en</span> <span class="hps">la cultura corporativa</span> <span class="hps">y la calidad de</span> <span class="hps">la formación del personal</span><br />
<span class="hps">Visitas de los clientes</span> <span class="hps">regulares</span><span class="">, construir</span> <span class="hps">perfiles de clientes</span><br />
<span class="hps">Configurar</span> <span class="hps">más puntos de venta</span><span>,</span> <span class="hps">y tratar de hacerlo</span> <span class="hps">bien</span></span>
		</div>
	</div>
</p>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('137','jhkwqus','132','Omori descarga de datos','<span id="result_box" class="short_text"><span class="hps">Información</span> <span class="hps">en la preparación de</span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('138','jhnjkus','132','Centro de vídeo','<span id="result_box" class="short_text"><span class="hps">Información</span> <span class="hps">en el acabado</span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('139','consd','0','en contacto con nosotros','<P>　　Zhejiang DOSO Sewing Machine Co., Ltd.</P>
<P>　　dirección：No.2229 Haifeng Rd.B.Dist.Binhai Industrial Zone</P>
<P>　　teléfono：0576-88027625</P>
<P>　　Envíe por fax：0576-88027656</P>
<P>　　sitio web：http://www.chinadoso.com</P>
<P>　　E-mail：info@chinadoso.com</P>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('140','cofnsd','139','Medios de contacto','<P>　　Zhejiang DOSO Sewing Machine Co., Ltd.</P>
<P>　　dirección：No.2229 Haifeng Rd.B.Dist.Binhai Industrial Zone</P>
<P>　　teléfono：0576-88027625</P>
<P>　　Envíe por fax：0576-88027656</P>
<P>　　sitio web：http://www.chinadoso.com</P>
<P>　　E-mail：info@chinadoso.com</P>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('141','cjonsd','139','La ubicación geográfica','资料整理中【地图】','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('142','conskd','139','Información en línea','<span id="result_box" class="short_text"><span class="hps">Información</span> <span class="hps">en el acabado</span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');
INSERT INTO `pa_page` VALUES ('143','conesd','139','La Declaración de la ley','<span id="result_box" class=""><span>Nada
 en este sitio web (incluyendo, pero no limitado a datos, texto, 
gráficos, imágenes, sonido o vídeo) pertenecen a los derechos de autor 
Omori máquina de coser (en lo sucesivo, la "Sociedad"). </span><span>Sin
 nuestro permiso previo y por escrito, ninguna unidad o individuo no 
podrán ser reproducidas en ninguna forma, reproducir, divulgar, 
publicar, reimprimir, revisar o mostrar el contenido de este sitio web. </span><span>Cualquier uso no autorizado de la conducta de este sitio web, que 
se basará en la "República Popular China Ley de Propiedad Intelectual" y
 otras leyes y reglamentos para implementar las personas o entidades 
relevantes que actúan responsabilidad oso ilegal.<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Este
 sitio es sólo para uso limitado de los propósitos informativos y no 
comerciales o personales, revisar y cambiar sin previo aviso. </span><span>Me
 relaciono con la precisión de cualquier contenido de esta página, la 
fiabilidad, los niveles de uso, los compradores pueden navegar por la 
magnitud de la pérdida o daño causado o integridad, mi compañía y 
filiales no aceptan ninguna responsabilidad, ni hacer ninguna expresan 
esta </span><span>o implícitas garantías, garantías, promesas o afirmado.<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Mi
 empresa a cualquier inicio de sesión, el uso, la referencia o visitar 
el contenido Web tales persona puede, directa o indirectamente, del oso o
 de cualquier propiedad, pérdida financiera o de otro tipo causados, no 
asume ninguna responsabilidad o la culpa, sino que además no será 
posible el procesamiento posterior de </span><span>cualquier reclamación, acciones o procedimientos legales.<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Términos de uso de este sitio web y la ley debe aplicarse la República Popular de China. </span><span>Cualquier controversia relativa a este sitio web y condiciones de 
uso de los tribunales de la sede de la empresa registrada en Hangzhou, 
la jurisdicción de China.<br />
&nbsp;&nbsp;&nbsp;&nbsp;</span><span>Siempre cambie este sitio y las exclusiones anteriores y derechos cláusulas reservados.</span></span>','1','Máquina de costura, máquina de costura grande de maderas','Máquina de costura - [DOSO] surtidor especializado del equipo de la maquinaria que arropa y de la maquinaria del textil','spain');


# 数据库表：pa_product 数据信息
INSERT INTO `pa_product` VALUES ('42','55','DS-5550 Grey 高速平缝机系列','0.00','DS-5550 ','70','DS-5550 Grey 高速平缝机系列','DS-5550 Grey 高速平缝机系列','1','','1436609188','1436609188',' 造型美观、性能优越、高速、高效。是国内最先进的机种之一。适用于服装、针织等行业的中厚料缝纫. ','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('40','55','DS-0302上下复合送料厚料平缝机系列','0.00','DS-0302','68','DS-0302上下复合送料厚料平缝机系列','DS-0302上下复合送料厚料平缝机系列','1','','1436609183','1436609183','<p> 本机采用连杆挑线、大旋棱勾线，自动润滑系统，配置上下送料机构和压脚交替提升机构，形成301线迹。缝厚能力强，层缝性能好，采用自动润滑装置，噪声低，使用寿命长，适用于皮革、人造革、帆布、坐垫、沙发、箱包制品。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-6202.jpg"> </p>','zh-cn','','17','0','0');
INSERT INTO `pa_product` VALUES ('41','55','DS-111QG高速不锈钢缝台平缝机','0.00','DS-111QG','69','DS-111QG高速不锈钢缝台平缝机','DS-111QG高速不锈钢缝台平缝机','1','','1436609186','1436609186','<p> 针对喷漆底板容易掉漆磨损的缺点，在底板上镶上不锈钢来代替喷漆，达到底板不磨损的目的。适用于各种薄料，中厚料服装加工。自动加油润滑，针距和反缝简洁，是一种性能杰出、经久耐用的平缝机。 </p> <img alt="" src="/upload/Image/1/6.jpg"> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-111QG.jpg"> </p>','zh-cn','','13','0','0');
INSERT INTO `pa_product` VALUES ('43','55','DS-5550高速平缝机','0.00','DS-5550','71','DS-5550高速平缝机','DS-5550高速平缝机','1','','1436609194','1436609194','<p>&nbsp;</p>','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('44','55','DS-6-28高速平缝机系列','0.00','DS-6-28','72','DS-6-28高速平缝机系列','DS-6-28高速平缝机系列','1','','1436609198','1436609198','<p>适用于缝制内衣、衬衫、运动服、大衣或类似服装，对缝料的适应广泛，缝纫质量高。</p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-5550Grey.jpg"></p>','zh-cn','','20','0','0');
INSERT INTO `pa_product` VALUES ('45','55','DS-6150QG高速不锈钢缝台平缝机','0.00','DS-6150QG','73','DS-6150QG高速不锈钢缝台平缝机','DS-6150QG高速不锈钢缝台平缝机','1','','1436609204','1436609204','<p> 针对喷漆底板容易掉漆磨损的缺点，在底板上镶上不锈钢来代替喷漆，达到底板不磨损的目的。适用于各种薄料，中厚料服装加工。自动加油润滑，针距和反缝简洁，是一种性能杰出、经久耐用的平缝机。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-111QG.jpg"> </p> ','zh-cn','','18','0','0');
INSERT INTO `pa_product` VALUES ('46','55','DS-6202高速厚料平缝机','0.00','DS-6202','74','DS-6202高速厚料平缝机','DS-6202高速厚料平缝机','1','','1436609208','1436609208',' 本机采用连杆挑线、大旋棱勾线，自动润滑系统，形成301线迹。缝厚能力强，层缝性能好，采用自动润滑装置，噪声低，使用寿命长，适用于皮革、人造革、帆布、坐垫、沙发、箱包制品。','zh-cn','','16','0','0');
INSERT INTO `pa_product` VALUES ('47','55','DS-8500高速平缝机系列','0.00','DS-8500','75','DS-8500高速平缝机系列','DS-8500高速平缝机系列','1','','1436609211','1436609211','<p> 适用于缝制各类薄料、中厚料服装。自动加油润滑、针距调节和反缝简捷，是一种性能杰出、经久耐用的平缝机。<img alt="" src="/upload/Image/chanpin/liebiao/DS-8700.jpg"> </p> ','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('48','55','DS-8600-J高速侧刀平缝机','0.00','DS-8600-J','76','DS-8600-J高速侧刀平缝机','DS-8600-J高速侧刀平缝机','1','','1436609216','1436609216','<p> 适用于缝制各类衬衫，西装或类似服装，特别是其衣领、前襟等部位。送料机构独特，使高速缝制时的倒顺送料针距能保持完全一致。侧切刀装置使缝纫和修刀工序一次完成，工作效率提高。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8600-J.jpg"> </p>','zh-cn','','13','0','0');
INSERT INTO `pa_product` VALUES ('49','55','DS-8700高速平缝机','0.00','DS-8700','77','DS-8700高速平缝机','DS-8700高速平缝机','1','','1436609219','1436609219','<p> 该机造型大方，线条流畅，结构成熟，性能可靠，高速高效，操作空间大。能缝制薄、中厚和厚的缝纫材料，线迹整齐、美观。合理的倒、顺送料机构确保缝薄时不起皱，缝厚时不断线。强注式润滑系统使该机在运转时缝纫性能稳定、噪声低。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8700.jpg"> </p>','zh-cn','','12','0','0');
INSERT INTO `pa_product` VALUES ('50','55','DS-8800珠边机','0.00','DS-8800','78','DS-8800珠边机','DS-8800珠边机','1','','1436609227','1436609227','<p> DS-8800直走纹珠边机，DS-68P横珠边机，DS-68ZX斜纹珠边机本机由钩针线形成单线链式仿手工缝滚边缝缝纫机，适用于各类中厚料服装等装饰性缝制，缝品的一面线迹呈点状，是各种服饰装饰缝纫的理想产品。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-6202.jpg"> </p>','zh-cn','','20','0','0');
INSERT INTO `pa_product` VALUES ('51','55','DS-8900高速平缝机系列','0.00','DS-8900','79','DS-8900高速平缝机系列','DS-8900高速平缝机系列','1','','1436609231','1436609231','<p> 该机造型大方，线条流畅，结构成熟，性能可靠，高速高效，操作空间大。能缝制薄、中厚和厚的缝纫材料，线迹整齐、美观。合理的倒、顺送料机构确保缝薄时不起皱，缝厚时不断线。强注式润滑系统使该机在运转时缝纫性能稳定、噪声低。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-5550Grey.jpg"> </p>','zh-cn','','20','0','0');
INSERT INTO `pa_product` VALUES ('52','56','DS-0058-3-高速双针链缝机系列（带后拖轮）','0.00','DS-0058-3','80','DS-0058-3-高速双针链缝机系列（带后拖轮）','DS-0058-3-高速双针链缝机系列（带后拖轮）','1','','1436616822','1436616822','<p> 本机能同时缝制出两行平行的双线链式线迹，适用于服装、内衣、床上用品及薄形包装和皮革制品的搭接、装缝。针间距有五种可供选择。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8600-J.jpg"> </p>','zh-cn','','17','0','0');
INSERT INTO `pa_product` VALUES ('53','56','DS-0058高速双针链缝机系列','0.00','DS-0058','81','DS-0058高速双针链缝机系列','DS-0058高速双针链缝机系列','1','','1436616825','1436616825','<p> 本机能同时缝制出两行平行的双线链式线迹，适用于服装、内衣、床上用品及薄形包装和皮革制品的搭接、装缝。针间距有五种可供选择。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8600-J.jpg"> </p>','zh-cn','','18','0','0');
INSERT INTO `pa_product` VALUES ('54','56','DS-8420高速双针平缝机','0.00','DS-8420','82','DS-8420高速双针平缝机','DS-8420高速双针平缝机','1','','1436616830','1436616830','<p> 本机采用双直针、立式自动加油旋梭勾线，滑杆挑线，构成二行双线锁式线迹。上下轴同步齿形带传动。采用针杆摆动与送料方式，旋钮式标盘节针距和杠杆式倒顺送料机构。在梭芯内的缝线回拉弹簧，保证底线与面线得到一致的缝纫效果。适用于缝制大衣、制服、牛仔裤、包袋、装饰缝等。 </p> <img alt="" src="/upload/Image/1/8.jpg"> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8450.jpg"> </p> ','zh-cn','','21','0','0');
INSERT INTO `pa_product` VALUES ('55','56','DS-8450高速双针平缝机','0.00','DS-8450','83','DS-8450高速双针平缝机','DS-8450高速双针平缝机','1','','1436616835','1436616835','<p> 该机应用范围较广，主要用于衬衫、制服、大衣、女式内衣、夹克、牛仔裤等的缝制。本机具有双针离合式针杆结构，使缝纫机拐角、锐角、直缝时准确方便，机杆与送布牙同步送料，可防止缝料滑移，线迹美观、整齐。 </p> <img alt="" src="/upload/Image/1/7.jpg"> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8450.jpg"> </p>','zh-cn','','24','0','0');
INSERT INTO `pa_product` VALUES ('56','57','DS-900T-4AT','0.00','DS-900T-4AT','84','DS-900T-4AT','DS-900T-4AT','1','','1436616916','1436616916','<p>&nbsp;</p>','zh-cn','','11','0','0');
INSERT INTO `pa_product` VALUES ('57','57','DS-900-4S','0.00','DS-900-4S','85','DS-900-4S','DS-900-4S','1','','1436616918','1436616918','<p>&nbsp;</p>','zh-cn','','10','0','0');
INSERT INTO `pa_product` VALUES ('58','57','DS-900-4BK','0.00','DS-900-4BK','144','DS-900-4BK','DS-900-4BK','1','','1436616920','1436617692','<p>&nbsp;</p>','zh-cn','','13','0','0');
INSERT INTO `pa_product` VALUES ('59','57','DS-900-4','0.00','DS-900-4','87','DS-900-4','DS-900-4','1','','1436616921','1436616921','   <p>&nbsp;</p>','zh-cn','','18','0','0');
INSERT INTO `pa_product` VALUES ('60','57','DS-5200-4AT','0.00','DS-5200-4AT','88','DS-5200-4AT','DS-5200-4AT','1','','1436616922','1436616922','   <p>&nbsp;</p> <p>  ','zh-cn','','16','0','0');
INSERT INTO `pa_product` VALUES ('61','57','DS-800-4超高速包缝机','0.00','DS-800-4','89','DS-800-4超高速包缝机','DS-800-4超高速包缝机','1','','1436616923','1436616923','   适用于各种薄料、中厚料织物的包边或包缝作业，采用自动润滑装置运转，畅顺自如。高速、低噪、启动力距小；外观漂亮、操作简易；线迹稳定、美观、理想且调整方便；适用于裤子、睡衣、衬衫、运动服等包缝作业。 ','zh-cn','','14','0','0');
INSERT INTO `pa_product` VALUES ('62','57','DS-900-4超高速包缝机','0.00','DS-900-4','90','DS-900-4超高速包缝机','DS-900-4超高速包缝机','1','','1436616926','1436616926','   <p> 本机广泛适用于服装、内衣、床上用品及薄形包装和皮革制品等各种面料的包缝作业，有多种线迹可供选择。可简单调节张力以便缝出良好的缝样，最高缝速8500转/分，实现高速缝纫，提高了生产效率。内置针杆防止漏油，同时零件采用耐磨设计，更耐磨，更持久，降低了维修率，更降低了成本。二重环弯针的前后量调整和上弯针的前后调整用调节器即可进行简单的调整，节省保养的所需时间。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-900-4.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Baofengji/">包缝机</a>,<a href="Baofengji/Baofengji-7.html">DS-900-4超高速包缝机</a>,<br> <br>  ','zh-cn','','12','0','0');
INSERT INTO `pa_product` VALUES ('63','57','DS-900-4AT/EUT-直驱超高速自动剪线包缝机','0.00','DS-900-4AT/EUT','510','DS-900-4AT/EUT-直驱超高速自动剪线包缝机','DS-900-4AT/EUT-直驱超高速自动剪线包缝机','1','','1436616927','1437334347','<p>
	是集精密机械与电子技术于一身的新一代产品，广泛适用于服装、内衣、床上用品及薄形包装和皮革制品等各种面料的包缝作业，有多种线迹可供选择。可简单调节张力以便缝出良好的缝样，最高缝速8000转/分，实现高速缝纫，提高了生产效率。内置针杆防止漏油，同时零件采用耐磨设计，更耐磨，更持久，降低了维修率，降低成本。二重环弯针的前后量调整和上弯针的前后调整用调节器即可进行简单的调整，节省保养的所需时间。
</p>
<p>
	<img alt="" src="/upload/Image/chanpin/liebiao/DS-900-4AT-EUT.jpg" /> 
</p>
<p>
	<br />
</p>
<p>
	<br />
<br />
上一个:<a href="Baofengji/Baofengji-7.html">DS-900-4超高速包缝机</a> 下一个:<a href="Baofengji/Baofengji-9.html">DS-MX5200-4-超高速包缝机</a>
</p>','zh-cn','','18','0','0');
INSERT INTO `pa_product` VALUES ('64','57','DS-MX5200-4-超高速包缝机','0.00','DS-MX5200-4','92','DS-MX5200-4-超高速包缝机','DS-MX5200-4-超高速包缝机','1','','1436616928','1436616928','   <p> 该机器在外形上设计采用国际流行的款式，结构上吸收国际先进水平的优点，性能优越，实用性强，缝纫平稳，操作性强并且维护简便，适用于各种薄料、中厚料、厚料织物的缝纫作业. </p>','zh-cn','','13','0','0');
INSERT INTO `pa_product` VALUES ('65','57','DS-700-3-17PK/SP口袋包缝机','0.00','DS-700-3-17PK/SP','111','DS-700-3-17PK/SP口袋包缝机','DS-700-3-17PK/SP口袋包缝机','1','','1436616930','1436617266','  
<img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg" /> 
	','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('66','57','DS-700-3超高速包缝机','0.00','DS-700-3','110','DS-700-3超高速包缝机','DS-700-3超高速包缝机','1','','1436616932','1436617248','  
<img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg" /> 
	  ','zh-cn','','16','0','0');
INSERT INTO `pa_product` VALUES ('67','57','DS-700-4-BK倒回缝包缝机','0.00','DS-700-4-BK','108','DS-700-4-BK倒回缝包缝机','DS-700-4-BK倒回缝包缝机','1','','1436616934','1436617226','  
<img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg" />		  ','zh-cn','','13','0','0');
INSERT INTO `pa_product` VALUES ('68','58','DS-800-4AT-EUT','0.00','DS-800-4AT-EUT','96','DS-800-4AT-EUT','DS-800-4AT-EUT','1','','1436616950','1436616950','   <p>&nbsp;</p> <p>  ','zh-cn','','14','0','0');
INSERT INTO `pa_product` VALUES ('69','58','DS-787-33AC','0.00','DS-787-33AC','97','DS-787-33AC','DS-787-33AC','1','','1436616953','1436616953','   <p>&nbsp;</p> <p>  ','zh-cn','','16','0','0');
INSERT INTO `pa_product` VALUES ('70','58','DS-787-01CB-EUT','0.00','DS-787-01CB-EUT','98','DS-787-01CB-EUT','DS-787-01CB-EUT','1','','1436616960','1436616960','   <p>&nbsp;</p> <p>','zh-cn','','18','0','0');
INSERT INTO `pa_product` VALUES ('71','58','DS-1500筒式绷缝机','0.00','DS-1500','99','DS-1500筒式绷缝机','DS-1500筒式绷缝机','1','','1436616973','1436616973','   <p> DS-1500筒式绷缝机系列备有极为丰富的各种专用机种，具有活动式底线供给机构，可随心所欲高低操作穿线，能适应各种针织品，运动服、休闲服等各种规格的装饰缝纫，如袖口下摆等，能充分满足高品质多样化的缝制要求。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1500.jpg"> </p>','zh-cn','','13','0','0');
INSERT INTO `pa_product` VALUES ('72','58','DS-500-01CB/AT/EUT-超高速自动剪线平台绷缝机','0.00','DS-500-01CB/AT/EUT','100','DS-500-01CB/AT/EUT-超高速自动剪线平台绷缝机','DS-500-01CB/AT/EUT-超高速自动剪线平台绷缝机','1','','1436616986','1436616986','   <p>高速平台绷缝机是为针织服装提供的缝制设备，主要适用于加工种针织内衣，并配备自动抬压脚，自动剪上下线。投资少，生产效率得到明显提高。只要将脚踏板向后踏，便可简单地操作电气式切线刀，把针线、弯针线、喂针线（上叉针线）快速地切断。</p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-500-01CB-AT-EUT.jpg"></p>','zh-cn','','14','0','0');
INSERT INTO `pa_product` VALUES ('73','58','DS-500-01CB/AT-超高速直驱平台绷缝机','0.00','DS-500-01CB/AT','101','DS-500-01CB/AT-超高速直驱平台绷缝机','DS-500-01CB/AT-超高速直驱平台绷缝机','1','','1436616988','1436616988','   该机采用内置直驱马达，具有良好的操控性及节能性，提高了产品加工效率，降低了运营成本。<br> <img alt="" src="/upload/Image/1/10.jpg"> ','zh-cn','','16','0','0');
INSERT INTO `pa_product` VALUES ('74','58','DS-500-01CB高速绷缝机','0.00','DS-500-01CB','102','DS-500-01CB高速绷缝机','DS-500-01CB高速绷缝机','1','','1436617063','1436617063','   <p> 本系列有极为丰富的各种专用机种，适应各种装饰缝。能满足高品质多样化的缝制要求。DS-500-01CB 一般车缝，采用针杆出的强制回油装置，有效地控制针杆的油量，消除漏油现象，上下硅油装置，防止机针发热及断线； </p>','zh-cn','','17','0','0');
INSERT INTO `pa_product` VALUES ('75','58','DS-500-02BB上滚条用绷缝机','0.00','DS-500-02BB','103','DS-500-02BB上滚条用绷缝机','DS-500-02BB上滚条用绷缝机','1','','1436617065','1436617065','   <p> 本机能安装滚条装置（龙头），适用于T恤衫、内衣裤等滚条作业。因龙头（卷具）的规格、尺寸繁多，故本机不含龙头。 </p> <p> <img alt="" src="/upload/Image/1/12.jpg"> </p> ','zh-cn','','14','0','0');
INSERT INTO `pa_product` VALUES ('76','58','DS-500-04CB四针六线绷缝机','0.00','DS-500-04CB','104','DS-500-04CB四针六线绷缝机','DS-500-04CB四针六线绷缝机','1','','1436617069','1436617069','   <p> 4针6线绷缝机用于未经包缝的两片布料的接缝或加固作业，如内衣裤等贴身衣物的裁片接缝处（如裤裆等） </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-500-01CB.jpg"> </p> ','zh-cn','','13','0','0');
INSERT INTO `pa_product` VALUES ('77','58','DS-500-05BB超高速花边绷缝机','0.00','DS-500-05BB','105','DS-500-05BB超高速花边绷缝机','DS-500-05BB超高速花边绷缝机','1','','1436617075','1436617075','   本机可用于环形裤腰松紧带的车缝。<br> <img alt="" src="/upload/Image/1/11.jpg"> ','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('78','58','DS-500-10SZ花样绷缝机','0.00','DS-500-10SZ','106','DS-500-10SZ花样绷缝机','DS-500-10SZ花样绷缝机','1','','1436617078','1436617078','   <p> 本机是在绷缝机基础上开发的最新的装饰缝机器。配备5种花盘，交换简易。可用于缝制时装、童装、内衣、运动服等各种各样的装饰缝，能满足高品质及多样化的缝制要求。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-500-01CB.jpg"> </p> ','zh-cn','','17','0','0');
INSERT INTO `pa_product` VALUES ('79','58','DS-600-01CB-AT-EUT-超高速自动剪线筒式绷缝机','0.00','DS-600-01CB-AT-EUT','107','DS-600-01CB-AT-EUT-超高速自动剪线筒式绷缝机','DS-600-01CB-AT-EUT-超高速自动剪线筒式绷缝机','1','','1436617084','1436617084','   <p>&nbsp;</p>','zh-cn','','14','0','0');
INSERT INTO `pa_product` VALUES ('80','57','DS-700-4超高速包缝机系列','0.00','DS-700-4','112','DS-700-4超高速包缝机系列','DS-700-4超高速包缝机系列','1','','1436617503','1436617503','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg">','zh-cn','','13','0','0');
INSERT INTO `pa_product` VALUES ('81','57','DS-700-4AT直驱超高速包缝机','0.00','DS-700-4AT','113','DS-700-4AT直驱超高速包缝机','DS-700-4AT直驱超高速包缝机','1','','1436617504','1436617504','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg">','zh-cn','','12','0','0');
INSERT INTO `pa_product` VALUES ('82','57','DS-700-5包缝机系列','0.00','DS-700-5','114','DS-700-5包缝机系列','DS-700-5包缝机系列','1','','1436617504','1436617504','   <p>&nbsp;</p> ','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('83','57','DS-737F超高速包缝机系列','0.00','DS-737F','115','DS-737F超高速包缝机系列','DS-737F超高速包缝机系列','1','','1436617505','1436617505','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> ','zh-cn','','19','0','0');
INSERT INTO `pa_product` VALUES ('84','57','DS-737FS超高速包缝机系列','0.00','DS-737FS','116','DS-737FS超高速包缝机系列','DS-737FS超高速包缝机系列','1','','1436617506','1436617506','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg">','zh-cn','','11','0','0');
INSERT INTO `pa_product` VALUES ('85','57','DS-747F-AT超高速直驱包缝机','0.00','DS-747F-AT','117','DS-747F-AT超高速直驱包缝机','DS-747F-AT超高速直驱包缝机','1','','1436617507','1436617507','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg">','zh-cn','','12','0','0');
INSERT INTO `pa_product` VALUES ('86','57','DS-747F-BK超高速倒回缝包缝机','0.00','DS-747F-BK','118','DS-747F-BK超高速倒回缝包缝机','DS-747F-BK超高速倒回缝包缝机','1','','1436617508','1436617508','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> ','zh-cn','','12','0','0');
INSERT INTO `pa_product` VALUES ('87','57','DS-747F-PK/SP超高速口袋包缝机','0.00','DS-747F-PK/SP','119','DS-747F-PK/SP超高速口袋包缝机','DS-747F-PK/SP超高速口袋包缝机','1','','1436617509','1436617509','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> ','zh-cn','','19','0','0');
INSERT INTO `pa_product` VALUES ('88','57','DS-747F超高速包缝机系列','0.00','DS-747F','120','DS-747F超高速包缝机系列','DS-747F超高速包缝机系列','1','','1436617510','1436617510','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> ','zh-cn','','14','0','0');
INSERT INTO `pa_product` VALUES ('89','59','DS-9816','0.00','DS-9816','121','DS-9816','DS-9816','1','','1436617524','1436617524','   <p>&nbsp;</p>','zh-cn','','12','0','0');
INSERT INTO `pa_product` VALUES ('90','59','DS-373AT','0.00','DS-373AT','122','DS-373AT','DS-373AT','1','','1436617525','1436617525','   <p>&nbsp;</p> ','zh-cn','','17','0','0');
INSERT INTO `pa_product` VALUES ('91','59','DS-1377-钉扣机','0.00','DS-1377','123','DS-1377-钉扣机','DS-1377-钉扣机','1','','1436617526','1436617526','   <p> 针脚数目可调为 8、16、32针，无需更换零件，方便简单；如需调整6、12、24针，则可通过更换齿轮和凸轮实现。用途：本机最大特点用于二孔或四孔平扣十字扣、按式扣及金属扣之缝钉。无需更换零件就能缝钉自如，适用于纺织布料、男、女衬衫、上衣外套及工作服等。 </p>','zh-cn','','14','0','0');
INSERT INTO `pa_product` VALUES ('92','59','DS-1790高速电子平头锁眼机','0.00','DS-1790','124','DS-1790高速电子平头锁眼机','DS-1790高速电子平头锁眼机','1','','1436617526','1436617526','   <p>&nbsp;</p>','zh-cn','','16','0','0');
INSERT INTO `pa_product` VALUES ('93','59','DS-1850高速套结机系列','0.00','DS-1850','125','DS-1850高速套结机系列','DS-1850高速套结机系列','1','','1436617527','1436617527','   <p>适用于西服、牛仔服等各类服装的受力部位加固缝制和圆头钮孔缝尾加固，及缝锁伞顶圆。</p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-1850.jpg"></p> ','zh-cn','','12','0','0');
INSERT INTO `pa_product` VALUES ('94','59','DS-1900ASS电脑控制高速套结机系列','0.00','DS-1900ASS','126','DS-1900ASS电脑控制高速套结机系列','DS-1900ASS电脑控制高速套结机系列','1','','1436617528','1436617528','   <p> 实现了最高缝速3000rpm，并且能快速终止缝制，脉冲马达，自动抬压脚机构，能更容易确认落针点。直驱式机头，创造出低振动、低噪声的舒适工作环境。采用世界顶级的进口芯片，全数字化精确数控技术，使机器性能更优越。 </p> <p> <img alt="" src="/upload/image/1/15.jpg"> </p>','zh-cn','','14','0','0');
INSERT INTO `pa_product` VALUES ('95','59','DS-1903A高速电子钉扣机','0.00','DS-1903A','127','DS-1903A高速电子钉扣机','DS-1903A高速电子钉扣机','1','','1436617529','1436617529','   <p> 实现了最高缝制速度：2700rpm。通过高速的性能，能快速启动和终止缝制，新装备了脉冲马达式自动抬压脚机构，可以切换从1段行程到2段行程，大幅度缩短了扣<br> 的循环时间。 </p> <img alt="" src="/upload/image/1/16.jpg"> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1903A.jpg"> </p>','zh-cn','','12','0','0');
INSERT INTO `pa_product` VALUES ('96','59','DS-210D电子花样机','0.00','DS-210D','128','DS-210D电子花样机','DS-210D电子花样机','1','','1436617530','1436617530','   <p>通过采用划时代的 X-Y送布机构，实现了高精度的花样缝制，高速缝制，加上快速的空送布速度，切线速度，缩短了缝制循环时间，直接驱动确保了反应的迅速，降低了振动和噪声，是箱包、服装行业用于加固缝、装饰缝的高效专用设备。</p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-210D.jpg"></p>','zh-cn','','128','0','0');
INSERT INTO `pa_product` VALUES ('97','59','DS-2516电子花样机','0.00','DS-2516','129','DS-2516电子花样机','DS-2516电子花样机','1','','1436617530','1436617530','   <p> 率先使用触摸式液晶显示屏，附设图像及中文指示，操作简易，改良后的底板由20mm提升至25mm，压脚亦改良到18mm，方便缝制更厚物料。配备顶级的伺服系统，并附有支援功能，若使用错误或出现故障，解决方法会自动出现于操作荧光屏上，使用者可对症下药。 </p> <img alt="" src="/upload/Image/1/14.jpg"> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2516.jpg"> </p><p> &nbsp; </p>','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('98','59','DS-373钉扣机','0.00','DS-373','145','DS-373钉扣机','DS-373钉扣机','1','','1436617531','1436617701','  
				<p>
					该机主要用于二孔或四孔的平钮扣缝钉，若加附具，也可缝钉带柄及其它钮扣，适用于轻薄、中厚面料的钉扣。
				</p>
				<p>
					<img alt="" src="/upload/image/1/16.jpg" /> 
				</p>
								<img alt="" src="/upload/Image/chanpin/liebiao/DS-373.jpg" /> ','zh-cn','','14','0','0');
INSERT INTO `pa_product` VALUES ('99','59','DS-781平头锁眼机系列','0.00','DS-781','131','DS-781平头锁眼机系列','DS-781平头锁眼机系列','1','','1436617533','1436617533','   <p>适用于各类针织、棉纺、化纤等织物的纽孔缝锁，薄料、中厚料皆宜。</p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-781.jpg"></p> ','zh-cn','','28','0','0');
INSERT INTO `pa_product` VALUES ('100','59','DS-808大白钉扣机','0.00','DS-808','132','DS-808大白钉扣机','DS-808大白钉扣机','1','','1436617534','1436617534','   本机适用于各类服装，针织成衣，羽绒服，牛仔类服装，鞋帽和皮革，塑料、帆布制品上装钉各种金属四合扣，工艺扣，牛仔服扣和铆钉、弹簧、鞋铆钉等。对于各种不同钮扣和不同厚度的衣料、包料、只要调整模具并稍加调节行程，就能获得您要求的装订质量标准。','zh-cn','','12','0','0');
INSERT INTO `pa_product` VALUES ('101','60','DS-1201多功能电脑帽绣绣花机系列','0.00','DS-1201','133','DS-1201多功能电脑帽绣绣花机系列','DS-1201多功能电脑帽绣绣花机系列','1','','1436617546','1436617546','   圆筒型CT MODEL同家用轻型机相比，该系列机型结构稳重，性能稳定，可灵活配合生产编排，适合小单量生产，也可作打样机。成衣绣框GARMENT FRAME可根据T恤，或其它成衣上的不同刺绣要求，提供各式各样的框架。帽框CAP FRAME在帽子上刺绣的角度可达到270度。平绣框 FLAT EMBROIDERY FRAME适用于平绣，可绣作布片等半成品。A：集中勾线B：直线导轨C：剪刀外剪系统 ','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('102','60','DS-1204','0.00','DS-1204','134','DS-1204','DS-1204','1','','1436617547','1436617547','   <p>&nbsp;</p>','zh-cn','','12','0','0');
INSERT INTO `pa_product` VALUES ('103','60','DS-1208','0.00','DS-1208','135','DS-1208','DS-1208','1','','1436617549','1436617549','   <p>&nbsp;</p>','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('104','60','DS-1212加金子','0.00','DS-1212','136','DS-1212加金子','DS-1212加金子','1','','1436617550','1436617550','   <p>&nbsp;</p>','zh-cn','','17','0','0');
INSERT INTO `pa_product` VALUES ('105','58','DS-600-01CB-AT-超高速自动剪线筒式绷缝机','0.00','DS-600-01CB-AT','137','DS-600-01CB-AT-超高速自动剪线筒式绷缝机','DS-600-01CB-AT-超高速自动剪线筒式绷缝机','1','','1436617608','1436617608','   <p> 本系列有各种专用的机种，以适应各种装饰缝。能满足高品质多样化的缝制要求。 </p>','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('106','58','DS-600-01CB/RP后拖轮绷缝机','0.00','DS-600-01CB/RP','138','DS-600-01CB/RP后拖轮绷缝机','DS-600-01CB/RP后拖轮绷缝机','1','','1436617610','1436617610','   <p> 本机增加后拖轮辅助送料装置，可轻松缝制一些难输送的面料，并且针距大。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-RP.jpg"> </p>','zh-cn','','16','0','0');
INSERT INTO `pa_product` VALUES ('107','58','DS-600-02BB上滚条用绷缝机','0.00','DS-600-02BB','139','DS-600-02BB上滚条用绷缝机','DS-600-02BB上滚条用绷缝机','1','','1436617611','1436617611','   <p> 本机能安装滚条装置（龙头），适用于T恤衫、内衣裤等滚条作业，因龙头（卷具）的规格，尺寸繁多，故本机不含龙头。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-AT.jpg"> </p>','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('108','58','DS-600-05GB环形罗纹裤腰松紧带绷缝机','0.00','DS-600-05GB','140','DS-600-05GB环形罗纹裤腰松紧带绷缝机','DS-600-05GB环形罗纹裤腰松紧带绷缝机','1','','1436617612','1436617612','   <p> 本机可用于环形裤腰松紧带的车缝。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-AT.jpg"> </p>','zh-cn','','14','0','0');
INSERT INTO `pa_product` VALUES ('109','58','DS-600-35AC超高速筒式绷缝机','0.00','DS-600-35AC','141','DS-600-35AC超高速筒式绷缝机','DS-600-35AC超高速筒式绷缝机','1','','1436617613','1436617613','   <p> 带左切刀的布料修边机器和自动吸风装置，能使布料边没有参差不齐的毛边，因而获得美观的缝纫效果。适用于T恤衫、圆领衫等薄衣料、中厚衣料的圆筒物折缝工序。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-RP.jpg"> </p>','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('110','58','DS-62G-01MR-D-AT-AW曲臂式四针六线拼缝机','0.00','DS-62G-01MR-D-AT-AW','142','DS-62G-01MR-D-AT-AW曲臂式四针六线拼缝机','DS-62G-01MR-D-AT-AW曲臂式四针六线拼缝机','1','','1436617614','1436617614','   该机为针织缝制作业之必备机型，四针六线奉献于您独有的高弹性、平坦且高强度的拼缝效果，筒型机座及大和独创的步履式压脚，在拼缝高弹性面料及椴部过缝处时更轻松，根据面料及用途的不同有各种规格的压脚针位组零件对应单切式双切式、还有配备连成一体的小型伺服马达，追求高缝制品质和简单操作性的新锐机型。 ','zh-cn','','11','0','0');
INSERT INTO `pa_product` VALUES ('111','58','DS-720-356T细横筒型三针绷缝机','0.00','DS-720-356T','143','DS-720-356T细横筒型三针绷缝机','DS-720-356T细横筒型三针绷缝机','1','','1436617614','1436617614','   电磁直驱式抬压脚组不產生噪音，反应灵敏。牛角式布诱导器使埋压拷克骨更為稳定。简易可调式折边缝诱导器，轻易切换折边缝功能。采用“密封式”侧盖，解决侧盖漏油的问题。另特殊短横筒设计，自筒边到压脚边缘之距离仅35mm，使操作更为顺畅。采用圆周182mm的细筒型设计，车缝小口径的圆筒型针织物，更加便利。底线分线盘外置於机体前侧，可轻易清除绞线、调整容易。可微调的底线过线架，可针对底线的收放与松紧，做更精细的调整。摇杆式差动距调整机构，提供您充分的差动进给量。摇杆式针距调整机构,可轻松方便的调整针距。全片式前盖，省去组装，调整时的麻烦。','zh-cn','','13','0','0');
INSERT INTO `pa_product` VALUES ('112','59','DS-9820直驱电脑圆头锁眼机','0.00','DS-9820','146','DS-9820直驱电脑圆头锁眼机','DS-9820直驱电脑圆头锁眼机','1','','1436617775','1436617775','   提高了伺服控制的送布装置，可缝制出高精度的图案，高速缝纫或缝制厚度时，不会产生电子缝纫机常有的失调偏位。通过彻底检查产生的噪音的机械装置，实现在缝制速度更快噪声更小。 ','zh-cn','','54','0','0');
INSERT INTO `pa_product` VALUES ('113','61','DS-008VC多针机','0.00','DS-008VC','147','DS-008VC多针机','DS-008VC多针机','1','','1436617819','1436617819','   <p> 完全自动给油，勾针纵向运动机构，筒型车台，利于圆筒型衣物之缝纫。适用于高级衣物之装饰车缝，有4针、6针、8针、12针、13针等不同针位的机型，一机多针，缝制方便，可配卷边器，一次性加工成形，是现代休闲服的最佳设备。 </p> <img alt="" src="/upload/image/1/18.jpg"> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-008VC.jpg"> </p> ','zh-cn','','16','0','0');
INSERT INTO `pa_product` VALUES ('114','61','DS-1302双针平台型双重缝外曲牙机','0.00','DS-1302','148','DS-1302双针平台型双重缝外曲牙机','DS-1302双针平台型双重缝外曲牙机','1','','1436617820','1436617820','   <p> DS-1302系列机型有四种齿轮，针位能缝2点，3点，4点，5点外曲牙。外曲牙、花形外曲牙，另加新型的松叶状花形，最适合女装、童装、手帕、桌布等有附加件的装饰缝。 </p> <img alt="" src="/upload/image/1/19.jpg"> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1302.jpg"> </p>','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('115','61','DS-1433PSM三十三针勾针纵向双重环缝链式打缆缝纫机','0.00','DS-1433PSM','149','DS-1433PSM三十三针勾针纵向双重环缝链式打缆缝纫机','DS-1433PSM三十三针勾针纵向双重环缝链式打缆缝纫机','1','','1436617822','1436617822','   <p> 适用薄针织品、乔其纱、中厚料以及坚固呢等缝料的装饰缝纫，可平缝、抽褶、打缆等，上下线使用普通线；如下线使用特定的橡筋线就可以对薄料做弹力抽褶打缆。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2000C.jpg"> </p>','zh-cn','','12','0','0');
INSERT INTO `pa_product` VALUES ('116','61','DS-1508P平台型弯针横向双重环缝式裤腰缝纫机','0.00','DS-1508P','150','DS-1508P平台型弯针横向双重环缝式裤腰缝纫机','DS-1508P平台型弯针横向双重环缝式裤腰缝纫机','1','','1436617823','1436617823','   <p> 适用于从中厚料到厚料，牛仔的卷边缝、上腰、上松紧等车缝。独自开发的后拖轮能保证高速运转时送布均衡，线迹美观。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2000C.jpg"> </p>','zh-cn','','16','0','0');
INSERT INTO `pa_product` VALUES ('117','61','DS-2000C双针平台型弯针横向双重环缝带刀裤耳机','0.00','DS-2000C','151','DS-2000C双针平台型弯针横向双重环缝带刀裤耳机','DS-2000C双针平台型弯针横向双重环缝带刀裤耳机','1','','1436617824','1436617824','<p> 双针带前割刀，缝裤耳用。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2000C.jpg"> </p>','zh-cn','','20','0','0');
INSERT INTO `pa_product` VALUES ('118','62','5800','0.00','5800','152','5800','5800','1','','1436617839','1436617839','<p>&nbsp;</p>','zh-cn','','14','0','0');
INSERT INTO `pa_product` VALUES ('119','62','700','0.00','700','153','700','700','1','','1436617841','1436617841','<p>&nbsp;</p> ','zh-cn','','18','0','0');
INSERT INTO `pa_product` VALUES ('120','62','747','0.00','747','154','747','747','1','','1436617844','1436617844','   <p>&nbsp;</p>','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('121','62','800','0.00','800','155','800','800','1','','1436617851','1436617851','   <p>&nbsp;</p>','zh-cn','','14','0','0');
INSERT INTO `pa_product` VALUES ('122','62','988','0.00','988','156','988','988','1','','1436617853','1436617853','   <p>&nbsp;</p>','zh-cn','','17','0','0');
INSERT INTO `pa_product` VALUES ('123','62','DS-28','0.00','DS-28','157','DS-28','DS-28','1','','1436617857','1436617857','   全面的适配能力。所有的平缝（单针、双针、厚料）。包缝-绷缝-暗缝（直驱、下挂均可）。低噪声，低振动，节能高达75% ','zh-cn','','16','0','0');
INSERT INTO `pa_product` VALUES ('124','62','MX6125','0.00','MX6125','158','MX6125','MX6125','1','','1436617859','1436617859','   <p>&nbsp;</p> ','zh-cn','','20','0','0');
INSERT INTO `pa_product` VALUES ('125','63','DS-20U23D电脑曲折平缝机','0.00','DS-20U23D','159','DS-20U23D电脑曲折平缝机','DS-20U23D电脑曲折平缝机','1','','1436617879','1436617879','   <p> 由于机针摆动受程序控制，可灵活地对应多达100种的人字缝线迹。控制系统设计完美、结构紧凑、功能完善、可自由编程、直接输入、操作简单，提高了操作性能和作业效率。采用容易操作的多功能制面板，在高速时也能完成精确的缝制。 </p> <img alt="" src="/upload/image/1/20.jpg"> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-20U23D.jpg"> </p>','zh-cn','','19','0','0');
INSERT INTO `pa_product` VALUES ('126','63','DS-20U43曲折缝纫机系列','0.00','DS-20U43','160','DS-20U43曲折缝纫机系列','DS-20U43曲折缝纫机系列','1','','1436617884','1436617884','   <p> 可在薄、中、厚料上做直缝、曲缝、绣花、拼缝、套结缝、包边缝、拉链缝、包梗缝、花纹缝等。阵位可左、右、中调节，能形成绚丽多彩的装饰图案。内藏式绕线器，反向送料机构。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-20U43.jpg"> </p>','zh-cn','','22','0','0');
INSERT INTO `pa_product` VALUES ('127','63','DS-2284','0.00','DS-2284','161','DS-2284','DS-2284','1','','1436617887','1436617887','   机采用新型旋转挑线杆，即便是在极低的张力下也能得到高品质且稳定的线迹。采用了梭轴配合补偿机构，旋梭在勾线时的左右位置均等，可防止跳线以及断线。对于有伸缩性的布料、装备了微量的抬压脚装置就会使压脚轻轻浮起，然后进行缝纫，缝出线迹整齐美观。特别设计的绕线器，使用更快更方便。 ','zh-cn','','21','0','0');
INSERT INTO `pa_product` VALUES ('128','64','DS927链式曲碗机','0.00','DS927','162','DS927链式曲碗机','DS927链式曲碗机','1','','1436617896','1436617896','   <p> 用于衬衫、风衣、牛仔裤、休闲装等薄料、中厚料服装的加工，其臂筒形的特殊结构特别适合袖、裤等筒形部位的搭接缝纫。 </p> <img alt="" src="/upload/image/1/21.jpg"> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-927-928.jpg"> </p>','zh-cn','','24','0','0');
INSERT INTO `pa_product` VALUES ('129','69','DS-1380/1290/1680/1390-双头激光切割机','0.00','DS-1380/1290/1680/1390','167','DS-1380/1290/1680/1390-双头激光切割机','DS-1380/1290/1680/1390-双头激光切割机','1','','1436617957','1436617957','   <p> 手机按键、塑胶透光按键、电子元器件、集成电路（IC）、电工电器、通讯产品、卫浴洁具、工具配件、刀具、眼睛钟表、珠宝首饰、汽车配件、箱包饰扣、炊具、不锈钢制品等行业。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1380.jpg"> </p> ','zh-cn','','15','0','0');
INSERT INTO `pa_product` VALUES ('130','69','DS-9060/8060/1080/1060-激光雕刻机/切割机','0.00','DS-9060/8060/1080/1060','168','DS-9060/8060/1080/1060-激光雕刻机/切割机','DS-9060/8060/1080/1060-激光雕刻机/切割机','1','','1436617961','1436617961','   <p> 手机按键、塑胶透光按键、电子元器件、集成电路（IC）、电工电器、通讯产品、卫浴洁具、工具配件、刀具、眼睛钟表、珠宝首饰、汽车配件、箱包饰扣、炊具、不锈钢制品等行业。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-9060.jpg"> </p>','zh-cn','','18','0','0');
INSERT INTO `pa_product` VALUES ('131','70','DS-310 吊瓶熨斗','0.00','DS-310','169','DS-310 吊瓶熨斗','DS-310 吊瓶熨斗','1','','1436617969','1436617969','   <p>&nbsp;</p> <p>','zh-cn','','14','0','0');
INSERT INTO `pa_product` VALUES ('132','70','DS-520 吊瓶熨斗','0.00','DS-520 ','170','DS-520 吊瓶熨斗','DS-520 吊瓶熨斗','1','','1436617971','1436617971','   <p>&nbsp;</p> <p>','zh-cn','','19','0','0');
INSERT INTO `pa_product` VALUES ('133','70','DS-6PC-1 全蒸汽熨斗','0.00','DS-6PC-1 ','171','DS-6PC-1 全蒸汽熨斗','DS-6PC-1 全蒸汽熨斗','1','','1436617976','1436617976','   <p>&nbsp;</p> <p> ','zh-cn','','14','0','0');
INSERT INTO `pa_product` VALUES ('134','70','DS-94A-吊瓶熨斗','0.00','DS-94A','172','DS-94A-吊瓶熨斗','DS-94A-吊瓶熨斗','1','','1436617978','1436617978','   <p>&nbsp;</p> <p>  ','zh-cn','','16','0','0');
INSERT INTO `pa_product` VALUES ('135','70','铁氟龙熨头靴','0.00','','173','铁氟龙熨头靴','铁氟龙熨头靴','1','','1436617981','1436617981','   <p>&nbsp;</p> <p> ','zh-cn','','18','0','0');
INSERT INTO `pa_product` VALUES ('136','71','DS-RC-100-110自动磨刀裁剪机系列','0.00','DS-RC-100-110','174','DS-RC-100-110自动磨刀裁剪机系列','DS-RC-100-110自动磨刀裁剪机系列','1','','1436617993','1436617993','   <p>&nbsp;</p> <p> ','zh-cn','','19','0','0');
INSERT INTO `pa_product` VALUES ('137','71','DS-CZD-3-103自动磨刀裁剪机系列','0.00','DS-CZD-3-103','175','DS-CZD-3-103自动磨刀裁剪机系列','DS-CZD-3-103自动磨刀裁剪机系列','1','','1436617994','1436617994','   <p>&nbsp;</p> <p>','zh-cn','','16','0','0');
INSERT INTO `pa_product` VALUES ('138','71','DS-CZD-3/103 RC-100/110自动磨刀裁剪机系列','0.00','DS-CZD-3/103 RC-100/110','176','DS-CZD-3/103 RC-100/110自动磨刀裁剪机系列','DS-CZD-3/103 RC-100/110自动磨刀裁剪机系列','1','','1436617995','1436617995','   <p> 本机可与美国伊士曼电剪627X型互通用，适用于棉、毛、麻、丝绸、化纤、皮革等厚料裁剪。具有集中润滑，切口平直，且能作小曲率半径曲线裁剪，低噪声，运转平稳，操作方便，高效率，自动磨刀，采用大功率电动机等特点，是服装行业最理想的裁剪工具。 </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-28.jpg"> </p>','zh-cn','','20','0','0');
INSERT INTO `pa_product` VALUES ('139','71','DS-911全自动切布条机','0.00','DS-911','177','DS-911全自动切布条机','DS-911全自动切布条机','1','','1436617996','1436617996','   <p>&nbsp;</p>','zh-cn','','18','0','0');
INSERT INTO `pa_product` VALUES ('140','71','DS-888断布机','0.00','DS-888','178','DS-888断布机','DS-888断布机','1','','1436618000','1436618000','   DS-888手机断布机适宜单人操作，机头凭弹力器回弹，导轨配有四个进口微型轴承，是棉布、麻布、丝绸、风衣布、雨伞布、塑胶布、尼龙、帆布等理想的裁断必备设备。','zh-cn','','22','0','0');
INSERT INTO `pa_product` VALUES ('141','72','DS-10S-分线机','0.00','DS-10S','179','DS-10S-分线机','DS-10S-分线机','1','','1436618008','1436618008','   本分线机装置了新型线卷夹头；<br> 装置了时间控制器，可简单调整绕线量；<br> 体积小、重量轻、搬运简单方便；<br> 采用微动装置，绕线设定简单方便；<br> 速度高，卷线快。','zh-cn','','28','0','0');
INSERT INTO `pa_product` VALUES ('142','72','DS-20S-40C-分线机','0.00','DS-20S-40C','180','DS-20S-40C-分线机','DS-20S-40C-分线机','1','','1436618008','1436618008','   <p>&nbsp;</p>','zh-cn','','29','0','0');
INSERT INTO `pa_product` VALUES ('164','96','DS-0303D-5','0.00','100','206','DS-0303D-5','DS-0303D-5','1','','1436622978','1436622978','   <p>&nbsp;</p>','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('163','96','DS-6202D-3','0.00','100','205','DS-6202D-3','DS-6202D-3','1','','1436622976','1436622976','   <p>&nbsp;</p>','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('162','96','DS-7200D-3','0.00','100','204','DS-7200D-3','DS-7200D-3','1','','1436622973','1436622973','   <p>&nbsp;</p> ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('161','96','DS-9600QGD-3','0.00','100','203','DS-9600QGD-3','DS-9600QGD-3','1','','1436622970','1436622970','   <p>&nbsp;</p>','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('160','96','DS-9610QGD-3','0.00','100','202','DS-9610QGD-3','DS-9610QGD-3','1','','1436622968','1436622968','   <p>&nbsp;</p>','en-us','','3','0','0');
INSERT INTO `pa_product` VALUES ('158','96','DS-9630D-3','0.00','100','200','DS-9630D-3','DS-9630D-3','1','','1436622964','1436622964','   <p>&nbsp;</p>','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('159','96','DS-9620QGD-3','0.00','100','201','DS-9620QGD-3','DS-9620QGD-3','1','','1436622967','1436622967','   <p>&nbsp;</p> ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('157','74','DS-9861','0.00','100','198','DS-9861','DS-9861','1','','1436622760','1436622760','   <p> <span style="line-height:normal;font-family:微软雅黑;white-space:normal;font-size:14px;">前所未有的降低了工人的技术要求，任何一个工人不用经过任何培训即可操作机器，并生产出合格的产品。有效的提高生产效率，一键式操作，操作工人只要按一下启动按钮机器会自动运行，工人就可以准备其他的模板了，更由于加入自动模板识别系统，可同时加工颜色一样的多块不同的模板，又有上下点号笔为下一道生产工序进行加工准备，使效率提高到极致。很大程度提升了产品品质，由于使用程序化加工，可以保证所有产品针距和缝纫走向等做到标准一致，并可轻松的实现特殊要求，如对于衣物的转角处加密缝制，或对有的部位进行双刀缝制等，只需在编制程序时加入就可一步到位，对于特殊工艺要求的产品更是得心应手。</span> </p> <p> <img alt="" src="/upload/image/20140414/20140414161899169916.jpg"> </p> <p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;液晶显示触摸屏 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;模板识别装置 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;X向无限缝制 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;自动画笔 &nbsp;&nbsp; </p> <p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;在各缝制行业的广泛应用 </p> <p> <img alt="" src="/upload/image/20140414/20140414162220572057.jpg"> </p> <p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DS-9861模板（缝制长度不受限制) </p> <p> <img alt="" src="/upload/image/20140414/20140414162368426842.jpg"> </p>','zh-cn','','47','0','0');
INSERT INTO `pa_product` VALUES ('165','96','DS-6202QGD-3 High Speed Heavy Duty Lockstitch Sewing Machine','0.00','100','207','DS-6202QGD-3 High Speed Heavy Duty Lockstitch Sewing Machine','DS-6202QGD-3 High Speed Heavy Duty Lockstitch Sewing Machine','1','','1436622980','1436622980','   <p>&nbsp;</p> ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('166','96','DS-0303D-5 Direct drive top and bottom feed synchronous machine with automatic thread-cutting','0.00','100','208','DS-0303D-5 Direct drive top and bottom feed synchronous machine with automatic thread-cutting','DS-0303D-5 Direct drive top and bottom feed synchronous machine with automatic thread-cutting','1','','1436622982','1436622982','   The machine is flat-bed type machine. It adopts link take-up and rotating hook to form 301 stitches, and can sew very heavy material with neat and beautiful stitches. Low noise, easy maintenance and minimum difference in stitch length between forward and reverse feed. It is equipped with top &amp; bottom feeding mechanism, and walking foot, suitable for sewing all kinds of garments, pillow, sofa, cases and bags.<br> ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('167','96','DS-9600QGD-3N Direct drive computerised lockstitch sewing machine','0.00','100','209','DS-9600QGD-3N Direct drive computerised lockstitch sewing machine','DS-9600QGD-3N Direct drive computerised lockstitch sewing machine','1','','1436622989','1436622989','   This model adopts direct drive system; shorten the distance of transportation, with smooth start and quick reaction, provided with the function of quick start and accurate stop, to get excellent sewing effect. With inside bobbin mechanism, users could set the different requirements of sewing craftsmanship on the control panel; it greatly improves the working efficiency. The height, inclination and phase of feed-dog are adjustable. This machine is suitable for sewing general fabrics, such as cotton, woolens, linen and chemical fiber, etc.<br> <p>&nbsp;</p>','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('168','96','DS-9610QGD-3 Direct drive computerised lockstitch sewing machine','0.00','100','210','DS-9610QGD-3 Direct drive computerised lockstitch sewing machine','DS-9610QGD-3 Direct drive computerised lockstitch sewing machine','1','','1436622992','1436622992','   It is provided with automatic thread trimmer, automatic needle positioning, automatic stitch amount setter, automatic thread wiper and many other sewing modes. It is available to sew shirts, uniforms and sportswear, and also available to sew portfolio, purses, shoes, jeans and other medium-heavy materials, especially suitable for sewing trademarks, pocket, sleeve-cuffs, it can be operated with high quality and high efficiency. The brand-new inbuilt direct drive servo motor is the most optimized design, it is a special design, low vibration, low noise; its performance excel national industry standard, the main parts was imported parts to prolong the service life. <br> <p>&nbsp;</p> <p>  <a href="diannaopingfeng/">Computerised lockstitch sewing machine</a>,<a href="diannaopingfeng/diannaopingfeng-3.html">DS-9610QGD-3 Direct drive computerised lockstitch sewing machine</a>,<br> <br> 上一个:<a href="diannaopingfeng/diannaopingfeng-2.html">DS-9600QGD-3N Direct drive computerised lockstitch sewing machine</a> 下一个:<a href="diannaopingfeng/diannaopingfeng-4.html">DS-9900QGD-3 Computerised lockstitch sewing machine with long arm</a></p>  ','en-us','','2','0','0');
INSERT INTO `pa_product` VALUES ('169','96','DS-5550 High Speed Lockstitch Sewing Machine','0.00','100','211','DS-5550 High Speed Lockstitch Sewing Machine','DS-5550 High Speed Lockstitch Sewing Machine','1','','1436622995','1436622995','   <p>&nbsp;</p> <p>  <a href="diannaopingfeng/">Computerised lockstitch sewing machine</a>,<a href="diannaopingfeng/diannaopingfeng-4.html">DS-5550 High Speed Lockstitch Sewing Machine</a>,<br> <br> 上一个:<a href="diannaopingfeng/diannaopingfeng-5.html">DS-9910QGD-3 computerised lockstitch sewing machine with long arm</a> 下一个:none</p>  ','en-us','','4','0','0');
INSERT INTO `pa_product` VALUES ('170','97','DS-0302 Heavy Duty Top And Bottom Feed Lockstitch Sewing Machine','0.00','100','212','DS-0302 Heavy Duty Top And Bottom Feed Lockstitch Sewing Machine','DS-0302 Heavy Duty Top And Bottom Feed Lockstitch Sewing Machine','1','','1436623030','1436623030','   <p>The machine is flat-bed type machine. It adopts link take-up and rotating hook to form 301 stitches, and can sew very heavy material with neat and beautiful stitches. Low noise, easy maintenance and minimum difference in stitch length between forward and reverse feed. It is equipped with top &amp; bottom feeding mechanism, and walking foot, suitable for sewing all kinds of garments, pillow, sofa, cases and bags.</p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-6202.jpg"><br> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">Lockstitch sewing machine</a>,<a href="Pingfengji/Pingfengji-1.html">DS-0302 Heavy Duty Top And Bottom Feed Lockstitch Sewing Machine</a>,<br> <br> 上一个:none 下一个:<a href="Pingfengji/Pingfengji-2.html">DS-111QG High Speed Lockstitch Sewing Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('171','97','DS-111QG High Speed Lockstitch Sewing Machine','0.00','100','213','DS-111QG High Speed Lockstitch Sewing Machine','DS-111QG High Speed Lockstitch Sewing Machine','1','','1436623035','1436623035','   <p>Applicable to sew the thin and moderate thickness cotton, woolens, chemical fiber fabrics and light-weighted leather goods, well designed, customized with perfect performance, the machine operates smoothly with low noise, endurability, nice appearance, and its automatic lubricating system and oil volume valve never make the cloth dirty. Satisfying the international standards, the machine can also use the general spare parts and accessories, which are convenient for users to purchase. It is an ideal sewing machine for manufacturers of garments, caps and shoes.</p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-111QG.jpg"></p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">Lockstitch sewing machine</a>,<a href="Pingfengji/Pingfengji-2.html">DS-111QG High Speed Lockstitch Sewing Machine</a>,<br> <br> 上一个:<a href="Pingfengji/Pingfengji-1.html">DS-0302 Heavy Duty Top And Bottom Feed Lockstitch Sewing Machine</a> 下一个:<a href="Pingfengji/Pingfengji-3.html">DS-5550 Grey High Speed Lockstitch Sewing Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('172','97','DS-5550 Grey High Speed Lockstitch Sewing Machine','0.00','100','214','DS-5550 Grey High Speed Lockstitch Sewing Machine','DS-5550 Grey High Speed Lockstitch Sewing Machine','1','','1436623041','1436623041','   A new generation model designed for a quiet and smooth performance, the machine delivers improved seam quality, reliability and beautiful seam, and the operation area is wider. This machine is characterized by heavy-duty operation through its auto-lubrication system. The proper normal and reverse feeding mechanism makes the sewing on thin material without crinkle and on thick material without breaking thread during high speed sewing.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8700.jpg"> <p>&nbsp;</p> <p>  <a href="Pingfengji/">Lockstitch sewing machine</a>,<a href="Pingfengji/Pingfengji-3.html">DS-5550 Grey High Speed Lockstitch Sewing Machine</a>,<br> <br> 上一个:<a href="Pingfengji/Pingfengji-2.html">DS-111QG High Speed Lockstitch Sewing Machine</a> 下一个:<a href="Pingfengji/Pingfengji-5.html">DS-6-28 High Speed Lockstitch Sewing Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('173','97','DS-6-28 High Speed Lockstitch Sewing Machine','0.00','100','215','DS-6-28 High Speed Lockstitch Sewing Machine','DS-6-28 High Speed Lockstitch Sewing Machine','1','','1436623044','1436623044','   It adapts to the wide range of sewing materials with excellent sewing quality, such as underwear, shirts, sportswear, overcoat and other similar garments.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-5550Grey.jpg"> <p>&nbsp;</p> <p>  <a href="Pingfengji/">Lockstitch sewing machine</a>,<a href="Pingfengji/Pingfengji-5.html">DS-6-28 High Speed Lockstitch Sewing Machine</a>,<br> <br> 上一个:<a href="Pingfengji/Pingfengji-3.html">DS-5550 Grey High Speed Lockstitch Sewing Machine</a> 下一个:<a href="Pingfengji/Pingfengji-6.html">DS-6150QG High Speed Lockstitch Sewing Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('174','97','DS-6150QG High Speed Lockstitch Sewing Machine','0.00','100','216','DS-6150QG High Speed Lockstitch Sewing Machine','DS-6150QG High Speed Lockstitch Sewing Machine','1','','1436623049','1436623049','   Applicable to sew the thin and moderate thickness cotton, woolens, chemical fiber fabrics and light-weighted leather goods, well designed, customized with perfect performance, the machine operates smoothly with low noise, endurability, nice appearance, and its automatic lubricating system and oil volume valve never make the cloth dirty. Satisfying the international standards, the machine can also use the general spare parts and accessories, which are convenient for users to purchase. It is an ideal sewing machine for manufacturers of garments, caps and shoes.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-111QG.jpg"> <p>&nbsp;</p> <p>  <a href="Pingfengji/">Lockstitch sewing machine</a>,<a href="Pingfengji/Pingfengji-6.html">DS-6150QG High Speed Lockstitch Sewing Machine</a>,<br> <br> 上一个:<a href="Pingfengji/Pingfengji-5.html">DS-6-28 High Speed Lockstitch Sewing Machine</a> 下一个:<a href="Pingfengji/Pingfengji-7.html">DS-6202 High Speed Heavy Duty Lockstitch Sewing Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('175','97','DS-6202 High Speed Heavy Duty Lockstitch Sewing Machine','0.00','100','217','DS-6202 High Speed Heavy Duty Lockstitch Sewing Machine','DS-6202 High Speed Heavy Duty Lockstitch Sewing Machine','1','','1436623052','1436623052','   <p>This machine is adopting link take-up, and big rotating hook to form the 301 stitch, and can sew very heavy materials with neat and beautiful stitches. Automatic lubrication device, low noise, long service life. It is applicable to sew leather, canvas, cushions, sofa and bags.&nbsp; </p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-6202.jpg"><br> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">Lockstitch sewing machine</a>,<a href="Pingfengji/Pingfengji-7.html">DS-6202 High Speed Heavy Duty Lockstitch Sewing Machine</a>,<br> <br> 上一个:<a href="Pingfengji/Pingfengji-6.html">DS-6150QG High Speed Lockstitch Sewing Machine</a> 下一个:<a href="Pingfengji/Pingfengji-8.html">DS-8500 High Speed Lockstitch Sewing Machine</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('176','97','DS-8500 High Speed Lockstitch Sewing Machine','0.00','100','218','DS-8500 High Speed Lockstitch Sewing Machine','DS-8500 High Speed Lockstitch Sewing Machine','1','','1436623055','1436623055','   <p>This machine is applicable for sewing all kinds garments, light, medium and heavy weight materials. With auto-lubrication system, simple needle gauge adjusting and reverse feeding. It is an excellent and endurable sewing machine. </p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-8700.jpg"><br> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">Lockstitch sewing machine</a>,<a href="Pingfengji/Pingfengji-8.html">DS-8500 High Speed Lockstitch Sewing Machine</a>,<br> <br> 上一个:<a href="Pingfengji/Pingfengji-7.html">DS-6202 High Speed Heavy Duty Lockstitch Sewing Machine</a> 下一个:<a href="Pingfengji/Pingfengji-9.html">DS-8600-J High Speed Lockstitch Sewing Machine With Side Cutter</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('177','97','DS-8600-J High Speed Lockstitch Sewing Machine With Side Cutter','0.00','100','219','DS-8600-J High Speed Lockstitch Sewing Machine With Side Cutter','DS-8600-J High Speed Lockstitch Sewing Machine With Side Cutter','1','','1436623058','1436623058','   This machine is available to sew all kinds of shirts, suits and similar garments, especially to sew the collar, and front part of clothes. The unique feeding mechanism can keep the stitch length same for forward feeding and reverse feeding during high speed sewing. The side cutter can complete the process of sewing and edge trimming at are time. It shows the high efficiency of work。<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8600-J.jpg"> <p>&nbsp;</p> <p>  <a href="Pingfengji/">Lockstitch sewing machine</a>,<a href="Pingfengji/Pingfengji-9.html">DS-8600-J High Speed Lockstitch Sewing Machine With Side Cutter</a>,<br> <br> 上一个:<a href="Pingfengji/Pingfengji-8.html">DS-8500 High Speed Lockstitch Sewing Machine</a> 下一个:<a href="Pingfengji/Pingfengji-10.html">DS-8700 High Speed Lockstitch Sewing Machine</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('178','97','DS-8700 High Speed Lockstitch Sewing Machine','0.00','100','220','DS-8700 High Speed Lockstitch Sewing Machine','DS-8700 High Speed Lockstitch Sewing Machine','1','','1436623061','1436623061','   A new generation model designed for a quiet and smooth performance, the machine delivers improved seam quality, reliability and beautiful seam, and the operation area is wider. This machine is characterized by heavy-duty operation through its auto-lubrication system. The proper normal and reverse feeding mechanism makes the sewing on thin material without crinkle and on thick material without breaking thread during high speed sewing.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8700.jpg"> <p>&nbsp;</p> <p>  <a href="Pingfengji/">Lockstitch sewing machine</a>,<a href="Pingfengji/Pingfengji-10.html">DS-8700 High Speed Lockstitch Sewing Machine</a>,<br> <br> 上一个:<a href="Pingfengji/Pingfengji-9.html">DS-8600-J High Speed Lockstitch Sewing Machine With Side Cutter</a> 下一个:<a href="Pingfengji/Pingfengji-11.html">DS-8800 Handstitch Sewing Machine</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('179','97','DS-8800 Handstitch Sewing Machine','0.00','100','221','DS-8800 Handstitch Sewing Machine','DS-8800 Handstitch Sewing Machine','1','','1436623064','1436623064','   DS-8800 straight handstitch from left to right, DS-68P parallel handstitch, DS-68ZX bevel handstitch machine. This machine mainly applies to decorative sewing of high quality western style clotheds, and widely applies for lapping seam with decorative stitches on clothes for both men and women overcoat, leather coat etc.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-6202.jpg"> <p>&nbsp;</p> <p>  <a href="Pingfengji/">Lockstitch sewing machine</a>,<a href="Pingfengji/Pingfengji-11.html">DS-8800 Handstitch Sewing Machine</a>,<br> <br> 上一个:<a href="Pingfengji/Pingfengji-10.html">DS-8700 High Speed Lockstitch Sewing Machine</a> 下一个:<a href="Pingfengji/Pingfengji-12.html">DS-8900 High Speed Lockstitch Sewing Machine</a></p>  ','en-us','','2','0','0');
INSERT INTO `pa_product` VALUES ('180','97','DS-8900 High Speed Lockstitch Sewing Machine','0.00','100','222','DS-8900 High Speed Lockstitch Sewing Machine','DS-8900 High Speed Lockstitch Sewing Machine','1','','1436623067','1436623067','   A new generation model designed for a quiet and smooth performance, the machine delivers improved seam quality, reliability and beautiful seam, and the operation area is wider. This machine is characterized by heavy-duty operation through its auto-lubrication system. The proper normal and reverse feeding mechanism makes the sewing on thin material without crinkle and on thick material without breaking thread during high speed sewing.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-5550Grey.jpg"> <p>&nbsp;</p> <p>  <a href="Pingfengji/">Lockstitch sewing machine</a>,<a href="Pingfengji/Pingfengji-12.html">DS-8900 High Speed Lockstitch Sewing Machine</a>,<br> <br> 上一个:<a href="Pingfengji/Pingfengji-11.html">DS-8800 Handstitch Sewing Machine</a> 下一个:none</p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('181','98','DS-0058-3 High speed double needle chain stitch machine','0.00','100','223','DS-0058-3 High speed double needle chain stitch machine','DS-0058-3 High speed double needle chain stitch machine','1','','1436623087','1436623087','   This machine can obtain 2 parallel lines of double chain stitch seams simultaneously. It is suitable for lap seaming and adorns seaming on garments, underwear, bedding, thin package and leather goods. There are five specifications of needle gauge for your option. <br> <p>&nbsp;</p> <p>  <a href="shuangzhenji/">Double needle sewing machine</a>,<a href="shuangzhenji/shuangzhenji-1.html">DS-0058-3 High speed double needle chain stitch machine</a>,<br> <br> 上一个:none 下一个:<a href="shuangzhenji/shuangzhenji-2.html">DS-0058 High speed double needle chain stitch machine</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('182','98','DS-0058 High speed double needle chain stitch machine','0.00','100','224','DS-0058 High speed double needle chain stitch machine','DS-0058 High speed double needle chain stitch machine','1','','1436623089','1436623089','   This machine can obtain 2 parallel lines of double chain stitch seams simultaneously. It is suitable for lap seaming and adorns seaming on garments, underwear, bedding, thin package and leather goods. There are five specifications of needle gauge for your option. <br> <p>&nbsp;</p> <p>  <a href="shuangzhenji/">Double needle sewing machine</a>,<a href="shuangzhenji/shuangzhenji-2.html">DS-0058 High speed double needle chain stitch machine</a>,<br> <br> 上一个:<a href="shuangzhenji/shuangzhenji-1.html">DS-0058-3 High speed double needle chain stitch machine</a> 下一个:<a href="shuangzhenji/shuangzhenji-3.html">DS-8420 High speed double needle lockstitch machine</a></p>  ','en-us','','3','0','0');
INSERT INTO `pa_product` VALUES ('183','98','DS-8420 High speed double needle lockstitch machine','0.00','100','225','DS-8420 High speed double needle lockstitch machine','DS-8420 High speed double needle lockstitch machine','1','','1436623092','1436623092','   The machine adopts two straight needles，vertical-axis rotating hook with self-lubricating Feature For catching thread loops and sliding cam take up to produce two lines of double Lockstitch. It is provided with synchronous tooth Belt for driving , knob-type stitch regulator and Lever type reverses feeding mechanism. The thread pulls back spring in the bobbin Case and guarantees the harmony between surface thread and bottom thread.<br> <p>&nbsp;</p> <p>  <a href="shuangzhenji/">Double needle sewing machine</a>,<a href="shuangzhenji/shuangzhenji-3.html">DS-8420 High speed double needle lockstitch machine</a>,<br> <br> 上一个:<a href="shuangzhenji/shuangzhenji-2.html">DS-0058 High speed double needle chain stitch machine</a> 下一个:<a href="shuangzhenji/shuangzhenji-4.html">DS-8450 High speed double needle lockstitch machine</a></p>  ','en-us','','3','0','0');
INSERT INTO `pa_product` VALUES ('184','98','DS-8450 High speed double needle lockstitch machine','0.00','100','226','DS-8450 High speed double needle lockstitch machine','DS-8450 High speed double needle lockstitch machine','1','','1436623099','1436623099','   The machine has structure of two-needle split needle bar it's very convenient to make straight stitch, corner seam as well. Feeding in phase needle bar and feed dog is helpful for wonder and nice stitch. Against any glide of materials. Suitable for lady underwears，jeans ,overcoat etc，including decoration and corner seam.<br> <p>&nbsp;</p> <p>  <a href="shuangzhenji/">Double needle sewing machine</a>,<a href="shuangzhenji/shuangzhenji-4.html">DS-8450 High speed double needle lockstitch machine</a>,<br> <br> 上一个:<a href="shuangzhenji/shuangzhenji-3.html">DS-8420 High speed double needle lockstitch machine</a> 下一个:none</p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('185','99','DS-900T-4AT','0.00','100','227','DS-900T-4AT','DS-900T-4AT','1','','1436623114','1436623114','   <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-21.html">DS-900T-4AT</a>,<br> <br> 上一个:none 下一个:<a href="Baofengji/Baofengji-20.html">DS-900-4S</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('186','99','DS-900-4S','0.00','100','228','DS-900-4S','DS-900-4S','1','','1436623118','1436623118','   <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-20.html">DS-900-4S</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-21.html">DS-900T-4AT</a> 下一个:<a href="Baofengji/Baofengji-19.html">DS-900-4BK</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('187','99','DS-900-4BK','0.00','100','229','DS-900-4BK','DS-900-4BK','1','','1436623122','1436623122','   <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-19.html">DS-900-4BK</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-20.html">DS-900-4S</a> 下一个:<a href="Baofengji/Baofengji-18.html">DS-900-4.jpg</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('188','99','DS-900-4.jpg','0.00','100','230','DS-900-4.jpg','DS-900-4.jpg','1','','1436623127','1436623127','   <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-18.html">DS-900-4.jpg</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-19.html">DS-900-4BK</a> 下一个:<a href="Baofengji/Baofengji-17.html">DS-5200-4AT</a></p>  ','en-us','','2','0','0');
INSERT INTO `pa_product` VALUES ('189','99','DS-5200-4AT','0.00','100','231','DS-5200-4AT','DS-5200-4AT','1','','1436623131','1436623131','   <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-17.html">DS-5200-4AT</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-18.html">DS-900-4.jpg</a> 下一个:<a href="Baofengji/Baofengji-13.html">DS-800-4-Super High-Speed Overlock Sewing Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('190','99','DS-800-4-Super High-Speed Overlock Sewing Machine','0.00','100','232','DS-800-4-Super High-Speed Overlock Sewing Machine','DS-800-4-Super High-Speed Overlock Sewing Machine','1','','1436623139','1436623139','   <p>Applicable to the over edging operation of thin, moderate and thick fabrics. Due to its auto-lubrication device, the machine operates perfectly and smoothly.<br> Functions: high speed, low noise, small start torque; nice appearance, easy operation. It can sew elegant and stable ideal stitch and easy to adjust. It is applicable to sew trousers, pajamas, shirts and sportswear.</p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-800-4.jpg"></p> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-13.html">DS-800-4-Super High-Speed Overlock Sewing Machine</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-17.html">DS-5200-4AT</a> 下一个:<a href="Baofengji/Baofengji-14.html">DS-900-4 Super High-Speed Overlock Sewing Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('191','99','DS-900-4 Super High-Speed Overlock Sewing Machine','0.00','100','233','DS-900-4 Super High-Speed Overlock Sewing Machine','DS-900-4 Super High-Speed Overlock Sewing Machine','1','','1436623147','1436623147','   <p>This new generation overlock is a combination of precision machinery and electronic technology. It is widely used for the joint seaming and decoration seaming on various materials, such as general garments, underwear, bedclothes, thin package and leather products, there are many different stitches for your selection. The thread tension is easy to adjust to achieve better sewing quality. The highest speed is up to 8500rpm, it greatly enhance the production efficiency. The needle bar is inbuilt to prevent oil leakage, meanwhile, the components are specially designed for anti-friction, more wearable and enduring, save the maintenance, save your cost.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-900-4.jpg"></p> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-14.html">DS-900-4 Super High-Speed Overlock Sewing Machine</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-13.html">DS-800-4-Super High-Speed Overlock Sewing Machine</a> 下一个:<a href="Baofengji/Baofengji-15.html">DS-900-4AT/EUT-Direct-Drive Automatic Thread-Cutting High Speed Overlock Sewing Machine</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('192','99','DS-900-4AT/EUT-Direct-Drive Automatic Thread-Cutting High Speed Overlock Sewing Machine','0.00','100','234','DS-900-4AT/EUT-Direct-Drive Automatic Thread-Cutting High Speed Overlock Sewing Machine','DS-900-4AT/EUT-Direct-Drive Automatic Thread-Cutting High Speed Overlock Sewing Machine','1','','1436623150','1436623150','   <p>This new generation overlock is a combination of precision machinery and electronic technology. It is widely used for the joint seaming and decoration seaming on various materials, such as general garments, underwear, bedclothes, thin package and leather products, there are many different stitches for your selection. The thread tension is easy to adjust to achieve better sewing quality. The highest speed is up to 8000rpm, it greatly enhances the production efficiency. The needle bar inbuilt is to prevent oil leakage, meanwhile, the components are specially designed for anti-friction, more wearable and enduring, save the maintenance, save your cost.</p> <p>Equipped with the brand-new automatic infrared sensor device, no need to step on the pedal, will save the effort, and make the operation more easier. </p> <p>The newly researched pneumatic foot-lifting device, can lift the presser foot easily and automatically, save human labour, save time.</p> <p>t removed hang type motor, enlarged operation area, with inbuilt direct-drive device, the machine would be more intellectual, and energy saving. Thus, it greatly improve the product efficiency, and reduce the operating cost. Vertical knife struction, combined with photo sensor, can start to cut automatically when needed, it greatly increased he work efficiency. The air suction inlet is set at the back of presser foot. Through air absorptive power, it can inhale all the thread ends and cut the threads.Adopting oil filter device, ensures oil clean, guarantees the products' high speed operation, cleaning the filter and changing the filter core regularly is good for prolong the service life.&nbsp; </p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-900-4AT-EUT.jpg"></p> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-15.html">DS-900-4AT/EUT-Direct-Drive Automatic Thread-Cutting High Speed Overlock Sewing Machine</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-14.html">DS-900-4 Super High-Speed Overlock Sewing Machine</a> 下一个:<a href="Baofengji/Baofengji-16.html">DS-MX5200-4-Super High-Speed Overlock Sewing Machine</a></p>  ','en-us','','2','0','0');
INSERT INTO `pa_product` VALUES ('193','99','DS-MX5200-4-Super High-Speed Overlock Sewing Machine','0.00','100','235','DS-MX5200-4-Super High-Speed Overlock Sewing Machine','DS-MX5200-4-Super High-Speed Overlock Sewing Machine','1','','1436623154','1436623154','   This machine is designed with fashionable appearance and world advanced mechanism. It's features wide and practical application, nice and smooth stitching, easy operation and maintenance, it can perform overlock and overedge on all kinds of fabric from light to medium heavy weight as an efficient sewing equipment in knitting and garment factories. <br> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-MX5200-4.jpg"></p> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-16.html">DS-MX5200-4-Super High-Speed Overlock Sewing Machine</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-15.html">DS-900-4AT/EUT-Direct-Drive Automatic Thread-Cutting High Speed Overlock Sewing Machine</a> 下一个:<a href="Baofengji/Baofengji-1.html">DS-700-3-17PK/SP Pocket Overlock Sewing Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('194','99','DS-700-3-17PK/SP Pocket Overlock Sewing Machine','0.00','100','236','DS-700-3-17PK/SP Pocket Overlock Sewing Machine','DS-700-3-17PK/SP Pocket Overlock Sewing Machine','1','','1436623162','1436623162','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-1.html">DS-700-3-17PK/SP Pocket Overlock Sewing Machine</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-16.html">DS-MX5200-4-Super High-Speed Overlock Sewing Machine</a> 下一个:<a href="Baofengji/Baofengji-2.html">DS-700-3 Super High-Speed Overlock Sewing Machine</a></p>  ','en-us','','3','0','0');
INSERT INTO `pa_product` VALUES ('195','99','DS-700-3 Super High-Speed Overlock Sewing Machine','0.00','100','237','DS-700-3 Super High-Speed Overlock Sewing Machine','DS-700-3 Super High-Speed Overlock Sewing Machine','1','','1436623169','1436623169','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-2.html">DS-700-3 Super High-Speed Overlock Sewing Machine</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-1.html">DS-700-3-17PK/SP Pocket Overlock Sewing Machine</a> 下一个:<a href="Baofengji/Baofengji-3.html">DS-700-4-BK Back Latching Seaming Overlock Machine</a></p>  ','en-us','','2','0','0');
INSERT INTO `pa_product` VALUES ('196','99','DS-700-4-BK Back Latching Seaming Overlock Machine','0.00','100','238','DS-700-4-BK Back Latching Seaming Overlock Machine','DS-700-4-BK Back Latching Seaming Overlock Machine','1','','1436623173','1436623173','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-3.html">DS-700-4-BK Back Latching Seaming Overlock Machine</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-2.html">DS-700-3 Super High-Speed Overlock Sewing Machine</a> 下一个:<a href="Baofengji/Baofengji-4.html">DS-700-4 Super High-Speed Overlock Sewing Machine</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('197','100','DS-800-4AT-EUT','0.00','100','239','DS-800-4AT-EUT','DS-800-4AT-EUT','1','','1436623192','1436623192','   <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-22.html">DS-800-4AT-EUT</a>,<br> <br> 上一个:none 下一个:<a href="Bengfengji/Bengfengji-21.html">DS-787-33AC</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('198','100','DS-787-33AC','0.00','100','240','DS-787-33AC','DS-787-33AC','1','','1436623193','1436623193','   <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-21.html">DS-787-33AC</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-22.html">DS-800-4AT-EUT</a> 下一个:<a href="Bengfengji/Bengfengji-20.html">DS-787-01CB-EUT</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('199','100','DS-787-01CB-EUT','0.00','100','241','DS-787-01CB-EUT','DS-787-01CB-EUT','1','','1436623194','1436623194','   <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-20.html">DS-787-01CB-EUT</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-21.html">DS-787-33AC</a> 下一个:<a href="Bengfengji/Bengfengji-1.html">DS-1500 Feed-On Type Cylinder Bed Interlock Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('200','100','DS-1500 Feed-On Type Cylinder Bed Interlock Machine','0.00','100','242','DS-1500 Feed-On Type Cylinder Bed Interlock Machine','DS-1500 Feed-On Type Cylinder Bed Interlock Machine','1','','1436623198','1436623198','   <p>DS-1500 tube Sartorius series are special machine for rich line trace with movable base line supply setting for freely adjusting height. The machine is very suitable for all sorts of decorating sewing such as clothing, sports suits, casual suits etc, which can meet diversified high quality sewing requirements.</p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-1500.jpg"><br> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-1.html">DS-1500 Feed-On Type Cylinder Bed Interlock Machine</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-20.html">DS-787-01CB-EUT</a> 下一个:<a href="Bengfengji/Bengfengji-2.html">DS-500-01CB-AT-EUT Flatbed interlock sewing machine</a></p>  ','en-us','','4','0','0');
INSERT INTO `pa_product` VALUES ('201','100','DS-500-01CB-AT-EUT Flatbed interlock sewing machine','0.00','100','243','DS-500-01CB-AT-EUT Flatbed interlock sewing machine','DS-500-01CB-AT-EUT Flatbed interlock sewing machine','1','','1436623202','1436623202','   High speed flatbed interlock sewing machine is the sewing equipment specially designed for knitwear garments, it is suitable for sewing various kinds of knitted underwears, and equipped with automatic pedal control, automatic thread cutting for upper &amp; lower threads. Low investment, the productivity has been increased obviously. The user can operate the electric cutting knive easily by just stepping the pedal backward, the threads on needle, looper and spreader (upper needle thread) can be cut off ripidly.&nbsp;&nbsp; <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-2.html">DS-500-01CB-AT-EUT Flatbed interlock sewing machine</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-1.html">DS-1500 Feed-On Type Cylinder Bed Interlock Machine</a> 下一个:<a href="Bengfengji/Bengfengji-3.html">DS-500-01CB-AT Super high speed -direct drive fly tbed interlock</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('202','100','DS-600-01CB/RP Cylinder -Bed Interlock Sewing Machine With Rear Puller','0.00','100','244','DS-600-01CB/RP Cylinder -Bed Interlock Sewing Machine With Rear Puller','DS-600-01CB/RP Cylinder -Bed Interlock Sewing Machine With Rear Puller','1','','1436623206','1436623206','   <p>Equipped with the rear puller device, the machine an sew hard-feed material easily, large needle gauge. </p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-RP.jpg"><br> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-3.html">DS-600-01CB/RP Cylinder -Bed Interlock Sewing Machine With Rear Puller</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-8.html">DS-600-02BB Cylinder-Bed Interlock Machine For Type Binding</a> 下一个:none</p>  ','en-us','','85','0','0');
INSERT INTO `pa_product` VALUES ('203','100','DS-500-01CB Flatbed interlcok sewing machine','0.00','100','245','DS-500-01CB Flatbed interlcok sewing machine','DS-500-01CB Flatbed interlcok sewing machine','1','','1436623208','1436623208','   High speed flatbed interlock sewing machine is the sewing equipment specially designed for knitwear garments, it is suitable for sewing various kinds of knitted underwears, and equipped with automatic pedal control, automatic thread cutting for upper &amp; lower threads. Low investment, the productivity has been increased obviously. The user can operate the electric cutting knive easily by just stepping the pedal backward, the threads on needle, looper and spreader (upper needle thread) can be cut off ripidly.&nbsp;&nbsp; <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-4.html">DS-500-01CB Flatbed interlcok sewing machine</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-3.html">DS-500-01CB-AT Super high speed -direct drive fly tbed interlock</a> 下一个:<a href="Bengfengji/Bengfengji-5.html">DS-500-02BB Interlock Sewing Machine For Tape Binding</a></p>  ','en-us','','2','0','0');
INSERT INTO `pa_product` VALUES ('204','100','DS-500-02BB Interlock Sewing Machine For Tape Binding','0.00','100','246','DS-500-02BB Interlock Sewing Machine For Tape Binding','DS-500-02BB Interlock Sewing Machine For Tape Binding','1','','1436623215','1436623215','   This machine is suitable for binding tape on T-shirt, polo shirt, underwear and briefs etc., There are so many folder sizes, so that no folder goes with the machine. <br> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-5.html">DS-500-02BB Interlock Sewing Machine For Tape Binding</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-4.html">DS-500-01CB Flatbed interlcok sewing machine</a> 下一个:<a href="Bengfengji/Bengfengji-6.html">DS-500-04CB 4-Needle 6 Thread Interlock Seaming Machine</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('205','100','DS-500-04CB 4-Needle 6 Thread Interlock Seaming Machine','0.00','100','247','DS-500-04CB 4-Needle 6 Thread Interlock Seaming Machine','DS-500-04CB 4-Needle 6 Thread Interlock Seaming Machine','1','','1436623223','1436623223','   <p>4-needle, 6-thread, used for closing or reinforcing the seam of 2 pieces of fabrics that have not been over edged, such as closing for crotches of briefs, underwear etc.</p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-500-01CB.jpg"></p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-6.html">DS-500-04CB 4-Needle 6 Thread Interlock Seaming Machine</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-5.html">DS-500-02BB Interlock Sewing Machine For Tape Binding</a> 下一个:<a href="Bengfengji/Bengfengji-7.html">DS-500-05BB Flatbed Interlick Machine For Attaching Elastic Or Lace</a></p>  ','en-us','','2','0','0');
INSERT INTO `pa_product` VALUES ('206','100','DS-500-05BB Flatbed Interlick Machine For Attaching Elastic Or Lace','0.00','100','248','DS-500-05BB Flatbed Interlick Machine For Attaching Elastic Or Lace','DS-500-05BB Flatbed Interlick Machine For Attaching Elastic Or Lace','1','','1436623227','1436623227','   This machine is used for ring type trousers waistband elastic seaming.<br> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-7.html">DS-500-05BB Flatbed Interlick Machine For Attaching Elastic Or Lace</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-6.html">DS-500-04CB 4-Needle 6 Thread Interlock Seaming Machine</a> 下一个:<a href="Bengfengji/Bengfengji-8.html">DS-500-10SZ Interlock Sewing Machine With Decoration Seam</a></p>  ','en-us','','3','0','0');
INSERT INTO `pa_product` VALUES ('207','100','DS-600-02BB Cylinder-Bed Interlock Machine For Type Binding','0.00','100','249','DS-600-02BB Cylinder-Bed Interlock Machine For Type Binding','DS-600-02BB Cylinder-Bed Interlock Machine For Type Binding','1','','1436623230','1436623230','   <p>This machine is suitable for binding tape on T-shirt, polo shirt, underwear and briefs etc., There are so many folder sizes, so that no folder goes with the machine. </p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-AT.jpg"><br> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-8.html">DS-600-02BB Cylinder-Bed Interlock Machine For Type Binding</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-19.html">DS-600-01CB/AT-Gigh-Seed Cylinder-Bed Interlock Sewing Machine</a> 下一个:<a href="Bengfengji/Bengfengji-3.html">DS-600-01CB/RP Cylinder -Bed Interlock Sewing Machine With Rear Puller</a></p>  ','en-us','','6','0','0');
INSERT INTO `pa_product` VALUES ('208','100','DS-600-01CB-EUT-Ultra High speed automatic shear line cylinder type sewing machine','0.00','100','250','DS-600-01CB-EUT-Ultra High speed automatic shear line cylinder type sewing machine','DS-600-01CB-EUT-Ultra High speed automatic shear line cylinder type sewing machine','1','','1436623232','1436623232','   <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-9.html">DS-600-01CB-EUT-Ultra High speed automatic shear line cylinder type sewing machine</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-8.html">DS-500-10SZ Interlock Sewing Machine With Decoration Seam</a> 下一个:<a href="Bengfengji/Bengfengji-10.html">DS-600-05GB Cylinder-Bed Interlock Machine For Ring Type Elastic Belt Seaming</a></p>  ','en-us','','4','0','0');
INSERT INTO `pa_product` VALUES ('209','101','DS-9816','0.00','100','251','DS-9816','DS-9816','1','','1436623245','1436623245','   <p>&nbsp;</p> <p>  <a href="Tezhongji/">Special/synchronized sewing machine</a>,<a href="Tezhongji/Tezhongji-13.html">DS-9816</a>,<br> <br> 上一个:none 下一个:<a href="Tezhongji/Tezhongji-12.html">DS-373AT</a></p>  ','en-us','','4','0','0');
INSERT INTO `pa_product` VALUES ('210','101','DS-373AT','0.00','100','252','DS-373AT','DS-373AT','1','','1436623246','1436623246','   <p>&nbsp;</p> <p>  <a href="Tezhongji/">Special/synchronized sewing machine</a>,<a href="Tezhongji/Tezhongji-12.html">DS-373AT</a>,<br> <br> 上一个:<a href="Tezhongji/Tezhongji-13.html">DS-9816</a> 下一个:<a href="Tezhongji/Tezhongji-1.html">DS-1377 Button sewing</a></p>  ','en-us','','5','0','0');
INSERT INTO `pa_product` VALUES ('211','101','DS-1377 Button sewing','0.00','100','253','DS-1377 Button sewing','DS-1377 Button sewing','1','','1436623248','1436623248','   The stitch number can be easily adjusted from 8, 16, and 32 stitches without&nbsp; changing any parts; By changing the gear and cam, the stitch number can be&nbsp; adjusted from 6, 12 and 24 stitches. <br> Application: The main feature of this machine is for sewing button on 2-hole or 4-hole flat&nbsp; buttons, cross buttons, press buttons, metal buttons etc. It is very convenient to use on various kinds of buttons without changing parts. The machine is suitable for textile fabrics, shirts, blouses, coat and work clothes etc. <p>&nbsp;</p> <p>  <a href="Tezhongji/">Special/synchronized sewing machine</a>,<a href="Tezhongji/Tezhongji-1.html">DS-1377 Button sewing</a>,<br> <br> 上一个:<a href="Tezhongji/Tezhongji-12.html">DS-373AT</a> 下一个:<a href="Tezhongji/Tezhongji-2.html">DS-1790 High-speed direct-drive computer-controlled lockstich buttonoling sewing machine</a></p>  ','en-us','','5','0','0');
INSERT INTO `pa_product` VALUES ('212','101','DS-1790 High-speed direct-drive computer-controlled lockstich buttonoling sewing machine','0.00','100','254','DS-1790 High-speed direct-drive computer-controlled lockstich buttonoling sewing machine','DS-1790 High-speed direct-drive computer-controlled lockstich buttonoling sewing machine','1','','1436623249','1436623249','   <p>Cloth feeding mechanism: the needle bar swing mechanism adopts a step motor,&nbsp; decomposition capacity up to 0.05mm, so that the sewing stitch stable appearance. Through the operation panel on the front of one speed setting, achieve the slow start function, which can effectively prevent the machine high speed star tup disconnection phenomenon The electronic control can sewing last needle when the rein forcing slot, to prevent the button hole. Based on the wire line clam per tension adjustment, can realize the button hole in parallel and sleeve joint part of the tension different needs.</p> <p>&nbsp;</p> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Special/synchronized sewing machine</a>,<a href="Tezhongji/Tezhongji-2.html">DS-1790 High-speed direct-drive computer-controlled lockstich buttonoling sewing machine</a>,<br> <br> 上一个:<a href="Tezhongji/Tezhongji-1.html">DS-1377 Button sewing</a> 下一个:<a href="Tezhongji/Tezhongji-3.html">DS-1850 High-Speed Bar Tacking Machine</a></p>  ','en-us','','5','0','0');
INSERT INTO `pa_product` VALUES ('213','101','DS-1850 High-Speed Bar Tacking Machine','0.00','100','255','DS-1850 High-Speed Bar Tacking Machine','DS-1850 High-Speed Bar Tacking Machine','1','','1436623250','1436623250','   <p>Bar tacking for various kinds of clothing such as suits, jeans and work clothes, also applicable for eye-let button hole tacking.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1850.jpg"></p> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Special/synchronized sewing machine</a>,<a href="Tezhongji/Tezhongji-3.html">DS-1850 High-Speed Bar Tacking Machine</a>,<br> <br> 上一个:<a href="Tezhongji/Tezhongji-2.html">DS-1790 High-speed direct-drive computer-controlled lockstich buttonoling sewing machine</a> 下一个:<a href="Tezhongji/Tezhongji-4.html">DS-1900ASS Computer-Controlled High Speed Bar Tacking Machine</a></p>  ','en-us','','4','0','0');
INSERT INTO `pa_product` VALUES ('214','101','DS-1900ASS Computer-Controlled High Speed Bar Tacking Machine','0.00','100','256','DS-1900ASS Computer-Controlled High Speed Bar Tacking Machine','DS-1900ASS Computer-Controlled High Speed Bar Tacking Machine','1','','1436623251','1436623251','   This machine achieves high sewing speed of 3000rpm. In addition to the high-speed sewing performance; the machine could start and stop quickly. It is provided as standard with and auto-lifter that uses a new stepping motor system. The direct drive sewing machine head created comfortable working environment with the low vibration and low noise. Adopting top level international imported CPU and digital precise CNC technology, the machine is of excellent performance.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1900ASS.jpg"> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Special/synchronized sewing machine</a>,<a href="Tezhongji/Tezhongji-4.html">DS-1900ASS Computer-Controlled High Speed Bar Tacking Machine</a>,<br> <br> 上一个:<a href="Tezhongji/Tezhongji-3.html">DS-1850 High-Speed Bar Tacking Machine</a> 下一个:<a href="Tezhongji/Tezhongji-5.html">DS-1903A Computer-Controlled High-Speed Lockstitch Button Sewing Machine</a></p>  ','en-us','','4','0','0');
INSERT INTO `pa_product` VALUES ('215','101','DS-1903A Computer-Controlled High-Speed Lockstitch Button Sewing Machine','0.00','100','257','DS-1903A Computer-Controlled High-Speed Lockstitch Button Sewing Machine','DS-1903A Computer-Controlled High-Speed Lockstitch Button Sewing Machine','1','','1436623252','1436623252','   <p>The machine achieves the world's highest sewing speed of 2700rpm. With the high-speed performance, the machine could start and stop quickly; It is equipped with pulse motor and automatic presser lifting mechanism. It is also possible to change over the stroke of the auto-lifter from a one-step stroke to a double-step stoke, which significantly shorten total cycle time for button sewing.</p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-1903A.jpg"></p> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Special/synchronized sewing machine</a>,<a href="Tezhongji/Tezhongji-5.html">DS-1903A Computer-Controlled High-Speed Lockstitch Button Sewing Machine</a>,<br> <br> 上一个:<a href="Tezhongji/Tezhongji-4.html">DS-1900ASS Computer-Controlled High Speed Bar Tacking Machine</a> 下一个:<a href="Tezhongji/Tezhongji-6.html">DS-210D Electric Pattern Machine</a></p>  ','en-us','','3','0','0');
INSERT INTO `pa_product` VALUES ('216','101','DS-210D Electric Pattern Machine','0.00','100','258','DS-210D Electric Pattern Machine','DS-210D Electric Pattern Machine','1','','1436623259','1436623259','   The machine is equipped with X-Y feed structure, it realizes high-precision pattern sewing and high speed sewing, meanwhile, fast empty feed structure speed and cutting speed, curtail the sewing circulating time. The direct drive system ensures the quick reaction, reduces the noise and vibration. It is the ideal sewing machine for bag, garment manufacturers. <br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-210D.jpg"> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Special/synchronized sewing machine</a>,<a href="Tezhongji/Tezhongji-6.html">DS-210D Electric Pattern Machine</a>,<br> <br> 上一个:<a href="Tezhongji/Tezhongji-5.html">DS-1903A Computer-Controlled High-Speed Lockstitch Button Sewing Machine</a> 下一个:<a href="Tezhongji/Tezhongji-7.html">DS-2516 Electric Pattern Machine</a></p>  ','en-us','','4','0','0');
INSERT INTO `pa_product` VALUES ('217','101','DS-2516 Electric Pattern Machine','0.00','100','259','DS-2516 Electric Pattern Machine','DS-2516 Electric Pattern Machine','1','','1436623263','1436623263','   This machine adopts liquid crystal touch-pad display panel for inputting the sewing patterns, Simple operation with photograph and instructions. Improvement of presser foot mechanism working holder lifting height from 20mm to 25mm, and the stepping foot lift improved from 10mm to 18mm. With top-class servo motor system and help functions, when you meet with an error with PLK-E series, the solutions will show in the screen automatically, so that, users could solve the problems immediately. <br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2516.jpg"> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Special/synchronized sewing machine</a>,<a href="Tezhongji/Tezhongji-7.html">DS-2516 Electric Pattern Machine</a>,<br> <br> 上一个:<a href="Tezhongji/Tezhongji-6.html">DS-210D Electric Pattern Machine</a> 下一个:<a href="Tezhongji/Tezhongji-8.html">DS-373 Button Sewing Machine</a></p>  ','en-us','','4','0','0');
INSERT INTO `pa_product` VALUES ('218','101','DS-373 Button Sewing Machine','0.00','100','260','DS-373 Button Sewing Machine','DS-373 Button Sewing Machine','1','','1436623267','1436623267','   <p>This machine is applicable for button with or four holes. Shanked button and others are also can be sewn by equipping accessories. It's suitable for light and medium weight materials.</p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-373.jpg"><br> </p> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Special/synchronized sewing machine</a>,<a href="Tezhongji/Tezhongji-8.html">DS-373 Button Sewing Machine</a>,<br> <br> 上一个:<a href="Tezhongji/Tezhongji-7.html">DS-2516 Electric Pattern Machine</a> 下一个:<a href="Tezhongji/Tezhongji-9.html">DS-781 Lockstitch Straight Button Holing Industrial Sewing Machine Series</a></p>  ','en-us','','4','0','0');
INSERT INTO `pa_product` VALUES ('219','101','DS-781 Lockstitch Straight Button Holing Industrial Sewing Machine Series','0.00','100','261','DS-781 Lockstitch Straight Button Holing Industrial Sewing Machine Series','DS-781 Lockstitch Straight Button Holing Industrial Sewing Machine Series','1','','1436623272','1436623272','   <p>Button holing for ordinary cloth, knitting, etc. It's suitable for light medium and weigh materials.<img alt="" src="/upload/Image/chanpin/liebiao/DS-781.jpg"><br> </p> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Special/synchronized sewing machine</a>,<a href="Tezhongji/Tezhongji-9.html">DS-781 Lockstitch Straight Button Holing Industrial Sewing Machine Series</a>,<br> <br> 上一个:<a href="Tezhongji/Tezhongji-8.html">DS-373 Button Sewing Machine</a> 下一个:<a href="Tezhongji/Tezhongji-10.html">DS-808 Button attachine machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('220','101','DS-808 Button attachine  machine','0.00','100','262','DS-808 Button attachine  machine','DS-808 Button attachine  machine','1','','1436623277','1436623277','   This machine is suitabie binbing all kinds of maeal snap fasteners, craft buttons, jean buttons, rivets, springs, snappers, shoes rivets, etc. For various buttons, different dress and bag materials, you can acquire your required binding quality standing qualty standard by changing the mould and regulating the procedure. <p>&nbsp;</p> <p>  <a href="Tezhongji/">Special/synchronized sewing machine</a>,<a href="Tezhongji/Tezhongji-10.html">DS-808 Button attachine machine</a>,<br> <br> 上一个:<a href="Tezhongji/Tezhongji-9.html">DS-781 Lockstitch Straight Button Holing Industrial Sewing Machine Series</a> 下一个:<a href="Tezhongji/Tezhongji-11.html">DS-9820 Direct-drive electronic eyelet button hole machine</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('221','102','DS-1201 Compact single head series','0.00','100','263','DS-1201 Compact single head series','DS-1201 Compact single head series','1','','1436623285','1436623285','   Compare to compact model machine, this series have the advantage of stronger structure and stable performance. It can cooperate manufacture neatly, It isn't merely suitable suitable for small production, but also can as test press.<br> <p>&nbsp;</p> <p>  <a href="xiuhuaji/">Embroidery machine</a>,<a href="xiuhuaji/xiuhuaji-1.html">DS-1201 Compact single head series</a>,<br> <br> 上一个:none 下一个:<a href="xiuhuaji/xiuhuaji-2.html">DS-1204</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('222','102','DS-1204','0.00','100','264','DS-1204','DS-1204','1','','1436623287','1436623287','   <p>&nbsp;</p> <p>  <a href="xiuhuaji/">Embroidery machine</a>,<a href="xiuhuaji/xiuhuaji-2.html">DS-1204</a>,<br> <br> 上一个:<a href="xiuhuaji/xiuhuaji-1.html">DS-1201 Compact single head series</a> 下一个:<a href="xiuhuaji/xiuhuaji-3.html">DS-1208</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('223','102','DS-1208','0.00','100','265','DS-1208','DS-1208','1','','1436623288','1436623288','   <p>&nbsp;</p> <p>  <a href="xiuhuaji/">Embroidery machine</a>,<a href="xiuhuaji/xiuhuaji-3.html">DS-1208</a>,<br> <br> 上一个:<a href="xiuhuaji/xiuhuaji-2.html">DS-1204</a> 下一个:<a href="xiuhuaji/xiuhuaji-4.html">DS-1212 With sequin</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('224','102','DS-1212 With sequin','0.00','100','266','DS-1212 With sequin','DS-1212 With sequin','1','','1436623292','1436623292','   <p>&nbsp;</p> <p>  <a href="xiuhuaji/">Embroidery machine</a>,<a href="xiuhuaji/xiuhuaji-4.html">DS-1212 With sequin</a>,<br> <br> 上一个:<a href="xiuhuaji/xiuhuaji-3.html">DS-1208</a> 下一个:none</p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('225','103','DS-008VC Button Sewing Machine','0.00','100','267','DS-008VC Button Sewing Machine','DS-008VC Button Sewing Machine','1','','1436623329','1436623329','   The sewing machine with full automatic oil supply, hook vertical movement structure and simple platform is suitable for cylinder type cloth and high-class cloth embroidery sewing, equipped with 4,6,8,12,13 needles on one machine of different positions, and also with roller, therefore, it is able to sew conveniently. The machine can achieve the process instantly, and is the best choice for modern leisure clothes.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-008VC.jpg"> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Mulit-needle sewing machine</a>,<a href="Duozhenji/Duozhenji-1.html">DS-008VC Button Sewing Machine</a>,<br> <br> 上一个:none 下一个:<a href="Duozhenji/Duozhenji-2.html">DS-1302 Double-Needle Picotting And Fagotting,Four Point Zigzag Double Chainstitch Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('226','103','DS-1302 Double-Needle Picotting And Fagotting,Four Point Zigzag Double Chainstitch Machine','0.00','100','268','DS-1302 Double-Needle Picotting And Fagotting,Four Point Zigzag Double Chainstitch Machine','DS-1302 Double-Needle Picotting And Fagotting,Four Point Zigzag Double Chainstitch Machine','1','','1436623334','1436623334','   This machine performs zigzagging by the built in cam that moves the needles left and right (2-5 points). Applications: various designs using and picotting and fagotting. Furthermore, newly developed flower stitching machine (Flower Picot) is joined to this series as new model.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1302.jpg"> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Mulit-needle sewing machine</a>,<a href="Duozhenji/Duozhenji-2.html">DS-1302 Double-Needle Picotting And Fagotting,Four Point Zigzag Double Chainstitch Machine</a>,<br> <br> 上一个:<a href="Duozhenji/Duozhenji-1.html">DS-008VC Button Sewing Machine</a> 下一个:<a href="Duozhenji/Duozhenji-3.html">DS-1433PSM 33-Needle Flat-Bed Dluble Chain Stitch Sewing Machine With Shirring</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('227','103','DS-1433PSM 33-Needle Flat-Bed Dluble Chain Stitch Sewing Machine With Shirring','0.00','100','269','DS-1433PSM 33-Needle Flat-Bed Dluble Chain Stitch Sewing Machine With Shirring','DS-1433PSM 33-Needle Flat-Bed Dluble Chain Stitch Sewing Machine With Shirring','1','','1436623340','1436623340','   Smocking machine can be used on thin knitted fabrics and Georgette as well as medium thick knitted fabrics and denim. As double chain stitch is formed, it is suitable for all kinds of products. By using general thread for upper and lower thread, plain or shirring smocking can be formed. Further, if you should use specified elastic thread for lower thread, elastic shirring smocking can be formed which is suitable for thin materials. In order to make smocking patterns, cams to be provided in plenty are used. By combining their cams with ornamental thread, making varied patterns is practicable.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2000C.jpg"> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Mulit-needle sewing machine</a>,<a href="Duozhenji/Duozhenji-3.html">DS-1433PSM 33-Needle Flat-Bed Dluble Chain Stitch Sewing Machine With Shirring</a>,<br> <br> 上一个:<a href="Duozhenji/Duozhenji-2.html">DS-1302 Double-Needle Picotting And Fagotting,Four Point Zigzag Double Chainstitch Machine</a> 下一个:<a href="Duozhenji/Duozhenji-4.html">DS-1508P Flat-Bed Double Chain Stitch Machine With Horizontal Looper Movement Mechanism</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('228','103','DS-1508P Flat-Bed Double Chain Stitch Machine With Horizontal Looper Movement Mechanism','0.00','100','270','DS-1508P Flat-Bed Double Chain Stitch Machine With Horizontal Looper Movement Mechanism','DS-1508P Flat-Bed Double Chain Stitch Machine With Horizontal Looper Movement Mechanism','1','','1436623343','1436623343','   <p>His machine is suitable for lap seaming, attaching waistbands and line tapes, and inserting elastic. Major features of DS-1508P series are wide range of applications on medium heavy and heavy weight fabric and special unique rear puller mechanism.These features enable DS-1508P series to produce durable and uniform stitches<br> </p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-2000C.jpg"></p> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Mulit-needle sewing machine</a>,<a href="Duozhenji/Duozhenji-4.html">DS-1508P Flat-Bed Double Chain Stitch Machine With Horizontal Looper Movement Mechanism</a>,<br> <br> 上一个:<a href="Duozhenji/Duozhenji-3.html">DS-1433PSM 33-Needle Flat-Bed Dluble Chain Stitch Sewing Machine With Shirring</a> 下一个:<a href="Duozhenji/Duozhenji-5.html">DS-2000C Double Needle Flatbed Making Belt Loop With From Fabric Cutter</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('229','103','DS-2000C Double Needle Flatbed Making Belt Loop With From Fabric Cutter','0.00','100','271','DS-2000C Double Needle Flatbed Making Belt Loop With From Fabric Cutter','DS-2000C Double Needle Flatbed Making Belt Loop With From Fabric Cutter','1','','1436623351','1436623351','   Double needle with a front cutting knife for sewing trousers ears.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2000C.jpg"> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Mulit-needle sewing machine</a>,<a href="Duozhenji/Duozhenji-5.html">DS-2000C Double Needle Flatbed Making Belt Loop With From Fabric Cutter</a>,<br> <br> 上一个:<a href="Duozhenji/Duozhenji-4.html">DS-1508P Flat-Bed Double Chain Stitch Machine With Horizontal Looper Movement Mechanism</a> 下一个:none</p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('230','104','5800','0.00','100','272','5800','5800','1','','1436623362','1436623362','   <p>&nbsp;</p> <p>  <a href="jienengji/">Servo motor system</a>,<a href="jienengji/jienengji-1.html">5800</a>,<br> <br> 上一个:none 下一个:<a href="jienengji/jienengji-2.html">700</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('231','104','700','0.00','100','273','700','700','1','','1436623368','1436623368','   <p>&nbsp;</p> <p>  <a href="jienengji/">Servo motor system</a>,<a href="jienengji/jienengji-2.html">700</a>,<br> <br> 上一个:<a href="jienengji/jienengji-1.html">5800</a> 下一个:<a href="jienengji/jienengji-3.html">747</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('232','104','747','0.00','100','274','747','747','1','','1436623372','1436623372','   <p>&nbsp;</p> <p>  <a href="jienengji/">Servo motor system</a>,<a href="jienengji/jienengji-3.html">747</a>,<br> <br> 上一个:<a href="jienengji/jienengji-2.html">700</a> 下一个:<a href="jienengji/jienengji-4.html">800</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('233','104','800','0.00','100','275','800','800','1','','1436623385','1436623385','   <p>&nbsp;</p> <p>  <a href="jienengji/">Servo motor system</a>,<a href="jienengji/jienengji-4.html">800</a>,<br> <br> 上一个:<a href="jienengji/jienengji-3.html">747</a> 下一个:<a href="jienengji/jienengji-5.html">988</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('234','104','988','0.00','100','276','988','988','1','','1436623389','1436623389','   <p>&nbsp;</p> <p>  <a href="jienengji/">Servo motor system</a>,<a href="jienengji/jienengji-5.html">988</a>,<br> <br> 上一个:<a href="jienengji/jienengji-4.html">800</a> 下一个:<a href="jienengji/jienengji-6.html">DS-28 Servo motor</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('235','104','DS-28 Servo motor','0.00','100','277','DS-28 Servo motor','DS-28 Servo motor','1','','1436623394','1436623394','   Save Money! Act Now!!<br> Stop paying those high electric bills!<br> Save up to70% on yr mon thly electric bills guaranteed!<br> <p>&nbsp;</p> <p>  <a href="jienengji/">Servo motor system</a>,<a href="jienengji/jienengji-6.html">DS-28 Servo motor</a>,<br> <br> 上一个:<a href="jienengji/jienengji-5.html">988</a> 下一个:<a href="jienengji/jienengji-7.html">MX6125</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('236','104','MX6125','0.00','100','278','MX6125','MX6125','1','','1436623400','1436623400','   <p>&nbsp;</p> <p>  <a href="jienengji/">Servo motor system</a>,<a href="jienengji/jienengji-7.html">MX6125</a>,<br> <br> 上一个:<a href="jienengji/jienengji-6.html">DS-28 Servo motor</a> 下一个:none</p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('237','105','DS-20U23D Automatic Zigzag Lockstitch Sewing Machine','0.00','100','279','DS-20U23D Automatic Zigzag Lockstitch Sewing Machine','DS-20U23D Automatic Zigzag Lockstitch Sewing Machine','1','','1436623448','1436623448','   Needle swinging controlled with program, the machine can flexibly sew various kinds of zigzag stitches. With free arm on head, sewing materials can be placed commodiously, improving feature and working efficiency. With multi-function operation panel the machine can accomplish accurate sewing even while operating at high speed.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-20U23D.jpg"> <p>&nbsp;</p> <p>  <a href="Quzhefeng/">Zigzag sewing machine</a>,<a href="Quzhefeng/Quzhefeng-1.html">DS-20U23D Automatic Zigzag Lockstitch Sewing Machine</a>,<br> <br> 上一个:none 下一个:<a href="Quzhefeng/Quzhefeng-2.html">DS-20U43 Zigzag Sewing Machine Series</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('238','105','DS-20U43 Zigzag Sewing Machine Series','0.00','100','280','DS-20U43 Zigzag Sewing Machine Series','DS-20U43 Zigzag Sewing Machine Series','1','','1436623452','1436623452','   The machine is suitable for straight seaming, zigzag, embroidery, abutted, bar tacking, over-edge seaming, zipper inserting seaming, wrapped around seaming, pattern seaming on thin and medium fabrics. The needle position can be adjusted between the right and the left to form beautiful decorative designs. The machine adopts built-in thread winder, backward feeding mechanism.<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-20U43.jpg"> <p>&nbsp;</p> <p>  <a href="Quzhefeng/">Zigzag sewing machine</a>,<a href="Quzhefeng/Quzhefeng-2.html">DS-20U43 Zigzag Sewing Machine Series</a>,<br> <br> 上一个:<a href="Quzhefeng/Quzhefeng-1.html">DS-20U23D Automatic Zigzag Lockstitch Sewing Machine</a> 下一个:<a href="Quzhefeng/Quzhefeng-3.html">DS-2284 High speed zigzag machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('239','105','DS-2284 High speed zigzag machine','0.00','100','281','DS-2284 High speed zigzag machine','DS-2284 High speed zigzag machine','1','','1436623455','1436623455','   The machine is equipped with a hook-driving shaft-offset mechanism which places the hook-rotating shaft off-center from the center of Zigzag stroke of the needle. This machanism allows the blade point of the hook to catch the needle thread every time regardless of the needle throwing direction. As a rusult, the machine is immune to sewing troubles, such as stitch skiping and thread breakage, annoyances likely to occur with the con ventional machine, especially when the needle throws th the right. The can be used for lock stitch, Zigzag stitch, two point and four point Zigzag stitch, you can have more than&nbsp; kinds patterns.<br> <p>&nbsp;</p> <p>  <a href="Quzhefeng/">Zigzag sewing machine</a>,<a href="Quzhefeng/Quzhefeng-3.html">DS-2284 High speed zigzag machine</a>,<br> <br> 上一个:<a href="Quzhefeng/Quzhefeng-2.html">DS-20U43 Zigzag Sewing Machine Series</a> 下一个:none</p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('240','111','DS-1380/1290/1680/1390-Laser cutting machine','0.00','100','287','DS-1380/1290/1680/1390-Laser cutting machine','DS-1380/1290/1680/1390-Laser cutting machine','1','','1436623674','1436623674','   <p>Mobile phone keys, translucent plastic keys, electronic components, integrated circuits (IC), electrical appliances, communication products, sanitary ware, accessories, tools, watches, jewelry, eyes auto parts, luggage buckle, cookware, stainless steel products and other industries. </p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-1380.jpg"></p> <p>&nbsp;</p> <p>  <a href="jiguang/">Laser cutting machine</a>,<a href="jiguang/jiguang-1.html">DS-1380/1290/1680/1390-Laser cutting machine</a>,<br> <br> 上一个:none 下一个:<a href="jiguang/jiguang-2.html">DS-9060/8060/1080/1060-Laser engraving / cutting machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('241','111','DS-9060/8060/1080/1060-Laser engraving / cutting machine','0.00','100','288','DS-9060/8060/1080/1060-Laser engraving / cutting machine','DS-9060/8060/1080/1060-Laser engraving / cutting machine','1','','1436623680','1436623680','   <p>Mobile phone keys, translucent plastic keys, electronic components, integrated circuits (IC), electrical appliances, communication products, sanitary ware, accessories, tools, watches, jewelry, eyes auto parts, luggage buckle, cookware, stainless steel products and other industries. </p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-9060.jpg"></p> <p>&nbsp;</p> <p>  <a href="jiguang/">Laser cutting machine</a>,<a href="jiguang/jiguang-2.html">DS-9060/8060/1080/1060-Laser engraving / cutting machine</a>,<br> <br> 上一个:<a href="jiguang/jiguang-1.html">DS-1380/1290/1680/1390-Laser cutting machine</a> 下一个:none</p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('242','112','DS-310 Gravity feed iron','0.00','100','289','DS-310 Gravity feed iron','DS-310 Gravity feed iron','1','','1436623702','1436623702','   <p>&nbsp;</p> <p>  <a href="yundou/">Iron</a>,<a href="yundou/yundou-1.html">DS-310 Gravity feed iron</a>,<br> <br> 上一个:none 下一个:<a href="yundou/yundou-2.html">DS-520 Gravity feed iron</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('243','112','DS-520 Gravity feed iron','0.00','100','290','DS-520 Gravity feed iron','DS-520 Gravity feed iron','1','','1436623709','1436623709','   <p>&nbsp;</p> <p>  <a href="yundou/">Iron</a>,<a href="yundou/yundou-2.html">DS-520 Gravity feed iron</a>,<br> <br> 上一个:<a href="yundou/yundou-1.html">DS-310 Gravity feed iron</a> 下一个:<a href="yundou/yundou-3.html">DS-6PC-1 All steam iron</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('244','112','DS-6PC-1 All steam iron','0.00','100','291','DS-6PC-1 All steam iron','DS-6PC-1 All steam iron','1','','1436623712','1436623712','   <p>&nbsp;</p> <p>  <a href="yundou/">Iron</a>,<a href="yundou/yundou-3.html">DS-6PC-1 All steam iron</a>,<br> <br> 上一个:<a href="yundou/yundou-2.html">DS-520 Gravity feed iron</a> 下一个:<a href="yundou/yundou-4.html">DS-94A Gravity feed iron</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('245','112','DS-94A Gravity feed iron','0.00','100','292','DS-94A Gravity feed iron','DS-94A Gravity feed iron','1','','1436623716','1436623716','   <p>&nbsp;</p> <p>  <a href="yundou/">Iron</a>,<a href="yundou/yundou-4.html">DS-94A Gravity feed iron</a>,<br> <br> 上一个:<a href="yundou/yundou-3.html">DS-6PC-1 All steam iron</a> 下一个:<a href="yundou/yundou-5.html">Teflon ironing head boots</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('246','112','Teflon ironing head boots','0.00','100','293','Teflon ironing head boots','Teflon ironing head boots','1','','1436623721','1436623721','   <p>&nbsp;</p> <p>  <a href="yundou/">Iron</a>,<a href="yundou/yundou-5.html">Teflon ironing head boots</a>,<br> <br> 上一个:<a href="yundou/yundou-4.html">DS-94A Gravity feed iron</a> 下一个:none</p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('247','113','DS-20S-40S Thread distributor','0.00','100','294','DS-20S-40S Thread distributor','DS-20S-40S Thread distributor','1','','1436623745','1436623745','   One action type bobbin stopper;<br> Easy adjustment of the thrad-winding volume of thread is controlled by a timer;<br> Small size and light weight;<br> The intermittent switch allows simple winding start setting;<br> High-speed two bobbins winding assures the prompt convention of a large <br> volume of thread to bobbins. <p>&nbsp;</p> <p>  <a href="fenxianji/">Thread distributor</a>,<a href="fenxianji/fenxianji-2.html">DS-20S-40S Thread distributor</a>,<br> <br> 上一个:none 下一个:<a href="fenxianji/fenxianji-1.html">DS-10S Thread distributor</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('248','113','DS-10S Thread distributor','0.00','100','295','DS-10S Thread distributor','DS-10S Thread distributor','1','','1436623750','1436623750','   One action type bobbin stopper;<br> East adjustment of the thread-winding volume of thread is controlled by a timer;<br> Small size and light weight;<br> The intermittent switch allows simple winding start setting.<br> <p>&nbsp;</p> <p>  <a href="fenxianji/">Thread distributor</a>,<a href="fenxianji/fenxianji-1.html">DS-10S Thread distributor</a>,<br> <br> 上一个:<a href="fenxianji/fenxianji-2.html">DS-20S-40S Thread distributor</a> 下一个:none</p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('249','114','DS-RC-100-110 Auto-sharping cutting machine series','0.00','100','296','DS-RC-100-110 Auto-sharping cutting machine series','DS-RC-100-110 Auto-sharping cutting machine series','1','','1436623774','1436623774','   It is available to cutting materials such as cotton, woolens, linen, silk, chemical fiber and leather, etc. Having features of concentrated lubrication, neat cutting section and small curvilinear cutting, low noise, stable running, easy operation, and high efficiency, automatic knife grinding, powerful motor, this machine is an ideal cutting tool for garment industry.<br> <p>&nbsp;</p> <p>  <a href="Caijianji/">Cutting machine</a>,<a href="Caijianji/Caijianji-4.html">DS-RC-100-110 Auto-sharping cutting machine series</a>,<br> <br> 上一个:none 下一个:<a href="Caijianji/Caijianji-3.html">DS-CZD-3-103 Auto-sharping cutting machine series</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('250','114','DS-CZD-3-103 Auto-sharping cutting machine series','0.00','100','297','DS-CZD-3-103 Auto-sharping cutting machine series','DS-CZD-3-103 Auto-sharping cutting machine series','1','','1436623778','1436623778','   It is available to cutting materials such as cotton, woolens, linen, silk, chemical fiber and leather, etc. Having features of concentrated lubrication, neat cutting section and small curvilinear cutting, low noise, stable running, easy operation, and high efficiency, automatic knife grinding, powerful motor, this machine is an ideal cutting tool for garment industry.<br> <p>&nbsp;</p> <p>  <a href="Caijianji/">Cutting machine</a>,<a href="Caijianji/Caijianji-3.html">DS-CZD-3-103 Auto-sharping cutting machine series</a>,<br> <br> 上一个:<a href="Caijianji/Caijianji-4.html">DS-RC-100-110 Auto-sharping cutting machine series</a> 下一个:<a href="Caijianji/Caijianji-2.html">DS-888 End cutter</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('251','114','DS-888 End cutter','0.00','100','298','DS-888 End cutter','DS-888 End cutter','1','','1436623782','1436623782','   DS-888 End cutter, Flat and strong rail avoid warp and awry and realize correct work. Compact design for easy operation and maintenance.<br> <p>&nbsp;</p> <p>  <a href="Caijianji/">Cutting machine</a>,<a href="Caijianji/Caijianji-2.html">DS-888 End cutter</a>,<br> <br> 上一个:<a href="Caijianji/Caijianji-3.html">DS-CZD-3-103 Auto-sharping cutting machine series</a> 下一个:<a href="Caijianji/Caijianji-1.html">DS-911A Automatic cutting and hem emboidering machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('252','114','DS-911A Automatic cutting and hem emboidering machine','0.00','100','299','DS-911A Automatic cutting and hem emboidering machine','DS-911A Automatic cutting and hem emboidering machine','1','','1436623784','1436623784','   This product is a specialized machine which can cut all kinds of cloth, such as circular knit, cotton and polyester cloth, into binding. With high automation, it can greatly improve work efficiency and cutting accuracy.The cutting speed can be adjusted as requested and it has automatic stop device.<br> The product can cut 45 degrees of fabric. And the cutting width ranges from 15mm to 90mm. It is a necessary machine for the majority of apparel manufacturers. <p>&nbsp;</p> <p>  <a href="Caijianji/">Cutting machine</a>,<a href="Caijianji/Caijianji-1.html">DS-911A Automatic cutting and hem emboidering machine</a>,<br> <br> 上一个:<a href="Caijianji/Caijianji-2.html">DS-888 End cutter</a> 下一个:none</p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('253','116','DS-9861','0.00','100','301','DS-9861','DS-9861','1','','1436623856','1436623856','   <p> <br> </p> <p> The machine had unprecedentedly lowered the requirements on workers, any worker can operate on the machine ,and produce standard goods without proper training. </p> <p> It greatly increase the productivity. The Button-start operation makes the sewing easier, workers just need to push the starting button,the machine will run automatically,then,the worker can work on another sewing mold, it is also adopted with automatic sewing mold identifying system,therefore,it is possible to sew on several different sewing mold at the same time,when the cloth are in same color. It is also equipped with mark pen to preparefor the next production procedure, thus the productivity had been increased to the extreme. </p> <p> Due to rhe adoption of programming ,it ensures needle gauge and sewing direction of all the products in the same standard,it greatly improve the product quality.And it is also possible to achieve special sewing requiremennts,such as ,reinforce sesaming on the conner of clothes ,or making double stitch on some positions,etc. &nbsp;All you have to do is to program these commands into the system,thus,all the sewing acticities can be finished at one go, and the products of soecial techical requirements can be finished with high proficiency. &nbsp; &nbsp;&nbsp; </p> <p> <img src="/upload/image/20140414/20140414161899169916.jpg" alt=""> </p> <p> &nbsp; &nbsp; &nbsp; &nbsp; <span style="font-size:10px;">&nbsp;<span style="font-size:9px;">&nbsp;</span></span><span style="color:#444444;font-family:Simsun;font-size:9px;line-height:normal;white-space:normal;background-color:#FFFFFF;">LCD touch screen</span><span style="font-size:9px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style="font-size:10px;"><span style="font-size:9px;">&nbsp;</span><span style="font-size:9px;">&nbsp;</span></span><span style="font-size:10px;color:#444444;font-family:Simsun;line-height:normal;background-color:#FFFFFF;"><span style="font-size:9px;">Template identification &nbsp; &nbsp;&nbsp;</span><span><span style="font-size:9px;">&nbsp;</span><span style="color:#444444;font-family:Simsun;line-height:normal;white-space:normal;background-color:#FFFFFF;font-size:9px;">X to the infinite sewing</span><span style="font-size:9px;"> &nbsp; &nbsp;</span><span style="color:#444444;font-family:Simsun;font-size:9px;line-height:normal;white-space:normal;background-color:#FFFFFF;">Automatic brush</span><span style="font-size:9px;"></span> <span style="font-size:9px;">&nbsp; &nbsp; &nbsp; &nbsp;</span></span></span> </p> <p> <span style="font-size:10px;color:#444444;font-family:Simsun;line-height:normal;background-color:#FFFFFF;"><span style="font-size:9px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;equipmen</span><span style="font-size:9px;">t</span></span><span style="font-size:9px;">&nbsp;&nbsp;</span><span style="font-size:10px;">&nbsp; &nbsp;</span><span style="font-size:9px;">&nbsp;&nbsp;</span><span style="line-height:1.5;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span> </p> <p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#444444;font-family:Simsun;font-size:9px;line-height:normal;white-space:normal;background-color:#FFFFFF;">Widely used in the sewing industry</span> </p> <p> <img src="/upload/image/20140414/20140414162220572057.jpg" alt=""> </p> <p> &nbsp; &nbsp; &nbsp; &nbsp;<span style="color:#444444;font-family:Simsun;font-size:9px;line-height:normal;white-space:normal;background-color:#FFFFFF;">DS - 9861 template sewing length (not limited)</span> </p> <p> <img src="/upload/image/20140414/20140414162368426842.jpg" alt=""> </p> <p> &nbsp;&nbsp;<img src="/upload/image/20140414/20140414162462136213.jpg" alt=""> </p> <p> <br> </p> <p> <br> </p> <p> <br> </p> <p>&nbsp;</p> <p>  <a href="Automatic-template/">Automatic template sewing machine</a>,<a href="Automatic-template/Automatic-template-1.html">DS-9861</a>,<br> <br> 上一个:none 下一个:none</p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('254','96','DS-9910QGD-3 computerised lockstitch sewing machine with long arm','0.00','100','302','DS-9910QGD-3 computerised lockstitch sewing machine with long arm','DS-9910QGD-3 computerised lockstitch sewing machine with long arm','1','','1436623931','1436623931','   This machine adopts direct drive system, shorten the distance of transportation, with smooth start and quick reaction, provided with the function of quick start and accurate stop, to get excellent sewing effect. The brand new built-in operation panel rabbet had solved the problem of poor connection caused by loose of fixing screws, this struction is easy to install and uninstall. The height, inclination and phase of presser foot is easy to be adjusted. The machine is suitable for sewing general fabrics such as cotton, woolens, linen and chemical fiber, etc. <br> <p>&nbsp;</p> <p>  <a href="diannaopingfeng/">Computerised lockstitch sewing machine</a>,<a href="diannaopingfeng/diannaopingfeng-5.html">DS-9910QGD-3 computerised lockstitch sewing machine with long arm</a>,<br> <br> 上一个:<a href="diannaopingfeng/diannaopingfeng-4.html">DS-9900QGD-3 Computerised lockstitch sewing machine with long arm</a> 下一个:<a href="diannaopingfeng/diannaopingfeng-4.html">DS-5550 High Speed Lockstitch Sewing Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('255','96','DS-5550 High Speed Lockstitch Sewing Machine','0.00','100','303','DS-5550 High Speed Lockstitch Sewing Machine','DS-5550 High Speed Lockstitch Sewing Machine','1','','1436623937','1436623937','   <p>&nbsp;</p> <p>  <a href="diannaopingfeng/">Computerised lockstitch sewing machine</a>,<a href="diannaopingfeng/diannaopingfeng-4.html">DS-5550 High Speed Lockstitch Sewing Machine</a>,<br> <br> 上一个:<a href="diannaopingfeng/diannaopingfeng-5.html">DS-9910QGD-3 computerised lockstitch sewing machine with long arm</a> 下一个:none</p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('256','99','DS-700-4 Super High-Speed Overlock Sewing Machine','0.00','100','304','DS-700-4 Super High-Speed Overlock Sewing Machine','DS-700-4 Super High-Speed Overlock Sewing Machine','1','','1436624055','1436624055','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-4.html">DS-700-4 Super High-Speed Overlock Sewing Machine</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-3.html">DS-700-4-BK Back Latching Seaming Overlock Machine</a> 下一个:<a href="Baofengji/Baofengji-5.html">DS-700-4-AT Direct Drive Super High Speed Overlock Sewing Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('257','99','DS-700-4-AT Direct Drive Super High Speed Overlock Sewing Machine','0.00','100','305','DS-700-4-AT Direct Drive Super High Speed Overlock Sewing Machine','DS-700-4-AT Direct Drive Super High Speed Overlock Sewing Machine','1','','1436624059','1436624059','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-5.html">DS-700-4-AT Direct Drive Super High Speed Overlock Sewing Machine</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-4.html">DS-700-4 Super High-Speed Overlock Sewing Machine</a> 下一个:<a href="Baofengji/Baofengji-6.html">DS-700-5</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('258','99','DS-700-5','0.00','100','306','DS-700-5','DS-700-5','1','','1436624062','1436624062','   <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-6.html">DS-700-5</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-5.html">DS-700-4-AT Direct Drive Super High Speed Overlock Sewing Machine</a> 下一个:<a href="Baofengji/Baofengji-7.html">DS-737F Super High-Speed Overlock Sewing Machine</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('259','99','DS-737F Super High-Speed Overlock Sewing Machine','0.00','100','307','DS-737F Super High-Speed Overlock Sewing Machine','DS-737F Super High-Speed Overlock Sewing Machine','1','','1436624068','1436624068','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-7.html">DS-737F Super High-Speed Overlock Sewing Machine</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-6.html">DS-700-5</a> 下一个:<a href="Baofengji/Baofengji-8.html">DS-737FS Super High-Speed Overlock Sewing Machine</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('260','99','DS-737FS Super High-Speed Overlock Sewing Machine','0.00','100','308','DS-737FS Super High-Speed Overlock Sewing Machine','DS-737FS Super High-Speed Overlock Sewing Machine','1','','1436624074','1436624074','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-8.html">DS-737FS Super High-Speed Overlock Sewing Machine</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-7.html">DS-737F Super High-Speed Overlock Sewing Machine</a> 下一个:<a href="Baofengji/Baofengji-9.html">DS-747F-AT Super High Speed Overlock Sewing Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('261','99','DS-747F-AT Super High Speed Overlock Sewing Machine','0.00','100','309','DS-747F-AT Super High Speed Overlock Sewing Machine','DS-747F-AT Super High Speed Overlock Sewing Machine','1','','1436624081','1436624081','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-9.html">DS-747F-AT Super High Speed Overlock Sewing Machine</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-8.html">DS-737FS Super High-Speed Overlock Sewing Machine</a> 下一个:<a href="Baofengji/Baofengji-10.html">DS-747F-BK Super High Speed Overlock Sewing Machine For Back Latching Sewing</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('262','99','DS-747F-BK Super High Speed Overlock Sewing Machine For Back Latching Sewing','0.00','100','310','DS-747F-BK Super High Speed Overlock Sewing Machine For Back Latching Sewing','DS-747F-BK Super High Speed Overlock Sewing Machine For Back Latching Sewing','1','','1436624085','1436624085','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-10.html">DS-747F-BK Super High Speed Overlock Sewing Machine For Back Latching Sewing</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-9.html">DS-747F-AT Super High Speed Overlock Sewing Machine</a> 下一个:<a href="Baofengji/Baofengji-11.html">DS-747F-PK/SP Super High Speed Pocket Overlock Sewing Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('263','99','DS-747F-PK/SP Super High Speed Pocket Overlock Sewing Machine','0.00','100','311','DS-747F-PK/SP Super High Speed Pocket Overlock Sewing Machine','DS-747F-PK/SP Super High Speed Pocket Overlock Sewing Machine','1','','1436624096','1436624096','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-11.html">DS-747F-PK/SP Super High Speed Pocket Overlock Sewing Machine</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-10.html">DS-747F-BK Super High Speed Overlock Sewing Machine For Back Latching Sewing</a> 下一个:<a href="Baofengji/Baofengji-12.html">DS-747F Super High-Speed Overlock Sewing Machine</a></p>  ','en-us','','2','0','0');
INSERT INTO `pa_product` VALUES ('264','99','DS-747F Super High-Speed Overlock Sewing Machine','0.00','100','312','DS-747F Super High-Speed Overlock Sewing Machine','DS-747F Super High-Speed Overlock Sewing Machine','1','','1436624104','1436624104','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Overlock sewing machine</a>,<a href="Baofengji/Baofengji-12.html">DS-747F Super High-Speed Overlock Sewing Machine</a>,<br> <br> 上一个:<a href="Baofengji/Baofengji-11.html">DS-747F-PK/SP Super High Speed Pocket Overlock Sewing Machine</a> 下一个:none</p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('265','100','DS-600-05GB Cylinder-Bed Interlock Machine For Ring Type Elastic Belt Seaming','0.00','100','313','DS-600-05GB Cylinder-Bed Interlock Machine For Ring Type Elastic Belt Seaming','DS-600-05GB Cylinder-Bed Interlock Machine For Ring Type Elastic Belt Seaming','1','','1436624116','1436624116','   This machine is used for ring type trousers waistband elastic seaming。<br> <img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-AT.jpg"> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-10.html">DS-600-05GB Cylinder-Bed Interlock Machine For Ring Type Elastic Belt Seaming</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-9.html">DS-600-01CB-EUT-Ultra High speed automatic shear line cylinder type sewing machine</a> 下一个:<a href="Bengfengji/Bengfengji-11.html">DS-600-35AC Cylinder-Bed Interlock Sewing Machine With Left Cutter</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('266','100','DS-600-35AC Cylinder-Bed Interlock Sewing Machine With Left Cutter','0.00','100','314','DS-600-35AC Cylinder-Bed Interlock Sewing Machine With Left Cutter','DS-600-35AC Cylinder-Bed Interlock Sewing Machine With Left Cutter','1','','1436624120','1436624120','   <p>The cloth seam-fine and auto-sucking device with left cutter can smooth the uneven material borders to get perfect stitch line. It's suitable for zigzag cylinder sewing machine on T-shirt, circle collapsible shirt series from thin to medium materials. </p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-RP.jpg"><br> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-11.html">DS-600-35AC Cylinder-Bed Interlock Sewing Machine With Left Cutter</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-10.html">DS-600-05GB Cylinder-Bed Interlock Machine For Ring Type Elastic Belt Seaming</a> 下一个:<a href="Bengfengji/Bengfengji-12.html">DS-62G-01MR-D-AT-AW4 Needle 6 threads feed-off-arm-flat sewing</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('267','100','DS-62G-01MR-D-AT-AW4 Needle 6 threads feed-off-arm-flat sewing','0.00','100','315','DS-62G-01MR-D-AT-AW4 Needle 6 threads feed-off-arm-flat sewing','DS-62G-01MR-D-AT-AW4 Needle 6 threads feed-off-arm-flat sewing','1','','1436624122','1436624122','   This machine is the requisite machine in knitting sewing, the 4-needle and 6-thread can perform a high elastic, very smooth and firm side seam. The cylinder-bed and walking presser foot that originated by Yamato, makes it easier go throug the side seam and folding side. There are different needle gauge of presser foot according to different material and usage, which can be divided into single cutter and double cutter. The machine also can be equipped with a small servo motor for special requirement. This is an ideal new model for high quality sewing and easy operation. <br> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-12.html">DS-62G-01MR-D-AT-AW4 Needle 6 threads feed-off-arm-flat sewing</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-11.html">DS-600-35AC Cylinder-Bed Interlock Sewing Machine With Left Cutter</a> 下一个:<a href="Bengfengji/Bengfengji-13.html">DS-720-356T Small cylinder three-needle interlock sewing</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('268','100','DS-720-356T Small cylinder three-needle interlock sewing','0.00','100','316','DS-720-356T Small cylinder three-needle interlock sewing','DS-720-356T Small cylinder three-needle interlock sewing','1','','1436624124','1436624124','   <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-13.html">DS-720-356T Small cylinder three-needle interlock sewing</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-12.html">DS-62G-01MR-D-AT-AW4 Needle 6 threads feed-off-arm-flat sewing</a> 下一个:<a href="Bengfengji/Bengfengji-19.html">DS-600-01CB/AT-Gigh-Seed Cylinder-Bed Interlock Sewing Machine</a></p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('269','100','DS-600-01CB/AT-Gigh-Seed Cylinder-Bed Interlock Sewing Machine','0.00','100','317','DS-600-01CB/AT-Gigh-Seed Cylinder-Bed Interlock Sewing Machine','DS-600-01CB/AT-Gigh-Seed Cylinder-Bed Interlock Sewing Machine','1','','1436624126','1436624126','   <p>Automatic presser-foot lifting, automatic top &amp; bottom thread trimming, automatic speed adjusting, low investment; but the productivity had been greatly enhanced. Electrical yarn cutter that can be operated simply by stepping on the pedal backwards can quickly cut off needle yarns, looper yarns and feed needle yarns (upper needle yarns). </p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-AT-EUT.jpg"></p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-19.html">DS-600-01CB/AT-Gigh-Seed Cylinder-Bed Interlock Sewing Machine</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-13.html">DS-720-356T Small cylinder three-needle interlock sewing</a> 下一个:<a href="Bengfengji/Bengfengji-8.html">DS-600-02BB Cylinder-Bed Interlock Machine For Type Binding</a></p>  ','en-us','','2','0','0');
INSERT INTO `pa_product` VALUES ('270','100','DS-600-02BB Cylinder-Bed Interlock Machine For Type Binding','0.00','100','318','DS-600-02BB Cylinder-Bed Interlock Machine For Type Binding','DS-600-02BB Cylinder-Bed Interlock Machine For Type Binding','1','','1436624134','1436624134','   <p>This machine is suitable for binding tape on T-shirt, polo shirt, underwear and briefs etc., There are so many folder sizes, so that no folder goes with the machine. </p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-AT.jpg"><br> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-8.html">DS-600-02BB Cylinder-Bed Interlock Machine For Type Binding</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-19.html">DS-600-01CB/AT-Gigh-Seed Cylinder-Bed Interlock Sewing Machine</a> 下一个:<a href="Bengfengji/Bengfengji-3.html">DS-600-01CB/RP Cylinder -Bed Interlock Sewing Machine With Rear Puller</a></p>  ','en-us','','1','0','0');
INSERT INTO `pa_product` VALUES ('271','100','DS-600-01CB/RP Cylinder -Bed Interlock Sewing Machine With Rear Puller','0.00','100','319','DS-600-01CB/RP Cylinder -Bed Interlock Sewing Machine With Rear Puller','DS-600-01CB/RP Cylinder -Bed Interlock Sewing Machine With Rear Puller','1','','1436624137','1436624137','   <p>Equipped with the rear puller device, the machine an sew hard-feed material easily, large needle gauge. </p> <p><img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-RP.jpg"><br> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Interlock sewing machine</a>,<a href="Bengfengji/Bengfengji-3.html">DS-600-01CB/RP Cylinder -Bed Interlock Sewing Machine With Rear Puller</a>,<br> <br> 上一个:<a href="Bengfengji/Bengfengji-8.html">DS-600-02BB Cylinder-Bed Interlock Machine For Type Binding</a> 下一个:none</p>  ','en-us','','3','0','0');
INSERT INTO `pa_product` VALUES ('272','101','DS-9820 Direct-drive electronic eyelet button hole machine','0.00','100','320','DS-9820 Direct-drive electronic eyelet button hole machine','DS-9820 Direct-drive electronic eyelet button hole machine','1','','1436624352','1436624352','   Improve the feed mechanism with servo control can be sewn to a high-precision patterns, high-speed sewing or sewing thickness will not result in deviation of the electronic sewing machines often offset. Through a thorough examination of the noise generated by mechanical devices, to achieve faster and less noise in the sewing speed.<br> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Special/synchronized sewing machine</a>,<a href="Tezhongji/Tezhongji-11.html">DS-9820 Direct-drive electronic eyelet button hole machine</a>,<br> <br> 上一个:<a href="Tezhongji/Tezhongji-10.html">DS-808 Button attachine machine</a> 下一个:none</p>  ','en-us','','0','0','0');
INSERT INTO `pa_product` VALUES ('273','117','DS-0303D-5','0.00','100','321','DS-0303D-5','DS-0303D-5','1','','1436626364','1436626364','   <p> Эта машина принимает ссылку нитепритягивателя большой поворотный крючок линии хребта, автоматическая система смазки, настройка верхнего и нижнего механизма подачи и прижимной лапки поочередно подъемного механизма, формирование из 301 стежков. Швейные способности, хорошую производительность слоя шва, автоматическое устройство смазки, низкий уровень шума, длительный срок службы, подходит для кожи, искусственной кожи, холст, подушки, диван, багажа продукции. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-0303D-5.jpg"> </p> <p>&nbsp;</p> <p>  <a href="diannaopingfengji/">Машина швейная компьютера</a>,<a href="diannaopingfengji/diannaopingfengji-1.html">DS-0303D-5</a>,<br> <br> Предыдущая:none следующий:<a href="diannaopingfengji/diannaopingfengji-2.html">DS-9600QGD-3N</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('274','117','DS-9600QGD-3N','0.00','100','322','DS-9600QGD-3N','DS-9600QGD-3N','1','','1436626365','1436626365','   <p> Использует уменьшенный сразу сыстемы драйва, трассе передачи, старт будет ровно, отвечает поворотливо, обеспечивает быстрый старт и точный двигатель с прокалыванной функции, влиянию ткани для того чтобы быть точно.Внутренние ветры типа Тибета продевают нитку организацию, потребитель могут подействовать согласно по-разному технологическому требованию продолжить могут селективное предположение, увеличенное работая эффективности больш, поставляют зуб ткани высоки, градиент и участок может легко для того чтобы отрегулировать.Будет целесообразно в равномерных хлопке тканей толщины и так далее материальных и капке, шерсти, пеньке, химически волокне. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-9600QGD-3N.jpg"> </p> <p>&nbsp;</p> <p>  <a href="diannaopingfengji/">Машина швейная компьютера</a>,<a href="diannaopingfengji/diannaopingfengji-2.html">DS-9600QGD-3N</a>,<br> <br> Предыдущая:<a href="diannaopingfengji/diannaopingfengji-1.html">DS-0303D-5</a> следующий:<a href="diannaopingfengji/diannaopingfengji-3.html">DS-9610QGD-3</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('275','117','DS-9610QGD-3','0.00','100','323','DS-9610QGD-3','DS-9610QGD-3','1','','1436626367','1436626367','   <p> Серия автоматических обрезки нити швейная швейная машина с автоматической обрезкой нити, автоматическая игла-разрядное число автоматических игла автоматически отсчитывает обратный шов, автоматического набора линий и других видов шитья. Применительно к швейной футболки, одежда, толстовки, подходит для швейных кошельки, бумажники, джинсы и другие тяжелые материалы; особенно подходит для швейных торговых марок, карманы, рукава и процессов, способных высокого качества, высокой эффективности работы швейной .Новый встроенный прямой оптимизации сервопривод конструкции двигателя; специальной конструкции; добиться эффекта ультра-низким уровнем вибрации, немой; показатели значительно превышают национальные стандарты швейные машины, ключевые составные части и компоненты импортных комплектующих, что значительно продлить срок службы . </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-9610QGD-3.jpg"> </p> <p>&nbsp;</p> <p>  <a href="diannaopingfengji/">Машина швейная компьютера</a>,<a href="diannaopingfengji/diannaopingfengji-3.html">DS-9610QGD-3</a>,<br> <br> Предыдущая:<a href="diannaopingfengji/diannaopingfengji-2.html">DS-9600QGD-3N</a> следующий:<a href="diannaopingfengji/diannaopingfengji-4.html">DS-9900QGD-3</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('276','117','DS-9900QGD-3','0.00','100','324','DS-9900QGD-3','DS-9900QGD-3','1','','1436626368','1436626368','   <p>&nbsp;</p> <p>  <a href="diannaopingfengji/">Машина швейная компьютера</a>,<a href="diannaopingfengji/diannaopingfengji-4.html">DS-9900QGD-3</a>,<br> <br> Предыдущая:<a href="diannaopingfengji/diannaopingfengji-3.html">DS-9610QGD-3</a> следующий:<a href="diannaopingfengji/diannaopingfengji-5.html">DS-9910QGD-3</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('277','117','DS-9910QGD-3','0.00','100','325','DS-9910QGD-3','DS-9910QGD-3','1','','1436626370','1436626370','   <p> Использует сразу сыстемы драйва, уменьшает трассу передачи, старт будет ровно, отвечает поворотливо, обеспечивает быстрый старт и точный двигатель с функции, прокалывает влияние ткани для того чтобы быть точн.Внутри инкрустированное Brand-new доске деятельности типа замешивая, котор нужно ввести плох улучшает контакт первоначально резьба зафиксировала легкую для того чтобы стать более менее ыми причинами хорошими и так далее вопросы, disassemblage более удобно.Поставляет зуб ткани высоки, градиент и участок может легко для того чтобы отрегулировать.Будет целесообразно в равномерных хлопке тканей толщины и так далее материальных и капке, шерсти, пеньке, химически волокне. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-9910QGD-3.jpg"> </p> <p>&nbsp;</p> <p>  <a href="diannaopingfengji/">Машина швейная компьютера</a>,<a href="diannaopingfengji/diannaopingfengji-5.html">DS-9910QGD-3</a>,<br> <br> Предыдущая:<a href="diannaopingfengji/diannaopingfengji-4.html">DS-9900QGD-3</a> следующий:none</p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('278','118','DS-6202QGD-3','0.00','100','326','DS-6202QGD-3','DS-6202QGD-3','1','','1436626372','1436626372','   <p>&nbsp;</p> <p>  <a href="Pingfengji/">швейная машина</a>,<a href="Pingfengji/Pingfengji-17.html">DS-6202QGD-3</a>,<br> <br> Предыдущая:none следующий:<a href="Pingfengji/Pingfengji-1.html">DS-0302</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('279','118','DS-0302','0.00','100','327','DS-0302','DS-0302','1','','1436626377','1436626377','   <p> Эта машина принимает ссылку нитепритягивателя большой поворотный крючок линии хребта, автоматическая система смазки, настройка верхнего и нижнего механизма подачи и прижимной лапки поочередно подъемного механизма, формирование из 301 стежков. Швейные способности, хорошую производительность слоя шва, автоматическое устройство смазки, низкий уровень шума, длительный срок службы, подходит для кожи, искусственной кожи, холст, подушки, диван, багажа продукции. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-6202.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">швейная машина</a>,<a href="Pingfengji/Pingfengji-1.html">DS-0302</a>,<br> <br> Предыдущая:<a href="Pingfengji/Pingfengji-17.html">DS-6202QGD-3</a> следующий:<a href="Pingfengji/Pingfengji-2.html">DS-111QG</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('280','118','DS-111QG','0.00','100','328','DS-111QG','DS-111QG','1','','1436626381','1436626381','   <p> Истиранию легко Diaoqi картины платы Недостатком из нержавеющей стали, а не живопись, граничит на объединительной плате, плате не носят цели. Применительно к целому ряду тонких, толстых умеренные обработки одежды. Автоматическая смазка, длина стежка и обратного простотой шитья, является отличным прочная машина закатки уровне. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-111QG.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">швейная машина</a>,<a href="Pingfengji/Pingfengji-2.html">DS-111QG</a>,<br> <br> Предыдущая:<a href="Pingfengji/Pingfengji-1.html">DS-0302</a> следующий:<a href="Pingfengji/Pingfengji-3.html">DS-5550 Grey</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('281','118','DS-5550 Grey','0.00','100','329','DS-5550 Grey','DS-5550 Grey','1','','1436626384','1436626384','   <p>&nbsp;</p> <p>  <a href="Pingfengji/">швейная машина</a>,<a href="Pingfengji/Pingfengji-3.html">DS-5550 Grey</a>,<br> <br> Предыдущая:<a href="Pingfengji/Pingfengji-2.html">DS-111QG</a> следующий:<a href="Pingfengji/Pingfengji-4.html">DS-5550</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('282','118','DS-5550','0.00','100','330','DS-5550','DS-5550','1','','1436626387','1436626387','   <p> Это хорошая форма, плавные линии и структуру сроков погашения, надежная работа, высокая скорость и эффективность рабочего пространства. Можно шить тонкие, густые и толстые швейные материалы, стежков аккуратными и красивыми.Разумного вниз от механизма подачи для того, чтобы шов тонкий, не морщины, шов толстой сплошной линией. Сильные Note-системы смазки сделать машина работает швейная стабильную производительность и низкий уровень шума. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8700.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">швейная машина</a>,<a href="Pingfengji/Pingfengji-4.html">DS-5550</a>,<br> <br> Предыдущая:<a href="Pingfengji/Pingfengji-3.html">DS-5550 Grey</a> следующий:<a href="Pingfengji/Pingfengji-5.html">DS-6-28</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('283','118','DS-6-28','0.00','100','331','DS-6-28','DS-6-28','1','','1436626394','1436626394','   <p> Применяется для пошива нижнего белья, рубашки, спортивная одежда, пальто или аналогичные одежда, швейные адаптироваться к широкому кругу высокого качества швейных </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-5550Grey.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">швейная машина</a>,<a href="Pingfengji/Pingfengji-5.html">DS-6-28</a>,<br> <br> Предыдущая:<a href="Pingfengji/Pingfengji-4.html">DS-5550</a> следующий:<a href="Pingfengji/Pingfengji-6.html">DS-6150QG</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('284','118','DS-6150QG','0.00','100','332','DS-6150QG','DS-6150QG','1','','1436626400','1436626400','   <p> Истиранию легко Diaoqi картины платы Недостатком из нержавеющей стали, а не живопись, граничит на объединительной плате, плате не носят цели. Применительно к целому ряду тонких, толстых умеренные обработки одежды. Автоматическая смазка, длина стежка и обратного простотой шитья, является отличным прочная машина закатки уровне. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-111QG.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">швейная машина</a>,<a href="Pingfengji/Pingfengji-6.html">DS-6150QG</a>,<br> <br> Предыдущая:<a href="Pingfengji/Pingfengji-5.html">DS-6-28</a> следующий:<a href="Pingfengji/Pingfengji-7.html">DS-6202</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('285','118','DS-6202','0.00','100','333','DS-6202','DS-6202','1','','1436626403','1436626403','   <p> Эта машина принимает ссылку нитепритягивателя большой поворотный крючок линии хребта, автоматическая система смазки, формирование из 301 стежков. Швейные способности, хорошую производительность слоя шва, автоматическое устройство смазки, низкий уровень шума, длительный срок службы, подходит для кожи, искусственной кожи, холст, подушки, диван, багажа продукции. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-6202.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">швейная машина</a>,<a href="Pingfengji/Pingfengji-7.html">DS-6202</a>,<br> <br> Предыдущая:<a href="Pingfengji/Pingfengji-6.html">DS-6150QG</a> следующий:<a href="Pingfengji/Pingfengji-8.html">DS-8500</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('286','118','DS-8500','0.00','100','334','DS-8500','DS-8500','1','','1436626407','1436626407','   <p> Применяется для пошива различных видов тонких, толстых умеренной одежды. Автоматическая смазка, регулируемое расстояние иглы и простота обратном закатки Это отличная прочная машина закатки уровне.<img alt="" src="/upload/Image/chanpin/liebiao/DS-8700.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">швейная машина</a>,<a href="Pingfengji/Pingfengji-8.html">DS-8500</a>,<br> <br> Предыдущая:<a href="Pingfengji/Pingfengji-7.html">DS-6202</a> следующий:<a href="Pingfengji/Pingfengji-9.html">DS-8600-J</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('287','118','DS-8600-J','0.00','100','335','DS-8600-J','DS-8600-J','1','','1436626412','1436626412','   <p> Подходит для шитья всех видов рубашки, костюмы или аналогичных одежды, особенно воротник, грудь и другие части. Уникальный механизм подачи, высокая скорость шитья прямой и обратной подачи длины стежка может быть точно таким же.Устройство бокового ножа делает процесс шитья и нож после завершения эффективность работы. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8600-J.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">швейная машина</a>,<a href="Pingfengji/Pingfengji-9.html">DS-8600-J</a>,<br> <br> Предыдущая:<a href="Pingfengji/Pingfengji-8.html">DS-8500</a> следующий:<a href="Pingfengji/Pingfengji-10.html">DS-8700</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('288','118','DS-8700','0.00','100','336','DS-8700','DS-8700','1','','1436626416','1436626416','   <p> Это хорошая форма, плавные линии и структуру сроков погашения, надежная работа, высокая скорость и эффективность рабочего пространства. Можно шить тонкие, густые и толстые швейные материалы, стежков аккуратными и красивыми.Разумного вниз от механизма подачи для того, чтобы шов тонкий, не морщины, шов толстой сплошной линией. Сильные Note-системы смазки сделать машина работает швейная стабильную производительность и низкий уровень шума. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8700.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">швейная машина</a>,<a href="Pingfengji/Pingfengji-10.html">DS-8700</a>,<br> <br> Предыдущая:<a href="Pingfengji/Pingfengji-9.html">DS-8600-J</a> следующий:<a href="Pingfengji/Pingfengji-11.html">DS-8800</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('289','118','DS-8800','0.00','100','337','DS-8800','DS-8800','1','','1436626418','1436626418','   <p> DS-8800 проходной борта машины края, DS-68P крестиком машины, DS-68ZX саржевого стежка швейная машина машины по форме крючком линии одного имитация цепочки ручного шитья отделки швейных машин, подходящих для всех типов умеренных толстой одежды декоративного шитья, швейных изделий стороны стежка пятнистой, является идеальным продуктом для различных костюмов декоративного шитья. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-6202.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">швейная машина</a>,<a href="Pingfengji/Pingfengji-11.html">DS-8800</a>,<br> <br> Предыдущая:<a href="Pingfengji/Pingfengji-10.html">DS-8700</a> следующий:<a href="Pingfengji/Pingfengji-12.html">DS-8900</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('290','119','DS-0058-3','0.00','100','338','DS-0058-3','DS-0058-3','1','','1436626423','1436626423','   <p> Функция в то же время швейной треков, два параллельных ряда двойной цепью относится и к одежде, белье, постельные принадлежности и тонких пакетов и изделий из кожи коленей загружен шва. Pin расстояния пять на выбор. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8600-J.jpg"> </p> <p>&nbsp;</p> <p>  <a href="shuangzhenji/">Двухместный машина иглы</a>,<a href="shuangzhenji/shuangzhenji-1.html">DS-0058-3</a>,<br> <br> Предыдущая:none следующий:<a href="shuangzhenji/shuangzhenji-2.html">DS-0058</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('291','119','DS-0058','0.00','100','339','DS-0058','DS-0058','1','','1436626429','1436626429','   <p> Функция в то же время швейной треков, два параллельных ряда двойной цепью относится и к одежде, белье, постельные принадлежности и тонких пакетов и изделий из кожи коленей загружен шва. Pin расстояния пять на выбор. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8600-J.jpg"> </p> <p>&nbsp;</p> <p>  <a href="shuangzhenji/">Двухместный машина иглы</a>,<a href="shuangzhenji/shuangzhenji-2.html">DS-0058</a>,<br> <br> Предыдущая:<a href="shuangzhenji/shuangzhenji-1.html">DS-0058-3</a> следующий:<a href="shuangzhenji/shuangzhenji-3.html">DS-8450</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('292','119','DS-8450','0.00','100','340','DS-8450','DS-8450','1','','1436626442','1436626442','   <p> Эта машина широкого спектра применений, в основном используется для рубашек, униформы, пальто, женское нижнее белье, куртки, джинсы шитья. Эта машина имеет двойной иглой раскол игловодителя структуру, так что швейную машину за углом, острого угла, прямой шов точным, синхронизированный кормления машины рычаг и корма собаки предотвращает швейных стежок промаха красивый, чистый. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8450.jpg"> </p> <p>&nbsp;</p> <p>  <a href="shuangzhenji/">Двухместный машина иглы</a>,<a href="shuangzhenji/shuangzhenji-3.html">DS-8450</a>,<br> <br> Предыдущая:<a href="shuangzhenji/shuangzhenji-2.html">DS-0058</a> следующий:<a href="shuangzhenji/shuangzhenji-4.html">DS-8420</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('293','119','DS-8420','0.00','100','341','DS-8420','DS-8420','1','','1436626445','1436626445','   <p> Эта машина принимает две прямые иглы, вертикальная автоматическая заправка челнока, ползунок нить, представляют собой две линии двойной цепной стежок. Вверх и вниз пояса оси времени.Качели игловодителя кормления образом, регулятор маркировкой длины стежка раздел диска и заемных залить гладкой механизм подачи. В нижней нити отступить весной, чтобы убедиться, что эффект нижней строке дисплея и поверхностью линий последовательного шитья. Применяется для пошива пальто, униформа, джинсы, сумки, декоративного шитья. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8450.jpg"> </p> <p>&nbsp;</p> <p>  <a href="shuangzhenji/">Двухместный машина иглы</a>,<a href="shuangzhenji/shuangzhenji-4.html">DS-8420</a>,<br> <br> Предыдущая:<a href="shuangzhenji/shuangzhenji-3.html">DS-8450</a> следующий:none</p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('294','120','DS-700-3-17PK/SP','0.00','100','342','DS-700-3-17PK/SP','DS-700-3-17PK/SP','1','','1436626450','1436626450','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Оверлоки Швейные машины</a>,<a href="Baofengji/Baofengji-1.html">DS-700-3-17PK/SP</a>,<br> <br> Предыдущая:none следующий:<a href="Baofengji/Baofengji-2.html">DS-700-3</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('295','120','DS-700-3','0.00','100','343','DS-700-3','DS-700-3','1','','1436626456','1436626456','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Оверлоки Швейные машины</a>,<a href="Baofengji/Baofengji-2.html">DS-700-3</a>,<br> <br> Предыдущая:<a href="Baofengji/Baofengji-1.html">DS-700-3-17PK/SP</a> следующий:<a href="Baofengji/Baofengji-3.html">DS-700-4-BK</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('296','120','DS-700-4-BK','0.00','100','344','DS-700-4-BK','DS-700-4-BK','1','','1436626459','1436626459','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Оверлоки Швейные машины</a>,<a href="Baofengji/Baofengji-3.html">DS-700-4-BK</a>,<br> <br> Предыдущая:<a href="Baofengji/Baofengji-2.html">DS-700-3</a> следующий:<a href="Baofengji/Baofengji-4.html">DS-700-4</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('297','120','DS-700-4','0.00','100','345','DS-700-4','DS-700-4','1','','1436626466','1436626466','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Оверлоки Швейные машины</a>,<a href="Baofengji/Baofengji-4.html">DS-700-4</a>,<br> <br> Предыдущая:<a href="Baofengji/Baofengji-3.html">DS-700-4-BK</a> следующий:<a href="Baofengji/Baofengji-5.html">DS-700-4-AT</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('298','120','DS-700-4-AT','0.00','100','346','DS-700-4-AT','DS-700-4-AT','1','','1436626470','1436626470','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Оверлоки Швейные машины</a>,<a href="Baofengji/Baofengji-5.html">DS-700-4-AT</a>,<br> <br> Предыдущая:<a href="Baofengji/Baofengji-4.html">DS-700-4</a> следующий:<a href="Baofengji/Baofengji-6.html">DS-700-5</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('299','120','DS-700-5','0.00','100','347','DS-700-5','DS-700-5','1','','1436626474','1436626474','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Оверлоки Швейные машины</a>,<a href="Baofengji/Baofengji-6.html">DS-700-5</a>,<br> <br> Предыдущая:<a href="Baofengji/Baofengji-5.html">DS-700-4-AT</a> следующий:<a href="Baofengji/Baofengji-7.html">DS-737F</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('300','120','DS-737F','0.00','100','348','DS-737F','DS-737F','1','','1436626479','1436626479','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Оверлоки Швейные машины</a>,<a href="Baofengji/Baofengji-7.html">DS-737F</a>,<br> <br> Предыдущая:<a href="Baofengji/Baofengji-6.html">DS-700-5</a> следующий:<a href="Baofengji/Baofengji-8.html">DS-737FS</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('301','120','DS-737FS','0.00','100','349','DS-737FS','DS-737FS','1','','1436626483','1436626483','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Оверлоки Швейные машины</a>,<a href="Baofengji/Baofengji-8.html">DS-737FS</a>,<br> <br> Предыдущая:<a href="Baofengji/Baofengji-7.html">DS-737F</a> следующий:<a href="Baofengji/Baofengji-9.html">DS-747F-AT</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('302','120','DS-747F-AT','0.00','100','350','DS-747F-AT','DS-747F-AT','1','','1436626487','1436626487','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Оверлоки Швейные машины</a>,<a href="Baofengji/Baofengji-9.html">DS-747F-AT</a>,<br> <br> Предыдущая:<a href="Baofengji/Baofengji-8.html">DS-737FS</a> следующий:<a href="Baofengji/Baofengji-10.html">DS-747F-BK</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('303','120','DS-747F-BK','0.00','100','351','DS-747F-BK','DS-747F-BK','1','','1436626492','1436626492','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Оверлоки Швейные машины</a>,<a href="Baofengji/Baofengji-10.html">DS-747F-BK</a>,<br> <br> Предыдущая:<a href="Baofengji/Baofengji-9.html">DS-747F-AT</a> следующий:<a href="Baofengji/Baofengji-11.html">DS-747F-PK/SP</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('304','120','DS-747F-PK/SP','0.00','100','352','DS-747F-PK/SP','DS-747F-PK/SP','1','','1436626501','1436626501','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Оверлоки Швейные машины</a>,<a href="Baofengji/Baofengji-11.html">DS-747F-PK/SP</a>,<br> <br> Предыдущая:<a href="Baofengji/Baofengji-10.html">DS-747F-BK</a> следующий:<a href="Baofengji/Baofengji-12.html">DS-747F</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('305','120','DS-747F','0.00','100','353','DS-747F','DS-747F','1','','1436626506','1436626506','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Оверлоки Швейные машины</a>,<a href="Baofengji/Baofengji-12.html">DS-747F</a>,<br> <br> Предыдущая:<a href="Baofengji/Baofengji-11.html">DS-747F-PK/SP</a> следующий:<a href="Baofengji/Baofengji-13.html">DS-800-4</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('306','121','DS-1500','0.00','100','354','DS-1500','DS-1500','1','','1436626512','1436626512','   <p> DS-1500 Drum Stretch Швейная машина Различные машины с очень богатыми, с подвижной нижней линии механизма подачи, и может адаптироваться ко всем видам трикотажные изделия, спортивная одежда, повседневная одежда и другие характеристики могут быть произвольными уровень операционных потоков, декоративного шитья, такие как манжеты подол, могут в полной мере отвечают требованиям качественной и разнообразной закатки. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1500.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina де Козер</a>,<a href="Bengfengji/Bengfengji-1.html">DS-1500</a>,<br> <br> Предыдущая:none следующий:<a href="Bengfengji/Bengfengji-2.html">DS-500-01CB/AT/EUT</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('307','121','DS-500-01CB/AT/EUT','0.00','100','355','DS-500-01CB/AT/EUT','DS-500-01CB/AT/EUT','1','','1436626519','1436626519','   <p> Высокоскоростная платформа участке швейные машины швейное оборудование для трикотажа, в основном подходит для обработки виды бельевого трикотажа, а также оснащены автоматическим лифтом лапки, автоматическая отрезать сборочной линии. Менее инвестиции, эффективность производства значительно улучшилось.Педаль на лошадях, вы можете просто работать электрических касательной нож, иглы и нити, нити петлителя подачи рукоделия (вилка рукоделие) быстро вырезать. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-500-01CB-AT-EUT.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina де Козер</a>,<a href="Bengfengji/Bengfengji-2.html">DS-500-01CB/AT/EUT</a>,<br> <br> Предыдущая:<a href="Bengfengji/Bengfengji-1.html">DS-1500</a> следующий:<a href="Bengfengji/Bengfengji-3.html">DS-500-01CB/AT</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('308','121','DS-500-01CB/AT','0.00','100','356','DS-500-01CB/AT','DS-500-01CB/AT','1','','1436626522','1436626522','   Машина использует встроенный прямым приводом и двигателем, с хорошей управляемостью и энергосбережение, повышение эффективности переработки продукции, снизить эксплуатационные расходы. <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina де Козер</a>,<a href="Bengfengji/Bengfengji-3.html">DS-500-01CB/AT</a>,<br> <br> Предыдущая:<a href="Bengfengji/Bengfengji-2.html">DS-500-01CB/AT/EUT</a> следующий:<a href="Bengfengji/Bengfengji-4.html">DS-500-01CB</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('309','121','DS-500-01CB','0.00','100','357','DS-500-01CB','DS-500-01CB','1','','1436626524','1436626524','   <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina де Козер</a>,<a href="Bengfengji/Bengfengji-4.html">DS-500-01CB</a>,<br> <br> Предыдущая:<a href="Bengfengji/Bengfengji-3.html">DS-500-01CB/AT</a> следующий:<a href="Bengfengji/Bengfengji-5.html">DS-500-02BB</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('310','121','DS-500-02BB','0.00','100','358','DS-500-02BB','DS-500-02BB','1','','1436626530','1436626530','   Эта машина может установить рулон блока (ведущий), подходит для футболки, нижнее белье, работа поперечной устойчивости. Спецификации с ведущим (по объему), диапазон размеров, так что машина без лидера. <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina де Козер</a>,<a href="Bengfengji/Bengfengji-5.html">DS-500-02BB</a>,<br> <br> Предыдущая:<a href="Bengfengji/Bengfengji-4.html">DS-500-01CB</a> следующий:<a href="Bengfengji/Bengfengji-6.html">DS-500-04CB</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('311','121','DS-500-04CB','0.00','100','359','DS-500-04CB','DS-500-04CB','1','','1436626535','1436626535','   <p> 4-контактный и 6 линий растяжения швейная машина на двоих без пакета шов шов или армирования рабочих мест, таких как нижнее белье и другие предметы нижнего белья швов (промежность, и т.д.) </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-500-01CB.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina де Козер</a>,<a href="Bengfengji/Bengfengji-6.html">DS-500-04CB</a>,<br> <br> Предыдущая:<a href="Bengfengji/Bengfengji-5.html">DS-500-02BB</a> следующий:<a href="Bengfengji/Bengfengji-7.html">DS-500-05BB</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('312','121','DS-500-05BB','0.00','100','360','DS-500-05BB','DS-500-05BB','1','','1436626542','1436626542','   Машина может быть использована для звонят поясе резинка сшиты. <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina де Козер</a>,<a href="Bengfengji/Bengfengji-7.html">DS-500-05BB</a>,<br> <br> Предыдущая:<a href="Bengfengji/Bengfengji-6.html">DS-500-04CB</a> следующий:<a href="Bengfengji/Bengfengji-8.html">DS-500-10SZ</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('313','121','DS-500-10SZ','0.00','100','361','DS-500-10SZ','DS-500-10SZ','1','','1436626545','1436626545','   <p> Эта машина является новейшей разработкой на базе швейной машины участке декоративных швейных машин. Тарелка с 5 цветков простой обмен. Может быть использован для широкого спектра декоративного шитья, шитье мода, детская одежда, нижнее белье, спортивная одежда может соответствовать высоким качеством и разнообразным требованиям закатки. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-500-01CB.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina де Козер</a>,<a href="Bengfengji/Bengfengji-8.html">DS-500-10SZ</a>,<br> <br> Предыдущая:<a href="Bengfengji/Bengfengji-7.html">DS-500-05BB</a> следующий:<a href="Bengfengji/Bengfengji-9.html">DS-600-01CB/AT/EUT</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('314','121','DS-600-01CB/AT/EUT','0.00','100','362','DS-600-01CB/AT/EUT','DS-600-01CB/AT/EUT','1','','1436626547','1436626547','   <p> Швейные небольшой площади структуры головы относится к небольшой части воротника и манжет, а также оснащены автоматическим лифтом лапки, автоматическая отрезать линии сборки, чтобы автоматически установить скорость. Менее инвестиции, эффективность производства значительно улучшилось.Педаль на лошадях, вы можете просто работать электрических касательной нож, иглы и нити, нити петлителя подачи рукоделия (вилка рукоделие) быстро вырезать. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-AT-EUT.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina де Козер</a>,<a href="Bengfengji/Bengfengji-9.html">DS-600-01CB/AT/EUT</a>,<br> <br> Предыдущая:<a href="Bengfengji/Bengfengji-8.html">DS-500-10SZ</a> следующий:<a href="Bengfengji/Bengfengji-10.html">DS-600-01CB-AT</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('315','121','DS-600-01CB-AT','0.00','100','363','DS-600-01CB-AT','DS-600-01CB-AT','1','','1436626552','1436626552','   <p> Эта серия имеет каждый вроде одноцелевой тип самолета, приспосабливает каждое вроде шов украшения.Смогите удовлетворять диверсификация highquality для того чтобы зашить запрос. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-AT.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina де Козер</a>,<a href="Bengfengji/Bengfengji-10.html">DS-600-01CB-AT</a>,<br> <br> Предыдущая:<a href="Bengfengji/Bengfengji-9.html">DS-600-01CB/AT/EUT</a> следующий:<a href="Bengfengji/Bengfengji-11.html">DS-600-01CB/RP</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('316','121','DS-600-01CB/RP','0.00','100','364','DS-600-01CB/RP','DS-600-01CB/RP','1','','1436626558','1436626558','   <p> После того как этот самолет увеличивает оборудование tugboat вспомогательное подавая, но с легкостью шьет подкладку которая некоторое трудное для того чтобы транспортировать, и игла отдельно от in a big way. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-RP.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina де Козер</a>,<a href="Bengfengji/Bengfengji-11.html">DS-600-01CB/RP</a>,<br> <br> Предыдущая:<a href="Bengfengji/Bengfengji-10.html">DS-600-01CB-AT</a> следующий:<a href="Bengfengji/Bengfengji-12.html">DS-600-02BB</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('317','121','DS-600-02BB','0.00','100','365','DS-600-02BB','DS-600-02BB','1','','1436626560','1436626560','   <p> Эта функция установлена штанга устройства (крана), подходит для футболки, нижнее белье, штанга работу с ведущими характеристики (объем), диапазон размеров машины без ведущих. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-AT.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina де Козер</a>,<a href="Bengfengji/Bengfengji-12.html">DS-600-02BB</a>,<br> <br> Предыдущая:<a href="Bengfengji/Bengfengji-11.html">DS-600-01CB/RP</a> следующий:<a href="Bengfengji/Bengfengji-13.html">DS-600-05GB</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('318','122','DS-1377','0.00','100','366','DS-1377','DS-1377','1','','1436626562','1436626562','   <p> Регулируемый контакт 8 фото, 16, 32-контактный, без необходимости замены частей, удобный и простой; Для регулировки 6, 12, 24-контактный разъем, вы можете заменить механизм и камера. Применение: Наиболее важной особенностью этого аппарата для двух или четырех отверстий плоский пряжки пряжка крест стиль пряжкой и металлической пряжкой скобы. Без запасных частей может свободно основной относится к текстильной ткани, мужчины, женщины, рубашки, блузки, куртки и комбинезоны. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1377.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Специальные машины</a>,<a href="Tezhongji/Tezhongji-1.html">DS-1377</a>,<br> <br> Предыдущая:none следующий:<a href="Tezhongji/Tezhongji-2.html">DS-1790</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('319','122','DS-1790','0.00','100','367','DS-1790','DS-1790','1','','1436626564','1436626564','   <p>&nbsp;</p> <p>  <a href="Tezhongji/">Специальные машины</a>,<a href="Tezhongji/Tezhongji-2.html">DS-1790</a>,<br> <br> Предыдущая:<a href="Tezhongji/Tezhongji-1.html">DS-1377</a> следующий:<a href="Tezhongji/Tezhongji-3.html">DS-1850</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('320','122','DS-1850','0.00','100','368','DS-1850','DS-1850','1','','1436626567','1436626567','   <p> Части сила, приложенная к костюмы, джинсы и другие швейные укрепление одежду, и круглый шов отверстие кнопки хвост подкрепление, и зонтик шва замке верхнего раунд. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1850.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Специальные машины</a>,<a href="Tezhongji/Tezhongji-3.html">DS-1850</a>,<br> <br> Предыдущая:<a href="Tezhongji/Tezhongji-2.html">DS-1790</a> следующий:<a href="Tezhongji/Tezhongji-4.html">DS-1900ASS</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('321','122','DS-1900ASS','0.00','100','369','DS-1900ASS','DS-1900ASS','1','','1436626568','1436626568','   <p> Максимальная скорость шитья 3000 оборотов в минуту, быстрое окончание шитья, импульсный двигатель, автоматическая лапку подъемный механизм, может быть легко признана Точка опускания иглы. Прямая голову диск, создавая низкий уровень вибрации, низкий уровень шума, комфортной рабочей среды. С топ импорта в мире чип, полностью цифровой точности с ЧПУ Технология, машины и лучшую производительность. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1900ASS.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Специальные машины</a>,<a href="Tezhongji/Tezhongji-4.html">DS-1900ASS</a>,<br> <br> Предыдущая:<a href="Tezhongji/Tezhongji-3.html">DS-1850</a> следующий:<a href="Tezhongji/Tezhongji-5.html">DS-1903A</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('322','122','DS-1903A','0.00','100','370','DS-1903A','DS-1903A','1','','1436626570','1436626570','   <p> Для достижения высокой скорости шитья: 2700rpm. Через высокую производительность, быстрый запуск и прекращение швейных нового оборудования импульс двигателя автоматический прижимной лапки подъемный механизм, вы можете переключаться с одного сегмента поездку в пункте 2 инсульта, существенно сократив пряжки<br> Время цикла. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1903A.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Специальные машины</a>,<a href="Tezhongji/Tezhongji-5.html">DS-1903A</a>,<br> <br> Предыдущая:<a href="Tezhongji/Tezhongji-4.html">DS-1900ASS</a> следующий:<a href="Tezhongji/Tezhongji-6.html">DS-210D</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('323','122','DS-210D','0.00','100','371','DS-210D','DS-210D','1','','1436626574','1436626574','   <p> По эпохального механизма подачи XY, для достижения высокой точности узор шитья, высокой скорости шитья, в сочетании с быстрой скоростью подачи воздуха, тангенциальная скорость, сократить время цикла, чтобы быть вшит, прямой привод для обеспечения быстрой реакции, снижение вибрацию и шум, багажа, швейной промышленности backtacking декоративный шов эффективной специализированное оборудование. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-210D.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Специальные машины</a>,<a href="Tezhongji/Tezhongji-6.html">DS-210D</a>,<br> <br> Предыдущая:<a href="Tezhongji/Tezhongji-5.html">DS-1903A</a> следующий:<a href="Tezhongji/Tezhongji-7.html">DS-2516</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('324','122','DS-2516','0.00','100','372','DS-2516','DS-2516','1','','1436626579','1436626579','   <p> Пионером в использовании сенсорный ЖК-экран, включают в себя изображения и китайский инструкция, простота в эксплуатации, улучшение обновление плата от 20мм до 25мм, лапка также был обновлен до 18мм удобная швейная плотных материалов. Оснащена верхней следящей системы, наряду с поддержкой функций, ошибки или неудачи, решение будет автоматически появляться в операционной на экране, пользователь может назначить правильное лекарство. </p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2516.jpg"> <p> <br> </p> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Специальные машины</a>,<a href="Tezhongji/Tezhongji-7.html">DS-2516</a>,<br> <br> Предыдущая:<a href="Tezhongji/Tezhongji-6.html">DS-210D</a> следующий:<a href="Tezhongji/Tezhongji-8.html">DS-373</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('325','122','DS-373','0.00','100','373','DS-373','DS-373','1','','1436626582','1436626582','   <p> Плоская машина основные кнопки используются в основном для двух или четырех отверстий, а также сопровождается швейной ногти Черешок и другие кнопки, для тонких и легких, толстой Dingkou ткани. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-373.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Специальные машины</a>,<a href="Tezhongji/Tezhongji-8.html">DS-373</a>,<br> <br> Предыдущая:<a href="Tezhongji/Tezhongji-7.html">DS-2516</a> следующий:<a href="Tezhongji/Tezhongji-9.html">DS-781</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('326','122','DS-781','0.00','100','374','DS-781','DS-781','1','','1436626589','1436626589','   <p> Кнопка блокировки отверстия швейной применимы ко всем видам вязания, хлопка, химических волокон ткани, тонкий, толстый материал, безопасный. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-781.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Tezhongji/">Специальные машины</a>,<a href="Tezhongji/Tezhongji-9.html">DS-781</a>,<br> <br> Предыдущая:<a href="Tezhongji/Tezhongji-8.html">DS-373</a> следующий:<a href="Tezhongji/Tezhongji-10.html">DS-808</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('327','122','DS-808','0.00','100','375','DS-808','DS-808','1','','1436626593','1436626593','   <p>&nbsp;</p> <p>  <a href="Tezhongji/">Специальные машины</a>,<a href="Tezhongji/Tezhongji-10.html">DS-808</a>,<br> <br> Предыдущая:<a href="Tezhongji/Tezhongji-9.html">DS-781</a> следующий:<a href="Tezhongji/Tezhongji-11.html">DS-9820</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('328','122','DS-9820','0.00','100','376','DS-9820','DS-9820','1','','1436626597','1436626597','   <p>&nbsp;</p> <p>  <a href="Tezhongji/">Специальные машины</a>,<a href="Tezhongji/Tezhongji-11.html">DS-9820</a>,<br> <br> Предыдущая:<a href="Tezhongji/Tezhongji-10.html">DS-808</a> следующий:none</p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('329','123','DS-1201','0.00','100','377','DS-1201','DS-1201','1','','1436626600','1436626600','   <p>&nbsp;</p> <p>  <a href="xiuhuaji/">Вышивка машины</a>,<a href="xiuhuaji/xiuhuaji-1.html">DS-1201</a>,<br> <br> Предыдущая:none следующий:<a href="xiuhuaji/xiuhuaji-2.html">DS-1204</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('330','123','DS-1204','0.00','100','378','DS-1204','DS-1204','1','','1436626603','1436626603','   <p>&nbsp;</p> <p>  <a href="xiuhuaji/">Вышивка машины</a>,<a href="xiuhuaji/xiuhuaji-2.html">DS-1204</a>,<br> <br> Предыдущая:<a href="xiuhuaji/xiuhuaji-1.html">DS-1201</a> следующий:<a href="xiuhuaji/xiuhuaji-3.html">DS-1208</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('331','123','DS-1208','0.00','100','379','DS-1208','DS-1208','1','','1436626604','1436626604','   <p>&nbsp;</p> <p>  <a href="xiuhuaji/">Вышивка машины</a>,<a href="xiuhuaji/xiuhuaji-3.html">DS-1208</a>,<br> <br> Предыдущая:<a href="xiuhuaji/xiuhuaji-2.html">DS-1204</a> следующий:<a href="xiuhuaji/xiuhuaji-4.html">DS-1212</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('332','123','DS-1212','0.00','100','380','DS-1212','DS-1212','1','','1436626608','1436626608','   <p>&nbsp;</p> <p>  <a href="xiuhuaji/">Вышивка машины</a>,<a href="xiuhuaji/xiuhuaji-4.html">DS-1212</a>,<br> <br> Предыдущая:<a href="xiuhuaji/xiuhuaji-3.html">DS-1208</a> следующий:none</p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('333','124','DS-008VC','0.00','100','381','DS-008VC','DS-008VC','1','','1436626612','1436626612','   <p> Полный автоматический поставок нефти, крючок вертикальное движение структуры, цилиндр регистрации автомобилей, способствующих цилиндра швейной одежды. Применить к старшим декоративных одежду шить, 4-контактный разъем, 6-контактный, 8-контактный, 12-контактный, 13-контактный различных моделей иглы из машины, иглы, шитье, и может быть оснащен щипцы, одно время формирования является лучшим оборудованием современной повседневной одежды. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-008VC.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Multi-игла машины</a>,<a href="Duozhenji/Duozhenji-1.html">DS-008VC</a>,<br> <br> Предыдущая:none следующий:<a href="Duozhenji/Duozhenji-2.html">DS-1302</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('334','124','DS-1302','0.00','100','382','DS-1302','DS-1302','1','','1436626614','1436626614','   <p> DS-1302 модели серии имеют четыре передачи, игольчатый потенциал шва 2:00, 3:00, 4:00, 5:00 внешнего изогнутые зубы. Космического изогнутыми зубами, в форме цветка за пределами зубов Qu, а также нового типа с отрывными листами форме в форме цветка, наиболее подходящей для женщин и детей, одежда, платки, скатерти и другие дополнительные детали декоративного шитья. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1302.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Multi-игла машины</a>,<a href="Duozhenji/Duozhenji-2.html">DS-1302</a>,<br> <br> Предыдущая:<a href="Duozhenji/Duozhenji-1.html">DS-008VC</a> следующий:<a href="Duozhenji/Duozhenji-3.html">DS-1433PSM</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('335','124','DS-1433PSM','0.00','100','383','DS-1433PSM','DS-1433PSM','1','','1436626620','1436626620','   <p> Применяется тонкий трикотаж, жоржет, толстый и крепкий материал так швейных декоративного шитья, плоский шов гофрирования, ударил кабеля на форуме использование обычных линий; следующие строки использовать конкретную линию резинкой из тонкого материала У протянуть кабель Chouzhe игры. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2000C.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Multi-игла машины</a>,<a href="Duozhenji/Duozhenji-3.html">DS-1433PSM</a>,<br> <br> Предыдущая:<a href="Duozhenji/Duozhenji-2.html">DS-1302</a> следующий:<a href="Duozhenji/Duozhenji-4.html">DS-1508P</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('336','124','DS-1508P','0.00','100','384','DS-1508P','DS-1508P','1','','1436626623','1436626623','   <p> Подходит для толстых материалов из толстой ожидать ковбой керлинг швы, сшитые на талии, с эластичным. Один разработаны после балансировки кормов буксир для обеспечения высокой скорости работы, красивые стежки. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2000C.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Multi-игла машины</a>,<a href="Duozhenji/Duozhenji-4.html">DS-1508P</a>,<br> <br> Предыдущая:<a href="Duozhenji/Duozhenji-3.html">DS-1433PSM</a> следующий:<a href="Duozhenji/Duozhenji-5.html">DS-2000C</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('337','124','DS-2000C','0.00','100','385','DS-2000C','DS-2000C','1','','1436626626','1436626626','   <p> Дважды игла с фрезой, шьют спецодежду ухо. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2000C.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Multi-игла машины</a>,<a href="Duozhenji/Duozhenji-5.html">DS-2000C</a>,<br> <br> Предыдущая:<a href="Duozhenji/Duozhenji-4.html">DS-1508P</a> следующий:none</p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('338','125','5800','0.00','100','386','5800','5800','1','','1436626629','1436626629','   <p>&nbsp;</p> <p>  <a href="jieneng/">Электрическое управление</a>,<a href="jieneng/jieneng-1.html">5800</a>,<br> <br> Предыдущая:none следующий:<a href="jieneng/jieneng-2.html">700</a></p>  ','ru','','3','0','0');
INSERT INTO `pa_product` VALUES ('339','125','700','0.00','100','387','700','700','1','','1436626631','1436626631','   <p>&nbsp;</p> <p>  <a href="jieneng/">Электрическое управление</a>,<a href="jieneng/jieneng-2.html">700</a>,<br> <br> Предыдущая:<a href="jieneng/jieneng-1.html">5800</a> следующий:<a href="jieneng/jieneng-3.html">747</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('340','125','747','0.00','100','388','747','747','1','','1436626638','1436626638','   <p>&nbsp;</p> <p>  <a href="jieneng/">Электрическое управление</a>,<a href="jieneng/jieneng-3.html">747</a>,<br> <br> Предыдущая:<a href="jieneng/jieneng-2.html">700</a> следующий:<a href="jieneng/jieneng-4.html">800</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('341','125','800','0.00','100','389','800','800','1','','1436626641','1436626641','   <p>&nbsp;</p> <p>  <a href="jieneng/">Электрическое управление</a>,<a href="jieneng/jieneng-4.html">800</a>,<br> <br> Предыдущая:<a href="jieneng/jieneng-3.html">747</a> следующий:<a href="jieneng/jieneng-5.html">988</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('342','125','988','0.00','100','390','988','988','1','','1436626643','1436626643','   <p>&nbsp;</p> <p>  <a href="jieneng/">Электрическое управление</a>,<a href="jieneng/jieneng-5.html">988</a>,<br> <br> Предыдущая:<a href="jieneng/jieneng-4.html">800</a> следующий:<a href="jieneng/jieneng-6.html">DS-28</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('343','125','DS-28','0.00','100','391','DS-28','DS-28','1','','1436626647','1436626647','   <p> Всеобъемлющее способность адаптации. Плоский шов (одной иглой, двойной иглой, толстый материал).Пакет шов - стрейч швейной - темная каемка (прямое диск, подключенный может быть). Низкий уровень шума, низкая вибрация, энергосбережение до 75% </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-28.jpg"> </p> <p>&nbsp;</p> <p>  <a href="jieneng/">Электрическое управление</a>,<a href="jieneng/jieneng-6.html">DS-28</a>,<br> <br> Предыдущая:<a href="jieneng/jieneng-5.html">988</a> следующий:<a href="jieneng/jieneng-7.html">MX6125</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('344','125','MX6125','0.00','100','392','MX6125','MX6125','1','','1436626649','1436626649','   <p>&nbsp;</p> <p>  <a href="jieneng/">Электрическое управление</a>,<a href="jieneng/jieneng-7.html">MX6125</a>,<br> <br> Предыдущая:<a href="jieneng/jieneng-6.html">DS-28</a> следующий:none</p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('345','126','DS-20U23D','0.00','100','393','DS-20U23D','DS-20U23D','1','','1436626653','1436626653','   <p> Благодаря иглы качели программой управления, гибкость соответствующих до 100 видов елочку строчки. Система управления дизайном идеально, компактная структура, функции идеально, свободно программируемые прямой вход, простота в эксплуатации, а также улучшить эксплуатационные характеристики и эффективность работы. Многофункциональная панель для удобства эксплуатации, даже на высокой скорости, чтобы завершить точным шитья. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-20U23D.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Quzhefeng/">зигзага Козе</a>,<a href="Quzhefeng/Quzhefeng-1.html">DS-20U23D</a>,<br> <br> Предыдущая:none следующий:<a href="Quzhefeng/Quzhefeng-2.html">DS-20U43</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('346','126','DS-20U43','0.00','100','394','DS-20U43','DS-20U43','1','','1436626658','1436626658','   <p> Тонкий, прямой шов на толстый материал, изогнутый шов, вышивка, пэчворк, лавируя, пакет боковой шов молния шов, шов пакета терьер шаблон шитья.Массив битов может быть слева, справа, в регуляции, красочные орнаменты. Скрытая моталки, обратный механизм подачи. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-20U43.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Quzhefeng/">зигзага Козе</a>,<a href="Quzhefeng/Quzhefeng-2.html">DS-20U43</a>,<br> <br> Предыдущая:<a href="Quzhefeng/Quzhefeng-1.html">DS-20U23D</a> следующий:<a href="Quzhefeng/Quzhefeng-3.html">DS-2284</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('347','126','DS-2284','0.00','100','395','DS-2284','DS-2284','1','','1436626659','1436626659','   <p>&nbsp;</p> <p>  <a href="Quzhefeng/">зигзага Козе</a>,<a href="Quzhefeng/Quzhefeng-3.html">DS-2284</a>,<br> <br> Предыдущая:<a href="Quzhefeng/Quzhefeng-2.html">DS-20U43</a> следующий:none</p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('348','132','DS-1380/1290/1680/1390','0.00','100','401','DS-1380/1290/1680/1390','DS-1380/1290/1680/1390','1','','1436626679','1436626679','   <p> Клавиши телефона, пластиковые полупрозрачные клавиши, электронных компонентов, интегральных схем (IC), электрических приборов, средств связи, сантехника, инструменты, аксессуары, ножи, глаза часы, ювелирные изделия, автозапчасти, багажа пряжки посуда, изделия из нержавеющей стали и т.д. промышленности. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1380.jpg"> </p> <p>&nbsp;</p> <p>  <a href="jiguangji/">Лазерные машины</a>,<a href="jiguangji/jiguangji-1.html">DS-1380/1290/1680/1390</a>,<br> <br> Предыдущая:none следующий:<a href="jiguangji/jiguangji-2.html">DS-9060/8060/1080/1060</a></p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('349','132','DS-9060/8060/1080/1060','0.00','100','402','DS-9060/8060/1080/1060','DS-9060/8060/1080/1060','1','','1436626682','1436626682','   <p> Клавиши телефона, пластиковые полупрозрачные клавиши, электронных компонентов, интегральных схем (IC), электрических приборов, средств связи, сантехника, инструменты, аксессуары, ножи, глаза часы, ювелирные изделия, автозапчасти, багажа пряжки посуда, изделия из нержавеющей стали и т.д. промышленности. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-9060.jpg"> </p> <p>&nbsp;</p> <p>  <a href="jiguangji/">Лазерные машины</a>,<a href="jiguangji/jiguangji-2.html">DS-9060/8060/1080/1060</a>,<br> <br> Предыдущая:<a href="jiguangji/jiguangji-1.html">DS-1380/1290/1680/1390</a> следующий:none</p>  ','ru','','1','0','0');
INSERT INTO `pa_product` VALUES ('350','133','DS-310','0.00','100','403','DS-310','DS-310','1','','1436626686','1436626686','   <p>&nbsp;</p> <p>  <a href="yundou/">железо</a>,<a href="yundou/yundou-1.html">DS-310</a>,<br> <br> Предыдущая:none следующий:<a href="yundou/yundou-2.html">DS-520</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('351','133','DS-520','0.00','100','404','DS-520','DS-520','1','','1436626688','1436626688','   <p>&nbsp;</p> <p>  <a href="yundou/">железо</a>,<a href="yundou/yundou-2.html">DS-520</a>,<br> <br> Предыдущая:<a href="yundou/yundou-1.html">DS-310</a> следующий:<a href="yundou/yundou-3.html">DS-6PC-1</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('352','133','DS-6PC-1','0.00','100','405','DS-6PC-1','DS-6PC-1','1','','1436626694','1436626694','   <p>&nbsp;</p> <p>  <a href="yundou/">железо</a>,<a href="yundou/yundou-3.html">DS-6PC-1</a>,<br> <br> Предыдущая:<a href="yundou/yundou-2.html">DS-520</a> следующий:<a href="yundou/yundou-4.html">DS-94A</a></p>  ','ru','','3','0','0');
INSERT INTO `pa_product` VALUES ('353','133','DS-94A','0.00','100','406','DS-94A','DS-94A','1','','1436626698','1436626698','   <p>&nbsp;</p> <p>  <a href="yundou/">железо</a>,<a href="yundou/yundou-4.html">DS-94A</a>,<br> <br> Предыдущая:<a href="yundou/yundou-3.html">DS-6PC-1</a> следующий:<a href="yundou/yundou-5.html">Тефлоновые сапоги облако головы</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('354','133','Тефлоновые сапоги облако головы','0.00','100','407','Тефлоновые сапоги облако головы','Тефлоновые сапоги облако головы','1','','1436626703','1436626703','   <p>&nbsp;</p> <p>  <a href="yundou/">железо</a>,<a href="yundou/yundou-5.html">Тефлоновые сапоги облако головы</a>,<br> <br> Предыдущая:<a href="yundou/yundou-4.html">DS-94A</a> следующий:none</p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('355','134','DS-888','0.00','100','408','DS-888','DS-888','1','','1436626707','1436626707','   <p>&nbsp;</p> <p>  <a href="Caijianji/">автомат для резки</a>,<a href="Caijianji/Caijianji-1.html">DS-888</a>,<br> <br> Предыдущая:none следующий:<a href="Caijianji/Caijianji-2.html">DS-CZD-3-103</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('356','134','DS-CZD-3-103','0.00','100','409','DS-CZD-3-103','DS-CZD-3-103','1','','1436626713','1436626713','   <p>&nbsp;</p> <p>  <a href="Caijianji/">автомат для резки</a>,<a href="Caijianji/Caijianji-2.html">DS-CZD-3-103</a>,<br> <br> Предыдущая:<a href="Caijianji/Caijianji-1.html">DS-888</a> следующий:<a href="Caijianji/Caijianji-3.html">DS-RC-100-110</a></p>  ','ru','','3','0','0');
INSERT INTO `pa_product` VALUES ('357','134','DS-RC-100-110','0.00','100','410','DS-RC-100-110','DS-RC-100-110','1','','1436626716','1436626716','   <p>&nbsp;</p> <p>  <a href="Caijianji/">автомат для резки</a>,<a href="Caijianji/Caijianji-3.html">DS-RC-100-110</a>,<br> <br> Предыдущая:<a href="Caijianji/Caijianji-2.html">DS-CZD-3-103</a> следующий:<a href="Caijianji/Caijianji-4.html">DS-CZD-3/103 RC-100/110</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('358','134','DS-CZD-3/103 RC-100/110','0.00','100','411','DS-CZD-3/103 RC-100/110','DS-CZD-3/103 RC-100/110','1','','1436626718','1436626718','   <p> Этот самолет может отрезать взаимосвязь 627X с электричеством американского джентльмена Ирака грациозно для использования, для того чтобы быть целесообразн для хлопка и капка, шерсти, пеньки, шелка, химически волокна, cut out leather равномерной толщины материальный.Имеет смазку централизма, допустимый предел будет прямо, также может сделать малый радиус погнутости изогнуть cut out, малошумное, виток будет устоичиво, легкость деятельности, высокий организационно-технический уровень, автоматический нож стана, мотор высокия организационно-технический уровня характеристик польз и так далее электрический, будет профессией одежды большинств идеально cut out инструмент. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-28.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Caijianji/">автомат для резки</a>,<a href="Caijianji/Caijianji-4.html">DS-CZD-3/103 RC-100/110</a>,<br> <br> Предыдущая:<a href="Caijianji/Caijianji-3.html">DS-RC-100-110</a> следующий:<a href="Caijianji/Caijianji-5.html">DS-911</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('359','134','DS-911','0.00','100','412','DS-911','DS-911','1','','1436626721','1436626721','   <p>&nbsp;</p> <p>  <a href="Caijianji/">автомат для резки</a>,<a href="Caijianji/Caijianji-5.html">DS-911</a>,<br> <br> Предыдущая:<a href="Caijianji/Caijianji-4.html">DS-CZD-3/103 RC-100/110</a> следующий:none</p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('360','135','DS-10S','0.00','100','413','DS-10S','DS-10S','1','','1436626725','1436626725','   К югу от линии машинный устройство нового патрона катушки;<br> Контроллер единицу времени можно просто настроить обмотки суммы;<br> Небольшой размер, легкий вес, простота в использовании;<br> Использование микро-устройство, обмотки набор простых и удобных;<br> Высокоскоростная катушка. <p>&nbsp;</p> <p>  <a href="fenxianji/">Sub-лайн машины</a>,<a href="fenxianji/fenxianji-1.html">DS-10S</a>,<br> <br> Предыдущая:none следующий:<a href="fenxianji/fenxianji-2.html">DS-20S-40C</a></p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('361','135','DS-20S-40C','0.00','100','414','DS-20S-40C','DS-20S-40C','1','','1436626728','1436626728','   <p>&nbsp;</p> <p>  <a href="fenxianji/">Sub-лайн машины</a>,<a href="fenxianji/fenxianji-2.html">DS-20S-40C</a>,<br> <br> Предыдущая:<a href="fenxianji/fenxianji-1.html">DS-10S</a> следующий:none</p>  ','ru','','2','0','0');
INSERT INTO `pa_product` VALUES ('362','138','DS-6202QGD-3','0.00','100','416','DS-6202QGD-3','DS-6202QGD-3','1','','1436626734','1436626734','   <p>&nbsp;</p> <p>  <a href="Pingfengji/">pespunte máquina de coser</a>,<a href="Pingfengji/Pingfengji-17.html">DS-6202QGD-3</a>,<br> <br> Anterior:none próximo:<a href="Pingfengji/Pingfengji-1.html">DS-0302</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('363','138','DS-0302','0.00','100','417','DS-0302','DS-0302','1','','1436626738','1436626738','   <p> Esta máquina adopta hilo enlace para llevar a la gran línea de gancho giratorio cresta, sistema de lubricación automática, la configuración del mecanismo de alimentación superior e inferior y el pie prensatelas alternativamente el mecanismo de elevación, la formación de 301 puntos de sutura. Costura capacidad, el buen desempeño de la capa de costura, dispositivo de lubricación automática, de poco ruido, larga vida útil, conveniente para el cuero, cuero artificial, tela, cojines, sofá, productos de equipaje. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-6202.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">pespunte máquina de coser</a>,<a href="Pingfengji/Pingfengji-1.html">DS-0302</a>,<br> <br> Anterior:<a href="Pingfengji/Pingfengji-17.html">DS-6202QGD-3</a> próximo:<a href="Pingfengji/Pingfengji-2.html">DS-111QG</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('364','138','DS-111QG','0.00','100','418','DS-111QG','DS-111QG','1','','1436626740','1436626740','   <p> La abrasión es fácil de desventaja Diaoqi posterior pintura de acero inoxidable en lugar de la pintura, que limita al plano posterior, la placa madre no usa propósito. Aplicable a una variedad de procesamiento fina, moderada prendas de espesor. La lubricación automática, largo de puntada y la sencillez de retroceso, es una excelente máquina de coser nivel soportable. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-111QG.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">pespunte máquina de coser</a>,<a href="Pingfengji/Pingfengji-2.html">DS-111QG</a>,<br> <br> Anterior:<a href="Pingfengji/Pingfengji-1.html">DS-0302</a> próximo:<a href="Pingfengji/Pingfengji-3.html">DS-5550</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('365','138','DS-5550','0.00','100','419','DS-5550','DS-5550','1','','1436626744','1436626744','   <p> Es una forma atractiva, líneas suaves y la estructura de vencimiento, un rendimiento fiable, de alta velocidad y la eficiencia, el campo de maniobra. Puede coser material de costura fina, gruesa y espesa, puntada puro y hermoso. El abajo razonable desde el mecanismo de alimentación para asegurar que la costura fina, no se arruga, costura continua línea gruesa. Nota Strong-Sistema de lubricación hacer que la máquina de coser el rendimiento de carrera estable y de poco ruido. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8700.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">pespunte máquina de coser</a>,<a href="Pingfengji/Pingfengji-3.html">DS-5550</a>,<br> <br> Anterior:<a href="Pingfengji/Pingfengji-2.html">DS-111QG</a> próximo:<a href="Pingfengji/Pingfengji-4.html">DS-5550-Grey</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('366','138','DS-5550-Grey','0.00','100','420','DS-5550-Grey','DS-5550-Grey','1','','1436626747','1436626747','   Hermoso en apariencia, un rendimiento superior, de alta velocidad, eficiente. Es uno de los modelos más avanzados. Material grueso ropa de coser, de tejer industria. <p>&nbsp;</p> <p>  <a href="Pingfengji/">pespunte máquina de coser</a>,<a href="Pingfengji/Pingfengji-4.html">DS-5550-Grey</a>,<br> <br> Anterior:<a href="Pingfengji/Pingfengji-3.html">DS-5550</a> próximo:<a href="Pingfengji/Pingfengji-5.html">DS-6-28</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('367','138','DS-6-28','0.00','100','421','DS-6-28','DS-6-28','1','','1436626751','1436626751','   <p> Aplicable a coser ropa interior, camisas, ropa deportiva, abrigos o ropa similar, la costura adaptarse a una amplia gama de coser de alta calidad. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-5550Grey.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">pespunte máquina de coser</a>,<a href="Pingfengji/Pingfengji-5.html">DS-6-28</a>,<br> <br> Anterior:<a href="Pingfengji/Pingfengji-4.html">DS-5550-Grey</a> próximo:<a href="Pingfengji/Pingfengji-6.html">DS-6150QG</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('368','138','DS-6150QG','0.00','100','422','DS-6150QG','DS-6150QG','1','','1436626755','1436626755','   <p> La abrasión es fácil de desventaja Diaoqi posterior pintura de acero inoxidable en lugar de la pintura, que limita al plano posterior, la placa madre no usa propósito. Aplicable a una variedad de procesamiento fina, moderada prendas de espesor. La lubricación automática, largo de puntada y la sencillez de retroceso, es una excelente máquina de coser nivel soportable. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-111QG.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">pespunte máquina de coser</a>,<a href="Pingfengji/Pingfengji-6.html">DS-6150QG</a>,<br> <br> Anterior:<a href="Pingfengji/Pingfengji-5.html">DS-6-28</a> próximo:<a href="Pingfengji/Pingfengji-7.html">DS-6202</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('369','138','DS-6202','0.00','100','423','DS-6202','DS-6202','1','','1436626757','1436626757','   <p> Esta máquina adopta el hilo de enlace para llevar a la gran gancho giratorio cresta de línea, sistema de lubricación automática, la formación de 301 puntos. Costura capacidad, el buen desempeño de la capa de costura, dispositivo de lubricación automática, de poco ruido, larga vida útil, conveniente para el cuero, cuero artificial, tela, cojines, sofá, productos de equipaje. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-6202.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">pespunte máquina de coser</a>,<a href="Pingfengji/Pingfengji-7.html">DS-6202</a>,<br> <br> Anterior:<a href="Pingfengji/Pingfengji-6.html">DS-6150QG</a> próximo:<a href="Pingfengji/Pingfengji-8.html">DS-8500</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('370','138','DS-8500','0.00','100','424','DS-8500','DS-8500','1','','1436626759','1436626759','   <p> Aplicable para coser diferentes tipos de prendas finas y gruesas moderados. Lubricación automática espaciado, aguja ajustable y la sencillez de costura inversa Es una excelente máquina de costura nivel soportable.<img alt="" src="/upload/Image/chanpin/liebiao/DS-8700.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">pespunte máquina de coser</a>,<a href="Pingfengji/Pingfengji-8.html">DS-8500</a>,<br> <br> Anterior:<a href="Pingfengji/Pingfengji-7.html">DS-6202</a> próximo:<a href="Pingfengji/Pingfengji-9.html">DS-8600-J</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('371','138','DS-8600-J','0.00','100','425','DS-8600-J','DS-8600-J','1','','1436626762','1436626762','   <p> Adecuado para coser todo tipo de camisas, trajes o ropa similar, especialmente el cuello, el pecho y otras partes. Mecanismo único de alimentación, la costura de alta velocidad de avance y la longitud de puntada inversa de alimentación puede ser exactamente la misma. El dispositivo cortador lateral hace que el proceso de la eficiencia de coser y un cuchillo de trabajo una vez terminado. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8600-J.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">pespunte máquina de coser</a>,<a href="Pingfengji/Pingfengji-9.html">DS-8600-J</a>,<br> <br> Anterior:<a href="Pingfengji/Pingfengji-8.html">DS-8500</a> próximo:<a href="Pingfengji/Pingfengji-10.html">DS-8700</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('372','138','DS-8700','0.00','100','426','DS-8700','DS-8700','1','','1436626764','1436626764','   <p> Es una forma atractiva, líneas suaves y la estructura de vencimiento, un rendimiento fiable, de alta velocidad y la eficiencia, el campo de maniobra. Puede coser material de costura fina, gruesa y espesa, puntada puro y hermoso. El abajo razonable desde el mecanismo de alimentación para asegurar que la costura fina, no se arruga, costura continua línea gruesa. Nota Strong-Sistema de lubricación hacer que la máquina de coser el rendimiento de carrera estable y de poco ruido. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8700.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">pespunte máquina de coser</a>,<a href="Pingfengji/Pingfengji-10.html">DS-8700</a>,<br> <br> Anterior:<a href="Pingfengji/Pingfengji-9.html">DS-8600-J</a> próximo:<a href="Pingfengji/Pingfengji-11.html">DS-8800</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('373','138','DS-8800','0.00','100','427','DS-8800','DS-8800','1','','1436626769','1436626769','   <p> DS-8800 máquina recta patrón talón borde, DS-68P punto de cruz máquina, DS-68ZX puntada tela cruzada de la máquina de coser de la máquina por el formulario en línea tejer una cadena simple imitación de la máquina de coser de mano de coser adornos, apto para todo tipo de prendas gruesas moderados costuras decorativas, cosiendo puntada bienes lado irregular, es el producto ideal para una variedad de trajes de costura decorativa. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-6202.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Pingfengji/">pespunte máquina de coser</a>,<a href="Pingfengji/Pingfengji-11.html">DS-8800</a>,<br> <br> Anterior:<a href="Pingfengji/Pingfengji-10.html">DS-8700</a> próximo:<a href="Pingfengji/Pingfengji-12.html">DS-8900</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('374','139','DS-700-3-17PK/SP','0.00','100','428','DS-700-3-17PK/SP','DS-700-3-17PK/SP','1','','1436626773','1436626773','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Máquina de coser overlock</a>,<a href="Baofengji/Baofengji-1.html">DS-700-3-17PK/SP</a>,<br> <br> Anterior:none próximo:<a href="Baofengji/Baofengji-2.html">DS-700-3</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('375','139','DS-700-3','0.00','100','429','DS-700-3','DS-700-3','1','','1436626776','1436626776','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Máquina de coser overlock</a>,<a href="Baofengji/Baofengji-2.html">DS-700-3</a>,<br> <br> Anterior:<a href="Baofengji/Baofengji-1.html">DS-700-3-17PK/SP</a> próximo:<a href="Baofengji/Baofengji-3.html">DS-700-4-BK</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('376','139','DS-500-01CB/AT','0.00','100','430','DS-500-01CB/AT','DS-500-01CB/AT','1','','1436626777','1436626777','   La máquina utiliza un built-in motor de accionamiento directo, con buen manejo y ahorro de energía, mejorar la eficiencia de procesamiento del producto, reducir los costos operativos.<br> <img alt="" src="/upload/Image/1/10.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Máquina de coser overlock</a>,<a href="Baofengji/Baofengji-3.html">DS-500-01CB/AT</a>,<br> <br> Anterior:<a href="Baofengji/Baofengji-16.html">DS-MX5200-4</a> próximo:none</p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('377','139','DS-700-4','0.00','100','431','DS-700-4','DS-700-4','1','','1436626782','1436626782','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Máquina de coser overlock</a>,<a href="Baofengji/Baofengji-4.html">DS-700-4</a>,<br> <br> Anterior:<a href="Baofengji/Baofengji-3.html">DS-700-4-BK</a> próximo:<a href="Baofengji/Baofengji-5.html">DS-700-4AT</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('378','139','DS-700-4AT','0.00','100','432','DS-700-4AT','DS-700-4AT','1','','1436626787','1436626787','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-700.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Máquina de coser overlock</a>,<a href="Baofengji/Baofengji-5.html">DS-700-4AT</a>,<br> <br> Anterior:<a href="Baofengji/Baofengji-4.html">DS-700-4</a> próximo:<a href="Baofengji/Baofengji-6.html">DS-700-5</a></p>  ','spain','','7','0','0');
INSERT INTO `pa_product` VALUES ('379','139','DS-700-5','0.00','100','433','DS-700-5','DS-700-5','1','','1436626791','1436626791','   <p>&nbsp;</p> <p>  <a href="Baofengji/">Máquina de coser overlock</a>,<a href="Baofengji/Baofengji-6.html">DS-700-5</a>,<br> <br> Anterior:<a href="Baofengji/Baofengji-5.html">DS-700-4AT</a> próximo:<a href="Baofengji/Baofengji-7.html">DS-737FS</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('380','139','DS-737FS','0.00','100','434','DS-737FS','DS-737FS','1','','1436626795','1436626795','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Máquina de coser overlock</a>,<a href="Baofengji/Baofengji-7.html">DS-737FS</a>,<br> <br> Anterior:<a href="Baofengji/Baofengji-6.html">DS-700-5</a> próximo:<a href="Baofengji/Baofengji-8.html">DS-737F</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('381','139','DS-737F','0.00','100','435','DS-737F','DS-737F','1','','1436626801','1436626801','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Máquina de coser overlock</a>,<a href="Baofengji/Baofengji-8.html">DS-737F</a>,<br> <br> Anterior:<a href="Baofengji/Baofengji-7.html">DS-737FS</a> próximo:<a href="Baofengji/Baofengji-9.html">DS-747F-AT</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('382','139','DS-747F-AT','0.00','100','436','DS-747F-AT','DS-747F-AT','1','','1436626806','1436626806','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Máquina de coser overlock</a>,<a href="Baofengji/Baofengji-9.html">DS-747F-AT</a>,<br> <br> Anterior:<a href="Baofengji/Baofengji-8.html">DS-737F</a> próximo:<a href="Baofengji/Baofengji-10.html">DS-747F-BK</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('383','139','DS-747F-BK','0.00','100','437','DS-747F-BK','DS-747F-BK','1','','1436626812','1436626812','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Máquina de coser overlock</a>,<a href="Baofengji/Baofengji-10.html">DS-747F-BK</a>,<br> <br> Anterior:<a href="Baofengji/Baofengji-9.html">DS-747F-AT</a> próximo:<a href="Baofengji/Baofengji-11.html">DS-747F-PK/SP</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('384','139','DS-747F-PK/SP','0.00','100','438','DS-747F-PK/SP','DS-747F-PK/SP','1','','1436626821','1436626821','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Máquina de coser overlock</a>,<a href="Baofengji/Baofengji-11.html">DS-747F-PK/SP</a>,<br> <br> Anterior:<a href="Baofengji/Baofengji-10.html">DS-747F-BK</a> próximo:<a href="Baofengji/Baofengji-12.html">DS-747F</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('385','139','DS-747F','0.00','100','439','DS-747F','DS-747F','1','','1436626829','1436626829','   <img alt="" src="/upload/Image/chanpin/liebiao/DS-747.jpg"> <p>&nbsp;</p> <p>  <a href="Baofengji/">Máquina de coser overlock</a>,<a href="Baofengji/Baofengji-12.html">DS-747F</a>,<br> <br> Anterior:<a href="Baofengji/Baofengji-11.html">DS-747F-PK/SP</a> próximo:<a href="Baofengji/Baofengji-13.html">DS-800-4</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('386','140','DS-1500','0.00','100','440','DS-1500','DS-1500','1','','1436626832','1436626832','   <p> DS-1500 Drum Stretch máquinas de coser Máquinas Varias equipado con una muy rica, con un resultado final el mecanismo de alimentación móvil, y puede adaptarse a todo tipo de prendas de punto, ropa deportiva, ropa de sport y otras especificaciones pueden estar al mismo nivel arbitrario de la operación de roscado, costura decorativa, como dobladillo del manguito, puede satisfacer plenamente los requisitos de la costura de alta calidad y diversa. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1500.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina de coser</a>,<a href="Bengfengji/Bengfengji-1.html">DS-1500</a>,<br> <br> Anterior:none próximo:<a href="Bengfengji/Bengfengji-2.html">DS-500-01CB/AT/EUT</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('387','140','DS-500-01CB/AT/EUT','0.00','100','441','DS-500-01CB/AT/EUT','DS-500-01CB/AT/EUT','1','','1436626836','1436626836','   <p> La alta velocidad de estiramiento plataforma de coser equipo máquina de coser para prendas de punto, principalmente adecuados para el tratamiento de los tipos de ropa interior de punto, y están equipadas con elevación automática del prensatelas, corte automático de la línea de montaje. Menos de inversión, la eficiencia de producción se mejora significativamente. El pedal de a caballo, sólo tiene que operar cuchillo eléctrico tangente aguja e hilo, hilo de ojo costura de alimentación (costura tenedor) cortó rápidamente. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-500-01CB-AT-EUT.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina de coser</a>,<a href="Bengfengji/Bengfengji-2.html">DS-500-01CB/AT/EUT</a>,<br> <br> Anterior:<a href="Bengfengji/Bengfengji-1.html">DS-1500</a> próximo:<a href="Bengfengji/Bengfengji-4.html">DS-500-01CB</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('388','140','DS-500-01CB','0.00','100','442','DS-500-01CB','DS-500-01CB','1','','1436626837','1436626837','   Esta serie de diversas máquinas extremadamente ricas, para adaptarse a una variedad de costura decorativa. Capaz de satisfacer la alta calidad y diversos requerimientos de costura. DS-500-01CB costura general, la barra de aguja forzado dispositivo de retorno de aceite para controlar la cantidad de aceite de barra de aguja, y suprimir las fugas del dispositivo de aceite de silicona superior e inferior, para evitar que la aguja fiebre y la desconexión; <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina de coser</a>,<a href="Bengfengji/Bengfengji-4.html">DS-500-01CB</a>,<br> <br> Anterior:<a href="Bengfengji/Bengfengji-2.html">DS-500-01CB/AT/EUT</a> próximo:<a href="Bengfengji/Bengfengji-5.html">DS-500-02BB</a></p>  ','spain','','8','0','0');
INSERT INTO `pa_product` VALUES ('389','140','DS-500-02BB','0.00','100','443','DS-500-02BB','DS-500-02BB','1','','1436626842','1436626842','   Esta máquina se puede instalar unidad de rodillos (líder), adecuado para las camisetas, ropa interior, trabajo barra estabilizadora. Especificaciones con los principales (volumen), el rango de tamaño, por lo que la máquina sin un líder. <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina de coser</a>,<a href="Bengfengji/Bengfengji-5.html">DS-500-02BB</a>,<br> <br> Anterior:<a href="Bengfengji/Bengfengji-4.html">DS-500-01CB</a> próximo:<a href="Bengfengji/Bengfengji-6.html">DS-500-04CB</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('390','140','DS-500-04CB','0.00','100','444','DS-500-04CB','DS-500-04CB','1','','1436626845','1436626845','   <p> De 4 pines y 6 de la máquina de coser tramo líneas para dos sin el paquete de costura costura o los trabajos de refuerzo de tela, tales como ropa interior y otras piezas de ropa interior (costuras entrepierna, etc) </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-500-01CB.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina de coser</a>,<a href="Bengfengji/Bengfengji-6.html">DS-500-04CB</a>,<br> <br> Anterior:<a href="Bengfengji/Bengfengji-5.html">DS-500-02BB</a> próximo:<a href="Bengfengji/Bengfengji-7.html">DS-500-05BB</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('391','140','DS-500-05BB','0.00','100','445','DS-500-05BB','DS-500-05BB','1','','1436626849','1436626849','   La máquina se puede utilizar para llamar a banda cintura elástica cosida. <img alt="" src="/upload/Image/1/11.jpg"> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina de coser</a>,<a href="Bengfengji/Bengfengji-7.html">DS-500-05BB</a>,<br> <br> Anterior:<a href="Bengfengji/Bengfengji-6.html">DS-500-04CB</a> próximo:<a href="Bengfengji/Bengfengji-8.html">DS-500-10SZ</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('392','140','DS-600-02BB','0.00','100','446','DS-600-02BB','DS-600-02BB','1','','1436626854','1436626854','   <p> Esta función está instalado el dispositivo de barra estabilizadora (del grifo), adecuado para las camisetas, ropa interior, rodillo de barras con las especificaciones del trabajo que lleva (volumen), el rango de tamaño de la máquina sin conducir. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-AT.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina de coser</a>,<a href="Bengfengji/Bengfengji-8.html">DS-600-02BB</a>,<br> <br> Anterior:<a href="Bengfengji/Bengfengji-18.html">DS-600-01CB/AT/EUT</a> próximo:<a href="Bengfengji/Bengfengji-3.html">DS-600-01CB/RP</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('393','140','DS-600-00CB-EUT','0.00','100','447','DS-600-00CB-EUT','DS-600-00CB-EUT','1','','1436626859','1436626859','   <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina de coser</a>,<a href="Bengfengji/Bengfengji-9.html">DS-600-00CB-EUT</a>,<br> <br> Anterior:<a href="Bengfengji/Bengfengji-8.html">DS-500-10SZ</a> próximo:<a href="Bengfengji/Bengfengji-10.html">DS-600-05GB</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('394','140','DS-600-05GB','0.00','100','448','DS-600-05GB','DS-600-05GB','1','','1436626865','1436626865','   <p> La máquina se puede utilizar para llamar a banda cintura elástica cosida. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-AT.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina de coser</a>,<a href="Bengfengji/Bengfengji-10.html">DS-600-05GB</a>,<br> <br> Anterior:<a href="Bengfengji/Bengfengji-9.html">DS-600-00CB-EUT</a> próximo:<a href="Bengfengji/Bengfengji-11.html">DS-600-35AC</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('395','140','DS-600-35AC','0.00','100','449','DS-600-35AC','DS-600-35AC','1','','1436626869','1436626869','   <p> La correa dejada la máquina material del ajuste del algodón el cortador y la instalación automática de la afluencia, puede permitir cerca al material del algodón no tener los fragmentos irregulares, así obtiene el efecto de adaptación artístico.Es conveniente en la camiseta, los plomos del círculo la ropa superior sin forro y así sucesivamente el material fino del vestido, el procedimiento de funcionamiento del cilindro material grueso del vestido que arruga. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-600-01CB-RP.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina de coser</a>,<a href="Bengfengji/Bengfengji-11.html">DS-600-35AC</a>,<br> <br> Anterior:<a href="Bengfengji/Bengfengji-10.html">DS-600-05GB</a> próximo:<a href="Bengfengji/Bengfengji-12.html">DS-62G-01MR-D-EN-AW</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('396','140','DS-62G-01MR-D-EN-AW','0.00','100','450','DS-62G-01MR-D-EN-AW','DS-62G-01MR-D-EN-AW','1','','1436626871','1436626871','   Máquina para hacer punto el proceso de costura debe modelos, de cuatro pines y seis carriles dedicados a su elasticidad único alto, el efecto patchwork y de alta intensidad plana, soporte barril y el japonés original de pie a pie prensatela en la lucha alta costura elástica telas y el Ministerio de tilo más fácil articulaciones correspondientes de un solo corte de doble corte de tejidos y el uso de diferentes partes del pie prensatelas aguja bits grupo de diversas especificaciones, así como con el motor servo pequeño fundida, la búsqueda de la alta costura, calidad y facilidad de vanguardia modelos. <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina de coser</a>,<a href="Bengfengji/Bengfengji-12.html">DS-62G-01MR-D-EN-AW</a>,<br> <br> Anterior:<a href="Bengfengji/Bengfengji-11.html">DS-600-35AC</a> próximo:<a href="Bengfengji/Bengfengji-13.html">DS-720-356T</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('397','140','DS-720-356T','0.00','100','451','DS-720-356T','DS-720-356T','1','','1436626872','1436626872','   Electromagnética prensatelas accionamiento directo pie elevador grupo no produce ruido y sensible. La inducción de cuerno tela permite overlock hueso enterrando más estable. El simple dobladillo ajustable inducido fácil función dobladillo. "Sealed" tapa lateral, resolver el problema de fuga de la cubierta lateral. Otro diseño especial cañón corto, la distancia desde el lado del cilindro hasta el borde del prensatelas, sólo 35 mm, haciendo que el funcionamiento sin problemas. Circunferencia de 182 mm con un diseño fino cilindro, cilindro de tejido de punto cosido de pequeño calibre, más conveniente. El hilo de la lanzadera hasta poner en el lado frontal del cuerpo, puede limpiar fácilmente el bobinado, fácil de ajustar. Frame puede ajustar con precisión el balance final sobre la línea, la tensión retractable para el resultado final, hacer más ajustes. El diferencial del eje de balancín del mecanismo de ajuste, proporcionando una alimentación totalmente diferencial. Tipo Rocker largo de puntada mecanismo de ajuste puede ser fácil y convenientemente ajustar la longitud de la puntada. Full-pieza de la portada, lo que elimina la necesidad de un problema de ajuste de montaje,. <p>&nbsp;</p> <p>  <a href="Bengfengji/">Estire máquina de coser</a>,<a href="Bengfengji/Bengfengji-13.html">DS-720-356T</a>,<br> <br> Anterior:<a href="Bengfengji/Bengfengji-12.html">DS-62G-01MR-D-EN-AW</a> próximo:<a href="Bengfengji/Bengfengji-24.html">DS-600-01CB-AT</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('398','141','DS-1790','0.00','100','452','DS-1790','DS-1790','1','','1436626874','1436626874','   <p>&nbsp;</p> <p>  <a href="tezhongji/">Máquina especial, máquina sincronizada</a>,<a href="tezhongji/tezhongji-2.html">DS-1790</a>,<br> <br> Anterior:none próximo:<a href="tezhongji/tezhongji-3.html">DS-1850</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('399','141','DS-1903A','0.00','100','453','DS-1903A','DS-1903A','1','','1436626879','1436626879','   <p> Para lograr la máxima velocidad de costura: 2700rpm. A través del desempeño de alta velocidad y rápida puesta en marcha y terminación de coser equipo nuevo impulso motor prensatelas automático mecanismo de elevación del pie, puede pasar de un segmento de viaje en el párrafo 2 de la carrera, acortando significativamente la hebilla. </p> <img alt="" src="/upload/image/1/16.jpg"> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1903A.jpg"> </p> <p>&nbsp;</p> <p>  <a href="tezhongji/">Máquina especial, máquina sincronizada</a>,<a href="tezhongji/tezhongji-3.html">DS-1903A</a>,<br> <br> Anterior:<a href="tezhongji/tezhongji-11.html">DS-9820</a> próximo:none</p>  ','spain','','7','0','0');
INSERT INTO `pa_product` VALUES ('400','141','DS-1900ASS','0.00','100','454','DS-1900ASS','DS-1900ASS','1','','1436626881','1436626881','   <p> Máximo 3.000 rpm de velocidad de costura, la terminación rápida de la costura, el pulso del motor, los pies prensatelas automático mecanismo de elevación, puede ser el punto más fácil de reconocer de la aguja. Cabeza de accionamiento directo, creando una vibración baja, de poco ruido, ambiente de trabajo agradable. Con el chip más importante del mundo importaciones, totalmente digital tecnología de precisión CNC, la máquina y un mejor rendimiento. </p> <p> <img alt="" src="/upload/image/1/15.jpg"> </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1900ASS.jpg"> </p> <p>&nbsp;</p> <p>  <a href="tezhongji/">Máquina especial, máquina sincronizada</a>,<a href="tezhongji/tezhongji-5.html">DS-1900ASS</a>,<br> <br> Anterior:<a href="tezhongji/tezhongji-3.html">DS-1850</a> próximo:<a href="tezhongji/tezhongji-6.html">DS-210D</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('401','141','DS-210D','0.00','100','455','DS-210D','DS-210D','1','','1436626885','1436626885','   <p> Mediante un mecanismo de alimentación de época XY, para lograr una costura patrón de alta precisión y alta velocidad de cosido, combinado con la velocidad rápida de alimentación de aire, la velocidad tangencial, acortar el tiempo de ciclo a ser la unidad cosido, directo para asegurar que una reacción rápida, reduciendo vibración y el ruido, el equipaje, la ropa de la industria para el remate decorativo costura eficiente equipo dedicado. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-210D.jpg"> </p> <p>&nbsp;</p> <p>  <a href="tezhongji/">Máquina especial, máquina sincronizada</a>,<a href="tezhongji/tezhongji-6.html">DS-210D</a>,<br> <br> Anterior:<a href="tezhongji/tezhongji-5.html">DS-1900ASS</a> próximo:<a href="tezhongji/tezhongji-7.html">DS-2516</a></p>  ','spain','','7','0','0');
INSERT INTO `pa_product` VALUES ('402','141','DS-2516','0.00','100','456','DS-2516','DS-2516','1','','1436626890','1436626890','   <p> Pionero en el uso de la pantalla táctil LCD, incluir imágenes e instrucciones chinos, facilidad de operación, actualización posterior mejora de 20 mm a 25 mm, prensatelas también se ha actualizado a 18 mm materiales de costura convenientes gruesas. Equipado con un sistema servo de la parte superior, junto con las funciones de apoyo, errores o fallos, la solución aparecerá automáticamente en la operación en la pantalla, el usuario puede prescribir el medicamento adecuado. </p> <img alt="" src="/upload/Image/1/14.jpg"> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2516.jpg"> </p> <p> <br> </p> <p>&nbsp;</p> <p>  <a href="tezhongji/">Máquina especial, máquina sincronizada</a>,<a href="tezhongji/tezhongji-7.html">DS-2516</a>,<br> <br> Anterior:<a href="tezhongji/tezhongji-6.html">DS-210D</a> próximo:<a href="tezhongji/tezhongji-8.html">DS-373</a></p>  ','spain','','7','0','0');
INSERT INTO `pa_product` VALUES ('403','141','DS-373','0.00','100','457','DS-373','DS-373','1','','1436626893','1436626893','   <p> Máquina plana grapa botón se utiliza principalmente para dos o cuatro agujeros, además de coser los botones de las uñas acompañada pecíolo y otro, por delgado y ligero, Dingkou tela gruesa. </p> <p> <img alt="" src="/upload/image/1/16.jpg"> </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-373.jpg"> </p> <p> <br> </p> <p>&nbsp;</p> <p>  <a href="tezhongji/">Máquina especial, máquina sincronizada</a>,<a href="tezhongji/tezhongji-8.html">DS-373</a>,<br> <br> Anterior:<a href="tezhongji/tezhongji-7.html">DS-2516</a> próximo:<a href="tezhongji/tezhongji-9.html">DS-781</a></p>  ','spain','','8','0','0');
INSERT INTO `pa_product` VALUES ('404','141','DS-781','0.00','100','458','DS-781','DS-781','1','','1436626896','1436626896','   <p> Botón de bloqueo agujero aplicable a todo tipo de géneros de punto, de algodón de coser, las telas de fibra química, material delgado, fuerte espesor. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-781.jpg"> </p> <p>&nbsp;</p> <p>  <a href="tezhongji/">Máquina especial, máquina sincronizada</a>,<a href="tezhongji/tezhongji-9.html">DS-781</a>,<br> <br> Anterior:<a href="tezhongji/tezhongji-8.html">DS-373</a> próximo:<a href="tezhongji/tezhongji-10.html">DS-808</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('405','141','DS-808','0.00','100','459','DS-808','DS-808','1','','1436626900','1436626900','   La máquina se aplica a todo tipo de prendas de vestir, prendas de vestir de punto, por la chaqueta, prendas de mezclilla, zapatos, sombreros y cuero, plásticos, productos de lona, grapadora varios botones, hebillas de metal Snap arte, hebilla jeans yRemaches, resortes, remaches zapatos. Material del paquete, siempre y cuando el ajuste del molde y un pequeño ajuste de la carrera, usted puede conseguir sus estándares de exigencias de calidad obligatorias para los distintos botones y diferentes espesores de la tela,Normas. <p>&nbsp;</p> <p>  <a href="tezhongji/">Máquina especial, máquina sincronizada</a>,<a href="tezhongji/tezhongji-10.html">DS-808</a>,<br> <br> Anterior:<a href="tezhongji/tezhongji-9.html">DS-781</a> próximo:<a href="tezhongji/tezhongji-11.html">DS-9820</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('406','141','DS-9820','0.00','100','460','DS-9820','DS-9820','1','','1436626906','1436626906','   Servo dispositivo de control de alimentación, costura patrón de la alta precisión y alta velocidad de costura o el espesor de coser no produce máquinas de coser electrónicas desviación a menudo offset. Exhaustiva comprobar el ruido generado por el dispositivo mecánico, para lograr más rápido y menos ruido en la velocidad de cosido. <p>&nbsp;</p> <p>  <a href="tezhongji/">Máquina especial, máquina sincronizada</a>,<a href="tezhongji/tezhongji-11.html">DS-9820</a>,<br> <br> Anterior:<a href="tezhongji/tezhongji-10.html">DS-808</a> próximo:<a href="tezhongji/tezhongji-3.html">DS-1903A</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('407','141','DS-1903A','0.00','100','461','DS-1903A','DS-1903A','1','','1436626909','1436626909','   <p> Para lograr la máxima velocidad de costura: 2700rpm. A través del desempeño de alta velocidad y rápida puesta en marcha y terminación de coser equipo nuevo impulso motor prensatelas automático mecanismo de elevación del pie, puede pasar de un segmento de viaje en el párrafo 2 de la carrera, acortando significativamente la hebilla. </p> <img alt="" src="/upload/image/1/16.jpg"> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1903A.jpg"> </p> <p>&nbsp;</p> <p>  <a href="tezhongji/">Máquina especial, máquina sincronizada</a>,<a href="tezhongji/tezhongji-3.html">DS-1903A</a>,<br> <br> Anterior:<a href="tezhongji/tezhongji-11.html">DS-9820</a> próximo:none</p>  ','spain','','8','0','0');
INSERT INTO `pa_product` VALUES ('408','142','DS-008VC','0.00','100','462','DS-008VC','DS-008VC','1','','1436626913','1436626913','   <p> Full-automatic da el aceite, cancela la organización longitudinal del movimiento de la aguja, el chasis del tubo, favores que adaptan la ropa del cilindro.Es la costura mecánica de la decoración conveniente en la ropa de alta calidad, unas 4 agujas, 6 agujas, 8 agujas, 12 agujas, 13 agujas y así sucesivamente el diverso tipo de la posición de la aguja, multi-agujas de la máquina, cose convenientemente, puede emparejar el mandril de bordear, la formación de proceso disponible, es equipo que arropa del ocio moderno el mejor. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-008VC.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Multi-aguja de la máquina</a>,<a href="Duozhenji/Duozhenji-1.html">DS-008VC</a>,<br> <br> Anterior:<a href="Duozhenji/Duozhenji-1.html">DS-1377</a> próximo:<a href="Duozhenji/Duozhenji-2.html">DS-1302</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('409','142','DS-008VC','0.00','100','463','DS-008VC','DS-008VC','1','','1436626917','1436626917','   <p> Full-automatic da el aceite, cancela la organización longitudinal del movimiento de la aguja, el chasis del tubo, favores que adaptan la ropa del cilindro.Es la costura mecánica de la decoración conveniente en la ropa de alta calidad, unas 4 agujas, 6 agujas, 8 agujas, 12 agujas, 13 agujas y así sucesivamente el diverso tipo de la posición de la aguja, multi-agujas de la máquina, cose convenientemente, puede emparejar el mandril de bordear, la formación de proceso disponible, es equipo que arropa del ocio moderno el mejor. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-008VC.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Multi-aguja de la máquina</a>,<a href="Duozhenji/Duozhenji-1.html">DS-008VC</a>,<br> <br> Anterior:<a href="Duozhenji/Duozhenji-1.html">DS-1377</a> próximo:<a href="Duozhenji/Duozhenji-2.html">DS-1302</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('410','142','DS-1302','0.00','100','464','DS-1302','DS-1302','1','','1436626920','1436626920','   <p> El tipo de la serie DS-1302 tiene cuatro clase de engranajes, la aguja que la energía potencial cose las 2, las 3, las 4, dientes de la consonancia del exterior de las 5.El Qu exterior exterior Ya, la forma florecida el diente de la consonancia, agrega por separado la nueva forma hoja-formada floja de la flor, la mayoría satisface el traje femenino, la ropa de los niños, el pañuelo, el mantel y así sucesivamente tiene la costura de la decoración del accesorio. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1302.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Multi-aguja de la máquina</a>,<a href="Duozhenji/Duozhenji-2.html">DS-1302</a>,<br> <br> Anterior:<a href="Duozhenji/Duozhenji-1.html">DS-008VC</a> próximo:<a href="Duozhenji/Duozhenji-3.html">DS-1433PSM</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('411','142','DS-1433PSM','0.00','100','465','DS-1433PSM','DS-1433PSM','1','','1436626925','1436626925','   <p> Es conveniente el fino hace punto las mercancías, el georgette del crepe, el material grueso tan bien como la decoración material de la costura de la firma y así sucesivamente que se adapta, pero el empalme rasante, saca el plisado, golpea el cable y así sucesivamente, en las aplicaciones de la bobina la línea de la PU del flujo; Si la línea específica del músculo del roble del uso de la bobina puede hacer la tensión al material fino para sacar el plisado para golpear el cable. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2000C.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Multi-aguja de la máquina</a>,<a href="Duozhenji/Duozhenji-3.html">DS-1433PSM</a>,<br> <br> Anterior:<a href="Duozhenji/Duozhenji-2.html">DS-1302</a> próximo:<a href="Duozhenji/Duozhenji-4.html">DS-1508P</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('412','142','DS-1508P','0.00','100','466','DS-1508P','DS-1508P','1','','1436626927','1436626927','   <p> Es adentro grueso conveniente cuenta con el material grueso, costura hemstitching del vaquero, en la cintura, en sewings mecánicos y así sucesivamente suelta y firmemente.Se convierte independientemente después de que el remolcador pueda garantizar cuando la operación de alta velocidad entrega el paño que se balanceará, la línea marca sea artístico. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2000C.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Multi-aguja de la máquina</a>,<a href="Duozhenji/Duozhenji-4.html">DS-1508P</a>,<br> <br> Anterior:<a href="Duozhenji/Duozhenji-3.html">DS-1433PSM</a> próximo:<a href="Duozhenji/Duozhenji-5.html">DS-2000C</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('413','142','DS-2000C','0.00','100','467','DS-2000C','DS-2000C','1','','1436626930','1436626930','   <p> <span style="color:#000000;" class="Apple-style-span"> </span></p> <pre>Delante de la correa cruz-punteaguda el cortador, cose el oído de los pantalones para utilizar. </pre> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-2000C.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Duozhenji/">Multi-aguja de la máquina</a>,<a href="Duozhenji/Duozhenji-5.html">DS-2000C</a>,<br> <br> Anterior:<a href="Duozhenji/Duozhenji-4.html">DS-1508P</a> próximo:none</p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('414','143','DS-20U23D','0.00','100','468','DS-20U23D','DS-20U23D','1','','1436626935','1436626935','   <p> Debido a la aguja de oscilación por el control del programa, flexibilidad correspondiente a un máximo de 100 especies de puntada de espiga. El sistema de control perfecto diseño estructura compacta, función perfecta, la entrada directa de libre programación, operación simple, y mejorar el rendimiento operativo y la eficiencia operativa. Panel de multifunción para fácil operación, incluso a alta velocidad para completar la costura precisa. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-20U23D.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Quzhefeng/">zigzag coser</a>,<a href="Quzhefeng/Quzhefeng-1.html">DS-20U23D</a>,<br> <br> Anterior:none próximo:<a href="Quzhefeng/Quzhefeng-2.html">DS-20U43</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('415','143','DS-20U43','0.00','100','469','DS-20U43','DS-20U43','1','','1436626939','1436626939','   <p> Costura fina, recta en un material grueso y curvado costura, bordado, patchwork, viradas, el paquete de la costura lateral con cremallera costura, patrón paquete Terrier costura cosiendo. Los bits de la matriz puede ser de izquierda, derecha, en la regulación, a los patrones decorativos de colores. Oculto enrollador, el mecanismo de retroceso. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-20U43.jpg"> </p> <p>&nbsp;</p> <p>  <a href="Quzhefeng/">zigzag coser</a>,<a href="Quzhefeng/Quzhefeng-2.html">DS-20U43</a>,<br> <br> Anterior:<a href="Quzhefeng/Quzhefeng-1.html">DS-20U23D</a> próximo:<a href="Quzhefeng/Quzhefeng-3.html">DS-2284</a></p>  ','spain','','7','0','0');
INSERT INTO `pa_product` VALUES ('416','143','DS-2284','0.00','100','470','DS-2284','DS-2284','1','','1436626942','1436626942','   La máquina utiliza una escobilla nueva rotación, incluso en muy baja tensión puede obtenerse con alta calidad y trazas estables. Eje gancho con el mecanismo de compensación, gancho de izquierda y derecha en la posición de línea de conexión igual a prevenir puentes, y la desconexión. Para tejidos elásticos, equipadas con un rastro del dispositivo de elevación del pie prensatelas flotará suavemente el pie prensatela, y luego cosiendo, cosiendo para calificar pista aspecto aseado. Especialmente diseñado bobinadora, más rápido y más cómodo de utilizar. <p>&nbsp;</p> <p>  <a href="Quzhefeng/">zigzag coser</a>,<a href="Quzhefeng/Quzhefeng-3.html">DS-2284</a>,<br> <br> Anterior:<a href="Quzhefeng/Quzhefeng-2.html">DS-20U43</a> próximo:none</p>  ','spain','','7','0','0');
INSERT INTO `pa_product` VALUES ('417','144','DS-CZD-3/103 RC-100/110','0.00','100','471','DS-CZD-3/103 RC-100/110','DS-CZD-3/103 RC-100/110','1','','1436626946','1436626946','   <p> El este avión puede cortar la intercomunicación 627X con la electricidad agraciada del caballero americano de Iraq para utilizar, para ser conveniente para el algodón y el kapoc, la lana, el cáñamo, la seda, la fibra química, el cortar material del grueso uniforme del cuero.Tiene la lubricación del centralismo, el margen es recto, también puede hacer que el radio pequeño de curvatura curva cortando, el de poco ruido, la revolución es constante, la comodidad de uso, la eficacia alta, el cuchillo automático del molino, motor eléctrico de la eficacia alta de las características de las aplicaciones y así sucesivamente, es la profesión de la ropa la mayoría de la herramienta que corta ideal. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-28.jpg"> </p> <p>&nbsp;</p> <p>  <a href="caijianji/">Máquina de corte, máquina de corte</a>,<a href="caijianji/caijianji-4.html">DS-CZD-3/103 RC-100/110</a>,<br> <br> Anterior:<a href="caijianji/caijianji-4.html">DS-911</a> próximo:<a href="caijianji/caijianji-3.html">DS-888</a></p>  ','spain','','7','0','0');
INSERT INTO `pa_product` VALUES ('418','144','DS-CZD-3/103 RC-100/110','0.00','100','472','DS-CZD-3/103 RC-100/110','DS-CZD-3/103 RC-100/110','1','','1436626950','1436626950','   <p> El este avión puede cortar la intercomunicación 627X con la electricidad agraciada del caballero americano de Iraq para utilizar, para ser conveniente para el algodón y el kapoc, la lana, el cáñamo, la seda, la fibra química, el cortar material del grueso uniforme del cuero.Tiene la lubricación del centralismo, el margen es recto, también puede hacer que el radio pequeño de curvatura curva cortando, el de poco ruido, la revolución es constante, la comodidad de uso, la eficacia alta, el cuchillo automático del molino, motor eléctrico de la eficacia alta de las características de las aplicaciones y así sucesivamente, es la profesión de la ropa la mayoría de la herramienta que corta ideal. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-28.jpg"> </p> <p>&nbsp;</p> <p>  <a href="caijianji/">Máquina de corte, máquina de corte</a>,<a href="caijianji/caijianji-4.html">DS-CZD-3/103 RC-100/110</a>,<br> <br> Anterior:<a href="caijianji/caijianji-4.html">DS-911</a> próximo:<a href="caijianji/caijianji-3.html">DS-888</a></p>  ','spain','','8','0','0');
INSERT INTO `pa_product` VALUES ('419','144','DS-888','0.00','100','473','DS-888','DS-888','1','','1436626954','1436626954','   DS-888 máquina de corte móvil es adecuado para una sola persona el funcionamiento, la nariz con elástico es de rebote, rieles con cuatro rodamientos en miniatura importados, es ideal para el algodón, lino, seda, tela cazadora, paño paraguas, plástico, tela, nylon, lona, etc encontrar el equipo necesario. <p>&nbsp;</p> <p>  <a href="caijianji/">Máquina de corte, máquina de corte</a>,<a href="caijianji/caijianji-3.html">DS-888</a>,<br> <br> Anterior:<a href="caijianji/caijianji-4.html">DS-CZD-3/103 RC-100/110</a> próximo:<a href="caijianji/caijianji-2.html">DS-CZD-3-103</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('420','144','DS-CZD-3-103','0.00','100','474','DS-CZD-3-103','DS-CZD-3-103','1','','1436626960','1436626960','   <p>&nbsp;</p> <p>  <a href="caijianji/">Máquina de corte, máquina de corte</a>,<a href="caijianji/caijianji-2.html">DS-CZD-3-103</a>,<br> <br> Anterior:<a href="caijianji/caijianji-3.html">DS-888</a> próximo:<a href="caijianji/caijianji-1.html">DS-RC-100-110</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('421','144','DS-RC-100-110','0.00','100','475','DS-RC-100-110','DS-RC-100-110','1','','1436626963','1436626963','   <p>&nbsp;</p> <p>  <a href="caijianji/">Máquina de corte, máquina de corte</a>,<a href="caijianji/caijianji-1.html">DS-RC-100-110</a>,<br> <br> Anterior:<a href="caijianji/caijianji-2.html">DS-CZD-3-103</a> próximo:none</p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('422','145','DS-310','0.00','100','476','DS-310','DS-310','1','','1436626966','1436626966','   <p>&nbsp;</p> <p>  <a href="yundou/">hierro</a>,<a href="yundou/yundou-1.html">DS-310</a>,<br> <br> Anterior:none próximo:<a href="yundou/yundou-2.html">DS-520</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('423','145','DS-520','0.00','100','477','DS-520','DS-520','1','','1436626968','1436626968','   <p>&nbsp;</p> <p>  <a href="yundou/">hierro</a>,<a href="yundou/yundou-2.html">DS-520</a>,<br> <br> Anterior:<a href="yundou/yundou-1.html">DS-310</a> próximo:<a href="yundou/yundou-3.html">DS-6PC-1</a></p>  ','spain','','7','0','0');
INSERT INTO `pa_product` VALUES ('424','145','DS-6PC-1','0.00','100','478','DS-6PC-1','DS-6PC-1','1','','1436626971','1436626971','   <p>&nbsp;</p> <p>  <a href="yundou/">hierro</a>,<a href="yundou/yundou-3.html">DS-6PC-1</a>,<br> <br> Anterior:<a href="yundou/yundou-2.html">DS-520</a> próximo:<a href="yundou/yundou-4.html">DS-94A</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('425','145','DS-94A','0.00','100','479','DS-94A','DS-94A','1','','1436626973','1436626973','   <p>&nbsp;</p> <p>  <a href="yundou/">hierro</a>,<a href="yundou/yundou-4.html">DS-94A</a>,<br> <br> Anterior:<a href="yundou/yundou-3.html">DS-6PC-1</a> próximo:<a href="yundou/yundou-5.html">Teflón botas de planchado cabeza</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('426','145','Teflón botas de planchado cabeza','0.00','100','480','Teflón botas de planchado cabeza','Teflón botas de planchado cabeza','1','','1436626976','1436626976','   <p>&nbsp;</p> <p>  <a href="yundou/">hierro</a>,<a href="yundou/yundou-5.html">Teflón botas de planchado cabeza</a>,<br> <br> Anterior:<a href="yundou/yundou-4.html">DS-94A</a> próximo:none</p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('427','146','DS-1380/1290/1680/1390','0.00','100','481','DS-1380/1290/1680/1390','DS-1380/1290/1680/1390','1','','1436626981','1436626981','   <p> Teclas del teléfono, las teclas de plástico translúcido, componentes electrónicos, circuitos integrados (IC), aparatos eléctricos, productos de comunicación, sanitarios, herramientas, accesorios, cuchillos, relojes, joyas ojos, partes de autos, hebillas de equipaje de utensilios de cocina, productos de acero inoxidable, etc industrias. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-1380.jpg"> </p> <p>&nbsp;</p> <p>  <a href="jiguangji/">Laser máquina</a>,<a href="jiguangji/jiguangji-1.html">DS-1380/1290/1680/1390</a>,<br> <br> Anterior:none próximo:<a href="jiguangji/jiguangji-2.html">DS-9060/8060/1080/1060</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('428','146','DS-9060/8060/1080/1060','0.00','100','482','DS-9060/8060/1080/1060','DS-9060/8060/1080/1060','1','','1436626984','1436626984','   <p> Teclas del teléfono, las teclas de plástico translúcido, componentes electrónicos, circuitos integrados (IC), aparatos eléctricos, productos de comunicación, sanitarios, herramientas, accesorios, cuchillos, relojes, joyas ojos, partes de autos, hebillas de equipaje de utensilios de cocina, productos de acero inoxidable, etc industrias. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-9060.jpg"> </p> <p>&nbsp;</p> <p>  <a href="jiguangji/">Laser máquina</a>,<a href="jiguangji/jiguangji-2.html">DS-9060/8060/1080/1060</a>,<br> <br> Anterior:<a href="jiguangji/jiguangji-1.html">DS-1380/1290/1680/1390</a> próximo:none</p>  ','spain','','7','0','0');
INSERT INTO `pa_product` VALUES ('429','147','DS-10S','0.00','100','483','DS-10S','DS-10S','1','','1436626986','1436626986','   El sub-línea de la máquina tirada dispositivo nuevo carrete;<br> Controlador de la unidad de tiempo simplemente puede ajustar la cantidad de enrollado;<br> Tamaño pequeño, peso ligero, fácil manejo;<br> Uso de un dispositivo micro y sinuoso juego es simple y conveniente;<br> De alta velocidad del molinete. <p>&nbsp;</p> <p>  <a href="fenxianji/">Sub-línea de la máquina</a>,<a href="fenxianji/fenxianji-2.html">DS-10S</a>,<br> <br> Anterior:none próximo:<a href="fenxianji/fenxianji-1.html">DS-20S-40C</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('430','147','DS-20S-40C','0.00','100','484','DS-20S-40C','DS-20S-40C','1','','1436626989','1436626989','   <p>&nbsp;</p> <p>  <a href="fenxianji/">Sub-línea de la máquina</a>,<a href="fenxianji/fenxianji-1.html">DS-20S-40C</a>,<br> <br> Anterior:<a href="fenxianji/fenxianji-2.html">DS-10S</a> próximo:none</p>  ','spain','','7','0','0');
INSERT INTO `pa_product` VALUES ('431','148','DS-1201','0.00','100','485','DS-1201','DS-1201','1','','1436626994','1436626994','   Cilíndrica MODELO TC en comparación con la estructura de los hogares luz mismo modelo de la máquina de la serie es el rendimiento constante, estable, con la flexibilidad de programación de la producción, propicio pequeño de un solo volumen de producción, pero también puede ser utilizado como dispositivo de pruebas. El bordado de la prenda marco MARCO ROPA T-shirts u otros requisitos bordado prendas para ofrecer una amplia gama de marcos. CAP bastidor para gorras sombreros bordados marco de ángulo de hasta 270 grados. Adecuado para bordado plano, plano bastidor de bordado PISO DE BORDADO piezas del bastidor de bordado de tela y otros productos semi-terminados. A: centralizado gancho línea B: C lineal guía: tijeras fuera del sistema de cizalla <p>&nbsp;</p> <p>  <a href="xiuhuaji/">máquina de bordar</a>,<a href="xiuhuaji/xiuhuaji-1.html">DS-1201</a>,<br> <br> Anterior:none próximo:<a href="xiuhuaji/xiuhuaji-2.html">DS-1204</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('432','148','DS-1204','0.00','100','486','DS-1204','DS-1204','1','','1436626996','1436626996','   <p>&nbsp;</p> <p>  <a href="xiuhuaji/">máquina de bordar</a>,<a href="xiuhuaji/xiuhuaji-2.html">DS-1204</a>,<br> <br> Anterior:<a href="xiuhuaji/xiuhuaji-1.html">DS-1201</a> próximo:<a href="xiuhuaji/xiuhuaji-3.html">DS-1208</a></p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('433','148','DS-1208','0.00','100','487','DS-1208','DS-1208','1','','1436626999','1436626999','   <p>&nbsp;</p> <p>  <a href="xiuhuaji/">máquina de bordar</a>,<a href="xiuhuaji/xiuhuaji-3.html">DS-1208</a>,<br> <br> Anterior:<a href="xiuhuaji/xiuhuaji-2.html">DS-1204</a> próximo:<a href="xiuhuaji/xiuhuaji-4.html">DS-1212</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('434','148','DS-1212','0.00','100','488','DS-1212','DS-1212','1','','1436627001','1436627001','   <p>&nbsp;</p> <p>  <a href="xiuhuaji/">máquina de bordar</a>,<a href="xiuhuaji/xiuhuaji-4.html">DS-1212</a>,<br> <br> Anterior:<a href="xiuhuaji/xiuhuaji-3.html">DS-1208</a> próximo:none</p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('435','149','DS-927','0.00','100','489','DS-927','DS-927','1','','1436627003','1436627003','   <p> Especialmente adecuado para camisas, chaquetas, jeans, ropa deportiva procesamiento fina, ropa gruesa, la estructura especial de sus mangas, pantalones de brazo cilíndrico tubular costura regazo sección. </p> <img alt="" src="/upload/image/1/21.jpg"> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-927-928.jpg"> </p> <p>&nbsp;</p> <p>  <a href="quwanji/">Qu máquina muñeca</a>,<a href="quwanji/quwanji-1.html">DS-927</a>,<br> <br> Anterior:none próximo:none</p>  ','spain','','6','0','0');
INSERT INTO `pa_product` VALUES ('436','151','DS-0303D-5','0.00','100','490','DS-0303D-5','DS-0303D-5','1','','1436627005','1436627005','   <p> Esta máquina adopta hilo enlace para llevar a la gran línea de gancho giratorio cresta, sistema de lubricación automática, la configuración del mecanismo de alimentación superior e inferior y el pie prensatelas alternativamente el mecanismo de elevación, la formación de 301 puntos de sutura. Costura capacidad, el buen desempeño de la capa de costura, dispositivo de lubricación automática, de poco ruido, larga vida útil, conveniente para el cuero, cuero artificial, tela, cojines, sofá, productos de equipaje. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-0303D-5.jpg"> </p> <p>&nbsp;</p> <p>  <a href="diannaopingfeng/">Computer máquina de coser</a>,<a href="diannaopingfeng/diannaopingfeng-1.html">DS-0303D-5</a>,<br> <br> Anterior:none próximo:<a href="diannaopingfeng/diannaopingfeng-2.html">DS-9600QGD-3N</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('437','151','DS-9600QGD-3N','0.00','100','491','DS-9600QGD-3N','DS-9600QGD-3N','1','','1436627007','1436627007','   <p> Utiliza el sistema de impulsión directa, reducido la ruta de transmisión, el comienzo ha sido liso, responde ágil, ha proporcionado el comienzo rápido y el motor exacto de la función, pinchada el efecto del paño para ser fino.El tipo interno vientos de Tíbet rosca la organización, el usuario puede actuar según el diverso requisito tecnológico para continuar puede la hipótesis selectiva, realzada la eficacia de trabajo grandemente, entrega el diente del paño altamente, el gradiente y la fase puede fácil ajustar.Es conveniente en el algodón material uniforme y el kapoc, lana, cáñamo, fibra química de las telas del grueso y así sucesivamente. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-9600QGD-3N.jpg"> </p> <p>&nbsp;</p> <p>  <a href="diannaopingfeng/">Computer máquina de coser</a>,<a href="diannaopingfeng/diannaopingfeng-2.html">DS-9600QGD-3N</a>,<br> <br> Anterior:<a href="diannaopingfeng/diannaopingfeng-1.html">DS-0303D-5</a> próximo:<a href="diannaopingfeng/diannaopingfeng-3.html">DS-9610QGD-3</a></p>  ','spain','','7','0','0');
INSERT INTO `pa_product` VALUES ('438','151','DS-9610QGD-3','0.00','100','492','DS-9610QGD-3','DS-9610QGD-3','1','','1436627008','1436627008','   <p> La serie de la máquina automática de cortahilos coser pespunte con cortahilos automático, automático de aguja poco número de aguja automático automáticamente una cuenta atrás de la costura trasera, auto-dial de la línea y otros modos de costura. Aplicado a coser camisas, ropa, camisetas, bolsos adecuados para coser, carteras, pantalones vaqueros y otros materiales pesados, especialmente adecuados para las marcas de costura, bolsillos, mangas y procesos capaces de alta calidad, alta costura trabajo de eficiencia . El nuevo integrado en la optimización directa servo drive diseño del motor, el diseño especial; lograr el efecto de ultra-baja vibración, silencio, los indicadores exceden los estándares nacionales de costura de la máquina, sus partes y componentes clave partes importadas, en gran medida ampliar la vida de servicio . </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-9610QGD-3.jpg"> </p> <p>&nbsp;</p> <p>  <a href="diannaopingfeng/">Computer máquina de coser</a>,<a href="diannaopingfeng/diannaopingfeng-3.html">DS-9610QGD-3</a>,<br> <br> Anterior:<a href="diannaopingfeng/diannaopingfeng-2.html">DS-9600QGD-3N</a> próximo:<a href="diannaopingfeng/diannaopingfeng-4.html">DS-9900QGD-3</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('439','151','DS-9900QGD-3','0.00','100','493','DS-9900QGD-3','DS-9900QGD-3','1','','1436627009','1436627009','   <p> La serie de la recortadora automática hilo pespunte barra de la aguja de máquina de coser sin aceite, con cortahilos automático, el número de bits de aguja automático de aguja automático, conteo automático Shun modos de coser pespunte. Aplicado a coser camisas, sudaderas, adecuado para coser bolsas, carteras, zapatos, pantalones vaqueros y otros materiales pesados, especialmente adecuados para coser marcas, bolsillos, mangas y procesos capaces de alta calidad, participar en el trabajo de costura eficiente . El built-in nuevo diseño del motor de accionamiento directo servo está optimizado, especialmente diseñado para lograr el efecto de ultra baja vibración, silencio, espacio operativo de los originales de alto 26cm largo 12cmm aumentado alto 30cm largo 14cm en el trabajo cómodo y más fácil.<br> <img alt="" src="/upload/Image/1/1.jpg"> </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-9900QGD-3.jpg"> </p> <p>&nbsp;</p> <p>  <a href="diannaopingfeng/">Computer máquina de coser</a>,<a href="diannaopingfeng/diannaopingfeng-4.html">DS-9900QGD-3</a>,<br> <br> Anterior:<a href="diannaopingfeng/diannaopingfeng-3.html">DS-9610QGD-3</a> próximo:<a href="diannaopingfeng/diannaopingfeng-5.html">DS-9910QGD-3</a></p>  ','spain','','5','0','0');
INSERT INTO `pa_product` VALUES ('440','151','DS-9910QGD-3','0.00','100','494','DS-9910QGD-3','DS-9910QGD-3','1','','1436627010','1436627010','   <p> Utiliza el sistema de impulsión directa, reduce la ruta de transmisión, el comienzo es liso, responde ágil, ha proporcionado el comienzo rápido y el motor exacto de la función, pincha el efecto del paño para ser fino.A estrenar adentro embutida el tipo tablero de amasamiento de la operación a insertar gravemente mejora el contacto que el hilo de rosca original fijó fácil convertirse en causas menos y así sucesivamente apretadas no buenas las preguntas, el disassemblage ha sido más conveniente.Entrega el diente del paño altamente, el gradiente y la fase puede fácil ajustar.Es conveniente en el algodón material uniforme y el kapoc, lana, cáñamo, fibra química de las telas del grueso y así sucesivamente. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-9910QGD-3.jpg"> </p> <p>&nbsp;</p> <p>  <a href="diannaopingfeng/">Computer máquina de coser</a>,<a href="diannaopingfeng/diannaopingfeng-5.html">DS-9910QGD-3</a>,<br> <br> Anterior:<a href="diannaopingfeng/diannaopingfeng-4.html">DS-9900QGD-3</a> próximo:none</p>  ','spain','','8','0','0');
INSERT INTO `pa_product` VALUES ('441','154','DS-0058-3','0.00','100','497','DS-0058-3','DS-0058-3','1','','1436627019','1436627019','   <p> La función de las vías de coser mismo tiempo, dos filas paralelas de doble cadena se aplica a la ropa, ropa interior, ropa de cama y un paquete delgado y productos de cuero regazo cargado costura. Espacio entre pines son cinco para elegir. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8600-J.jpg"> </p> <p>&nbsp;</p> <p>  <a href="shuangzhenji/">máquina de doble aguja</a>,<a href="shuangzhenji/shuangzhenji-1.html">DS-0058-3</a>,<br> <br> Anterior:none próximo:<a href="shuangzhenji/shuangzhenji-2.html">DS-0058</a></p>  ','spain','','9','0','0');
INSERT INTO `pa_product` VALUES ('442','154','DS-0058','0.00','100','498','DS-0058','DS-0058','1','','1436627021','1436627021','   <p> La función de las vías de coser mismo tiempo, dos filas paralelas de doble cadena se aplica a la ropa, ropa interior, ropa de cama y un paquete delgado y productos de cuero regazo cargado costura. Espacio entre pines son cinco para elegir. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8600-J.jpg"> </p> <p>&nbsp;</p> <p>  <a href="shuangzhenji/">máquina de doble aguja</a>,<a href="shuangzhenji/shuangzhenji-2.html">DS-0058</a>,<br> <br> Anterior:<a href="shuangzhenji/shuangzhenji-1.html">DS-0058-3</a> próximo:<a href="shuangzhenji/shuangzhenji-3.html">DS-8420</a></p>  ','spain','','9','0','0');
INSERT INTO `pa_product` VALUES ('443','154','DS-8420','0.00','100','499','DS-8420','DS-8420','1','','1436627027','1436627027','   <p> Esta máquina adopta dos agujas rectas, verticales automático gancho giratorio repostaje, hilo barra deslizante, constituyen dos líneas de una puntada de cadena doble. Arriba y abajo del eje correa de distribución. La barra de aguja oscilante forma de alimentación, el botón de la sección con la etiqueta del disco del largo de puntada y ha movilizado verter mecanismo de alimentación sin problemas. En el hilo de la bobina tire hacia atrás el resorte para asegurar que el efecto de la línea de fondo y líneas de superficie de costura constante. Aplicable a coser batas, uniformes, pantalones vaqueros, bolsos, costura decorativa. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8450.jpg"> </p> <p>&nbsp;</p> <p>  <a href="shuangzhenji/">máquina de doble aguja</a>,<a href="shuangzhenji/shuangzhenji-3.html">DS-8420</a>,<br> <br> Anterior:<a href="shuangzhenji/shuangzhenji-2.html">DS-0058</a> próximo:<a href="shuangzhenji/shuangzhenji-4.html">DS-8450</a></p>  ','spain','','9','0','0');
INSERT INTO `pa_product` VALUES ('444','154','DS-8450','0.00','100','500','DS-8450','DS-8450','1','','1436627032','1436627032','   <p> Esta máquina de una amplia gama de aplicaciones, principalmente utilizado para las camisas, uniformes, abrigos, ropa interior de mujer, chaquetas, pantalones vaqueros de costura. Esta máquina tiene un doble aguja aguja dividida estructura de barra, de modo que la máquina de coser alrededor de la esquina, el ángulo agudo, recto exacto costura, sincronizado palanca de alimentación de la máquina y de dientes de arrastre evita deslizamiento puntada de costura bonita y limpia. </p> <p> <img alt="" src="/upload/Image/chanpin/liebiao/DS-8450.jpg"> </p> <p>&nbsp;</p> <p>  <a href="shuangzhenji/">máquina de doble aguja</a>,<a href="shuangzhenji/shuangzhenji-4.html">DS-8450</a>,<br> <br> Anterior:<a href="shuangzhenji/shuangzhenji-3.html">DS-8420</a> próximo:none</p>  ','spain','','7','0','0');
INSERT INTO `pa_product` VALUES ('445','157','5800','0.00','100','503','5800','5800','1','','1436627043','1436627043','   <p>&nbsp;</p> <p>  <a href="jienengji/">Ahorro de energía de control eléctrico</a>,<a href="jienengji/jienengji-1.html">5800</a>,<br> <br> Anterior:none próximo:<a href="jienengji/jienengji-2.html">700</a></p>  ','spain','','11','0','0');
INSERT INTO `pa_product` VALUES ('446','157','700','0.00','100','504','700','700','1','','1436627046','1436627046','   <p>&nbsp;</p> <p>  <a href="jienengji/">Ahorro de energía de control eléctrico</a>,<a href="jienengji/jienengji-2.html">700</a>,<br> <br> Anterior:<a href="jienengji/jienengji-1.html">5800</a> próximo:<a href="jienengji/jienengji-4.html">800</a></p>  ','spain','','7','0','0');
INSERT INTO `pa_product` VALUES ('447','157','800','0.00','100','505','800','800','1','','1436627050','1436627050','   <p>&nbsp;</p> <p>  <a href="jienengji/">Ahorro de energía de control eléctrico</a>,<a href="jienengji/jienengji-4.html">800</a>,<br> <br> Anterior:<a href="jienengji/jienengji-2.html">700</a> próximo:<a href="jienengji/jienengji-5.html">988</a></p>  ','spain','','8','0','0');
INSERT INTO `pa_product` VALUES ('448','157','747','0.00','100','506','747','747','1','','1436627053','1436627053','   <p>&nbsp;</p> <p>  <a href="jienengji/">Ahorro de energía de control eléctrico</a>,<a href="jienengji/jienengji-5.html">747</a>,<br> <br> Anterior:<a href="jienengji/jienengji-7.html">MX6125</a> próximo:none</p>  ','spain','','7','0','0');
INSERT INTO `pa_product` VALUES ('449','157','DS-28','0.00','100','507','DS-28','DS-28','1','','1436627054','1436627054','   Capacidad de adaptación integral. Piso costura (aguja, aguja doble, gruesos). La costura paquete - tramo de costura - costura oscuro (unidad de conexión directa puede ser). Bajo nivel de ruido, vibración baja, ahorro de energía de hasta un 75% <p>&nbsp;</p> <p>  <a href="jienengji/">Ahorro de energía de control eléctrico</a>,<a href="jienengji/jienengji-6.html">DS-28</a>,<br> <br> Anterior:<a href="jienengji/jienengji-5.html">988</a> próximo:<a href="jienengji/jienengji-7.html">MX6125</a></p>  ','spain','','9','0','0');
INSERT INTO `pa_product` VALUES ('450','157','MX6125','0.00','100','508','MX6125','MX6125','1','','1436627057','1436627057','   <p>&nbsp;</p> <p>  <a href="jienengji/">Ahorro de energía de control eléctrico</a>,<a href="jienengji/jienengji-7.html">MX6125</a>,<br> <br> Anterior:<a href="jienengji/jienengji-6.html">DS-28</a> próximo:<a href="jienengji/jienengji-5.html">747</a></p>  ','spain','','8','0','0');
INSERT INTO `pa_product` VALUES ('451','157','747','0.00','100','509','747','747','1','','1436627062','1436627062','   <p>&nbsp;</p> <p>  <a href="jienengji/">Ahorro de energía de control eléctrico</a>,<a href="jienengji/jienengji-5.html">747</a>,<br> <br> Anterior:<a href="jienengji/jienengji-7.html">MX6125</a> próximo:none</p>  ','spain','','8','0','0');


# 数据库表：pa_role 数据信息
INSERT INTO `pa_role` VALUES ('1','超级管理员','0','1','系统内置超级管理员组，不受权限分配账号限制');
INSERT INTO `pa_role` VALUES ('2','管理员','1','1','拥有系统仅此于超级管理员的权限');
INSERT INTO `pa_role` VALUES ('3','领导','1','1','拥有所有操作的读权限，无增加、删除、修改的权限');
INSERT INTO `pa_role` VALUES ('4','测试组','1','1','测试');


# 数据库表：pa_role_user 数据信息
INSERT INTO `pa_role_user` VALUES ('3','4');


# 数据库表：pa_tag 数据信息
INSERT INTO `pa_tag` VALUES ('6','关于我们','aboutus','<h3> <img src="/newconist/Uploads/image/product/20140303/20140303081406_87297.jpg" width="100" height="100" align="left" alt="" /> </h3><p>  在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多<span></span></span></span></span></span></span></span></span></span></span></p>','zh-cn');


# 数据库表：pa_wxhd 数据信息
INSERT INTO `pa_wxhd` VALUES ('2','大森送好礼活动','1438272000','/Uploads/image/wxhd/20150726/20150726104804_70111.jpg','0','12','为了回馈广大用户，大森开展买一送一活动','活动介绍活动介绍&lt;span&gt;活动介绍活动介绍&lt;/span&gt;&lt;span&gt;活动介绍活动介绍&lt;/span&gt;&lt;span&gt;活动介绍活动介绍&lt;/span&gt;&lt;span&gt;活动介绍活动介绍&lt;/span&gt;&lt;span&gt;活动介绍活动介绍&lt;/span&gt;&lt;span&gt;活动介绍活动介绍&lt;/span&gt;&lt;span&gt;活动介绍活动介绍&lt;/span&gt;&lt;span&gt;活动介绍活动介绍&lt;/span&gt;&lt;span&gt;活动介绍活动介绍&lt;/span&gt;&lt;span&gt;活动介绍活动介绍&lt;/span&gt;&lt;span&gt;活动介绍活动介绍&lt;/span&gt;&lt;span&gt;活动介绍活动介绍&lt;/span&gt;&lt;span&gt;活动介绍活动介绍&lt;/span&gt;','1437900633','18382307095','');
INSERT INTO `pa_wxhd` VALUES ('3','大森买10台送3台活动','1438272000','/Uploads/image/wxhd/20150727/20150727171051_58142.jpg','0','20','1.从2015-07-25号开始我公司推出买10送3活动，欢迎广大消费者购买。
2.凡是分享和注册成功一个用户即可获得20积分。
3.满300积分即可获得小礼品一份','&lt;p&gt;
	&lt;strong&gt;&lt;span style=&quot;color:#FF9900;&quot;&gt;活动规则&lt;/span&gt;&lt;/strong&gt;
&lt;/p&gt;
&lt;p&gt;
	&lt;strong&gt;&lt;span style=&quot;color:#FF9900;&quot;&gt;&lt;span style=&quot;color:#FFE500;&quot;&gt;1.从2015-07-25号开始我公司推出买10送3活动，欢迎广大消费者购买。&lt;/span&gt;&lt;br /&gt;
&lt;span style=&quot;color:#FFE500;&quot;&gt;2.凡是分享和注册成功一个用户即可获得20积分。&lt;/span&gt;&lt;br /&gt;
&lt;span style=&quot;color:#FFE500;&quot;&gt;3.满300积分即可获得小礼品一份&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;
&lt;/p&gt;
&lt;p&gt;
	&lt;strong&gt;&lt;span&gt;&lt;span style=&quot;color:#FFFFFF;background-color:#E53333;&quot;&gt;4.&lt;/span&gt;&lt;/span&gt;&lt;span&gt;&lt;span style=&quot;color:#FFFFFF;background-color:#E53333;&quot;&gt;满20000积分赠送一台xxx缝纫机&lt;/span&gt;&lt;/span&gt;&lt;span&gt;&lt;span style=&quot;color:#FFFFFF;background-color:#E53333;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;
&lt;/p&gt;','1438010159','18382307092','');
