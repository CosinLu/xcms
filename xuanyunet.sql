/*
Navicat MySQL Data Transfer

Source Server         : wamp
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : xuanyunet

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-09-09 18:54:17
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='信息文章表';

-- ----------------------------
-- Records of info_article
-- ----------------------------
INSERT INTO `info_article` VALUES ('1', '7', '123', null, '', null, 'show', '100', null, null, null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES ('4', 'test1', '54,75,77', '', '', 'show', '100', null, null, null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='上传文件表';

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
INSERT INTO `uploads` VALUES ('26', '99ab4cdb22e569da1d1136ce641a6b00.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/99ab4cdb22e569da1d1136ce641a6b00.png', '/uploads/20160909/', '/uploads/20160909/99ab4cdb22e569da1d1136ce641a6b00.png', '99ab4cdb22e569da1d1136ce641a6b00', '99ab4cdb22e569da1d1136ce641a6b00.png', 'QQ截图20160615115334.png', '.png', '11.81', '1', '92', '55', 'png', 'width=\"92\" height=\"55\"', '');
INSERT INTO `uploads` VALUES ('27', '86a88b419a224edbdc4617fb136bf307.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/86a88b419a224edbdc4617fb136bf307.png', '/uploads/20160909/', '/uploads/20160909/86a88b419a224edbdc4617fb136bf307.png', '86a88b419a224edbdc4617fb136bf307', '86a88b419a224edbdc4617fb136bf307.png', 'QQ截图20160615115044.png', '.png', '6.43', '1', '71', '41', 'png', 'width=\"71\" height=\"41\"', '');
INSERT INTO `uploads` VALUES ('28', '7e941d7cfc1d08e9fc5321e6b9037f07.jpg', 'image/jpeg', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/7e941d7cfc1d08e9fc5321e6b9037f07.jpg', '/uploads/20160909/', '/uploads/20160909/7e941d7cfc1d08e9fc5321e6b9037f07.jpg', '7e941d7cfc1d08e9fc5321e6b9037f07', '7e941d7cfc1d08e9fc5321e6b9037f07.jpg', '9463df9191e7fea174158c440ee7145a.jpg', '.jpg', '459.53', '1', '127', '127', 'jpeg', 'width=\"2272\" height=\"1704\"', '');
INSERT INTO `uploads` VALUES ('29', 'a1bef5078cc104d8fffd7cc1685422f8', '', '/uploads/20160909/', '/uploads/20160909/a1bef5078cc104d8fffd7cc1685422f8', null, 'a1bef5078cc104d8fffd7cc1685422f8', 'a1bef5078cc104d8fffd7cc1685422f8', '', '', '', null, '0', null, null, '', '', '<p>没有选择要上传的文件。  </p>');
INSERT INTO `uploads` VALUES ('30', '5299337e78e4f9f1cfa4ac845bf6b7df.jpg', 'image/jpeg', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/5299337e78e4f9f1cfa4ac845bf6b7df.jpg', '/uploads/20160909/', '/uploads/20160909/5299337e78e4f9f1cfa4ac845bf6b7df.jpg', '5299337e78e4f9f1cfa4ac845bf6b7df', '5299337e78e4f9f1cfa4ac845bf6b7df.jpg', '9463df9191e7fea174158c440ee7145a.jpg', '.jpg', '459.53', '1', '127', '127', 'jpeg', 'width=\"2272\" height=\"1704\"', '');
INSERT INTO `uploads` VALUES ('31', 'ddfeff8219952c62c0953ba3f77eae30.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/ddfeff8219952c62c0953ba3f77eae30.png', '/uploads/20160909/', '/uploads/20160909/ddfeff8219952c62c0953ba3f77eae30.png', 'ddfeff8219952c62c0953ba3f77eae30', 'ddfeff8219952c62c0953ba3f77eae30.png', 'QQ截图20160615115028.png', '.png', '9.81', '1', '89', '51', 'png', 'width=\"89\" height=\"51\"', '');
INSERT INTO `uploads` VALUES ('32', '4664e4a4b726c5d35a60c770f65999bc.jpg', 'image/jpeg', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/4664e4a4b726c5d35a60c770f65999bc.jpg', '/uploads/20160909/', '/uploads/20160909/4664e4a4b726c5d35a60c770f65999bc.jpg', '4664e4a4b726c5d35a60c770f65999bc', '4664e4a4b726c5d35a60c770f65999bc.jpg', '9463df9191e7fea174158c440ee7145a.jpg', '.jpg', '459.53', '1', '127', '127', 'jpeg', 'width=\"2272\" height=\"1704\"', '');
INSERT INTO `uploads` VALUES ('33', '1cddc022a6cd0c427042718998c82f79.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/1cddc022a6cd0c427042718998c82f79.png', '/uploads/20160909/', '/uploads/20160909/1cddc022a6cd0c427042718998c82f79.png', '1cddc022a6cd0c427042718998c82f79', '1cddc022a6cd0c427042718998c82f79.png', 'QQ截图20160615115028.png', '.png', '9.81', '1', '89', '51', 'png', 'width=\"89\" height=\"51\"', '');
INSERT INTO `uploads` VALUES ('34', 'fec0f1d8d60a11b0b80f1921e064dff0.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/fec0f1d8d60a11b0b80f1921e064dff0.png', '/uploads/20160909/', '/uploads/20160909/fec0f1d8d60a11b0b80f1921e064dff0.png', 'fec0f1d8d60a11b0b80f1921e064dff0', 'fec0f1d8d60a11b0b80f1921e064dff0.png', 'QQ截图20160615150937.png', '.png', '8.64', '1', '101', '55', 'png', 'width=\"101\" height=\"55\"', '');
INSERT INTO `uploads` VALUES ('35', 'a0ef5ebafa003e46a1ff6d3308330ad6.jpg', 'image/jpeg', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/a0ef5ebafa003e46a1ff6d3308330ad6.jpg', '/uploads/20160909/', '/uploads/20160909/a0ef5ebafa003e46a1ff6d3308330ad6.jpg', 'a0ef5ebafa003e46a1ff6d3308330ad6', 'a0ef5ebafa003e46a1ff6d3308330ad6.jpg', '9463df9191e7fea174158c440ee7145a.jpg', '.jpg', '459.53', '1', '127', '127', 'jpeg', 'width=\"2272\" height=\"1704\"', '');
INSERT INTO `uploads` VALUES ('36', 'cb8e95746324f879b2c4f6ea36e7acbb.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/cb8e95746324f879b2c4f6ea36e7acbb.png', '/uploads/20160909/', '/uploads/20160909/cb8e95746324f879b2c4f6ea36e7acbb.png', 'cb8e95746324f879b2c4f6ea36e7acbb', 'cb8e95746324f879b2c4f6ea36e7acbb.png', 'QQ截图20160615150937.png', '.png', '8.64', '1', '101', '55', 'png', 'width=\"101\" height=\"55\"', '');
INSERT INTO `uploads` VALUES ('37', 'ed72e227464f661e261c584ff1aaf5ae.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/ed72e227464f661e261c584ff1aaf5ae.png', '/uploads/20160909/', '/uploads/20160909/ed72e227464f661e261c584ff1aaf5ae.png', 'ed72e227464f661e261c584ff1aaf5ae', 'ed72e227464f661e261c584ff1aaf5ae.png', 'QQ截图20160615155453.png', '.png', '3.55', '1', '43', '43', 'png', 'width=\"43\" height=\"43\"', '');
INSERT INTO `uploads` VALUES ('38', '9ac719eaf83452f471237847c01e5ea0.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/9ac719eaf83452f471237847c01e5ea0.png', '/uploads/20160909/', '/uploads/20160909/9ac719eaf83452f471237847c01e5ea0.png', '9ac719eaf83452f471237847c01e5ea0', '9ac719eaf83452f471237847c01e5ea0.png', 'QQ截图20160616142927.png', '.png', '4.08', '1', '57', '29', 'png', 'width=\"57\" height=\"29\"', '');
INSERT INTO `uploads` VALUES ('39', 'af9e23834f68e0e7d3cb5593c801e782.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/af9e23834f68e0e7d3cb5593c801e782.png', '/uploads/20160909/', '/uploads/20160909/af9e23834f68e0e7d3cb5593c801e782.png', 'af9e23834f68e0e7d3cb5593c801e782', 'af9e23834f68e0e7d3cb5593c801e782.png', 'QQ截图20160615115334.png', '.png', '11.81', '1', '92', '55', 'png', 'width=\"92\" height=\"55\"', '');
INSERT INTO `uploads` VALUES ('40', '0494cd57c1061eecea90eb7f05d8d2dc.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/0494cd57c1061eecea90eb7f05d8d2dc.png', '/uploads/20160909/', '/uploads/20160909/0494cd57c1061eecea90eb7f05d8d2dc.png', '0494cd57c1061eecea90eb7f05d8d2dc', '0494cd57c1061eecea90eb7f05d8d2dc.png', 'QQ截图20160615155453.png', '.png', '3.55', '1', '43', '43', 'png', 'width=\"43\" height=\"43\"', '');
INSERT INTO `uploads` VALUES ('41', '93d78cb5ed34d0a163b4cd7038da3e6b.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/93d78cb5ed34d0a163b4cd7038da3e6b.png', '/uploads/20160909/', '/uploads/20160909/93d78cb5ed34d0a163b4cd7038da3e6b.png', '93d78cb5ed34d0a163b4cd7038da3e6b', '93d78cb5ed34d0a163b4cd7038da3e6b.png', 'QQ截图20160615150937.png', '.png', '8.64', '1', '101', '55', 'png', 'width=\"101\" height=\"55\"', '');
INSERT INTO `uploads` VALUES ('42', '144f20bac37ea3d404116d32fd28a351.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/144f20bac37ea3d404116d32fd28a351.png', '/uploads/20160909/', '/uploads/20160909/144f20bac37ea3d404116d32fd28a351.png', '144f20bac37ea3d404116d32fd28a351', '144f20bac37ea3d404116d32fd28a351.png', 'QQ截图20160615150937.png', '.png', '8.64', '1', '101', '55', 'png', 'width=\"101\" height=\"55\"', '');
INSERT INTO `uploads` VALUES ('43', 'ac78cffd5d6834b4c1c792b6b8634722.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/ac78cffd5d6834b4c1c792b6b8634722.png', '/uploads/20160909/', '/uploads/20160909/ac78cffd5d6834b4c1c792b6b8634722.png', 'ac78cffd5d6834b4c1c792b6b8634722', 'ac78cffd5d6834b4c1c792b6b8634722.png', 'QQ截图20160615150937.png', '.png', '8.64', '1', '101', '55', 'png', 'width=\"101\" height=\"55\"', '');
INSERT INTO `uploads` VALUES ('44', 'e58608c05c7c0cb9bcc2511c6c190380.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/e58608c05c7c0cb9bcc2511c6c190380.png', '/uploads/20160909/', '/uploads/20160909/e58608c05c7c0cb9bcc2511c6c190380.png', 'e58608c05c7c0cb9bcc2511c6c190380', 'e58608c05c7c0cb9bcc2511c6c190380.png', 'QQ截图20160615150937.png', '.png', '8.64', '1', '101', '55', 'png', 'width=\"101\" height=\"55\"', '');
INSERT INTO `uploads` VALUES ('45', '1254990c87705cf15973f585c320e81e.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/1254990c87705cf15973f585c320e81e.png', '/uploads/20160909/', '/uploads/20160909/1254990c87705cf15973f585c320e81e.png', '1254990c87705cf15973f585c320e81e', '1254990c87705cf15973f585c320e81e.png', 'QQ截图20160616142917.png', '.png', '3.27', '1', '49', '27', 'png', 'width=\"49\" height=\"27\"', '');
INSERT INTO `uploads` VALUES ('46', 'c00ca8a73e75b95832d94091434ce415.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/c00ca8a73e75b95832d94091434ce415.png', '/uploads/20160909/', '/uploads/20160909/c00ca8a73e75b95832d94091434ce415.png', 'c00ca8a73e75b95832d94091434ce415', 'c00ca8a73e75b95832d94091434ce415.png', 'QQ截图20160616142927.png', '.png', '4.08', '1', '57', '29', 'png', 'width=\"57\" height=\"29\"', '');
INSERT INTO `uploads` VALUES ('47', 'b29be679c750ac49ecacf18d40bea1b1.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/b29be679c750ac49ecacf18d40bea1b1.png', '/uploads/20160909/', '/uploads/20160909/b29be679c750ac49ecacf18d40bea1b1.png', 'b29be679c750ac49ecacf18d40bea1b1', 'b29be679c750ac49ecacf18d40bea1b1.png', 'QQ截图20160615155453.png', '.png', '3.55', '1', '43', '43', 'png', 'width=\"43\" height=\"43\"', '');
INSERT INTO `uploads` VALUES ('48', '39fe74055bf0efec1e8e6ca77a485031.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/39fe74055bf0efec1e8e6ca77a485031.png', '/uploads/20160909/', '/uploads/20160909/39fe74055bf0efec1e8e6ca77a485031.png', '39fe74055bf0efec1e8e6ca77a485031', '39fe74055bf0efec1e8e6ca77a485031.png', 'QQ截图20160615150937.png', '.png', '8.64', '1', '101', '55', 'png', 'width=\"101\" height=\"55\"', '');
INSERT INTO `uploads` VALUES ('49', 'd4ba41b9f62f61e3f9b89030c2460600.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/d4ba41b9f62f61e3f9b89030c2460600.png', '/uploads/20160909/', '/uploads/20160909/d4ba41b9f62f61e3f9b89030c2460600.png', 'd4ba41b9f62f61e3f9b89030c2460600', 'd4ba41b9f62f61e3f9b89030c2460600.png', 'QQ截图20160615155453.png', '.png', '3.55', '1', '43', '43', 'png', 'width=\"43\" height=\"43\"', '');
INSERT INTO `uploads` VALUES ('50', '7e481bd2bc538cc976e52cb3703dfe5f.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/7e481bd2bc538cc976e52cb3703dfe5f.png', '/uploads/20160909/', '/uploads/20160909/7e481bd2bc538cc976e52cb3703dfe5f.png', '7e481bd2bc538cc976e52cb3703dfe5f', '7e481bd2bc538cc976e52cb3703dfe5f.png', 'QQ截图20160615115028.png', '.png', '9.81', '1', '89', '51', 'png', 'width=\"89\" height=\"51\"', '');
INSERT INTO `uploads` VALUES ('51', '11dc9bd620f25c1c37f3325dcaa5b736.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/11dc9bd620f25c1c37f3325dcaa5b736.png', '/uploads/20160909/', '/uploads/20160909/11dc9bd620f25c1c37f3325dcaa5b736.png', '11dc9bd620f25c1c37f3325dcaa5b736', '11dc9bd620f25c1c37f3325dcaa5b736.png', 'QQ截图20160615115028.png', '.png', '9.81', '1', '89', '51', 'png', 'width=\"89\" height=\"51\"', '');
INSERT INTO `uploads` VALUES ('52', '43e8996738d13b8124a0f301d5ef19fc.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/43e8996738d13b8124a0f301d5ef19fc.png', '/uploads/20160909/', '/uploads/20160909/43e8996738d13b8124a0f301d5ef19fc.png', '43e8996738d13b8124a0f301d5ef19fc', '43e8996738d13b8124a0f301d5ef19fc.png', 'QQ截图20160615115044.png', '.png', '6.43', '1', '71', '41', 'png', 'width=\"71\" height=\"41\"', '');
INSERT INTO `uploads` VALUES ('53', 'eebc0b80b3341591115cb510801330fd.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/eebc0b80b3341591115cb510801330fd.png', '/uploads/20160909/', '/uploads/20160909/eebc0b80b3341591115cb510801330fd.png', 'eebc0b80b3341591115cb510801330fd', 'eebc0b80b3341591115cb510801330fd.png', 'QQ截图20160615115334.png', '.png', '11.81', '1', '92', '55', 'png', 'width=\"92\" height=\"55\"', '');
INSERT INTO `uploads` VALUES ('54', 'ccc5e58958dfc0be66559e968f8a9e90.jpg', 'image/jpeg', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/ccc5e58958dfc0be66559e968f8a9e90.jpg', '/uploads/20160909/', '/uploads/20160909/ccc5e58958dfc0be66559e968f8a9e90.jpg', 'ccc5e58958dfc0be66559e968f8a9e90', 'ccc5e58958dfc0be66559e968f8a9e90.jpg', '9463df9191e7fea174158c440ee7145a.jpg', '.jpg', '459.53', '1', '127', '127', 'jpeg', 'width=\"2272\" height=\"1704\"', '');
INSERT INTO `uploads` VALUES ('55', '4a6820c773c5d9409d6b0a0211cb44cf.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/4a6820c773c5d9409d6b0a0211cb44cf.png', '/uploads/20160909/', '/uploads/20160909/4a6820c773c5d9409d6b0a0211cb44cf.png', '4a6820c773c5d9409d6b0a0211cb44cf', '4a6820c773c5d9409d6b0a0211cb44cf.png', 'QQ截图20160615115044.png', '.png', '6.43', '1', '71', '41', 'png', 'width=\"71\" height=\"41\"', '');
INSERT INTO `uploads` VALUES ('56', 'dde326030eb3787a3f89e90372f0974c.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/dde326030eb3787a3f89e90372f0974c.png', '/uploads/20160909/', '/uploads/20160909/dde326030eb3787a3f89e90372f0974c.png', 'dde326030eb3787a3f89e90372f0974c', 'dde326030eb3787a3f89e90372f0974c.png', 'QQ截图20160615115028.png', '.png', '9.81', '1', '89', '51', 'png', 'width=\"89\" height=\"51\"', '');
INSERT INTO `uploads` VALUES ('57', '841eef3557124c74151bda6a2634b88b.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/841eef3557124c74151bda6a2634b88b.png', '/uploads/20160909/', '/uploads/20160909/841eef3557124c74151bda6a2634b88b.png', '841eef3557124c74151bda6a2634b88b', '841eef3557124c74151bda6a2634b88b.png', 'QQ截图20160615115028.png', '.png', '9.81', '1', '89', '51', 'png', 'width=\"89\" height=\"51\"', '');
INSERT INTO `uploads` VALUES ('58', '7e5f502be2ee569a530bc8178cd9e898.exe', 'application/x-dosexec', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/7e5f502be2ee569a530bc8178cd9e898.exe', '/uploads/20160909/', '/uploads/20160909/7e5f502be2ee569a530bc8178cd9e898.exe', '7e5f502be2ee569a530bc8178cd9e898', '7e5f502be2ee569a530bc8178cd9e898.exe', 'QQMusicForYQQ.exe', '.exe', '51448.34', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('59', '3b457ba631aee8e4f3182207664f045c.zip', 'application/zip', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/3b457ba631aee8e4f3182207664f045c.zip', '/uploads/20160909/', '/uploads/20160909/3b457ba631aee8e4f3182207664f045c.zip', '3b457ba631aee8e4f3182207664f045c', '3b457ba631aee8e4f3182207664f045c.zip', 'webuploader-0.1.5.zip', '.zip', '3586.26', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('60', 'ab46513b385effef26cc03db27f07093.exe', 'application/x-dosexec', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/ab46513b385effef26cc03db27f07093.exe', '/uploads/20160909/', '/uploads/20160909/ab46513b385effef26cc03db27f07093.exe', 'ab46513b385effef26cc03db27f07093', 'ab46513b385effef26cc03db27f07093.exe', 'QQMusicForYQQ.exe', '.exe', '51448.34', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('61', 'c9f2f00349610e2b819351ad1b4484e9.exe', 'application/x-dosexec', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/c9f2f00349610e2b819351ad1b4484e9.exe', '/uploads/20160909/', '/uploads/20160909/c9f2f00349610e2b819351ad1b4484e9.exe', 'c9f2f00349610e2b819351ad1b4484e9', 'c9f2f00349610e2b819351ad1b4484e9.exe', 'QQMusicForYQQ.exe', '.exe', '51448.34', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('62', '778f3144cd7e3d9be09decffd0d240dd.exe', 'application/x-dosexec', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/778f3144cd7e3d9be09decffd0d240dd.exe', '/uploads/20160909/', '/uploads/20160909/778f3144cd7e3d9be09decffd0d240dd.exe', '778f3144cd7e3d9be09decffd0d240dd', '778f3144cd7e3d9be09decffd0d240dd.exe', 'QQMusicForYQQ.exe', '.exe', '51448.34', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('63', 'c57b2b42f33e3f7803b006138df37ee2.exe', 'application/x-dosexec', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/c57b2b42f33e3f7803b006138df37ee2.exe', '/uploads/20160909/', '/uploads/20160909/c57b2b42f33e3f7803b006138df37ee2.exe', 'c57b2b42f33e3f7803b006138df37ee2', 'c57b2b42f33e3f7803b006138df37ee2.exe', 'PhpStorm-2016.1.2.exe', '.exe', '170722.75', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('64', 'cd8dd4d6ed76ae2b3a5f90a60dc9d800.exe', 'application/x-dosexec', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/cd8dd4d6ed76ae2b3a5f90a60dc9d800.exe', '/uploads/20160909/', '/uploads/20160909/cd8dd4d6ed76ae2b3a5f90a60dc9d800.exe', 'cd8dd4d6ed76ae2b3a5f90a60dc9d800', 'cd8dd4d6ed76ae2b3a5f90a60dc9d800.exe', 'PhpStorm-2016.1.2.exe', '.exe', '170722.75', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('65', '29683fe435503970ceb0769df2945c58.exe', 'application/x-dosexec', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/29683fe435503970ceb0769df2945c58.exe', '/uploads/20160909/', '/uploads/20160909/29683fe435503970ceb0769df2945c58.exe', '29683fe435503970ceb0769df2945c58', '29683fe435503970ceb0769df2945c58.exe', 'PhpStorm-2016.1.2.exe', '.exe', '170722.75', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('66', 'ada26b8de1a96a1a87e0bfc1b0763193.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/ada26b8de1a96a1a87e0bfc1b0763193.png', '/uploads/20160909/', '/uploads/20160909/ada26b8de1a96a1a87e0bfc1b0763193.png', 'ada26b8de1a96a1a87e0bfc1b0763193', 'ada26b8de1a96a1a87e0bfc1b0763193.png', 'QQ截图20160615115334.png', '.png', '11.81', '1', '92', '55', 'png', 'width=\"92\" height=\"55\"', '');
INSERT INTO `uploads` VALUES ('67', 'c688b549fd19f81259cb99d01adb3f21.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/c688b549fd19f81259cb99d01adb3f21.png', '/uploads/20160909/', '/uploads/20160909/c688b549fd19f81259cb99d01adb3f21.png', 'c688b549fd19f81259cb99d01adb3f21', 'c688b549fd19f81259cb99d01adb3f21.png', 'QQ截图20160615115044.png', '.png', '6.43', '1', '71', '41', 'png', 'width=\"71\" height=\"41\"', '');
INSERT INTO `uploads` VALUES ('68', 'fdb92f730855f54122627475f8f0737e.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/fdb92f730855f54122627475f8f0737e.png', '/uploads/20160909/', '/uploads/20160909/fdb92f730855f54122627475f8f0737e.png', 'fdb92f730855f54122627475f8f0737e', 'fdb92f730855f54122627475f8f0737e.png', 'QQ截图20160615115028.png', '.png', '9.81', '1', '89', '51', 'png', 'width=\"89\" height=\"51\"', '');
INSERT INTO `uploads` VALUES ('69', '8f6c190a026eb109ade8897db5a94a80.rar', 'application/x-rar', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/8f6c190a026eb109ade8897db5a94a80.rar', '/uploads/20160909/', '/uploads/20160909/8f6c190a026eb109ade8897db5a94a80.rar', '8f6c190a026eb109ade8897db5a94a80', '8f6c190a026eb109ade8897db5a94a80.rar', '浮动固定位置插件.rar', '.rar', '44.25', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('70', 'f4f6b03abd6132983ed769a257b458aa.rar', 'application/x-rar', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/f4f6b03abd6132983ed769a257b458aa.rar', '/uploads/20160909/', '/uploads/20160909/f4f6b03abd6132983ed769a257b458aa.rar', 'f4f6b03abd6132983ed769a257b458aa', 'f4f6b03abd6132983ed769a257b458aa.rar', '浮动固定位置插件.rar', '.rar', '44.25', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('71', '0b90989a1f3b75a6c31d3a5c882b36a2.rar', 'application/x-rar', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/0b90989a1f3b75a6c31d3a5c882b36a2.rar', '/uploads/20160909/', '/uploads/20160909/0b90989a1f3b75a6c31d3a5c882b36a2.rar', '0b90989a1f3b75a6c31d3a5c882b36a2', '0b90989a1f3b75a6c31d3a5c882b36a2.rar', '浮动固定位置插件.rar', '.rar', '44.25', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('72', '97e811c928ea602de4ed94d10e3a373e.rar', 'application/x-rar', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/97e811c928ea602de4ed94d10e3a373e.rar', '/uploads/20160909/', '/uploads/20160909/97e811c928ea602de4ed94d10e3a373e.rar', '97e811c928ea602de4ed94d10e3a373e', '97e811c928ea602de4ed94d10e3a373e.rar', '浮动固定位置插件.rar', '.rar', '44.25', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('73', 'bc4ae7c1be97890ba8ae6e3bd8a781ae.rar', 'application/x-rar', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/bc4ae7c1be97890ba8ae6e3bd8a781ae.rar', '/uploads/20160909/', '/uploads/20160909/bc4ae7c1be97890ba8ae6e3bd8a781ae.rar', 'bc4ae7c1be97890ba8ae6e3bd8a781ae', 'bc4ae7c1be97890ba8ae6e3bd8a781ae.rar', '浮动固定位置插件.rar', '.rar', '44.25', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('74', 'ef5f566f04a8fcc98fa7ad8ea6032e21.rar', 'application/x-rar', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/ef5f566f04a8fcc98fa7ad8ea6032e21.rar', '/uploads/20160909/', '/uploads/20160909/ef5f566f04a8fcc98fa7ad8ea6032e21.rar', 'ef5f566f04a8fcc98fa7ad8ea6032e21', 'ef5f566f04a8fcc98fa7ad8ea6032e21.rar', '浮动固定位置插件.rar', '.rar', '44.25', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('75', '16bccf2a281c0c52ad9b196922c0aa8a.rar', 'application/x-rar', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/16bccf2a281c0c52ad9b196922c0aa8a.rar', '/uploads/20160909/', '/uploads/20160909/16bccf2a281c0c52ad9b196922c0aa8a.rar', '16bccf2a281c0c52ad9b196922c0aa8a', '16bccf2a281c0c52ad9b196922c0aa8a.rar', '浮动固定位置插件.rar', '.rar', '44.25', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('76', 'ff81a9d360d3df7e3646f1b20c51e805.js', 'text/plain', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/ff81a9d360d3df7e3646f1b20c51e805.js', '/uploads/20160909/', '/uploads/20160909/ff81a9d360d3df7e3646f1b20c51e805.js', 'ff81a9d360d3df7e3646f1b20c51e805', 'ff81a9d360d3df7e3646f1b20c51e805.js', 'jquery.min.js', '.js', '93.74', '0', null, null, '', '', '');
INSERT INTO `uploads` VALUES ('77', '48ae01b695b51624c0582b74cb537f42.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/48ae01b695b51624c0582b74cb537f42.png', '/uploads/20160909/', '/uploads/20160909/48ae01b695b51624c0582b74cb537f42.png', '48ae01b695b51624c0582b74cb537f42', '48ae01b695b51624c0582b74cb537f42.png', '毕业帽子.png', '.png', '15.24', '1', '127', '127', 'png', 'width=\"227\" height=\"204\"', '');
INSERT INTO `uploads` VALUES ('78', '91e86841ae95bb56bb39493803cb461d.png', 'image/png', 'D:/wamp/www/uploads/20160909/', 'D:/wamp/www/uploads/20160909/91e86841ae95bb56bb39493803cb461d.png', '/uploads/20160909/', '/uploads/20160909/91e86841ae95bb56bb39493803cb461d.png', '91e86841ae95bb56bb39493803cb461d', '91e86841ae95bb56bb39493803cb461d.png', '毕业帽子.png', '.png', '15.24', '1', '127', '127', 'png', 'width=\"227\" height=\"204\"', '');
