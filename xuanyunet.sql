/*
Navicat MySQL Data Transfer

Source Server         : wamp
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : xuanyunet

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-10-28 18:17:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `config_group_id` int(10) DEFAULT NULL COMMENT '配置组标识',
  `type` varchar(50) DEFAULT NULL COMMENT '配置项类型',
  `param` varchar(100) DEFAULT NULL COMMENT '参数',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) unsigned DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='基本配置表';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '标题', 'title', 'MCMS演示站', '1', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('2', '关键字', 'keywords', '', '1', 'textarea', '', '', 'show', '100');
INSERT INTO `config` VALUES ('3', '描述', 'description', '', '1', 'textarea', '', '', 'show', '100');
INSERT INTO `config` VALUES ('4', '版权', 'copyright', '© Copyright 2015 轩宇网络 All Rights Reserved', '1', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('5', '备案号', 'icp_num', '京ICP备15054430号-1', '1', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('6', '统计代码', 'count_code', '', '1', 'textarea', '', '', 'show', '100');
INSERT INTO `config` VALUES ('7', '状态', 'status', '1', '2', 'radio', '1|正常,0|关闭', '', 'show', '100');
INSERT INTO `config` VALUES ('8', '关闭说明', 'close_explain', '网站升级，敬请期待！', '2', 'textarea', '', '', 'show', '100');

-- ----------------------------
-- Table structure for config_group
-- ----------------------------
DROP TABLE IF EXISTS `config_group`;
CREATE TABLE `config_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` int(10) DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='配置组';

-- ----------------------------
-- Records of config_group
-- ----------------------------
INSERT INTO `config_group` VALUES ('1', '基本配置', 'show', '', '100');
INSERT INTO `config_group` VALUES ('2', '网站状态', 'show', '', '100');

-- ----------------------------
-- Table structure for info_article
-- ----------------------------
DROP TABLE IF EXISTS `info_article`;
CREATE TABLE `info_article` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `cid` int(10) DEFAULT NULL COMMENT '信息栏目标识',
  `title` varchar(500) DEFAULT NULL COMMENT '标题',
  `image` int(10) DEFAULT NULL COMMENT '上传图片标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '摘要',
  `content` text COMMENT '内容',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='信息文章表';

-- ----------------------------
-- Records of info_article
-- ----------------------------
INSERT INTO `info_article` VALUES ('7', '7', '测试信息1', '3', null, '<p>测试信息1</p>', 'show', '100', null, null, '1477621922', null);

-- ----------------------------
-- Table structure for info_banner
-- ----------------------------
DROP TABLE IF EXISTS `info_banner`;
CREATE TABLE `info_banner` (
  `cid` int(10) NOT NULL COMMENT '信息栏目标识',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `image` int(10) DEFAULT NULL COMMENT '上传文件标识',
  `url` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息栏目Banner表';

-- ----------------------------
-- Records of info_banner
-- ----------------------------

-- ----------------------------
-- Table structure for info_col
-- ----------------------------
DROP TABLE IF EXISTS `info_col`;
CREATE TABLE `info_col` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `ident` varchar(50) DEFAULT NULL COMMENT '唯一标识',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '分类所属上级标识【默认0】',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别【从0开始】',
  `info_type_id` int(11) DEFAULT NULL COMMENT '信息类型标识',
  `url` varchar(255) DEFAULT NULL COMMENT '链接【设置后分类将使用此url】',
  `pic` varchar(10) DEFAULT NULL COMMENT '图片：nopic=无图，onepic=单图，muitipic=多图',
  `seo_title` varchar(80) DEFAULT NULL COMMENT 'SEO标题',
  `seo_desc` varchar(200) DEFAULT NULL COMMENT 'SEO描述',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `location` varchar(20) DEFAULT NULL COMMENT '栏目位置',
  `target` varchar(10) DEFAULT NULL COMMENT 'url打开方式',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  `add_next_auth` tinyint(1) DEFAULT '1' COMMENT '新增下级权限：0=禁止，1=允许',
  `edit_auth` tinyint(1) DEFAULT '1' COMMENT '编辑权限：0=禁止，1=允许',
  `del_auth` tinyint(1) DEFAULT '1' COMMENT '删除权限：0=禁止，1=允许',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='信息栏目表';

-- ----------------------------
-- Records of info_col
-- ----------------------------
INSERT INTO `info_col` VALUES ('1', '关于我们', '', '0', '1', '0', 'http://www.baidu.com/', 'onepic', null, null, '', '', '_blank', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('2', '产品中心', null, '0', '1', '2', null, 'onepic', null, null, '', null, null, 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('3', '新闻资讯', null, '0', '1', '0', null, 'onepic', null, null, '', null, null, 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('4', '联系我们', null, '0', '1', '1', null, 'onepic', null, null, '', null, null, 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('5', '车间场景', null, '1', '2', '1', null, 'onepic', null, null, '', null, null, 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('6', '公司简介', '', '1', '2', '1', '', 'onepic', null, null, '', '', '_self', 'show', '1', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('7', '公司动态', null, '3', '2', '3', null, 'nopic', null, null, '', null, null, 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('8', '行业动态', null, '3', '2', '3', null, 'nopic', null, null, '', null, null, 'show', '100', null, null, null, null, '1', '1', '1');

-- ----------------------------
-- Table structure for info_col_muitipic
-- ----------------------------
DROP TABLE IF EXISTS `info_col_muitipic`;
CREATE TABLE `info_col_muitipic` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `cid` int(11) DEFAULT NULL COMMENT '信息栏目标识',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `image` varchar(100) DEFAULT NULL COMMENT '上传文件标识',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息栏目多图表';

-- ----------------------------
-- Records of info_col_muitipic
-- ----------------------------

-- ----------------------------
-- Table structure for info_col_onepic
-- ----------------------------
DROP TABLE IF EXISTS `info_col_onepic`;
CREATE TABLE `info_col_onepic` (
  `cid` int(10) NOT NULL COMMENT '信息栏目标识',
  `image` varchar(100) DEFAULT NULL COMMENT '上传图片标识',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `remark` varchar(100) DEFAULT NULL COMMENT '摘要',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息栏目单图表';

-- ----------------------------
-- Records of info_col_onepic
-- ----------------------------
INSERT INTO `info_col_onepic` VALUES ('6', '1', '', '', null, null, null, null);

-- ----------------------------
-- Table structure for info_products
-- ----------------------------
DROP TABLE IF EXISTS `info_products`;
CREATE TABLE `info_products` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `cid` int(10) DEFAULT NULL COMMENT '信息栏目标识',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `image` int(10) DEFAULT NULL COMMENT '上传图片标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '摘要',
  `content` text COMMENT '内容',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='信息产品表';

-- ----------------------------
-- Records of info_products
-- ----------------------------

-- ----------------------------
-- Table structure for info_single
-- ----------------------------
DROP TABLE IF EXISTS `info_single`;
CREATE TABLE `info_single` (
  `cid` int(10) unsigned NOT NULL COMMENT '信息栏目标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '摘要',
  `content` text COMMENT '内容',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息单页表';

-- ----------------------------
-- Records of info_single
-- ----------------------------
INSERT INTO `info_single` VALUES ('6', '', '', null, null, null, null);

-- ----------------------------
-- Table structure for info_type
-- ----------------------------
DROP TABLE IF EXISTS `info_type`;
CREATE TABLE `info_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` char(50) DEFAULT NULL COMMENT '名称',
  `ctrl` varchar(20) DEFAULT NULL COMMENT '控制器',
  `sys_ctrl` varchar(20) DEFAULT NULL COMMENT '系统控制器',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='信息类型表';

-- ----------------------------
-- Records of info_type
-- ----------------------------
INSERT INTO `info_type` VALUES ('1', '单页', 'single', 'info_single', '', 'show', '100', null, null, null, null);
INSERT INTO `info_type` VALUES ('2', '图片', 'products', 'info_products', '', 'show', '100', null, null, null, null);
INSERT INTO `info_type` VALUES ('3', '文章', 'news', 'info_article', '', 'show', '100', null, null, null, null);

-- ----------------------------
-- Table structure for slide
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `image` varchar(100) DEFAULT NULL COMMENT '上传文件标识',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of slide
-- ----------------------------

-- ----------------------------
-- Table structure for sys_col
-- ----------------------------
DROP TABLE IF EXISTS `sys_col`;
CREATE TABLE `sys_col` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `pid` int(10) DEFAULT '0' COMMENT '上级标识',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别',
  `dir` varchar(20) DEFAULT NULL COMMENT '目录',
  `ctrl` varchar(20) DEFAULT NULL COMMENT '控制器',
  `method` varchar(20) DEFAULT NULL COMMENT '方法',
  `param` varchar(100) DEFAULT NULL COMMENT '参数',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_type` varchar(10) DEFAULT NULL COMMENT '用户类型：developer=开发者，producter=生产者',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='系统栏目表';

-- ----------------------------
-- Records of sys_col
-- ----------------------------
INSERT INTO `sys_col` VALUES ('1', '首页', '0', '1', '', '', '', '', '', 'pro', 'show', '1', null, null, null, null);
INSERT INTO `sys_col` VALUES ('2', '网站', '0', '1', '', '', '', '', '', 'pro', 'show', '2', null, null, null, null);
INSERT INTO `sys_col` VALUES ('3', '信息', '0', '1', '', '', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('4', '扩展', '0', '1', '', '', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('28', '后台管理', '1', '2', '', '', '', '', '', 'dev', 'show', '200', null, null, null, null);
INSERT INTO `sys_col` VALUES ('6', '权限管理', '2', '2', '', '', '', '', '', 'pro', 'show', '200', null, null, null, null);
INSERT INTO `sys_col` VALUES ('7', '我的面板', '1', '2', '', 'home', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('8', '数据字典', '28', '3', '', 'sys_dict', '', '', '', 'dev', 'show', '300', null, null, null, null);
INSERT INTO `sys_col` VALUES ('9', '配置组', '29', '4', '', 'config_group', '', '', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('10', '配置项', '29', '4', '', 'config_item', '', '', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('11', '网站配置', '2', '2', '', 'config', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('12', '信息栏目', '3', '2', '', 'info_col', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('13', '信息管理', '3', '2', '', 'information', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('14', '信息类型', '3', '2', '', 'info_type', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('15', '幻灯片', '4', '2', '', 'slide', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('16', '后台菜单', '28', '3', '', 'sys_col', '', '', '', 'dev', 'show', '200', null, null, null, null);
INSERT INTO `sys_col` VALUES ('17', '角色管理', '6', '3', '', 'sys_role', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('18', '用户管理', '6', '3', '', 'sys_user', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('20', '栏目图片', '3', '2', '', '', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('24', '单图管理', '20', '3', '', 'info_col_onepic', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('25', '多图管理', '20', '3', '', 'info_col_muitipic', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('31', '操作日志', '1', '2', '', 'sys_log', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('29', '配置管理', '28', '3', '', '', '', '', '', 'dev', 'show', '100', null, null, null, null);

-- ----------------------------
-- Table structure for sys_col_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_col_auth`;
CREATE TABLE `sys_col_auth` (
  `col_id` int(10) NOT NULL COMMENT '系统栏目标识',
  `col_auth` varchar(10) NOT NULL COMMENT '系统栏目权限标识'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统栏目权限表';

-- ----------------------------
-- Records of sys_col_auth
-- ----------------------------
INSERT INTO `sys_col_auth` VALUES ('8', 'look');
INSERT INTO `sys_col_auth` VALUES ('7', 'del');
INSERT INTO `sys_col_auth` VALUES ('7', 'update');
INSERT INTO `sys_col_auth` VALUES ('7', 'insert');
INSERT INTO `sys_col_auth` VALUES ('13', 'look');
INSERT INTO `sys_col_auth` VALUES ('13', 'del');
INSERT INTO `sys_col_auth` VALUES ('13', 'update');
INSERT INTO `sys_col_auth` VALUES ('13', 'insert');
INSERT INTO `sys_col_auth` VALUES ('25', 'look');
INSERT INTO `sys_col_auth` VALUES ('25', 'del');
INSERT INTO `sys_col_auth` VALUES ('24', 'look');
INSERT INTO `sys_col_auth` VALUES ('24', 'update');
INSERT INTO `sys_col_auth` VALUES ('8', 'del');
INSERT INTO `sys_col_auth` VALUES ('8', 'update');
INSERT INTO `sys_col_auth` VALUES ('8', 'insert');
INSERT INTO `sys_col_auth` VALUES ('9', 'look');
INSERT INTO `sys_col_auth` VALUES ('9', 'del');
INSERT INTO `sys_col_auth` VALUES ('9', 'update');
INSERT INTO `sys_col_auth` VALUES ('9', 'insert');
INSERT INTO `sys_col_auth` VALUES ('10', 'look');
INSERT INTO `sys_col_auth` VALUES ('10', 'del');
INSERT INTO `sys_col_auth` VALUES ('10', 'update');
INSERT INTO `sys_col_auth` VALUES ('10', 'insert');
INSERT INTO `sys_col_auth` VALUES ('11', 'update');
INSERT INTO `sys_col_auth` VALUES ('17', 'insert');
INSERT INTO `sys_col_auth` VALUES ('17', 'update');
INSERT INTO `sys_col_auth` VALUES ('17', 'del');
INSERT INTO `sys_col_auth` VALUES ('17', 'look');
INSERT INTO `sys_col_auth` VALUES ('18', 'look');
INSERT INTO `sys_col_auth` VALUES ('18', 'del');
INSERT INTO `sys_col_auth` VALUES ('18', 'update');
INSERT INTO `sys_col_auth` VALUES ('18', 'insert');
INSERT INTO `sys_col_auth` VALUES ('12', 'look');
INSERT INTO `sys_col_auth` VALUES ('12', 'del');
INSERT INTO `sys_col_auth` VALUES ('12', 'update');
INSERT INTO `sys_col_auth` VALUES ('12', 'insert');
INSERT INTO `sys_col_auth` VALUES ('14', 'insert');
INSERT INTO `sys_col_auth` VALUES ('14', 'update');
INSERT INTO `sys_col_auth` VALUES ('14', 'del');
INSERT INTO `sys_col_auth` VALUES ('14', 'look');
INSERT INTO `sys_col_auth` VALUES ('15', 'insert');
INSERT INTO `sys_col_auth` VALUES ('15', 'update');
INSERT INTO `sys_col_auth` VALUES ('15', 'del');
INSERT INTO `sys_col_auth` VALUES ('15', 'look');
INSERT INTO `sys_col_auth` VALUES ('16', 'look');
INSERT INTO `sys_col_auth` VALUES ('16', 'del');
INSERT INTO `sys_col_auth` VALUES ('16', 'update');
INSERT INTO `sys_col_auth` VALUES ('16', 'insert');
INSERT INTO `sys_col_auth` VALUES ('25', 'update');
INSERT INTO `sys_col_auth` VALUES ('25', 'insert');
INSERT INTO `sys_col_auth` VALUES ('31', 'del');
INSERT INTO `sys_col_auth` VALUES ('31', 'look');
INSERT INTO `sys_col_auth` VALUES ('11', 'look');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '分类所属上级标识【默认0】',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别【从0开始】',
  `ident` varchar(20) DEFAULT NULL COMMENT '唯一标识',
  `color` char(7) DEFAULT NULL COMMENT '颜色',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='系统数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '后台栏目权限', '0', '1', 'sys_col_auth', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('2', '新增', '1', '2', 'insert', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('3', '修改', '1', '2', 'update', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('4', '删除', '1', '2', 'del', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('5', '查看', '1', '2', 'look', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('6', '用户类型', '0', '1', 'user_type', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('7', '生产者', '6', '2', 'pro', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('8', '开发者', '6', '2', 'dev', '#337ab7', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('9', '显示', '0', '1', 'display', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10', '显示', '9', '2', 'show', '#5cb85c', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('11', '隐藏', '9', '2', 'hide', '#d9534f', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('12', '配置项类型', '0', '1', 'config_type', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('13', '文本', '12', '2', 'text', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('14', '单选', '12', '2', 'radio', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('15', '复选', '12', '2', 'checkbox', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('16', '下拉列表', '12', '2', 'select', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('17', '文本域', '12', '2', 'textarea', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('18', '用户状态', '0', '1', 'user_status', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('19', '正常', '18', '2', 'normal', '#5cb85c', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('20', '冻结', '18', '2', 'forzen', '#d9534f', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('21', '图片', '0', '1', 'image', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('22', '无图', '21', '2', 'nopic', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('23', '单图', '21', '2', 'onepic', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('24', '多图', '21', '2', 'muitipic', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('26', '位置', '0', '1', 'location', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('27', '顶部导航', '26', '2', 'tnav', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('28', '底部导航', '26', '2', 'bnav', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('29', '打开方式', '0', '1', 'target', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('30', '当前窗口', '29', '2', '_self', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('31', '新窗口', '29', '2', '_blank', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('32', '日志状态', '0', '1', 'log_status', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('33', '成功', '32', '2', 'success', '#5cb85c', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('34', '失败', '32', '2', 'fail', '#d9534f', '', '100', null, null, null, null);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户标识',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `col_name` varchar(10) DEFAULT NULL COMMENT '栏目名称',
  `opera` varchar(20) DEFAULT NULL COMMENT '操作：新增，修改，删除',
  `status` varchar(10) DEFAULT NULL COMMENT '状态：success=成功，fail=失败',
  `browser` varchar(50) DEFAULT NULL COMMENT '浏览器名称',
  `version` varchar(50) DEFAULT NULL COMMENT '浏览器版本号',
  `platform` varchar(50) DEFAULT NULL COMMENT '平台',
  `hostname` varchar(50) DEFAULT NULL COMMENT '主机名',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `time` int(10) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '1', 'xuanyunet', '幻灯片', 'insert', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', null, '::1', '1476956173');
INSERT INTO `sys_log` VALUES ('2', '1', 'xuanyunet', '幻灯片', 'update', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', null, '::1', '1476956187');
INSERT INTO `sys_log` VALUES ('3', '1', 'xuanyunet', '信息栏目', 'update', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', null, '::1', '1476956910');
INSERT INTO `sys_log` VALUES ('4', '1', 'xuanyunet', '幻灯片', 'insert', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', null, '::1', '1477012785');
INSERT INTO `sys_log` VALUES ('5', '1', 'xuanyunet', null, 'del', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', null, '::1', '1477012809');
INSERT INTO `sys_log` VALUES ('6', '1', 'xuanyunet', null, 'del', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', null, '::1', '1477012847');
INSERT INTO `sys_log` VALUES ('7', '1', 'xuanyunet', '幻灯片', 'insert', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', null, '::1', '1477012894');
INSERT INTO `sys_log` VALUES ('8', '1', 'xuanyunet', null, 'del', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', null, '::1', '1477012908');
INSERT INTO `sys_log` VALUES ('9', '1', 'xuanyunet', '信息管理', 'insert', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', null, '::1', '1477021358');
INSERT INTO `sys_log` VALUES ('10', '1', 'xuanyunet', '行业动态', 'insert', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', null, '::1', '1477021446');
INSERT INTO `sys_log` VALUES ('11', '1', 'xuanyunet', '', 'del', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', null, '::1', '1477021457');
INSERT INTO `sys_log` VALUES ('12', '1', 'xuanyunet', '', 'del', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477022074');
INSERT INTO `sys_log` VALUES ('13', '1', 'xuanyunet', '行业动态', 'insert', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477022917');
INSERT INTO `sys_log` VALUES ('14', '1', 'xuanyunet', '幻灯片', 'insert', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477023086');
INSERT INTO `sys_log` VALUES ('15', '1', 'xuanyunet', '', 'del', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477023091');
INSERT INTO `sys_log` VALUES ('16', '1', 'xuanyunet', '幻灯片', 'insert', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477023128');
INSERT INTO `sys_log` VALUES ('17', '1', 'xuanyunet', '幻灯片', 'del', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477023132');
INSERT INTO `sys_log` VALUES ('18', '1', 'xuanyunet', '行业动态', 'del', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477024377');
INSERT INTO `sys_log` VALUES ('19', '1', 'xuanyunet', '公司简介', 'update', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477024463');
INSERT INTO `sys_log` VALUES ('20', '1', 'xuanyunet', '角色权限', 'update', 'success', 'Internet Explorer', '11.0', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477365921');
INSERT INTO `sys_log` VALUES ('21', '1', 'xuanyunet', '角色权限', 'update', 'success', 'Internet Explorer', '11.0', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477366120');
INSERT INTO `sys_log` VALUES ('22', '1', 'xuanyunet', '角色权限', 'update', 'success', 'Internet Explorer', '11.0', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477366487');
INSERT INTO `sys_log` VALUES ('23', '1', 'xuanyunet', '角色权限', 'update', 'success', 'Internet Explorer', '11.0', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477367387');
INSERT INTO `sys_log` VALUES ('24', '1', 'xuanyunet', '角色权限', 'update', 'success', 'Internet Explorer', '11.0', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477367406');
INSERT INTO `sys_log` VALUES ('25', '1', 'xuanyunet', '角色权限', 'update', 'success', 'Internet Explorer', '11.0', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477367435');
INSERT INTO `sys_log` VALUES ('26', '1', 'xuanyunet', '角色权限', 'update', 'success', 'Internet Explorer', '11.0', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477367659');
INSERT INTO `sys_log` VALUES ('27', '1', 'xuanyunet', '后台菜单', 'update', 'success', 'Internet Explorer', '11.0', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477369111');
INSERT INTO `sys_log` VALUES ('28', '1', 'xuanyunet', '角色权限', 'update', 'success', 'Internet Explorer', '11.0', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477369234');
INSERT INTO `sys_log` VALUES ('29', '1', 'xuanyunet', '角色权限', 'update', 'success', 'Internet Explorer', '11.0', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477369244');
INSERT INTO `sys_log` VALUES ('30', '1', 'xuanyunet', '角色权限', 'update', 'success', 'Internet Explorer', '11.0', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477369252');
INSERT INTO `sys_log` VALUES ('31', '1', 'xuanyunet', '产品中心', 'insert', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477621533');
INSERT INTO `sys_log` VALUES ('32', '1', 'xuanyunet', '产品中心', 'del', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477621546');
INSERT INTO `sys_log` VALUES ('33', '1', 'xuanyunet', '公司动态', 'update', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477621922');
INSERT INTO `sys_log` VALUES ('34', '3', 'article', '网站配置', 'update', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477629102');
INSERT INTO `sys_log` VALUES ('35', '1', 'xuanyunet', '配置项', 'update', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477638704');
INSERT INTO `sys_log` VALUES ('36', '1', 'xuanyunet', '网站配置', 'update', 'success', 'Chrome', '54.0.2840.59', 'Windows 10', 'DESKTOP-VD45ACM', '::1', '1477638712');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户标识',
  `login_ip` varchar(20) DEFAULT NULL COMMENT '登录ip地址',
  `login_time` int(10) DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='系统登录日志表';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('16', '1', '::1', '1476926355');
INSERT INTO `sys_login_log` VALUES ('17', '1', '::1', '1476926364');
INSERT INTO `sys_login_log` VALUES ('18', '1', '::1', '1476926724');
INSERT INTO `sys_login_log` VALUES ('19', '1', '::1', '1476926816');
INSERT INTO `sys_login_log` VALUES ('20', '1', '::1', '1476926847');
INSERT INTO `sys_login_log` VALUES ('21', '1', '::1', '1476926900');
INSERT INTO `sys_login_log` VALUES ('22', '1', '::1', '1476927080');
INSERT INTO `sys_login_log` VALUES ('23', '1', '::1', '1476948030');
INSERT INTO `sys_login_log` VALUES ('24', '1', '::1', '1476948360');
INSERT INTO `sys_login_log` VALUES ('25', '1', '::1', '1476948368');
INSERT INTO `sys_login_log` VALUES ('26', '1', '::1', '1476948522');
INSERT INTO `sys_login_log` VALUES ('27', '1', '::1', '1476948859');
INSERT INTO `sys_login_log` VALUES ('28', '1', '::1', '1476948866');
INSERT INTO `sys_login_log` VALUES ('29', '1', '::1', '1476948925');
INSERT INTO `sys_login_log` VALUES ('30', '1', '::1', '1476948937');
INSERT INTO `sys_login_log` VALUES ('31', '1', '::1', '1476949111');
INSERT INTO `sys_login_log` VALUES ('32', '1', '::1', '1476949129');
INSERT INTO `sys_login_log` VALUES ('33', '1', '::1', '1476949438');
INSERT INTO `sys_login_log` VALUES ('34', '1', '::1', '1476949665');
INSERT INTO `sys_login_log` VALUES ('35', '1', '::1', '1476949880');
INSERT INTO `sys_login_log` VALUES ('36', '1', '::1', '1476950169');
INSERT INTO `sys_login_log` VALUES ('37', '1', '::1', '1477012701');
INSERT INTO `sys_login_log` VALUES ('38', '1', '::1', '1477020354');
INSERT INTO `sys_login_log` VALUES ('39', '1', '::1', '1477300429');
INSERT INTO `sys_login_log` VALUES ('40', '1', '::1', '1477365909');
INSERT INTO `sys_login_log` VALUES ('41', '3', '::1', '1477365933');
INSERT INTO `sys_login_log` VALUES ('42', '3', '::1', '1477366466');
INSERT INTO `sys_login_log` VALUES ('43', '1', '::1', '1477367368');
INSERT INTO `sys_login_log` VALUES ('44', '3', '::1', '1477367381');
INSERT INTO `sys_login_log` VALUES ('45', '3', '::1', '1477367425');
INSERT INTO `sys_login_log` VALUES ('46', '3', '::1', '1477367672');
INSERT INTO `sys_login_log` VALUES ('47', '3', '::1', '1477367682');
INSERT INTO `sys_login_log` VALUES ('48', '3', '::1', '1477367701');
INSERT INTO `sys_login_log` VALUES ('49', '1', '::1', '1477370220');
INSERT INTO `sys_login_log` VALUES ('50', '1', '::1', '1477391508');
INSERT INTO `sys_login_log` VALUES ('51', '1', '::1', '1477446135');
INSERT INTO `sys_login_log` VALUES ('52', '1', '::1', '1477462467');
INSERT INTO `sys_login_log` VALUES ('53', '1', '::1', '1477533592');
INSERT INTO `sys_login_log` VALUES ('54', '1', '::1', '1477559558');
INSERT INTO `sys_login_log` VALUES ('55', '1', '::1', '1477621054');
INSERT INTO `sys_login_log` VALUES ('56', '1', '::1', '1477626541');
INSERT INTO `sys_login_log` VALUES ('57', '1', '::1', '1477628988');
INSERT INTO `sys_login_log` VALUES ('58', '3', '::1', '1477629096');
INSERT INTO `sys_login_log` VALUES ('59', '1', '::1', '1477629115');
INSERT INTO `sys_login_log` VALUES ('60', '1', '::1', '1477634557');
INSERT INTO `sys_login_log` VALUES ('61', '1', '::1', '1477637213');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `role_type` tinyint(1) DEFAULT '0' COMMENT '角色类型：0=普通管理员，1=超级管理员【拥有所有生产者的权限】',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '1', '拥有所有权限', '100', null, null, null, null);
INSERT INTO `sys_role` VALUES ('2', '文章管理员', '0', '', '100', null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_auth`;
CREATE TABLE `sys_role_auth` (
  `role_id` int(10) DEFAULT NULL COMMENT '角色标识',
  `col_id` int(10) DEFAULT NULL COMMENT '系统栏目标识',
  `col_auth` varchar(10) DEFAULT NULL COMMENT '系统栏目权限'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统角色权限表';

-- ----------------------------
-- Records of sys_role_auth
-- ----------------------------
INSERT INTO `sys_role_auth` VALUES ('2', '2', '');
INSERT INTO `sys_role_auth` VALUES ('2', '11', 'look');
INSERT INTO `sys_role_auth` VALUES ('2', '11', 'update');
INSERT INTO `sys_role_auth` VALUES ('2', '3', '');
INSERT INTO `sys_role_auth` VALUES ('2', '12', 'del');
INSERT INTO `sys_role_auth` VALUES ('2', '12', 'insert');
INSERT INTO `sys_role_auth` VALUES ('2', '12', 'look');
INSERT INTO `sys_role_auth` VALUES ('2', '12', 'update');
INSERT INTO `sys_role_auth` VALUES ('2', '13', 'del');
INSERT INTO `sys_role_auth` VALUES ('2', '13', 'insert');
INSERT INTO `sys_role_auth` VALUES ('2', '13', 'update');
INSERT INTO `sys_role_auth` VALUES ('2', '14', 'del');
INSERT INTO `sys_role_auth` VALUES ('2', '14', 'insert');
INSERT INTO `sys_role_auth` VALUES ('2', '14', 'look');
INSERT INTO `sys_role_auth` VALUES ('2', '14', 'update');
INSERT INTO `sys_role_auth` VALUES ('2', '20', '');
INSERT INTO `sys_role_auth` VALUES ('2', '24', 'look');
INSERT INTO `sys_role_auth` VALUES ('2', '24', 'update');
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'del');
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'insert');
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'look');
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'update');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `role_id` int(10) unsigned DEFAULT NULL COMMENT '角色标识',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `realname` varchar(50) DEFAULT NULL COMMENT '姓名',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` char(6) DEFAULT NULL COMMENT '状态：normal=正常，forzen=冻结',
  `user_type` varchar(10) DEFAULT 'pro' COMMENT '用户类型：dev=开发者，pro=生产者',
  `sys_manager` tinyint(1) DEFAULT '0' COMMENT '默认管理员【拥有生产者所有权限】：0=否，1=是',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', 'xuanyunet', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'normal', 'dev', '1', null, null, null, null);
INSERT INTO `sys_user` VALUES ('2', '1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'normal', 'pro', '1', null, null, null, null);
INSERT INTO `sys_user` VALUES ('3', '2', 'article', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'normal', 'pro', '0', null, null, null, null);

-- ----------------------------
-- Table structure for uploads
-- ----------------------------
DROP TABLE IF EXISTS `uploads`;
CREATE TABLE `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `name` varchar(255) DEFAULT NULL COMMENT '上传后的文件名',
  `type` varchar(50) DEFAULT NULL COMMENT 'MIME类型',
  `abs_path` varchar(255) DEFAULT NULL COMMENT '绝对路径【不含文件名】',
  `full_abs_path` varchar(255) DEFAULT NULL COMMENT '绝对路径【含文件名】',
  `path` varchar(255) DEFAULT NULL COMMENT '相对路径【不含文件名】',
  `full_path` varchar(255) DEFAULT NULL COMMENT '相对路径【含文件名】',
  `raw_name` varchar(255) DEFAULT NULL COMMENT '文件名，不含后缀名',
  `orig_name` varchar(255) DEFAULT NULL COMMENT '原始的文件名，只有在使用了 encrypt_name 参数时该值才有用',
  `client_name` varchar(255) DEFAULT NULL COMMENT '用户提交过来的文件名，还没有对该文件名做任何处理',
  `ext` varchar(10) DEFAULT NULL COMMENT '文件后缀名，包括句点',
  `size` double(20,2) DEFAULT NULL COMMENT '文件大小（单位 kb）',
  `is_image` tinyint(1) DEFAULT NULL COMMENT '文件是否为图片（1 = image. 0 = not.）',
  `image_width` tinyint(20) DEFAULT NULL COMMENT '图片宽度',
  `image_height` tinyint(20) DEFAULT NULL COMMENT '图片高度',
  `image_type` varchar(50) DEFAULT NULL COMMENT '图片类型（通常是不带句点的文件后缀名）',
  `image_size_str` varchar(100) DEFAULT NULL COMMENT '一个包含了图片宽度和高度的字符串（用于放在 image 标签中）',
  `errors` varchar(255) DEFAULT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='上传文件表';

-- ----------------------------
-- Records of uploads
-- ----------------------------
INSERT INTO `uploads` VALUES ('1', '6bef2b73bd646f3a2b4ce8a5f9f90ae6.jpg', 'image/jpeg', 'D:/wamp/www/uploads/20161018/', 'D:/wamp/www/uploads/20161018/6bef2b73bd646f3a2b4ce8a5f9f90ae6.jpg', '/uploads/20161018/', '/uploads/20161018/6bef2b73bd646f3a2b4ce8a5f9f90ae6.jpg', '6bef2b73bd646f3a2b4ce8a5f9f90ae6', '6bef2b73bd646f3a2b4ce8a5f9f90ae6.jpg', '9463df9191e7fea174158c440ee7145a.jpg', '.jpg', '459.53', '1', '127', '127', 'jpeg', 'width=\"2272\" height=\"1704\"', '');
INSERT INTO `uploads` VALUES ('2', '8f5d3ee1a394ce571fc3f6044dd81e12.png', 'image/png', 'D:/wamp/www/uploads/20161018/', 'D:/wamp/www/uploads/20161018/8f5d3ee1a394ce571fc3f6044dd81e12.png', '/uploads/20161018/', '/uploads/20161018/8f5d3ee1a394ce571fc3f6044dd81e12.png', '8f5d3ee1a394ce571fc3f6044dd81e12', '8f5d3ee1a394ce571fc3f6044dd81e12.png', 'QQ截图20160615115028.png', '.png', '9.81', '1', '89', '51', 'png', 'width=\"89\" height=\"51\"', '');
INSERT INTO `uploads` VALUES ('3', '735cae2269a92567732070444edcf6ad.png', 'image/png', 'D:/wamp/www/uploads/20161018/', 'D:/wamp/www/uploads/20161018/735cae2269a92567732070444edcf6ad.png', '/uploads/20161018/', '/uploads/20161018/735cae2269a92567732070444edcf6ad.png', '735cae2269a92567732070444edcf6ad', '735cae2269a92567732070444edcf6ad.png', 'QQ截图20160615115044.png', '.png', '6.43', '1', '71', '41', 'png', 'width=\"71\" height=\"41\"', '');
INSERT INTO `uploads` VALUES ('4', '5ed6a29dff20a9d00b6ef8c7b9990017.png', 'image/png', 'D:/wamp/www/uploads/20161018/', 'D:/wamp/www/uploads/20161018/5ed6a29dff20a9d00b6ef8c7b9990017.png', '/uploads/20161018/', '/uploads/20161018/5ed6a29dff20a9d00b6ef8c7b9990017.png', '5ed6a29dff20a9d00b6ef8c7b9990017', '5ed6a29dff20a9d00b6ef8c7b9990017.png', 'QQ截图20160615115334.png', '.png', '11.81', '1', '92', '55', 'png', 'width=\"92\" height=\"55\"', '');
INSERT INTO `uploads` VALUES ('5', '3ab1f8a36eed91bf2ce46f776fa288c7.js', 'text/plain', 'D:/wamp/www/uploads/20161018/', 'D:/wamp/www/uploads/20161018/3ab1f8a36eed91bf2ce46f776fa288c7.js', '/uploads/20161018/', '/uploads/20161018/3ab1f8a36eed91bf2ce46f776fa288c7.js', '3ab1f8a36eed91bf2ce46f776fa288c7', '3ab1f8a36eed91bf2ce46f776fa288c7.js', 'countTo.js', '.js', '3.17', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('6', '6d1080e436f7ff74748ee9b7efd920e7.js', 'text/plain', 'D:/wamp/www/uploads/20161018/', 'D:/wamp/www/uploads/20161018/6d1080e436f7ff74748ee9b7efd920e7.js', '/uploads/20161018/', '/uploads/20161018/6d1080e436f7ff74748ee9b7efd920e7.js', '6d1080e436f7ff74748ee9b7efd920e7', '6d1080e436f7ff74748ee9b7efd920e7.js', 'jquery.min.js', '.js', '93.74', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('7', '460cc51538e9aa863eaf65c7de7c3a5d.rar', 'application/x-rar', 'D:/wamp/www/uploads/20161018/', 'D:/wamp/www/uploads/20161018/460cc51538e9aa863eaf65c7de7c3a5d.rar', '/uploads/20161018/', '/uploads/20161018/460cc51538e9aa863eaf65c7de7c3a5d.rar', '460cc51538e9aa863eaf65c7de7c3a5d', '460cc51538e9aa863eaf65c7de7c3a5d.rar', '浮动固定位置插件.rar', '.rar', '44.25', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('8', '6e83f2fd299521aaf25cdec89c725cfc.jpg', 'image/jpeg', 'D:/wamp/www/uploads/20161018/', 'D:/wamp/www/uploads/20161018/6e83f2fd299521aaf25cdec89c725cfc.jpg', '/uploads/20161018/', '/uploads/20161018/6e83f2fd299521aaf25cdec89c725cfc.jpg', '6e83f2fd299521aaf25cdec89c725cfc', '6e83f2fd299521aaf25cdec89c725cfc.jpg', '未标题-1.jpg', '.jpg', '14.88', '1', '125', '67', 'jpeg', 'width=\"125\" height=\"67\"', '');
INSERT INTO `uploads` VALUES ('9', '662d93d72528ff4f97f94d153426dd37.png', 'image/png', 'D:/wamp/www/uploads/20161018/', 'D:/wamp/www/uploads/20161018/662d93d72528ff4f97f94d153426dd37.png', '/uploads/20161018/', '/uploads/20161018/662d93d72528ff4f97f94d153426dd37.png', '662d93d72528ff4f97f94d153426dd37', '662d93d72528ff4f97f94d153426dd37.png', 'QQ截图20160616162124.png', '.png', '5.12', '1', '41', '46', 'png', 'width=\"41\" height=\"46\"', '');
INSERT INTO `uploads` VALUES ('10', '5b6d7940433b83687cc2110af76085f6.jpg', 'image/jpeg', 'D:/wamp/www/uploads/20161018/', 'D:/wamp/www/uploads/20161018/5b6d7940433b83687cc2110af76085f6.jpg', '/uploads/20161018/', '/uploads/20161018/5b6d7940433b83687cc2110af76085f6.jpg', '5b6d7940433b83687cc2110af76085f6', '5b6d7940433b83687cc2110af76085f6.jpg', '9463df9191e7fea174158c440ee7145a.jpg', '.jpg', '459.53', '1', '127', '127', 'jpeg', 'width=\"2272\" height=\"1704\"', '');
INSERT INTO `uploads` VALUES ('11', '159a98ce61262b11e05791990b071ee2.png', 'image/png', 'D:/wamp/www/uploads/20161018/', 'D:/wamp/www/uploads/20161018/159a98ce61262b11e05791990b071ee2.png', '/uploads/20161018/', '/uploads/20161018/159a98ce61262b11e05791990b071ee2.png', '159a98ce61262b11e05791990b071ee2', '159a98ce61262b11e05791990b071ee2.png', 'QQ截图20160616142927.png', '.png', '4.08', '1', '57', '29', 'png', 'width=\"57\" height=\"29\"', '');
INSERT INTO `uploads` VALUES ('12', 'dd7abbf43aa68ed9c482bc14263a6047.png', 'image/png', 'D:/wamp/www/uploads/20161018/', 'D:/wamp/www/uploads/20161018/dd7abbf43aa68ed9c482bc14263a6047.png', '/uploads/20161018/', '/uploads/20161018/dd7abbf43aa68ed9c482bc14263a6047.png', 'dd7abbf43aa68ed9c482bc14263a6047', 'dd7abbf43aa68ed9c482bc14263a6047.png', 'QQ截图20160616142937.png', '.png', '5.72', '1', '62', '38', 'png', 'width=\"62\" height=\"38\"', '');
