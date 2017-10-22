/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : xcms

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-10-22 20:12:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for common_dict
-- ----------------------------
DROP TABLE IF EXISTS `common_dict`;
CREATE TABLE `common_dict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pid` int(10) unsigned DEFAULT '0',
  `level` tinyint(2) DEFAULT NULL,
  `ident` varchar(20) DEFAULT NULL,
  `color` char(7) DEFAULT NULL,
  `is_sys` tinyint(1) DEFAULT '0',
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='通用字典表';

-- ----------------------------
-- Records of common_dict
-- ----------------------------
INSERT INTO `common_dict` VALUES ('1', '操作', '0', '1', 'sys_menu_auth', '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('2', '新增', '1', '2', 'insert', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('3', '编辑', '1', '2', 'update', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('4', '删除', '1', '2', 'del', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('5', '查看', '1', '2', 'look', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('9', '显示', '0', '1', 'display', '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('10', '显示', '9', '2', 'show', '#5cb85c', '0', '100');
INSERT INTO `common_dict` VALUES ('11', '隐藏', '9', '2', 'hide', '#d9534f', '0', '100');
INSERT INTO `common_dict` VALUES ('12', '配置项类型', '0', '1', 'config_type', '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('13', '文本', '12', '2', 'text', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('14', '单选', '12', '2', 'radio', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('15', '复选', '12', '2', 'checkbox', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('16', '下拉列表', '12', '2', 'select', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('17', '文本域', '12', '2', 'textarea', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('18', '用户状态', '0', '1', 'user_status', '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('19', '正常', '18', '2', 'normal', '#5cb85c', '0', '100');
INSERT INTO `common_dict` VALUES ('20', '冻结', '18', '2', 'forzen', '#d9534f', '0', '100');
INSERT INTO `common_dict` VALUES ('26', '位置', '0', '1', 'position', '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('27', '顶部', '26', '2', 'top', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('28', '底部', '26', '2', 'bottom', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('29', '打开方式', '0', '1', 'target', '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('30', '当前窗口', '29', '2', '_self', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('31', '新窗口', '29', '2', '_blank', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('32', '日志状态', '0', '1', 'log_status', '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('33', '成功', '32', '2', 'success', '#5cb85c', '0', '100');
INSERT INTO `common_dict` VALUES ('34', '失败', '32', '2', 'fail', '#d9534f', '0', '100');
INSERT INTO `common_dict` VALUES ('35', '用户类型', '0', '1', 'user_type', '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('36', '生产者', '35', '2', 'pro', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('37', '开发者', '35', '2', 'dev', '#d9534f', '0', '100');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `variable` varchar(100) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `param` varchar(100) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='基本配置表';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '标题', 'title', '轩宇网络工作室', 'base', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('2', '关键字', 'keywords', '', 'base', 'textarea', '', null, 'show', '100');
INSERT INTO `config` VALUES ('3', '描述', 'description', '', 'base', 'textarea', '', null, 'show', '100');
INSERT INTO `config` VALUES ('4', '版权', 'copyright', '@ 轩宇网络', 'base', 'text', '', null, 'show', '100');
INSERT INTO `config` VALUES ('5', '备案号', 'icp_num', '京ICP备15054430号-1', 'base', 'text', '', null, 'show', '100');
INSERT INTO `config` VALUES ('6', '统计/商桥', 'count_code', '', 'base', 'textarea', '', null, 'show', '100');
INSERT INTO `config` VALUES ('7', '状态', 'status', '1', 'status', 'radio', '1|正常,0|关闭', null, 'show', '100');
INSERT INTO `config` VALUES ('8', '关闭说明', 'close_explain', '网站升级，敬请期待！', 'status', 'textarea', '', null, 'show', '100');

-- ----------------------------
-- Table structure for config_group
-- ----------------------------
DROP TABLE IF EXISTS `config_group`;
CREATE TABLE `config_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统配置组';

-- ----------------------------
-- Records of config_group
-- ----------------------------
INSERT INTO `config_group` VALUES ('1', '基本配置', 'base', 'show', '100');
INSERT INTO `config_group` VALUES ('2', '网站状态', 'status', 'show', '100');

-- ----------------------------
-- Table structure for info_article
-- ----------------------------
DROP TABLE IF EXISTS `info_article`;
CREATE TABLE `info_article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `original_link` varchar(255) DEFAULT NULL,
  `auther` varchar(30) DEFAULT NULL,
  `thumb` int(10) DEFAULT NULL,
  `content` text,
  `target` varchar(10) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT '100',
  `create_time` int(10) DEFAULT NULL,
  `create_user` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `update_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='信息文章表';

-- ----------------------------
-- Records of info_article
-- ----------------------------
INSERT INTO `info_article` VALUES ('1', '5', '123124', '', '', '6', '', '_self', 'show', '100', '1508503903', null, null, null);

-- ----------------------------
-- Table structure for info_cases
-- ----------------------------
DROP TABLE IF EXISTS `info_cases`;
CREATE TABLE `info_cases` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `thumb` int(10) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `content` text,
  `target` varchar(10) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT '100',
  `create_time` int(10) DEFAULT NULL,
  `create_user` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `update_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='信息案例表';

-- ----------------------------
-- Records of info_cases
-- ----------------------------
INSERT INTO `info_cases` VALUES ('1', '2', '12345', '7', '3,4,5', '', '_self', 'show', '100', '1508503553', null, null, null);

-- ----------------------------
-- Table structure for info_category
-- ----------------------------
DROP TABLE IF EXISTS `info_category`;
CREATE TABLE `info_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pid` int(10) unsigned DEFAULT '0',
  `level` tinyint(2) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `dir` varchar(30) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(10) DEFAULT NULL,
  `seo_title` varchar(80) DEFAULT NULL,
  `seo_desc` varchar(200) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `is_add_next` tinyint(1) DEFAULT '1',
  `is_update` tinyint(1) DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='信息栏目表';

-- ----------------------------
-- Records of info_category
-- ----------------------------
INSERT INTO `info_category` VALUES ('1', '产品中心', '0', '1', '2', 'product', '', '_self', null, null, 'show', '100', '1', '1', '1');
INSERT INTO `info_category` VALUES ('2', '产品服务', '1', '2', '2', 'fuwu', '', '_self', null, null, 'show', '100', '1', '1', '1');
INSERT INTO `info_category` VALUES ('3', '新闻中心', '0', '1', '1', 'news', '', '_blank', null, null, 'show', '100', '1', '1', '1');
INSERT INTO `info_category` VALUES ('4', '行业动态', '3', '2', '1', '', '', '_self', null, null, 'show', '100', '1', '1', '1');
INSERT INTO `info_category` VALUES ('5', '帮助中心', '3', '2', '1', '', '', '_self', null, null, 'show', '100', '1', '1', '1');
INSERT INTO `info_category` VALUES ('6', '关于我们', '0', '1', '3', '', '', '_self', null, null, 'show', '100', '1', '1', '1');

-- ----------------------------
-- Table structure for info_category_adv
-- ----------------------------
DROP TABLE IF EXISTS `info_category_adv`;
CREATE TABLE `info_category_adv` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `ident` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `create_time` int(10) DEFAULT NULL,
  `create_user` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `update_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息栏目广告表';

-- ----------------------------
-- Records of info_category_adv
-- ----------------------------

-- ----------------------------
-- Table structure for info_model
-- ----------------------------
DROP TABLE IF EXISTS `info_model`;
CREATE TABLE `info_model` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(50) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL,
  `list_model` varchar(50) DEFAULT NULL,
  `detail_model` varchar(50) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='信息模型表';

-- ----------------------------
-- Records of info_model
-- ----------------------------
INSERT INTO `info_model` VALUES ('1', '文章', 'info_article', 'article', 'article/detail', 'show', '100');
INSERT INTO `info_model` VALUES ('2', '案例', 'info_cases', 'cases', 'cases/detail', 'show', '100');
INSERT INTO `info_model` VALUES ('3', '单页', 'info_page', 'page', '', 'show', '100');

-- ----------------------------
-- Table structure for info_page
-- ----------------------------
DROP TABLE IF EXISTS `info_page`;
CREATE TABLE `info_page` (
  `cid` int(10) unsigned NOT NULL,
  `content` text,
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息单页表';

-- ----------------------------
-- Records of info_page
-- ----------------------------
INSERT INTO `info_page` VALUES ('6', '<p>关于我们内容</p>', null);

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `thumb` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(10) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of link
-- ----------------------------

-- ----------------------------
-- Table structure for navigation
-- ----------------------------
DROP TABLE IF EXISTS `navigation`;
CREATE TABLE `navigation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pid` int(10) unsigned DEFAULT '0',
  `level` tinyint(2) DEFAULT NULL,
  `category` tinyint(10) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(10) DEFAULT NULL,
  `position` varchar(10) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `is_add_next` tinyint(1) DEFAULT '1',
  `is_update` tinyint(1) DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of navigation
-- ----------------------------

-- ----------------------------
-- Table structure for slide
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(10) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of slide
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `login_ip` varchar(20) DEFAULT NULL,
  `login_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统登录日志表';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('1', '4', '::1', '1506691157');
INSERT INTO `sys_login_log` VALUES ('2', '4', '::1', '1506736569');
INSERT INTO `sys_login_log` VALUES ('3', '4', '::1', '1506739359');
INSERT INTO `sys_login_log` VALUES ('4', '4', '::1', '1506745776');
INSERT INTO `sys_login_log` VALUES ('5', '4', '::1', '1506754980');
INSERT INTO `sys_login_log` VALUES ('6', '4', '::1', '1506774812');
INSERT INTO `sys_login_log` VALUES ('7', '4', '::1', '1508416123');
INSERT INTO `sys_login_log` VALUES ('8', '4', '::1', '1508503547');
INSERT INTO `sys_login_log` VALUES ('9', '4', '::1', '1508548296');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `is_menu` tinyint(1) DEFAULT '1',
  `icon` varchar(50) DEFAULT NULL,
  `pid` int(10) DEFAULT '0',
  `level` tinyint(2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `user_type` varchar(10) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '起始页', '1', 'fa fa-home', '0', '1', '', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('2', '系统管理', '1', 'fa fa-laptop', '0', '1', '', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('3', '内容管理', '1', 'fa fa-folder', '0', '1', '', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('4', '模块管理', '1', 'fa fa-th-large', '0', '1', '', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('7', '我的面板', '1', 'fa fa-list-alt', '1', '2', 'welcome', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('9', '配置组', '1', 'fa fa-cogs', '1', '2', 'config_group', '', 'dev', 'show', '200');
INSERT INTO `sys_menu` VALUES ('10', '配置项', '1', 'fa fa-cog', '1', '2', 'config_item', '', 'dev', 'show', '200');
INSERT INTO `sys_menu` VALUES ('11', '网站配置', '1', 'fa fa-cog', '2', '2', 'config', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('12', '栏目管理', '1', 'fa fa-columns', '3', '2', 'info_category', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('13', '信息管理', '1', 'fa fa-list', '3', '2', 'info', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('14', '模型管理', '1', 'fa fa-codepen', '3', '2', 'info_model', '', 'pro', 'show', '110');
INSERT INTO `sys_menu` VALUES ('15', '幻灯片', '1', 'fa fa-slideshare', '4', '2', 'slide', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('16', '菜单管理', '1', 'fa fa-bars', '1', '2', 'sys_menu', '', 'dev', 'show', '200');
INSERT INTO `sys_menu` VALUES ('17', '角色管理', '1', 'fa fa-users', '2', '2', 'sys_role', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('18', '用户管理', '1', 'fa fa-user', '2', '2', 'sys_user', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('31', '操作日志', '1', 'fa fa-list', '1', '2', 'sys_oplog', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('38', '文件管理', '1', 'fa fa-file-text-o', '4', '2', 'uploads', '', 'pro', 'hide', '120');
INSERT INTO `sys_menu` VALUES ('41', '导航管理', '1', 'fa fa-bars', '4', '2', 'navigation', '', 'pro', 'show', '130');
INSERT INTO `sys_menu` VALUES ('42', '友情链接', '1', 'fa fa-link', '4', '2', 'link', '', 'pro', 'show', '110');
INSERT INTO `sys_menu` VALUES ('48', '通用字典', '1', 'fa fa-book', '4', '2', 'common_dict', '', 'pro', 'show', '140');
INSERT INTO `sys_menu` VALUES ('50', '广告管理', '1', 'fa fa-image', '3', '2', 'info_category_adv', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('51', '角色权限', '0', 'fa fa-file-text', '17', '3', 'sys_role_auth', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('52', '用户权限', '0', 'fa fa-file-text', '18', '3', 'sys_user_auth', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('53', '文章', '0', 'fa fa-file-text', '13', '3', 'info_article', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('54', '案例', '0', 'fa fa-file-text', '13', '3', 'info_cases', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('55', '单页', '0', 'fa fa-file-text', '13', '3', 'info_page', '', 'pro', 'show', '100');

-- ----------------------------
-- Table structure for sys_menu_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_auth`;
CREATE TABLE `sys_menu_auth` (
  `sys_menu_id` int(10) NOT NULL,
  `sys_menu_auth` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统菜单权限表';

-- ----------------------------
-- Records of sys_menu_auth
-- ----------------------------
INSERT INTO `sys_menu_auth` VALUES ('7', 'look');
INSERT INTO `sys_menu_auth` VALUES ('13', 'look');
INSERT INTO `sys_menu_auth` VALUES ('13', 'del');
INSERT INTO `sys_menu_auth` VALUES ('13', 'update');
INSERT INTO `sys_menu_auth` VALUES ('13', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('9', 'look');
INSERT INTO `sys_menu_auth` VALUES ('9', 'del');
INSERT INTO `sys_menu_auth` VALUES ('9', 'update');
INSERT INTO `sys_menu_auth` VALUES ('9', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('10', 'look');
INSERT INTO `sys_menu_auth` VALUES ('10', 'del');
INSERT INTO `sys_menu_auth` VALUES ('10', 'update');
INSERT INTO `sys_menu_auth` VALUES ('10', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('17', 'look');
INSERT INTO `sys_menu_auth` VALUES ('17', 'del');
INSERT INTO `sys_menu_auth` VALUES ('18', 'look');
INSERT INTO `sys_menu_auth` VALUES ('18', 'del');
INSERT INTO `sys_menu_auth` VALUES ('18', 'update');
INSERT INTO `sys_menu_auth` VALUES ('18', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('12', 'look');
INSERT INTO `sys_menu_auth` VALUES ('12', 'del');
INSERT INTO `sys_menu_auth` VALUES ('12', 'update');
INSERT INTO `sys_menu_auth` VALUES ('12', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('14', 'look');
INSERT INTO `sys_menu_auth` VALUES ('14', 'del');
INSERT INTO `sys_menu_auth` VALUES ('14', 'update');
INSERT INTO `sys_menu_auth` VALUES ('14', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('15', 'del');
INSERT INTO `sys_menu_auth` VALUES ('15', 'update');
INSERT INTO `sys_menu_auth` VALUES ('15', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('16', 'look');
INSERT INTO `sys_menu_auth` VALUES ('16', 'del');
INSERT INTO `sys_menu_auth` VALUES ('16', 'update');
INSERT INTO `sys_menu_auth` VALUES ('16', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('31', 'look');
INSERT INTO `sys_menu_auth` VALUES ('31', 'del');
INSERT INTO `sys_menu_auth` VALUES ('11', 'look');
INSERT INTO `sys_menu_auth` VALUES ('33', 'look');
INSERT INTO `sys_menu_auth` VALUES ('33', 'del');
INSERT INTO `sys_menu_auth` VALUES ('33', 'update');
INSERT INTO `sys_menu_auth` VALUES ('33', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('35', 'look');
INSERT INTO `sys_menu_auth` VALUES ('35', 'update');
INSERT INTO `sys_menu_auth` VALUES ('36', 'look');
INSERT INTO `sys_menu_auth` VALUES ('36', 'update');
INSERT INTO `sys_menu_auth` VALUES ('37', 'look');
INSERT INTO `sys_menu_auth` VALUES ('37', 'del');
INSERT INTO `sys_menu_auth` VALUES ('37', 'update');
INSERT INTO `sys_menu_auth` VALUES ('37', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('38', 'look');
INSERT INTO `sys_menu_auth` VALUES ('38', 'del');
INSERT INTO `sys_menu_auth` VALUES ('17', 'update');
INSERT INTO `sys_menu_auth` VALUES ('11', 'update');
INSERT INTO `sys_menu_auth` VALUES ('17', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('15', 'look');
INSERT INTO `sys_menu_auth` VALUES ('41', 'look');
INSERT INTO `sys_menu_auth` VALUES ('41', 'del');
INSERT INTO `sys_menu_auth` VALUES ('41', 'update');
INSERT INTO `sys_menu_auth` VALUES ('41', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('42', 'look');
INSERT INTO `sys_menu_auth` VALUES ('42', 'del');
INSERT INTO `sys_menu_auth` VALUES ('42', 'update');
INSERT INTO `sys_menu_auth` VALUES ('42', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('44', 'look');
INSERT INTO `sys_menu_auth` VALUES ('44', 'del');
INSERT INTO `sys_menu_auth` VALUES ('44', 'update');
INSERT INTO `sys_menu_auth` VALUES ('44', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('45', 'look');
INSERT INTO `sys_menu_auth` VALUES ('45', 'del');
INSERT INTO `sys_menu_auth` VALUES ('45', 'update');
INSERT INTO `sys_menu_auth` VALUES ('45', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('46', 'look');
INSERT INTO `sys_menu_auth` VALUES ('46', 'del');
INSERT INTO `sys_menu_auth` VALUES ('46', 'update');
INSERT INTO `sys_menu_auth` VALUES ('46', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('48', 'look');
INSERT INTO `sys_menu_auth` VALUES ('48', 'del');
INSERT INTO `sys_menu_auth` VALUES ('48', 'update');
INSERT INTO `sys_menu_auth` VALUES ('48', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('50', 'look');
INSERT INTO `sys_menu_auth` VALUES ('50', 'del');
INSERT INTO `sys_menu_auth` VALUES ('50', 'update');
INSERT INTO `sys_menu_auth` VALUES ('50', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('53', 'look');
INSERT INTO `sys_menu_auth` VALUES ('53', 'del');
INSERT INTO `sys_menu_auth` VALUES ('53', 'update');
INSERT INTO `sys_menu_auth` VALUES ('53', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('54', 'look');
INSERT INTO `sys_menu_auth` VALUES ('54', 'del');
INSERT INTO `sys_menu_auth` VALUES ('54', 'update');
INSERT INTO `sys_menu_auth` VALUES ('54', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('51', 'update');
INSERT INTO `sys_menu_auth` VALUES ('52', 'update');
INSERT INTO `sys_menu_auth` VALUES ('55', 'look');
INSERT INTO `sys_menu_auth` VALUES ('55', 'update');

-- ----------------------------
-- Table structure for sys_oplog
-- ----------------------------
DROP TABLE IF EXISTS `sys_oplog`;
CREATE TABLE `sys_oplog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `menu_name` varchar(10) DEFAULT NULL,
  `opera` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `browser` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `hostname` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
-- Records of sys_oplog
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `role_type` tinyint(1) DEFAULT '2' COMMENT '角色类型：0=开发者，1=超级管理员【拥有所有生产者的权限】，2=普通管理员',
  `remark` varchar(100) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '1', '拥有所有权限', '100');
INSERT INTO `sys_role` VALUES ('3', '演示', '2', '演示使用', '100');
INSERT INTO `sys_role` VALUES ('4', '开发者', '0', '开发者', '100');

-- ----------------------------
-- Table structure for sys_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_auth`;
CREATE TABLE `sys_role_auth` (
  `role_id` int(10) DEFAULT NULL,
  `sys_menu_id` int(10) DEFAULT NULL,
  `sys_menu_auth` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统角色权限表';

-- ----------------------------
-- Records of sys_role_auth
-- ----------------------------
INSERT INTO `sys_role_auth` VALUES ('2', '12', 'update');
INSERT INTO `sys_role_auth` VALUES ('2', '12', 'del');
INSERT INTO `sys_role_auth` VALUES ('2', '12', 'look');
INSERT INTO `sys_role_auth` VALUES ('2', '13', 'insert');
INSERT INTO `sys_role_auth` VALUES ('2', '13', 'update');
INSERT INTO `sys_role_auth` VALUES ('2', '13', 'del');
INSERT INTO `sys_role_auth` VALUES ('2', '20', '');
INSERT INTO `sys_role_auth` VALUES ('2', '24', 'update');
INSERT INTO `sys_role_auth` VALUES ('2', '24', 'look');
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'insert');
INSERT INTO `sys_role_auth` VALUES ('3', '1', '');
INSERT INTO `sys_role_auth` VALUES ('3', '31', 'del');
INSERT INTO `sys_role_auth` VALUES ('3', '2', '');
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'update');
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'del');
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'look');
INSERT INTO `sys_role_auth` VALUES ('2', '4', '');
INSERT INTO `sys_role_auth` VALUES ('2', '15', 'insert');
INSERT INTO `sys_role_auth` VALUES ('2', '15', 'update');
INSERT INTO `sys_role_auth` VALUES ('2', '15', 'del');
INSERT INTO `sys_role_auth` VALUES ('2', '15', 'look');
INSERT INTO `sys_role_auth` VALUES ('2', '12', 'insert');
INSERT INTO `sys_role_auth` VALUES ('2', '3', '');
INSERT INTO `sys_role_auth` VALUES ('2', '11', 'look');
INSERT INTO `sys_role_auth` VALUES ('2', '11', 'update');
INSERT INTO `sys_role_auth` VALUES ('2', '2', '');
INSERT INTO `sys_role_auth` VALUES ('3', '11', 'look');
INSERT INTO `sys_role_auth` VALUES ('3', '11', 'update');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'del');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'insert');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'look');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'update');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'del');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'insert');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'look');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'update');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `user_type` tinyint(1) DEFAULT '2' COMMENT '用户类型：0=开发者，1=系统默认，2=普通',
  `password` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `status` char(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('2', '1', 'admin', '1', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'normal');
INSERT INTO `sys_user` VALUES ('3', '3', 'demo', '2', 'e10adc3949ba59abbe56e057f20f883e', 'demo', null, null, 'normal');
INSERT INTO `sys_user` VALUES ('4', '4', 'xadmin', '0', 'e10adc3949ba59abbe56e057f20f883e', 'Meng Xianghan', '开发者', null, 'normal');

-- ----------------------------
-- Table structure for sys_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_auth`;
CREATE TABLE `sys_user_auth` (
  `user_id` int(10) DEFAULT NULL,
  `sys_menu_id` int(10) DEFAULT NULL,
  `sys_menu_auth` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统用户权限表';

-- ----------------------------
-- Records of sys_user_auth
-- ----------------------------
INSERT INTO `sys_user_auth` VALUES ('6', '38', 'look');
INSERT INTO `sys_user_auth` VALUES ('6', '38', 'del');
INSERT INTO `sys_user_auth` VALUES ('6', '15', 'update');
INSERT INTO `sys_user_auth` VALUES ('6', '15', 'look');
INSERT INTO `sys_user_auth` VALUES ('6', '15', 'insert');
INSERT INTO `sys_user_auth` VALUES ('6', '15', 'del');
INSERT INTO `sys_user_auth` VALUES ('6', '4', '');

-- ----------------------------
-- Table structure for uploads
-- ----------------------------
DROP TABLE IF EXISTS `uploads`;
CREATE TABLE `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_type` varchar(50) DEFAULT NULL COMMENT '文件类型【MIME】',
  `abs_path_dir` varchar(255) DEFAULT NULL COMMENT '绝对路径目录',
  `abs_path` varchar(255) DEFAULT NULL COMMENT '绝对路径',
  `rel_path_dir` varchar(255) DEFAULT NULL COMMENT '相对路径目录',
  `rel_path` varchar(255) DEFAULT NULL COMMENT '相对路径',
  `raw_name` varchar(255) DEFAULT NULL COMMENT '文件名，不含后缀名',
  `raw_rel_path` varchar(255) DEFAULT NULL COMMENT '相对路径，不含后缀名',
  `orig_name` varchar(255) DEFAULT NULL COMMENT '原始的文件名',
  `client_name` varchar(255) DEFAULT NULL COMMENT '用户提交过来的文件名',
  `file_ext` varchar(10) DEFAULT NULL COMMENT '文件后缀名，包括句点',
  `file_size` double(20,2) DEFAULT NULL COMMENT '文件大小（单位 kb）',
  `is_image` tinyint(1) DEFAULT NULL COMMENT '文件是否为图片（1 = image. 0 = not.）',
  `image_width` tinyint(20) DEFAULT NULL COMMENT '图片宽度',
  `image_height` tinyint(20) DEFAULT NULL COMMENT '图片高度',
  `image_type` varchar(50) DEFAULT NULL COMMENT '图片类型（通常是不带句点的文件后缀名）',
  `image_size_str` varchar(100) DEFAULT NULL COMMENT '一个包含了图片宽度和高度的字符串（用于放在 image 标签中）',
  `errors` varchar(255) DEFAULT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='上传文件表';

-- ----------------------------
-- Records of uploads
-- ----------------------------
INSERT INTO `uploads` VALUES ('1', 'b9e23b5c278c0f238f3217e444ba0ee1.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170930/', 'D:/wamp/www/uploads/upload/20170930/b9e23b5c278c0f238f3217e444ba0ee1.jpg', '/uploads/upload/20170930/', '/uploads/upload/20170930/b9e23b5c278c0f238f3217e444ba0ee1.jpg', 'b9e23b5c278c0f238f3217e444ba0ee1', '/uploads/upload/20170930/b9e23b5c278c0f238f3217e444ba0ee1', 'b9e23b5c278c0f238f3217e444ba0ee1.jpg', '59ad05bdNae81e2b2.jpg', '.jpg', '189.91', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('2', '33d177d5d1c42db9b24c007fd6ef4d48.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20171020/', 'D:/wamp/www/uploads/upload/20171020/33d177d5d1c42db9b24c007fd6ef4d48.jpg', '/uploads/upload/20171020/', '/uploads/upload/20171020/33d177d5d1c42db9b24c007fd6ef4d48.jpg', '33d177d5d1c42db9b24c007fd6ef4d48', '/uploads/upload/20171020/33d177d5d1c42db9b24c007fd6ef4d48', '33d177d5d1c42db9b24c007fd6ef4d48.jpg', '59a65fc3Na16894cb.jpg', '.jpg', '132.85', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('3', 'a6bb7d26a8e54095ae30ec6bb421604d.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20171020/', 'D:/wamp/www/uploads/upload/20171020/a6bb7d26a8e54095ae30ec6bb421604d.jpg', '/uploads/upload/20171020/', '/uploads/upload/20171020/a6bb7d26a8e54095ae30ec6bb421604d.jpg', 'a6bb7d26a8e54095ae30ec6bb421604d', '/uploads/upload/20171020/a6bb7d26a8e54095ae30ec6bb421604d', 'a6bb7d26a8e54095ae30ec6bb421604d.jpg', '59ace85aNf6612abe.jpg', '.jpg', '64.76', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('4', '94e9a04b72b05a7e3f033b2914ff6886.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20171020/', 'D:/wamp/www/uploads/upload/20171020/94e9a04b72b05a7e3f033b2914ff6886.jpg', '/uploads/upload/20171020/', '/uploads/upload/20171020/94e9a04b72b05a7e3f033b2914ff6886.jpg', '94e9a04b72b05a7e3f033b2914ff6886', '/uploads/upload/20171020/94e9a04b72b05a7e3f033b2914ff6886', '94e9a04b72b05a7e3f033b2914ff6886.jpg', '59ad20b0Ne7fda0f0.jpg', '.jpg', '95.12', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('5', '7d79a11e12cd8ad87860d93db0f83dc3.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20171020/', 'D:/wamp/www/uploads/upload/20171020/7d79a11e12cd8ad87860d93db0f83dc3.jpg', '/uploads/upload/20171020/', '/uploads/upload/20171020/7d79a11e12cd8ad87860d93db0f83dc3.jpg', '7d79a11e12cd8ad87860d93db0f83dc3', '/uploads/upload/20171020/7d79a11e12cd8ad87860d93db0f83dc3', '7d79a11e12cd8ad87860d93db0f83dc3.jpg', '59ad205aN2f73c174.jpg', '.jpg', '148.52', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('6', '4594e0810e3359ba3ee598e2a5f1f437.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20171020/', 'D:/wamp/www/uploads/upload/20171020/4594e0810e3359ba3ee598e2a5f1f437.jpg', '/uploads/upload/20171020/', '/uploads/upload/20171020/4594e0810e3359ba3ee598e2a5f1f437.jpg', '4594e0810e3359ba3ee598e2a5f1f437', '/uploads/upload/20171020/4594e0810e3359ba3ee598e2a5f1f437', '4594e0810e3359ba3ee598e2a5f1f437.jpg', '59a65fc3Na16894cb.jpg', '.jpg', '132.85', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('7', '1b16e684093528dd45adfb3dc871dd59.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20171020/', 'D:/wamp/www/uploads/upload/20171020/1b16e684093528dd45adfb3dc871dd59.jpg', '/uploads/upload/20171020/', '/uploads/upload/20171020/1b16e684093528dd45adfb3dc871dd59.jpg', '1b16e684093528dd45adfb3dc871dd59', '/uploads/upload/20171020/1b16e684093528dd45adfb3dc871dd59', '1b16e684093528dd45adfb3dc871dd59.jpg', 'logo-001.jpg', '.jpg', '21.01', '1', '127', '127', 'jpeg', 'width=\"640\" height=\"640\"', null);
