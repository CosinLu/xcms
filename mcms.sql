/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : mcms

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-08-11 10:48:15
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
  `value` varchar(500) DEFAULT NULL COMMENT '值',
  `config_group_id` int(10) DEFAULT NULL COMMENT '配置组标识',
  `type` varchar(50) DEFAULT NULL COMMENT '配置项类型',
  `param` varchar(100) DEFAULT NULL COMMENT '参数',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) unsigned DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='基本配置表';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '标题', 'title', '', '1', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('2', '关键字', 'keywords', '', '1', 'textarea', '', '', 'show', '100');
INSERT INTO `config` VALUES ('3', '描述', 'description', '', '1', 'textarea', '', '', 'show', '100');
INSERT INTO `config` VALUES ('4', '版权', 'copyright', '', '1', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('5', '备案号', 'icp_num', '', '1', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('6', '统计/商桥', 'count_code', '', '1', 'textarea', '', '', 'show', '100');
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置组';

-- ----------------------------
-- Records of config_group
-- ----------------------------
INSERT INTO `config_group` VALUES ('1', '基本配置', 'show', '', '100');
INSERT INTO `config_group` VALUES ('2', '网站状态', 'show', '', '100');

-- ----------------------------
-- Table structure for info_cases
-- ----------------------------
DROP TABLE IF EXISTS `info_cases`;
CREATE TABLE `info_cases` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `cid` int(10) DEFAULT NULL COMMENT '信息栏目标识',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `image` int(10) DEFAULT NULL COMMENT '缩略图',
  `images` varchar(255) DEFAULT NULL COMMENT '图片',
  `case_url` varchar(255) DEFAULT NULL COMMENT '案例链接',
  `case_target` varchar(10) DEFAULT NULL COMMENT '案例链接打开方式',
  `content` text COMMENT '内容',
  `target` varchar(10) DEFAULT NULL COMMENT 'url打开方式',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息案例表';

-- ----------------------------
-- Records of info_cases
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
  `tpl_id` int(11) DEFAULT NULL COMMENT '模板标识',
  `url` varchar(255) DEFAULT NULL COMMENT '链接【设置后分类将使用此url】',
  `pic` varchar(10) DEFAULT NULL COMMENT '图片：nopic=无图，onepic=单图，muitipic=多图',
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='信息栏目表';

-- ----------------------------
-- Records of info_col
-- ----------------------------
INSERT INTO `info_col` VALUES ('1', '新闻', '0', '1', '1', '', 'nopic', null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('2', '产品', '0', '1', '2', '', 'nopic', null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('3', '公司简介', '0', '1', '3', '', 'nopic', null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');

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

-- ----------------------------
-- Table structure for info_news
-- ----------------------------
DROP TABLE IF EXISTS `info_news`;
CREATE TABLE `info_news` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `cid` int(10) DEFAULT NULL COMMENT '信息栏目标识',
  `title` varchar(500) DEFAULT NULL COMMENT '标题',
  `summary` varchar(100) DEFAULT NULL COMMENT '摘要',
  `content` text COMMENT '内容',
  `target` varchar(10) DEFAULT NULL COMMENT 'url打开方式',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息文章表';

-- ----------------------------
-- Records of info_news
-- ----------------------------

-- ----------------------------
-- Table structure for info_single
-- ----------------------------
DROP TABLE IF EXISTS `info_single`;
CREATE TABLE `info_single` (
  `cid` int(10) unsigned NOT NULL COMMENT '信息栏目标识',
  `summary` varchar(100) DEFAULT NULL COMMENT '摘要',
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

-- ----------------------------
-- Table structure for navigation
-- ----------------------------
DROP TABLE IF EXISTS `navigation`;
CREATE TABLE `navigation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '分类所属上级标识【默认0】',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别【从0开始】',
  `url` varchar(255) DEFAULT NULL COMMENT '链接【设置后分类将使用此url】',
  `position` varchar(10) DEFAULT NULL COMMENT '位置：top=顶部，bottom=底部',
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of navigation
-- ----------------------------
INSERT INTO `navigation` VALUES ('1', '关于', '0', '1', '', 'top', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `navigation` VALUES ('2', '案例', '0', '1', '', 'top', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `navigation` VALUES ('3', '服务', '0', '1', '', 'top', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `navigation` VALUES ('4', '联系', '0', '1', '', 'top', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `navigation` VALUES ('5', '公司简介', '1', '2', '', 'top', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `navigation` VALUES ('6', '公司资质', '1', '2', '', 'top', 'show', '100', null, null, null, null, '1', '1', '1');

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
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `pid` int(10) DEFAULT '0' COMMENT '上级标识',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_type` varchar(10) DEFAULT NULL COMMENT '用户类型：pro=生产者，dev=开发者',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='系统栏目表';

-- ----------------------------
-- Records of sys_col
-- ----------------------------
INSERT INTO `sys_col` VALUES ('1', '起始页', 'fa fa-home', '0', '1', '', '', 'pro', 'show', '1', null, null, null, null);
INSERT INTO `sys_col` VALUES ('2', '系统管理', 'fa fa-laptop', '0', '1', '', '', 'pro', 'show', '2', null, null, null, null);
INSERT INTO `sys_col` VALUES ('3', '内容管理', 'fa fa-folder', '0', '1', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('4', '模块管理', 'fa fa-th-large', '0', '1', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('28', '后台管理', 'fa fa-desktop', '1', '2', '', '', 'dev', 'show', '200', null, null, null, null);
INSERT INTO `sys_col` VALUES ('7', '我的面板', 'fa fa-list-alt', '1', '2', 'welcome', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('8', '数据字典', '', '28', '3', 'sys_dict', '', 'dev', 'show', '300', null, null, null, null);
INSERT INTO `sys_col` VALUES ('9', '配置组', '', '28', '3', 'config_group', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('10', '配置项', '', '28', '3', 'config_item', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('11', '网站配置', 'fa fa-cog', '2', '2', 'config', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('12', '栏目管理', 'fa fa-columns', '3', '2', 'info_col', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('13', '信息管理', 'fa fa-list', '3', '2', 'info', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('14', '模板管理', 'fa fa-codepen', '2', '2', 'sys_tpl', '', 'pro', 'show', '200', null, null, null, null);
INSERT INTO `sys_col` VALUES ('15', '幻灯片', 'fa fa-slideshare', '4', '2', 'slide', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('16', '菜单管理', '', '28', '3', 'sys_col', '', 'dev', 'show', '200', null, null, null, null);
INSERT INTO `sys_col` VALUES ('17', '角色管理', 'fa fa-users', '2', '2', 'sys_role', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('18', '用户管理', 'fa fa-user', '2', '2', 'sys_user', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('20', '广告管理', 'fa fa-picture-o', '3', '2', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('24', '单图管理', null, '20', '3', 'info_col_onepic', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('25', '多图管理', null, '20', '3', 'info_col_muitipic', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('31', '日志', 'fa fa-th-list', '1', '2', 'sys_log', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('38', '文件管理', 'fa fa-file-text-o', '4', '2', 'uploads', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('41', '导航管理', 'fa fa-bars', '2', '2', 'navigation', '', 'pro', 'show', '300', null, null, null, null);

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
INSERT INTO `sys_col_auth` VALUES ('7', 'look');
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
INSERT INTO `sys_col_auth` VALUES ('17', 'del');
INSERT INTO `sys_col_auth` VALUES ('17', 'update');
INSERT INTO `sys_col_auth` VALUES ('18', 'look');
INSERT INTO `sys_col_auth` VALUES ('18', 'del');
INSERT INTO `sys_col_auth` VALUES ('18', 'update');
INSERT INTO `sys_col_auth` VALUES ('18', 'insert');
INSERT INTO `sys_col_auth` VALUES ('12', 'look');
INSERT INTO `sys_col_auth` VALUES ('12', 'del');
INSERT INTO `sys_col_auth` VALUES ('12', 'update');
INSERT INTO `sys_col_auth` VALUES ('12', 'insert');
INSERT INTO `sys_col_auth` VALUES ('14', 'look');
INSERT INTO `sys_col_auth` VALUES ('14', 'del');
INSERT INTO `sys_col_auth` VALUES ('14', 'update');
INSERT INTO `sys_col_auth` VALUES ('14', 'insert');
INSERT INTO `sys_col_auth` VALUES ('15', 'del');
INSERT INTO `sys_col_auth` VALUES ('15', 'update');
INSERT INTO `sys_col_auth` VALUES ('15', 'insert');
INSERT INTO `sys_col_auth` VALUES ('16', 'look');
INSERT INTO `sys_col_auth` VALUES ('16', 'del');
INSERT INTO `sys_col_auth` VALUES ('16', 'update');
INSERT INTO `sys_col_auth` VALUES ('16', 'insert');
INSERT INTO `sys_col_auth` VALUES ('25', 'update');
INSERT INTO `sys_col_auth` VALUES ('25', 'insert');
INSERT INTO `sys_col_auth` VALUES ('31', 'look');
INSERT INTO `sys_col_auth` VALUES ('31', 'del');
INSERT INTO `sys_col_auth` VALUES ('11', 'update');
INSERT INTO `sys_col_auth` VALUES ('33', 'look');
INSERT INTO `sys_col_auth` VALUES ('33', 'del');
INSERT INTO `sys_col_auth` VALUES ('33', 'update');
INSERT INTO `sys_col_auth` VALUES ('33', 'insert');
INSERT INTO `sys_col_auth` VALUES ('35', 'look');
INSERT INTO `sys_col_auth` VALUES ('35', 'update');
INSERT INTO `sys_col_auth` VALUES ('36', 'look');
INSERT INTO `sys_col_auth` VALUES ('36', 'update');
INSERT INTO `sys_col_auth` VALUES ('37', 'look');
INSERT INTO `sys_col_auth` VALUES ('37', 'del');
INSERT INTO `sys_col_auth` VALUES ('37', 'update');
INSERT INTO `sys_col_auth` VALUES ('37', 'insert');
INSERT INTO `sys_col_auth` VALUES ('38', 'look');
INSERT INTO `sys_col_auth` VALUES ('38', 'del');
INSERT INTO `sys_col_auth` VALUES ('17', 'insert');
INSERT INTO `sys_col_auth` VALUES ('11', 'look');
INSERT INTO `sys_col_auth` VALUES ('17', 'look');
INSERT INTO `sys_col_auth` VALUES ('15', 'look');
INSERT INTO `sys_col_auth` VALUES ('41', 'del');
INSERT INTO `sys_col_auth` VALUES ('41', 'update');
INSERT INTO `sys_col_auth` VALUES ('41', 'insert');
INSERT INTO `sys_col_auth` VALUES ('41', 'look');

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
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='系统数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '操作', '0', '1', 'sys_col_auth', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('2', '新增', '1', '2', 'insert', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('3', '修改', '1', '2', 'update', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('4', '删除', '1', '2', 'del', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('5', '查看', '1', '2', 'look', '#333333', '', '100', null, null, null, null);
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
INSERT INTO `sys_dict` VALUES ('26', '位置', '0', '1', 'position', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('27', '顶部', '26', '2', 'top', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('28', '底部', '26', '2', 'bottom', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('29', '打开方式', '0', '1', 'target', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('30', '当前窗口', '29', '2', '_self', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('31', '新窗口', '29', '2', '_blank', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('32', '日志状态', '0', '1', 'log_status', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('33', '成功', '32', '2', 'success', '#5cb85c', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('34', '失败', '32', '2', 'fail', '#d9534f', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('35', '用户类型', '0', '1', 'user_type', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('36', '生产者', '35', '2', 'pro', '#333333', '', '100', null, null, null, null);
INSERT INTO `sys_dict` VALUES ('37', '开发者', '35', '2', 'dev', '#d9534f', '', '100', null, null, null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '2', 'admin', '菜单管理', 'insert', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495780105');
INSERT INTO `sys_log` VALUES ('2', '2', 'admin', '菜单管理', 'del', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495780134');
INSERT INTO `sys_log` VALUES ('3', '2', 'admin', '栏目管理', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1499831292');
INSERT INTO `sys_log` VALUES ('4', '2', 'admin', '栏目管理', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1499831296');
INSERT INTO `sys_log` VALUES ('5', '2', 'admin', '栏目管理', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1499831299');
INSERT INTO `sys_log` VALUES ('6', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500609945');
INSERT INTO `sys_log` VALUES ('7', '2', 'admin', '栏目管理', 'del', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500609961');
INSERT INTO `sys_log` VALUES ('8', '2', 'admin', '栏目管理', 'del', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500609964');
INSERT INTO `sys_log` VALUES ('9', '2', 'admin', '栏目管理', 'del', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500609967');
INSERT INTO `sys_log` VALUES ('10', '2', 'admin', '数据字典', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500617099');
INSERT INTO `sys_log` VALUES ('11', '2', 'admin', '数据字典', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500619271');
INSERT INTO `sys_log` VALUES ('12', '2', 'admin', '数据字典', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500619287');
INSERT INTO `sys_log` VALUES ('13', '2', 'admin', '数据字典', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500619301');
INSERT INTO `sys_log` VALUES ('14', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500620236');
INSERT INTO `sys_log` VALUES ('15', '2', 'admin', '数据字典', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500620917');
INSERT INTO `sys_log` VALUES ('16', '2', 'admin', '用户管理', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500621746');
INSERT INTO `sys_log` VALUES ('17', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500623765');
INSERT INTO `sys_log` VALUES ('18', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500623772');
INSERT INTO `sys_log` VALUES ('19', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500623777');
INSERT INTO `sys_log` VALUES ('20', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500623783');
INSERT INTO `sys_log` VALUES ('21', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500625596');
INSERT INTO `sys_log` VALUES ('22', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500625644');
INSERT INTO `sys_log` VALUES ('23', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500625662');
INSERT INTO `sys_log` VALUES ('24', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500625803');
INSERT INTO `sys_log` VALUES ('25', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500625830');
INSERT INTO `sys_log` VALUES ('26', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500625894');
INSERT INTO `sys_log` VALUES ('27', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500626135');
INSERT INTO `sys_log` VALUES ('28', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500626577');
INSERT INTO `sys_log` VALUES ('29', '4', 'madmin', '菜单管理', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500628147');
INSERT INTO `sys_log` VALUES ('30', '4', 'madmin', '菜单管理', 'del', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500628153');
INSERT INTO `sys_log` VALUES ('31', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1500705057');
INSERT INTO `sys_log` VALUES ('32', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1500730327');
INSERT INTO `sys_log` VALUES ('33', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500880636');
INSERT INTO `sys_log` VALUES ('34', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500888903');
INSERT INTO `sys_log` VALUES ('35', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500943976');
INSERT INTO `sys_log` VALUES ('36', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1500943981');
INSERT INTO `sys_log` VALUES ('37', '4', 'madmin', '文件管理', 'del', 'success', 'Chrome', '60.0.3112.78', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1501811907');
INSERT INTO `sys_log` VALUES ('38', '4', 'madmin', '用户管理', 'insert', 'success', 'Chrome', '60.0.3112.78', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1501812129');
INSERT INTO `sys_log` VALUES ('39', '4', 'madmin', '用户管理', 'insert', 'success', 'Chrome', '60.0.3112.78', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1501812236');
INSERT INTO `sys_log` VALUES ('40', '4', 'madmin', '角色权限', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501892709');
INSERT INTO `sys_log` VALUES ('41', '4', 'madmin', '文件管理', 'del', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501893529');
INSERT INTO `sys_log` VALUES ('42', '4', 'madmin', '数据字典', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501894192');
INSERT INTO `sys_log` VALUES ('43', '4', 'madmin', '数据字典', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501894206');
INSERT INTO `sys_log` VALUES ('44', '4', 'madmin', '数据字典', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501894218');
INSERT INTO `sys_log` VALUES ('45', '4', 'madmin', '菜单管理', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501894428');
INSERT INTO `sys_log` VALUES ('46', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501894451');
INSERT INTO `sys_log` VALUES ('47', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501894467');
INSERT INTO `sys_log` VALUES ('48', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501894475');
INSERT INTO `sys_log` VALUES ('49', '4', 'madmin', '数据字典', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501926975');
INSERT INTO `sys_log` VALUES ('50', '4', 'madmin', '数据字典', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501926982');
INSERT INTO `sys_log` VALUES ('51', '4', 'madmin', '导航管理', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501928145');
INSERT INTO `sys_log` VALUES ('52', '4', 'madmin', '导航管理', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501928186');
INSERT INTO `sys_log` VALUES ('53', '4', 'madmin', '导航管理', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501928217');
INSERT INTO `sys_log` VALUES ('54', '4', 'madmin', '导航管理', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501928224');
INSERT INTO `sys_log` VALUES ('55', '4', 'madmin', '导航管理', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501928397');
INSERT INTO `sys_log` VALUES ('56', '4', 'madmin', '导航管理', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1501928407');
INSERT INTO `sys_log` VALUES ('57', '4', 'madmin', '导航管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1502013437');
INSERT INTO `sys_log` VALUES ('58', '4', 'madmin', '导航管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1502013445');
INSERT INTO `sys_log` VALUES ('59', '4', 'madmin', '导航管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1502013459');
INSERT INTO `sys_log` VALUES ('60', '4', 'madmin', '导航管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1502022371');
INSERT INTO `sys_log` VALUES ('61', '4', 'madmin', '用户管理', 'update', 'success', 'Chrome', '60.0.3112.78', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502341523');
INSERT INTO `sys_log` VALUES ('62', '4', 'madmin', '用户管理', 'update', 'success', 'Chrome', '60.0.3112.78', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502341531');
INSERT INTO `sys_log` VALUES ('63', '4', 'madmin', '用户管理', 'update', 'success', 'Chrome', '60.0.3112.78', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502341539');
INSERT INTO `sys_log` VALUES ('64', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502419666');

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
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='系统登录日志表';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('1', '2', '::1', '1495698247');
INSERT INTO `sys_login_log` VALUES ('2', '2', '::1', '1495702883');
INSERT INTO `sys_login_log` VALUES ('3', '2', '::1', '1495707311');
INSERT INTO `sys_login_log` VALUES ('4', '2', '::1', '1495761979');
INSERT INTO `sys_login_log` VALUES ('5', '2', '::1', '1495772120');
INSERT INTO `sys_login_log` VALUES ('6', '2', '::1', '1495781915');
INSERT INTO `sys_login_log` VALUES ('7', '2', '::1', '1495783927');
INSERT INTO `sys_login_log` VALUES ('8', '2', '::1', '1495858072');
INSERT INTO `sys_login_log` VALUES ('9', '2', '::1', '1498709458');
INSERT INTO `sys_login_log` VALUES ('10', '2', '::1', '1499831276');
INSERT INTO `sys_login_log` VALUES ('11', '2', '::1', '1500621683');
INSERT INTO `sys_login_log` VALUES ('12', '4', '::1', '1500621813');
INSERT INTO `sys_login_log` VALUES ('13', '4', '::1', '1500621854');
INSERT INTO `sys_login_log` VALUES ('14', '4', '::1', '1500639043');
INSERT INTO `sys_login_log` VALUES ('15', '3', '::1', '1500639129');
INSERT INTO `sys_login_log` VALUES ('16', '4', '::1', '1500705011');
INSERT INTO `sys_login_log` VALUES ('17', '4', '::1', '1500722314');
INSERT INTO `sys_login_log` VALUES ('18', '3', '::1', '1500722360');
INSERT INTO `sys_login_log` VALUES ('19', '4', '::1', '1500727668');
INSERT INTO `sys_login_log` VALUES ('20', '3', '::1', '1500727733');
INSERT INTO `sys_login_log` VALUES ('21', '4', '::1', '1500728304');
INSERT INTO `sys_login_log` VALUES ('22', '4', '::1', '1500728349');
INSERT INTO `sys_login_log` VALUES ('23', '4', '::1', '1500888888');
INSERT INTO `sys_login_log` VALUES ('24', '4', '::1', '1500889656');
INSERT INTO `sys_login_log` VALUES ('25', '4', '::1', '1500889724');
INSERT INTO `sys_login_log` VALUES ('26', '4', '::1', '1500891088');
INSERT INTO `sys_login_log` VALUES ('27', '4', '::1', '1500943966');
INSERT INTO `sys_login_log` VALUES ('28', '4', '127.0.0.1', '1501226664');
INSERT INTO `sys_login_log` VALUES ('29', '4', '127.0.0.1', '1501229942');
INSERT INTO `sys_login_log` VALUES ('30', '4', '127.0.0.1', '1501746031');
INSERT INTO `sys_login_log` VALUES ('31', '2', '127.0.0.1', '1501757457');
INSERT INTO `sys_login_log` VALUES ('32', '3', '127.0.0.1', '1501808739');
INSERT INTO `sys_login_log` VALUES ('33', '4', '127.0.0.1', '1501809587');
INSERT INTO `sys_login_log` VALUES ('34', '5', '127.0.0.1', '1501812180');
INSERT INTO `sys_login_log` VALUES ('35', '4', '127.0.0.1', '1501812218');
INSERT INTO `sys_login_log` VALUES ('36', '6', '127.0.0.1', '1501812251');
INSERT INTO `sys_login_log` VALUES ('37', '4', '127.0.0.1', '1501812262');
INSERT INTO `sys_login_log` VALUES ('38', '4', '127.0.0.1', '1501824292');
INSERT INTO `sys_login_log` VALUES ('39', '4', '127.0.0.1', '1501892679');
INSERT INTO `sys_login_log` VALUES ('40', '6', '127.0.0.1', '1501892726');
INSERT INTO `sys_login_log` VALUES ('41', '4', '127.0.0.1', '1501892782');
INSERT INTO `sys_login_log` VALUES ('42', '4', '127.0.0.1', '1501926749');
INSERT INTO `sys_login_log` VALUES ('43', '4', '127.0.0.1', '1502013208');
INSERT INTO `sys_login_log` VALUES ('44', '4', '127.0.0.1', '1502022364');
INSERT INTO `sys_login_log` VALUES ('45', '4', '127.0.0.1', '1502175424');
INSERT INTO `sys_login_log` VALUES ('46', '4', '127.0.0.1', '1502178647');
INSERT INTO `sys_login_log` VALUES ('47', '4', '127.0.0.1', '1502180322');
INSERT INTO `sys_login_log` VALUES ('48', '4', '127.0.0.1', '1502260069');
INSERT INTO `sys_login_log` VALUES ('49', '4', '127.0.0.1', '1502327238');
INSERT INTO `sys_login_log` VALUES ('50', '4', '127.0.0.1', '1502341385');
INSERT INTO `sys_login_log` VALUES ('51', '4', '127.0.0.1', '1502349008');
INSERT INTO `sys_login_log` VALUES ('52', '4', '127.0.0.1', '1502356659');
INSERT INTO `sys_login_log` VALUES ('53', '4', '127.0.0.1', '1502413779');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `role_type` tinyint(1) DEFAULT '2' COMMENT '角色类型：0=开发者，1=超级管理员【拥有所有生产者的权限】，2=普通管理员',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '1', '拥有所有权限', '100', null, null, null, null);
INSERT INTO `sys_role` VALUES ('3', '演示', '2', '演示使用', '100', null, null, null, null);
INSERT INTO `sys_role` VALUES ('4', '开发者', '0', '开发者', '100', null, null, null, null);

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
INSERT INTO `sys_role_auth` VALUES ('3', '31', 'del');
INSERT INTO `sys_role_auth` VALUES ('3', '2', '');
INSERT INTO `sys_role_auth` VALUES ('3', '11', 'update');
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
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'insert');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'update');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'del');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'look');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'insert');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'update');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'del');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'look');
INSERT INTO `sys_role_auth` VALUES ('3', '1', '');

-- ----------------------------
-- Table structure for sys_tpl
-- ----------------------------
DROP TABLE IF EXISTS `sys_tpl`;
CREATE TABLE `sys_tpl` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` char(50) DEFAULT NULL COMMENT '名称',
  `list_tpl` varchar(20) DEFAULT NULL COMMENT '列表模板',
  `show_tpl` varchar(20) DEFAULT NULL COMMENT '详细模板',
  `sys_tpl` varchar(20) DEFAULT NULL COMMENT '后台模板',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of sys_tpl
-- ----------------------------
INSERT INTO `sys_tpl` VALUES ('1', '新闻模板', 'news', 'news/show', 'info_news', '', 'show', '100', null, null, null, null);
INSERT INTO `sys_tpl` VALUES ('2', '案例模板', 'cases', 'cases/show', 'info_cases', '', 'show', '100', null, null, null, null);
INSERT INTO `sys_tpl` VALUES ('3', '单页模板', 'single', '', 'info_single', '', 'show', '100', null, null, null, null);

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
  `user_type` tinyint(1) DEFAULT '2' COMMENT '用户类型：0=开发者，1=系统默认，2=普通',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('2', '1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'normal', '1', null, null, null, null);
INSERT INTO `sys_user` VALUES ('3', '3', 'demo', 'e10adc3949ba59abbe56e057f20f883e', 'demo', null, null, 'normal', '2', null, null, null, null);
INSERT INTO `sys_user` VALUES ('4', '4', 'madmin', 'e10adc3949ba59abbe56e057f20f883e', '开发者', '开发者', null, 'normal', '0', null, null, null, null);
INSERT INTO `sys_user` VALUES ('5', '1', 'test', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'normal', '2', null, null, null, null);
INSERT INTO `sys_user` VALUES ('6', '3', 'demo1', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'normal', '2', null, null, null, null);

-- ----------------------------
-- Table structure for sys_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_auth`;
CREATE TABLE `sys_user_auth` (
  `user_id` int(10) DEFAULT NULL COMMENT '角色标识',
  `col_id` int(10) DEFAULT NULL COMMENT '系统栏目标识',
  `col_auth` varchar(10) DEFAULT NULL COMMENT '系统栏目权限'
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='上传文件表';

-- ----------------------------
-- Records of uploads
-- ----------------------------
