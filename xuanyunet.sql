/*
Navicat MySQL Data Transfer

Source Server         : wamp
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : xuanyunet

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-09-07 17:41:42
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
  `url` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `image` int(10) DEFAULT NULL COMMENT '上传文件标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

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
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='上传文件表';

-- ----------------------------
-- Records of uploads
-- ----------------------------
INSERT INTO `uploads` VALUES ('1', '8fffb3e24d56d194602f004018454929.jpg', 'image/jpeg', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/8fffb3e24d56d194602f004018454929.jpg', '/uploads/', '/uploads/8fffb3e24d56d194602f004018454929.jpg', '8fffb3e24d56d194602f004018454929', '8fffb3e24d56d194602f004018454929.jpg', 'a1d0c074f9f4a7c1b0f8a206d23663eb862cc4b4112951-lKYSZ.jpg', '.jpg', '628.75', '1', '127', '127', 'jpeg', 'width=\"4608\" height=\"3072\"', '');
INSERT INTO `uploads` VALUES ('2', '2e085f0391c035b0a7926d220342700e.7z', 'application/x-7z-compressed', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/2e085f0391c035b0a7926d220342700e.7z', '/uploads/', '/uploads/2e085f0391c035b0a7926d220342700e.7z', '2e085f0391c035b0a7926d220342700e', '2e085f0391c035b0a7926d220342700e.7z', '光晕笔刷2.7z', '.7z', '3301.91', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('3', '5a45670f89ce890302b42739366442f5.png', 'image/png', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/5a45670f89ce890302b42739366442f5.png', '/uploads/', '/uploads/5a45670f89ce890302b42739366442f5.png', '5a45670f89ce890302b42739366442f5', '5a45670f89ce890302b42739366442f5.png', '一摞书1.png', '.png', '319.25', '1', '127', '127', 'png', 'width=\"512\" height=\"512\"', '');
INSERT INTO `uploads` VALUES ('4', '6053c789b859374e2f0e7130a01e042e.docx', 'application/vnd.openxmlformats-officedocument.word', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/6053c789b859374e2f0e7130a01e042e.docx', '/uploads/', '/uploads/6053c789b859374e2f0e7130a01e042e.docx', '6053c789b859374e2f0e7130a01e042e', '6053c789b859374e2f0e7130a01e042e.docx', '13.docx', '.docx', '11.33', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('5', 'afc9ba3d3a87eda8e587f27baf11a2b8.zip', 'application/zip', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/afc9ba3d3a87eda8e587f27baf11a2b8.zip', '/uploads/', '/uploads/afc9ba3d3a87eda8e587f27baf11a2b8.zip', 'afc9ba3d3a87eda8e587f27baf11a2b8', 'afc9ba3d3a87eda8e587f27baf11a2b8.zip', '53bd16e20a31a.zip', '.zip', '4311.81', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('6', 'b448cc04a493b8797c3cad16f14fb07f.eps', 'application/octet-stream', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/b448cc04a493b8797c3cad16f14fb07f.eps', '/uploads/', '/uploads/b448cc04a493b8797c3cad16f14fb07f.eps', 'b448cc04a493b8797c3cad16f14fb07f', 'b448cc04a493b8797c3cad16f14fb07f.eps', '53bd01fd01b6d.eps', '.eps', '8719.53', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('7', 'd190bb6bf8e51ba5f539ca93728785b5.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/d190bb6bf8e51ba5f539ca93728785b5.rar', '/uploads/', '/uploads/d190bb6bf8e51ba5f539ca93728785b5.rar', 'd190bb6bf8e51ba5f539ca93728785b5', 'd190bb6bf8e51ba5f539ca93728785b5.rar', '草地2.rar', '.rar', '2746.09', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('8', 'a66b24077829d75fbad6751ebcd87725.png', 'image/png', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/a66b24077829d75fbad6751ebcd87725.png', '/uploads/', '/uploads/a66b24077829d75fbad6751ebcd87725.png', 'a66b24077829d75fbad6751ebcd87725', 'a66b24077829d75fbad6751ebcd87725.png', '一摞书1.png', '.png', '319.25', '1', '127', '127', 'png', 'width=\"512\" height=\"512\"', '');
INSERT INTO `uploads` VALUES ('9', 'bb7b8c8e053bf748e78199d81afe0aa1.png', 'image/png', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/bb7b8c8e053bf748e78199d81afe0aa1.png', '/uploads/', '/uploads/bb7b8c8e053bf748e78199d81afe0aa1.png', 'bb7b8c8e053bf748e78199d81afe0aa1', 'bb7b8c8e053bf748e78199d81afe0aa1.png', '一摞书2.png', '.png', '280.00', '1', '127', '127', 'png', 'width=\"512\" height=\"512\"', '');
INSERT INTO `uploads` VALUES ('10', 'edb9d40ea24b6c4a5523ac10634e6f43.zip', 'application/zip', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/edb9d40ea24b6c4a5523ac10634e6f43.zip', '/uploads/', '/uploads/edb9d40ea24b6c4a5523ac10634e6f43.zip', 'edb9d40ea24b6c4a5523ac10634e6f43', 'edb9d40ea24b6c4a5523ac10634e6f43.zip', '一摞书5.zip', '.zip', '29245.36', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('11', '596bd9800263a1c3b3a3b83abfa5fc6e.zip', 'application/zip', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/596bd9800263a1c3b3a3b83abfa5fc6e.zip', '/uploads/', '/uploads/596bd9800263a1c3b3a3b83abfa5fc6e.zip', '596bd9800263a1c3b3a3b83abfa5fc6e', '596bd9800263a1c3b3a3b83abfa5fc6e.zip', '纸飞机.zip', '.zip', '34478.72', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('12', '16756bf6d06954f7b190bd3e7b95e203.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/16756bf6d06954f7b190bd3e7b95e203.rar', '/uploads/', '/uploads/16756bf6d06954f7b190bd3e7b95e203.rar', '16756bf6d06954f7b190bd3e7b95e203', '16756bf6d06954f7b190bd3e7b95e203.rar', '草地2.rar', '.rar', '2746.09', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('13', '5c097bc41978981d80d0bd21fb847bc3.7z', 'application/x-7z-compressed', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/5c097bc41978981d80d0bd21fb847bc3.7z', '/uploads/', '/uploads/5c097bc41978981d80d0bd21fb847bc3.7z', '5c097bc41978981d80d0bd21fb847bc3', '5c097bc41978981d80d0bd21fb847bc3.7z', '光晕笔刷1.7z', '.7z', '214.36', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('14', '3f29cdd7846afe8eafed66919fe1f97a.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/3f29cdd7846afe8eafed66919fe1f97a.rar', '/uploads/', '/uploads/3f29cdd7846afe8eafed66919fe1f97a.rar', '3f29cdd7846afe8eafed66919fe1f97a', '3f29cdd7846afe8eafed66919fe1f97a.rar', '草地1.rar', '.rar', '4357.99', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('15', 'b3d92c80be79b972e922c7836cfbd254.jpg', 'image/jpeg', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/b3d92c80be79b972e922c7836cfbd254.jpg', '/uploads/', '/uploads/b3d92c80be79b972e922c7836cfbd254.jpg', 'b3d92c80be79b972e922c7836cfbd254', 'b3d92c80be79b972e922c7836cfbd254.jpg', 'a1d0c074f9f4a7c1b0f8a206d23663eb862cc4b4112951-lKYSZ.jpg', '.jpg', '628.75', '1', '127', '127', 'jpeg', 'width=\"4608\" height=\"3072\"', '');
INSERT INTO `uploads` VALUES ('16', '2310f1ef84e88df0ee9f82265d79f9f5.jpg', 'image/jpeg', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/2310f1ef84e88df0ee9f82265d79f9f5.jpg', '/uploads/', '/uploads/2310f1ef84e88df0ee9f82265d79f9f5.jpg', '2310f1ef84e88df0ee9f82265d79f9f5', '2310f1ef84e88df0ee9f82265d79f9f5.jpg', 'a1d0c074f9f4a7c1b0f8a206d23663eb862cc4b4112951-lKYSZ.jpg', '.jpg', '628.75', '1', '127', '127', 'jpeg', 'width=\"4608\" height=\"3072\"', '');
INSERT INTO `uploads` VALUES ('17', '57f0efd7b49dbefc9a7cdc7691394c9e.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/57f0efd7b49dbefc9a7cdc7691394c9e.rar', '/uploads/', '/uploads/57f0efd7b49dbefc9a7cdc7691394c9e.rar', '57f0efd7b49dbefc9a7cdc7691394c9e', '57f0efd7b49dbefc9a7cdc7691394c9e.rar', '草地2.rar', '.rar', '2746.09', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('18', '962e5a9b0ae64f6187e09fcf0087f96b.7z', 'application/x-7z-compressed', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/962e5a9b0ae64f6187e09fcf0087f96b.7z', '/uploads/', '/uploads/962e5a9b0ae64f6187e09fcf0087f96b.7z', '962e5a9b0ae64f6187e09fcf0087f96b', '962e5a9b0ae64f6187e09fcf0087f96b.7z', '光晕笔刷2.7z', '.7z', '3301.91', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('19', '96d932792fb400580e1889239ae731ef.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/96d932792fb400580e1889239ae731ef.rar', '/uploads/', '/uploads/96d932792fb400580e1889239ae731ef.rar', '96d932792fb400580e1889239ae731ef', '96d932792fb400580e1889239ae731ef.rar', '草地2.rar', '.rar', '2746.09', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('20', '2be05119309d41459a9789a8e463954d.7z', 'application/x-7z-compressed', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/2be05119309d41459a9789a8e463954d.7z', '/uploads/', '/uploads/2be05119309d41459a9789a8e463954d.7z', '2be05119309d41459a9789a8e463954d', '2be05119309d41459a9789a8e463954d.7z', '光晕笔刷1.7z', '.7z', '214.36', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('21', 'bf096690dd25036a38d7d85af35b3a28.jpg', 'image/jpeg', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/bf096690dd25036a38d7d85af35b3a28.jpg', '/uploads/', '/uploads/bf096690dd25036a38d7d85af35b3a28.jpg', 'bf096690dd25036a38d7d85af35b3a28', 'bf096690dd25036a38d7d85af35b3a28.jpg', 'a1d0c074f9f4a7c1b0f8a206d23663eb862cc4b4112951-lKYSZ.jpg', '.jpg', '628.75', '1', '127', '127', 'jpeg', 'width=\"4608\" height=\"3072\"', '');
INSERT INTO `uploads` VALUES ('22', '8940f23020209bbdaee6c1b8b0d1a385.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/8940f23020209bbdaee6c1b8b0d1a385.rar', '/uploads/', '/uploads/8940f23020209bbdaee6c1b8b0d1a385.rar', '8940f23020209bbdaee6c1b8b0d1a385', '8940f23020209bbdaee6c1b8b0d1a385.rar', '草地2.rar', '.rar', '2746.09', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('23', 'ec5796fb6b90de431df03038c194fac3.7z', 'application/x-7z-compressed', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/ec5796fb6b90de431df03038c194fac3.7z', '/uploads/', '/uploads/ec5796fb6b90de431df03038c194fac3.7z', 'ec5796fb6b90de431df03038c194fac3', 'ec5796fb6b90de431df03038c194fac3.7z', '光晕笔刷1.7z', '.7z', '214.36', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('24', '68be0da1daaee8a21e335c16d82f3294.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/68be0da1daaee8a21e335c16d82f3294.rar', '/uploads/', '/uploads/68be0da1daaee8a21e335c16d82f3294.rar', '68be0da1daaee8a21e335c16d82f3294', '68be0da1daaee8a21e335c16d82f3294.rar', '草地2.rar', '.rar', '2746.09', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('25', 'f70825346e0acc6aaee3e3ab1688afa4.zip', 'application/zip', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/f70825346e0acc6aaee3e3ab1688afa4.zip', '/uploads/', '/uploads/f70825346e0acc6aaee3e3ab1688afa4.zip', 'f70825346e0acc6aaee3e3ab1688afa4', 'f70825346e0acc6aaee3e3ab1688afa4.zip', '全尺寸PC收银台官方视觉素材.zip', '.zip', '70.14', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('26', '8444e1def6cf176197a65520aa6dcacf.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/8444e1def6cf176197a65520aa6dcacf.rar', '/uploads/', '/uploads/8444e1def6cf176197a65520aa6dcacf.rar', '8444e1def6cf176197a65520aa6dcacf', '8444e1def6cf176197a65520aa6dcacf.rar', '草地2.rar', '.rar', '2746.09', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('27', '2bc949d922f51431e553d733dbbba9b7.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/2bc949d922f51431e553d733dbbba9b7.rar', '/uploads/', '/uploads/2bc949d922f51431e553d733dbbba9b7.rar', '2bc949d922f51431e553d733dbbba9b7', '2bc949d922f51431e553d733dbbba9b7.rar', '草地2.rar', '.rar', '2746.09', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('28', '709e5b7cad11969455929786ea354118.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/709e5b7cad11969455929786ea354118.rar', '/uploads/', '/uploads/709e5b7cad11969455929786ea354118.rar', '709e5b7cad11969455929786ea354118', '709e5b7cad11969455929786ea354118.rar', '草地2.rar', '.rar', '2746.09', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('29', 'a7a0ca2686f1de66f7bd63ab903d1667.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/a7a0ca2686f1de66f7bd63ab903d1667.rar', '/uploads/', '/uploads/a7a0ca2686f1de66f7bd63ab903d1667.rar', 'a7a0ca2686f1de66f7bd63ab903d1667', 'a7a0ca2686f1de66f7bd63ab903d1667.rar', '草地2.rar', '.rar', '2746.09', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('30', 'b0cf6d7a8548fae82ce0335010bf6d36.7z', 'application/x-7z-compressed', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/b0cf6d7a8548fae82ce0335010bf6d36.7z', '/uploads/', '/uploads/b0cf6d7a8548fae82ce0335010bf6d36.7z', 'b0cf6d7a8548fae82ce0335010bf6d36', 'b0cf6d7a8548fae82ce0335010bf6d36.7z', '光晕笔刷1.7z', '.7z', '214.36', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('31', 'd96b46a9fa269a17f5488b6d45a67a4d.7z', 'application/x-7z-compressed', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/d96b46a9fa269a17f5488b6d45a67a4d.7z', '/uploads/', '/uploads/d96b46a9fa269a17f5488b6d45a67a4d.7z', 'd96b46a9fa269a17f5488b6d45a67a4d', 'd96b46a9fa269a17f5488b6d45a67a4d.7z', '光晕笔刷1.7z', '.7z', '214.36', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('32', '77658d9ee5dc93b0ebdbcaa5c8af8eed.7z', 'application/x-7z-compressed', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/77658d9ee5dc93b0ebdbcaa5c8af8eed.7z', '/uploads/', '/uploads/77658d9ee5dc93b0ebdbcaa5c8af8eed.7z', '77658d9ee5dc93b0ebdbcaa5c8af8eed', '77658d9ee5dc93b0ebdbcaa5c8af8eed.7z', '光晕笔刷1.7z', '.7z', '214.36', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('33', '1ae9531adc7d0d7e3dab083b86867655.7z', 'application/x-7z-compressed', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/1ae9531adc7d0d7e3dab083b86867655.7z', '/uploads/', '/uploads/1ae9531adc7d0d7e3dab083b86867655.7z', '1ae9531adc7d0d7e3dab083b86867655', '1ae9531adc7d0d7e3dab083b86867655.7z', '光晕笔刷1.7z', '.7z', '214.36', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('34', '210ff1e77ac0dde42702ff1de7bc35c7.7z', 'application/x-7z-compressed', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/210ff1e77ac0dde42702ff1de7bc35c7.7z', '/uploads/', '/uploads/210ff1e77ac0dde42702ff1de7bc35c7.7z', '210ff1e77ac0dde42702ff1de7bc35c7', '210ff1e77ac0dde42702ff1de7bc35c7.7z', '光晕笔刷1.7z', '.7z', '214.36', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('35', '31b44fe9f51b204bd24a1aa669bf80f3.7z', 'application/x-7z-compressed', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/31b44fe9f51b204bd24a1aa669bf80f3.7z', '/uploads/', '/uploads/31b44fe9f51b204bd24a1aa669bf80f3.7z', '31b44fe9f51b204bd24a1aa669bf80f3', '31b44fe9f51b204bd24a1aa669bf80f3.7z', '光晕笔刷1.7z', '.7z', '214.36', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('36', 'd0fd7ebadb355f838982a5efff0a5e0d.7z', 'application/x-7z-compressed', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/d0fd7ebadb355f838982a5efff0a5e0d.7z', '/uploads/', '/uploads/d0fd7ebadb355f838982a5efff0a5e0d.7z', 'd0fd7ebadb355f838982a5efff0a5e0d', 'd0fd7ebadb355f838982a5efff0a5e0d.7z', '光晕笔刷1.7z', '.7z', '214.36', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('37', '96feebc5cdf225e292847e8df3fa5873.zip', 'application/zip', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/96feebc5cdf225e292847e8df3fa5873.zip', '/uploads/', '/uploads/96feebc5cdf225e292847e8df3fa5873.zip', '96feebc5cdf225e292847e8df3fa5873', '96feebc5cdf225e292847e8df3fa5873.zip', '全尺寸PC收银台官方视觉素材.zip', '.zip', '70.14', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('38', '9bafe0bbbbe77195c6d9d48ccf9e78b5.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/9bafe0bbbbe77195c6d9d48ccf9e78b5.rar', '/uploads/', '/uploads/9bafe0bbbbe77195c6d9d48ccf9e78b5.rar', '9bafe0bbbbe77195c6d9d48ccf9e78b5', '9bafe0bbbbe77195c6d9d48ccf9e78b5.rar', '草地2.rar', '.rar', '2746.09', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('39', 'aaae2f4b384076b1f1f419ac1db45898.zip', 'application/zip', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/aaae2f4b384076b1f1f419ac1db45898.zip', '/uploads/', '/uploads/aaae2f4b384076b1f1f419ac1db45898.zip', 'aaae2f4b384076b1f1f419ac1db45898', 'aaae2f4b384076b1f1f419ac1db45898.zip', '一摞书5.zip', '.zip', '29245.36', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('40', '157be54f6eed938d765e1b475c78e7b4.eps', 'application/octet-stream', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/157be54f6eed938d765e1b475c78e7b4.eps', '/uploads/', '/uploads/157be54f6eed938d765e1b475c78e7b4.eps', '157be54f6eed938d765e1b475c78e7b4', '157be54f6eed938d765e1b475c78e7b4.eps', '53bd01fd01b6d.eps', '.eps', '8719.53', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('41', '0f6a5b7fe7d2e07c2a9210f6e731eb48.png', 'image/png', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/0f6a5b7fe7d2e07c2a9210f6e731eb48.png', '/uploads/', '/uploads/0f6a5b7fe7d2e07c2a9210f6e731eb48.png', '0f6a5b7fe7d2e07c2a9210f6e731eb48', '0f6a5b7fe7d2e07c2a9210f6e731eb48.png', '草地3.png', '.png', '388.63', '1', '127', '127', 'png', 'width=\"1920\" height=\"325\"', '');
INSERT INTO `uploads` VALUES ('42', '12f9a26911b31491a500c63233938860.zip', 'application/zip', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/12f9a26911b31491a500c63233938860.zip', '/uploads/', '/uploads/12f9a26911b31491a500c63233938860.zip', '12f9a26911b31491a500c63233938860', '12f9a26911b31491a500c63233938860.zip', '一摞书5.zip', '.zip', '29245.36', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('43', 'bfae7f87fe596f7cd3c3cb0279f2e8b0.7z', 'application/x-7z-compressed', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/bfae7f87fe596f7cd3c3cb0279f2e8b0.7z', '/uploads/', '/uploads/bfae7f87fe596f7cd3c3cb0279f2e8b0.7z', 'bfae7f87fe596f7cd3c3cb0279f2e8b0', 'bfae7f87fe596f7cd3c3cb0279f2e8b0.7z', '光晕笔刷1.7z', '.7z', '214.36', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('44', 'cf84dd22db36653a8c306ae74998a5c1.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/cf84dd22db36653a8c306ae74998a5c1.rar', '/uploads/', '/uploads/cf84dd22db36653a8c306ae74998a5c1.rar', 'cf84dd22db36653a8c306ae74998a5c1', 'cf84dd22db36653a8c306ae74998a5c1.rar', '草地2.rar', '.rar', '2746.09', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('45', 'e1a5f9e1bf7a5ac53ebe07faaf2f23be.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/e1a5f9e1bf7a5ac53ebe07faaf2f23be.rar', '/uploads/', '/uploads/e1a5f9e1bf7a5ac53ebe07faaf2f23be.rar', 'e1a5f9e1bf7a5ac53ebe07faaf2f23be', 'e1a5f9e1bf7a5ac53ebe07faaf2f23be.rar', '草地1.rar', '.rar', '4357.99', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('46', '48faee8bf7d971aa748a6f783076eeb6', '', '/uploads/', '/uploads/48faee8bf7d971aa748a6f783076eeb6', null, '48faee8bf7d971aa748a6f783076eeb6', '48faee8bf7d971aa748a6f783076eeb6', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('47', '3d8a9ab128c1c27dbca52983de9b1c1c', '', '/uploads/', '/uploads/3d8a9ab128c1c27dbca52983de9b1c1c', null, '3d8a9ab128c1c27dbca52983de9b1c1c', '3d8a9ab128c1c27dbca52983de9b1c1c', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('48', '41dd5b69a38ca759259ca365c775600a', '', '/uploads/', '/uploads/41dd5b69a38ca759259ca365c775600a', null, '41dd5b69a38ca759259ca365c775600a', '41dd5b69a38ca759259ca365c775600a', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('49', '86e8f84197b02d2f4167416aa598816c.rar', 'application/x-rar', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/86e8f84197b02d2f4167416aa598816c.rar', '/uploads/', '/uploads/86e8f84197b02d2f4167416aa598816c.rar', '86e8f84197b02d2f4167416aa598816c', '86e8f84197b02d2f4167416aa598816c.rar', '草地2.rar', '.rar', '2746.09', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('50', 'aa8bfe9a9fc6cfed1fb4f4ccb05dcc1b', '', '/uploads/', '/uploads/aa8bfe9a9fc6cfed1fb4f4ccb05dcc1b', null, 'aa8bfe9a9fc6cfed1fb4f4ccb05dcc1b', 'aa8bfe9a9fc6cfed1fb4f4ccb05dcc1b', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('51', '92ba845729e55eb32475b8590e81d6d7', '', '/uploads/', '/uploads/92ba845729e55eb32475b8590e81d6d7', null, '92ba845729e55eb32475b8590e81d6d7', '92ba845729e55eb32475b8590e81d6d7', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('52', '206dd24d423c98ff926dd914d1849b30', '', '/uploads/', '/uploads/206dd24d423c98ff926dd914d1849b30', null, '206dd24d423c98ff926dd914d1849b30', '206dd24d423c98ff926dd914d1849b30', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('53', 'f1a1b1e12a12b79488de8c7a75004311', '', '/uploads/', '/uploads/f1a1b1e12a12b79488de8c7a75004311', null, 'f1a1b1e12a12b79488de8c7a75004311', 'f1a1b1e12a12b79488de8c7a75004311', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('54', '14cf323e6aff911fdd2ce95ecc348023', '', '/uploads/', '/uploads/14cf323e6aff911fdd2ce95ecc348023', null, '14cf323e6aff911fdd2ce95ecc348023', '14cf323e6aff911fdd2ce95ecc348023', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('55', '6eeb6bb3b7e0f406b62d5a5d5dff4f2e', '', '/uploads/', '/uploads/6eeb6bb3b7e0f406b62d5a5d5dff4f2e', null, '6eeb6bb3b7e0f406b62d5a5d5dff4f2e', '6eeb6bb3b7e0f406b62d5a5d5dff4f2e', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('56', 'f2c8adba682171613997d1e89f796a98', '', '/uploads/', '/uploads/f2c8adba682171613997d1e89f796a98', null, 'f2c8adba682171613997d1e89f796a98', 'f2c8adba682171613997d1e89f796a98', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('57', '6bd33bfb14bdfc41b5f32da430eaff6d', '', '/uploads/', '/uploads/6bd33bfb14bdfc41b5f32da430eaff6d', null, '6bd33bfb14bdfc41b5f32da430eaff6d', '6bd33bfb14bdfc41b5f32da430eaff6d', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('58', 'f677ea170898b1a97e33cf39d3e0a934', '', '/uploads/', '/uploads/f677ea170898b1a97e33cf39d3e0a934', null, 'f677ea170898b1a97e33cf39d3e0a934', 'f677ea170898b1a97e33cf39d3e0a934', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('59', '30077d245090c09a8c695ae25cc36e96', '', '/uploads/', '/uploads/30077d245090c09a8c695ae25cc36e96', null, '30077d245090c09a8c695ae25cc36e96', '30077d245090c09a8c695ae25cc36e96', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('60', 'eb9fe4810a2dc0546e970cbfc270d47f', '', '/uploads/', '/uploads/eb9fe4810a2dc0546e970cbfc270d47f', null, 'eb9fe4810a2dc0546e970cbfc270d47f', 'eb9fe4810a2dc0546e970cbfc270d47f', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('61', 'ca44ae7362b43d290c355a8a66920d97', '', '/uploads/', '/uploads/ca44ae7362b43d290c355a8a66920d97', null, 'ca44ae7362b43d290c355a8a66920d97', 'ca44ae7362b43d290c355a8a66920d97', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('62', 'd301de16c616d2859836236920805adc', '', '/uploads/', '/uploads/d301de16c616d2859836236920805adc', null, 'd301de16c616d2859836236920805adc', 'd301de16c616d2859836236920805adc', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('63', '1afd49c8f0999446b9622256d0586e6b', '', '/uploads/', '/uploads/1afd49c8f0999446b9622256d0586e6b', null, '1afd49c8f0999446b9622256d0586e6b', '1afd49c8f0999446b9622256d0586e6b', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('64', '921cb8fc93cfe903d0ca5200f0523c8d', '', '/uploads/', '/uploads/921cb8fc93cfe903d0ca5200f0523c8d', null, '921cb8fc93cfe903d0ca5200f0523c8d', '921cb8fc93cfe903d0ca5200f0523c8d', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('65', '71effcfb028e3e8787302cc47f36e113', '', '/uploads/', '/uploads/71effcfb028e3e8787302cc47f36e113', null, '71effcfb028e3e8787302cc47f36e113', '71effcfb028e3e8787302cc47f36e113', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('66', '313ce5ecae510632203b4edd08b15d9d', '', '/uploads/', '/uploads/313ce5ecae510632203b4edd08b15d9d', null, '313ce5ecae510632203b4edd08b15d9d', '313ce5ecae510632203b4edd08b15d9d', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('67', '1b41228738704e7e9a2fac001106cae6', '', '/uploads/', '/uploads/1b41228738704e7e9a2fac001106cae6', null, '1b41228738704e7e9a2fac001106cae6', '1b41228738704e7e9a2fac001106cae6', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('68', '5257a7a388b9fcfe957fcff8d609c91a.png', 'image/png', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/5257a7a388b9fcfe957fcff8d609c91a.png', '/uploads/', '/uploads/5257a7a388b9fcfe957fcff8d609c91a.png', '5257a7a388b9fcfe957fcff8d609c91a', '5257a7a388b9fcfe957fcff8d609c91a.png', '草地3.png', '.png', '388.63', '1', '127', '127', 'png', 'width=\"1920\" height=\"325\"', '');
INSERT INTO `uploads` VALUES ('69', '51f01e66732d6689eaac6b664a1cb22d.png', 'image/png', 'D:/wamp/www/uploads/', 'D:/wamp/www/uploads/51f01e66732d6689eaac6b664a1cb22d.png', '/uploads/', '/uploads/51f01e66732d6689eaac6b664a1cb22d.png', '51f01e66732d6689eaac6b664a1cb22d', '51f01e66732d6689eaac6b664a1cb22d.png', '草地3.png', '.png', '388.63', '1', '127', '127', 'png', 'width=\"1920\" height=\"325\"', '');
INSERT INTO `uploads` VALUES ('70', '69c096d33b70352f664f6d01831a36dc', '', '/uploads/', '/uploads/69c096d33b70352f664f6d01831a36dc', null, '69c096d33b70352f664f6d01831a36dc', '69c096d33b70352f664f6d01831a36dc', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
