/*
Navicat MySQL Data Transfer

Source Server         : wamp
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : xuanyunet

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-09-08 20:03:12
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='基本配置表';

-- ----------------------------
-- Records of config
-- ----------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='配置组';

-- ----------------------------
-- Records of config_group
-- ----------------------------

-- ----------------------------
-- Table structure for info_article
-- ----------------------------
DROP TABLE IF EXISTS `info_article`;
CREATE TABLE `info_article` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `info_col_id` int(10) DEFAULT NULL COMMENT '信息栏目标识',
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息文章表';

-- ----------------------------
-- Records of info_article
-- ----------------------------

-- ----------------------------
-- Table structure for info_banner
-- ----------------------------
DROP TABLE IF EXISTS `info_banner`;
CREATE TABLE `info_banner` (
  `info_col_id` int(10) NOT NULL COMMENT '信息栏目标识',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `image` int(10) DEFAULT NULL COMMENT '上传文件标识',
  `url` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`info_col_id`)
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
  `pid` int(10) unsigned DEFAULT '0' COMMENT '分类所属上级标识【默认0】',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别【从0开始】',
  `info_type_id` int(11) DEFAULT NULL COMMENT '信息类型标识',
  `pic` varchar(10) DEFAULT NULL COMMENT '图片：nopic=无图，onepic=单图，muitipic=多图',
  `url` varchar(255) DEFAULT NULL COMMENT '链接【设置后分类将使用此url】',
  `seo_title` varchar(80) DEFAULT NULL COMMENT 'SEO标题',
  `seo_desc` varchar(200) DEFAULT NULL COMMENT 'SEO描述',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
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
INSERT INTO `info_col` VALUES ('1', '关于', '0', '1', '0', 'nopic', null, null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('2', '新闻', '0', '1', '0', 'nopic', null, null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('3', '案例', '0', '1', '3', 'nopic', null, null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('4', '下载', '0', '1', '4', 'nopic', null, null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('5', '公司简介', '1', '2', '1', 'nopic', null, null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('6', '组织机构', '1', '2', '1', 'nopic', null, null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('7', '最新资讯', '2', '2', '2', 'nopic', null, null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('8', '行业动态', '2', '2', '2', 'nopic', null, null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');

-- ----------------------------
-- Table structure for info_single
-- ----------------------------
DROP TABLE IF EXISTS `info_single`;
CREATE TABLE `info_single` (
  `info_col_id` int(10) unsigned NOT NULL COMMENT '信息栏目标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '摘要',
  `content` text COMMENT '内容',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`info_col_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息单页表';

-- ----------------------------
-- Records of info_single
-- ----------------------------
INSERT INTO `info_single` VALUES ('6', '组织机构', '<p>组织机构内容</p>', null, null, null, null);
INSERT INTO `info_single` VALUES ('5', '公司简介', '<p>公司简介内容</p>', null, null, null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='信息类型表';

-- ----------------------------
-- Records of info_type
-- ----------------------------
INSERT INTO `info_type` VALUES ('1', '单页', 'single', 'info_single', '', 'show', '100', null, null, null, null);
INSERT INTO `info_type` VALUES ('2', '文章', 'article', 'info_article', '', 'show', '100', null, null, null, null);
INSERT INTO `info_type` VALUES ('3', '图片', 'picture', 'info_picture', '', 'show', '100', null, null, null, null);
INSERT INTO `info_type` VALUES ('4', '下载', 'download', 'info_download', '', 'show', '100', null, null, null, null);
INSERT INTO `info_type` VALUES ('5', '案例', 'case', 'info_case', '', 'show', '100', null, null, null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES ('2', 'test', '18', '', '', 'show', '100', null, null, null, null);
INSERT INTO `slide` VALUES ('3', 'test1', '19', '', '', 'show', '100', null, null, null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='系统栏目表';

-- ----------------------------
-- Records of sys_col
-- ----------------------------
INSERT INTO `sys_col` VALUES ('1', '首页', '0', '1', '', '', '', '', '', 'pro', 'show', '1', null, null, null, null);
INSERT INTO `sys_col` VALUES ('2', '系统', '0', '1', '', '', '', '', '', 'pro', 'show', '2', null, null, null, null);
INSERT INTO `sys_col` VALUES ('3', '信息', '0', '1', '', '', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('4', '扩展', '0', '1', '', '', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('5', '菜单', '0', '1', '', '', '', '', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('6', '用户', '0', '1', '', '', '', '', '', 'pro', 'show', '3', null, null, null, null);
INSERT INTO `sys_col` VALUES ('7', '后台首页', '1', '2', '', 'home', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('8', '系统数据字典', '1', '2', '', 'sys_dict', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('9', '配置组', '2', '2', '', 'config_group', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('10', '配置项', '2', '2', '', 'config_item', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('11', '配置信息', '2', '2', '', 'config', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('12', '信息栏目', '3', '2', '', 'info_col', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('13', '信息管理', '3', '2', '', 'information', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('14', '信息类型', '3', '2', '', 'info_type', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('15', '幻灯片', '4', '2', '', 'slide', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('16', '后台栏目', '5', '2', '', 'sys_col', '', '', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('17', '角色管理', '6', '2', '', 'sys_role', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('18', '管理员管理', '6', '2', '', 'sys_user', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('19', '修改密码', '6', '2', '', 'password', '', '', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('20', '栏目图片', '3', '2', '', '', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('24', '单图管理', '20', '3', '', 'onepic', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('25', '多图管理', '20', '3', '', 'muitipic', '', '', '', 'pro', 'show', '100', null, null, null, null);

-- ----------------------------
-- Table structure for sys_col_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_col_auth`;
CREATE TABLE `sys_col_auth` (
  `col_id` int(10) DEFAULT NULL COMMENT '系统栏目标识',
  `col_auth` varchar(10) DEFAULT NULL COMMENT '系统栏目权限标识'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统栏目权限表';

-- ----------------------------
-- Records of sys_col_auth
-- ----------------------------
INSERT INTO `sys_col_auth` VALUES ('8', 'insert');
INSERT INTO `sys_col_auth` VALUES ('7', 'del');
INSERT INTO `sys_col_auth` VALUES ('7', 'update');
INSERT INTO `sys_col_auth` VALUES ('7', 'insert');
INSERT INTO `sys_col_auth` VALUES ('13', 'look');
INSERT INTO `sys_col_auth` VALUES ('13', 'del');
INSERT INTO `sys_col_auth` VALUES ('13', 'update');
INSERT INTO `sys_col_auth` VALUES ('13', 'insert');
INSERT INTO `sys_col_auth` VALUES ('25', 'update');
INSERT INTO `sys_col_auth` VALUES ('25', 'insert');
INSERT INTO `sys_col_auth` VALUES ('24', 'look');
INSERT INTO `sys_col_auth` VALUES ('24', 'update');
INSERT INTO `sys_col_auth` VALUES ('8', 'update');
INSERT INTO `sys_col_auth` VALUES ('8', 'del');
INSERT INTO `sys_col_auth` VALUES ('8', 'look');
INSERT INTO `sys_col_auth` VALUES ('9', 'look');
INSERT INTO `sys_col_auth` VALUES ('9', 'del');
INSERT INTO `sys_col_auth` VALUES ('9', 'update');
INSERT INTO `sys_col_auth` VALUES ('9', 'insert');
INSERT INTO `sys_col_auth` VALUES ('10', 'insert');
INSERT INTO `sys_col_auth` VALUES ('10', 'update');
INSERT INTO `sys_col_auth` VALUES ('10', 'del');
INSERT INTO `sys_col_auth` VALUES ('10', 'look');
INSERT INTO `sys_col_auth` VALUES ('11', 'update');
INSERT INTO `sys_col_auth` VALUES ('17', 'insert');
INSERT INTO `sys_col_auth` VALUES ('17', 'update');
INSERT INTO `sys_col_auth` VALUES ('17', 'del');
INSERT INTO `sys_col_auth` VALUES ('17', 'look');
INSERT INTO `sys_col_auth` VALUES ('18', 'insert');
INSERT INTO `sys_col_auth` VALUES ('18', 'update');
INSERT INTO `sys_col_auth` VALUES ('18', 'del');
INSERT INTO `sys_col_auth` VALUES ('18', 'look');
INSERT INTO `sys_col_auth` VALUES ('12', 'insert');
INSERT INTO `sys_col_auth` VALUES ('12', 'update');
INSERT INTO `sys_col_auth` VALUES ('12', 'del');
INSERT INTO `sys_col_auth` VALUES ('12', 'look');
INSERT INTO `sys_col_auth` VALUES ('14', 'insert');
INSERT INTO `sys_col_auth` VALUES ('14', 'update');
INSERT INTO `sys_col_auth` VALUES ('14', 'del');
INSERT INTO `sys_col_auth` VALUES ('14', 'look');
INSERT INTO `sys_col_auth` VALUES ('15', 'insert');
INSERT INTO `sys_col_auth` VALUES ('15', 'update');
INSERT INTO `sys_col_auth` VALUES ('15', 'del');
INSERT INTO `sys_col_auth` VALUES ('15', 'look');
INSERT INTO `sys_col_auth` VALUES ('16', 'insert');
INSERT INTO `sys_col_auth` VALUES ('16', 'update');
INSERT INTO `sys_col_auth` VALUES ('16', 'del');
INSERT INTO `sys_col_auth` VALUES ('16', 'look');
INSERT INTO `sys_col_auth` VALUES ('25', 'del');
INSERT INTO `sys_col_auth` VALUES ('25', 'look');

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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='系统数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '系统菜单权限', '0', '1', '', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('2', '新增', '1', '2', 'insert', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('3', '修改', '1', '2', 'update', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('4', '删除', '1', '2', 'del', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('5', '查看', '1', '2', 'look', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('6', '用户类型', '0', '1', '', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('7', '生产者', '6', '2', 'pro', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('8', '开发者', '6', '2', 'dev', '#337ab7', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('9', '显示', '0', '1', '', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10', '显示', '9', '2', 'show', '#5cb85c', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('11', '隐藏', '9', '2', 'hide', '#d9534f', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('12', '配置项类型', '0', '1', '', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('13', '文本', '12', '2', 'text', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('14', '单选', '12', '2', 'radio', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('15', '复选', '12', '2', 'checkbox', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('16', '下拉列表', '12', '2', 'select', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('17', '文本域', '12', '2', 'textarea', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('18', '用户状态', '0', '1', '', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('19', '正常', '18', '2', 'normal', '#5cb85c', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('20', '冻结', '18', '2', 'forzen', '#d9534f', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('21', '图片', '0', '1', '', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('22', '无图', '21', '2', 'nopic', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('23', '单图', '21', '2', 'onepic', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('24', '多图', '21', '2', 'muitipic', '#333333', '', '100', null, null, null, null);

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
  `state` char(6) DEFAULT NULL COMMENT '状态：normal=正常，forzen=冻结',
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
  `client_name` varchar(255) DEFAULT NULL COMMENT '	用户提交过来的文件名，还没有对该文件名做任何处理',
  `ext` varchar(10) DEFAULT NULL COMMENT '文件后缀名，包括句点',
  `size` double(20,2) DEFAULT NULL COMMENT '文件大小（单位 kb）',
  `is_image` tinyint(1) DEFAULT NULL COMMENT '文件是否为图片（1 = image. 0 = not.）',
  `image_width` tinyint(20) DEFAULT NULL COMMENT '图片宽度',
  `image_height` tinyint(20) DEFAULT NULL COMMENT '图片高度',
  `image_type` varchar(50) DEFAULT NULL COMMENT '图片类型（通常是不带句点的文件后缀名）',
  `image_size_str` varchar(100) DEFAULT NULL COMMENT '一个包含了图片宽度和高度的字符串（用于放在 image 标签中）',
  `errors` varchar(255) DEFAULT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='上传文件表';

-- ----------------------------
-- Records of uploads
-- ----------------------------
INSERT INTO `uploads` VALUES ('1', '835aab7ef61b29a478da1df07c4ceffd.docx', 'application/zip', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/835aab7ef61b29a478da1df07c4ceffd.docx', '/uploads/', '/uploads/835aab7ef61b29a478da1df07c4ceffd.docx', '835aab7ef61b29a478da1df07c4ceffd', '835aab7ef61b29a478da1df07c4ceffd.docx', '亨通修改.docx', '.docx', '1000.58', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('2', '23af399df738c777c65171b523d3e57d.png', 'image/png', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/23af399df738c777c65171b523d3e57d.png', '/uploads/', '/uploads/23af399df738c777c65171b523d3e57d.png', '23af399df738c777c65171b523d3e57d', '23af399df738c777c65171b523d3e57d.png', '24fa41837b9b3c814abfc3db0fb2a3d1.png', '.png', '814.04', '1', '127', '127', 'png', 'width=\"1920\" height=\"450\"', '');
INSERT INTO `uploads` VALUES ('3', 'de05a7d074e228a41539edba5a17788d.png', 'image/png', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/de05a7d074e228a41539edba5a17788d.png', '/uploads/', '/uploads/de05a7d074e228a41539edba5a17788d.png', 'de05a7d074e228a41539edba5a17788d', 'de05a7d074e228a41539edba5a17788d.png', '24fa41837b9b3c814abfc3db0fb2a3d1.png', '.png', '814.04', '1', '127', '127', 'png', 'width=\"1920\" height=\"450\"', '');
INSERT INTO `uploads` VALUES ('4', '2a14c9a5a68b4dea95f9a8ac82003e5b.png', 'image/png', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/2a14c9a5a68b4dea95f9a8ac82003e5b.png', '/uploads/', '/uploads/2a14c9a5a68b4dea95f9a8ac82003e5b.png', '2a14c9a5a68b4dea95f9a8ac82003e5b', '2a14c9a5a68b4dea95f9a8ac82003e5b.png', '24fa41837b9b3c814abfc3db0fb2a3d1.png', '.png', '814.04', '1', '127', '127', 'png', 'width=\"1920\" height=\"450\"', '');
INSERT INTO `uploads` VALUES ('5', '289486268f6bef3f4e8d06e4c3cdc9f2.png', 'image/png', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/289486268f6bef3f4e8d06e4c3cdc9f2.png', '/uploads/', '/uploads/289486268f6bef3f4e8d06e4c3cdc9f2.png', '289486268f6bef3f4e8d06e4c3cdc9f2', '289486268f6bef3f4e8d06e4c3cdc9f2.png', '24fa41837b9b3c814abfc3db0fb2a3d1.png', '.png', '814.04', '1', '127', '127', 'png', 'width=\"1920\" height=\"450\"', '');
INSERT INTO `uploads` VALUES ('6', '6783ade489ea53ebb48b499481729df3.docx', 'application/zip', 'D:/wamp/www/uploads/20160908014015/', 'D:/wamp/www/uploads/20160908014015/6783ade489ea53ebb48b499481729df3.docx', '/uploads/20160908014015/', '/uploads/20160908014015/6783ade489ea53ebb48b499481729df3.docx', '6783ade489ea53ebb48b499481729df3', '6783ade489ea53ebb48b499481729df3.docx', '亨通修改.docx', '.docx', '1000.58', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('7', 'b76590f5bbd1af85ec65709813e08cb3.docx', 'application/zip', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/b76590f5bbd1af85ec65709813e08cb3.docx', '/uploads/20160908/', '/uploads/20160908/b76590f5bbd1af85ec65709813e08cb3.docx', 'b76590f5bbd1af85ec65709813e08cb3', 'b76590f5bbd1af85ec65709813e08cb3.docx', '亨通修改.docx', '.docx', '1000.58', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('8', '6e2c68deb8942c7477c0f73ecfb5d7e2.png', 'image/png', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/6e2c68deb8942c7477c0f73ecfb5d7e2.png', '/uploads/20160908/', '/uploads/20160908/6e2c68deb8942c7477c0f73ecfb5d7e2.png', '6e2c68deb8942c7477c0f73ecfb5d7e2', '6e2c68deb8942c7477c0f73ecfb5d7e2.png', '24fa41837b9b3c814abfc3db0fb2a3d1.png', '.png', '814.04', '1', '127', '127', 'png', 'width=\"1920\" height=\"450\"', '');
INSERT INTO `uploads` VALUES ('9', '96a30642e2b8256ab37c38f62c5a69b4.png', 'image/png', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/96a30642e2b8256ab37c38f62c5a69b4.png', '/uploads/20160908/', '/uploads/20160908/96a30642e2b8256ab37c38f62c5a69b4.png', '96a30642e2b8256ab37c38f62c5a69b4', '96a30642e2b8256ab37c38f62c5a69b4.png', '24fa41837b9b3c814abfc3db0fb2a3d1.png', '.png', '814.04', '1', '127', '127', 'png', 'width=\"1920\" height=\"450\"', '');
INSERT INTO `uploads` VALUES ('10', 'f7627c71f4239f2f7c11e6a9174bfe2a.docx', 'application/zip', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/f7627c71f4239f2f7c11e6a9174bfe2a.docx', '/uploads/20160908/', '/uploads/20160908/f7627c71f4239f2f7c11e6a9174bfe2a.docx', 'f7627c71f4239f2f7c11e6a9174bfe2a', 'f7627c71f4239f2f7c11e6a9174bfe2a.docx', '亨通修改.docx', '.docx', '1000.58', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('11', '235b034582a9e155006b64a764aec676.html', 'text/html', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/235b034582a9e155006b64a764aec676.html', '/uploads/20160908/', '/uploads/20160908/235b034582a9e155006b64a764aec676.html', '235b034582a9e155006b64a764aec676', '235b034582a9e155006b64a764aec676.html', 'footer.html', '.html', '5.02', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('12', 'f72e6d3fb95338f6e39173ceee60e854.html', 'text/html', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/f72e6d3fb95338f6e39173ceee60e854.html', '/uploads/20160908/', '/uploads/20160908/f72e6d3fb95338f6e39173ceee60e854.html', 'f72e6d3fb95338f6e39173ceee60e854', 'f72e6d3fb95338f6e39173ceee60e854.html', 'contact.html', '.html', '7.33', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('13', 'f6525799fa5f97ee0448067dedf12b9a.docx', 'application/zip', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/f6525799fa5f97ee0448067dedf12b9a.docx', '/uploads/20160908/', '/uploads/20160908/f6525799fa5f97ee0448067dedf12b9a.docx', 'f6525799fa5f97ee0448067dedf12b9a', 'f6525799fa5f97ee0448067dedf12b9a.docx', '亨通修改.docx', '.docx', '1000.58', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('14', '52be2bbf85dc13771b5f1b3280cb8a0b.html', 'text/html', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/52be2bbf85dc13771b5f1b3280cb8a0b.html', '/uploads/20160908/', '/uploads/20160908/52be2bbf85dc13771b5f1b3280cb8a0b.html', '52be2bbf85dc13771b5f1b3280cb8a0b', '52be2bbf85dc13771b5f1b3280cb8a0b.html', 'footer.html', '.html', '5.02', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('15', '105f290808dd03e8aae7a78dc25960d3.png', 'image/png', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/105f290808dd03e8aae7a78dc25960d3.png', '/uploads/20160908/', '/uploads/20160908/105f290808dd03e8aae7a78dc25960d3.png', '105f290808dd03e8aae7a78dc25960d3', '105f290808dd03e8aae7a78dc25960d3.png', '24fa41837b9b3c814abfc3db0fb2a3d1.png', '.png', '814.04', '1', '127', '127', 'png', 'width=\"1920\" height=\"450\"', '');
INSERT INTO `uploads` VALUES ('16', '96e79d4445f499e8676cd08c9fa0fdc6.docx', 'application/zip', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/96e79d4445f499e8676cd08c9fa0fdc6.docx', '/uploads/20160908/', '/uploads/20160908/96e79d4445f499e8676cd08c9fa0fdc6.docx', '96e79d4445f499e8676cd08c9fa0fdc6', '96e79d4445f499e8676cd08c9fa0fdc6.docx', '亨通修改.docx', '.docx', '1000.58', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('17', 'b6cc98a7fba1b9384adfcfb1cd469975.docx', 'application/zip', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/b6cc98a7fba1b9384adfcfb1cd469975.docx', '/uploads/20160908/', '/uploads/20160908/b6cc98a7fba1b9384adfcfb1cd469975.docx', 'b6cc98a7fba1b9384adfcfb1cd469975', 'b6cc98a7fba1b9384adfcfb1cd469975.docx', '亨通修改.docx', '.docx', '1000.58', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('18', '2431bf7ad5f126dbf22855143e829be6.png', 'image/png', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/2431bf7ad5f126dbf22855143e829be6.png', '/uploads/20160908/', '/uploads/20160908/2431bf7ad5f126dbf22855143e829be6.png', '2431bf7ad5f126dbf22855143e829be6', '2431bf7ad5f126dbf22855143e829be6.png', '24fa41837b9b3c814abfc3db0fb2a3d1.png', '.png', '814.04', '1', '127', '127', 'png', 'width=\"1920\" height=\"450\"', '');
INSERT INTO `uploads` VALUES ('19', '83a78d4fa834eb8777ef4d512d49bb5a.png', 'image/png', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/83a78d4fa834eb8777ef4d512d49bb5a.png', '/uploads/20160908/', '/uploads/20160908/83a78d4fa834eb8777ef4d512d49bb5a.png', '83a78d4fa834eb8777ef4d512d49bb5a', '83a78d4fa834eb8777ef4d512d49bb5a.png', '24fa41837b9b3c814abfc3db0fb2a3d1.png', '.png', '814.04', '1', '127', '127', 'png', 'width=\"1920\" height=\"450\"', '');
INSERT INTO `uploads` VALUES ('20', 'b8e1af1cdc883af6bcd820c10d5dae7c.docx', 'application/zip', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/b8e1af1cdc883af6bcd820c10d5dae7c.docx', '/uploads/20160908/', '/uploads/20160908/b8e1af1cdc883af6bcd820c10d5dae7c.docx', 'b8e1af1cdc883af6bcd820c10d5dae7c', 'b8e1af1cdc883af6bcd820c10d5dae7c.docx', '亨通修改.docx', '.docx', '1000.58', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('21', '1c16ceeeefb3485c252bb5cb7f00de14.html', 'text/html', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/1c16ceeeefb3485c252bb5cb7f00de14.html', '/uploads/20160908/', '/uploads/20160908/1c16ceeeefb3485c252bb5cb7f00de14.html', '1c16ceeeefb3485c252bb5cb7f00de14', '1c16ceeeefb3485c252bb5cb7f00de14.html', 'contact.html', '.html', '7.33', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('22', '75c646c97c58a8eabc7c212925db1e30.png', 'image/png', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/75c646c97c58a8eabc7c212925db1e30.png', '/uploads/20160908/', '/uploads/20160908/75c646c97c58a8eabc7c212925db1e30.png', '75c646c97c58a8eabc7c212925db1e30', '75c646c97c58a8eabc7c212925db1e30.png', '24fa41837b9b3c814abfc3db0fb2a3d1.png', '.png', '814.04', '1', '127', '127', 'png', 'width=\"1920\" height=\"450\"', '');
INSERT INTO `uploads` VALUES ('23', '3f6433fea3e45449f77003a13083f472.docx', 'application/zip', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/3f6433fea3e45449f77003a13083f472.docx', '/uploads/20160908/', '/uploads/20160908/3f6433fea3e45449f77003a13083f472.docx', '3f6433fea3e45449f77003a13083f472', '3f6433fea3e45449f77003a13083f472.docx', '亨通修改.docx', '.docx', '1000.58', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('24', '66ba41b1a24a47fb3ddaa39e0e08a2fe.html', 'text/html', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/66ba41b1a24a47fb3ddaa39e0e08a2fe.html', '/uploads/20160908/', '/uploads/20160908/66ba41b1a24a47fb3ddaa39e0e08a2fe.html', '66ba41b1a24a47fb3ddaa39e0e08a2fe', '66ba41b1a24a47fb3ddaa39e0e08a2fe.html', 'footer.html', '.html', '5.02', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('25', 'f80b250e4603b916e90a191704e32f69.docx', 'application/zip', 'D:/wamp/www/uploads/20160908/', 'D:/wamp/www/uploads/20160908/f80b250e4603b916e90a191704e32f69.docx', '/uploads/20160908/', '/uploads/20160908/f80b250e4603b916e90a191704e32f69.docx', 'f80b250e4603b916e90a191704e32f69', 'f80b250e4603b916e90a191704e32f69.docx', '亨通修改.docx', '.docx', '1000.58', '0', null, null, '', '', '');
