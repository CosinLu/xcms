/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : mcms

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-07-09 21:50:04
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
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='基本配置表';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '标题', 'title', '', '1', 'text', '', '', 'show', '100', null);
INSERT INTO `config` VALUES ('2', '关键字', 'keywords', '', '1', 'textarea', '', '', 'show', '100', null);
INSERT INTO `config` VALUES ('3', '描述', 'description', '', '1', 'textarea', '', '', 'show', '100', null);
INSERT INTO `config` VALUES ('4', '版权', 'copyright', '', '1', 'text', '', '', 'show', '100', null);
INSERT INTO `config` VALUES ('5', '备案号', 'icp_num', '', '1', 'text', '', '', 'show', '100', null);
INSERT INTO `config` VALUES ('6', '统计/商桥', 'count_code', '', '1', 'textarea', '', '', 'show', '100', null);
INSERT INTO `config` VALUES ('7', '状态', 'status', '1', '2', 'radio', '1|正常,0|关闭', '', 'show', '100', null);
INSERT INTO `config` VALUES ('8', '关闭说明', 'close_explain', '网站升级，敬请期待！', '2', 'textarea', '', '', 'show', '100', null);

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
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置组';

-- ----------------------------
-- Records of config_group
-- ----------------------------
INSERT INTO `config_group` VALUES ('1', '基本配置', 'show', '', '100', null);
INSERT INTO `config_group` VALUES ('2', '网站状态', 'show', '', '100', null);

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
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
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
  `info_tpl_id` int(11) DEFAULT NULL COMMENT '模板标识',
  `url` varchar(255) DEFAULT NULL COMMENT '链接【设置后分类将使用此url】',
  `pic` varchar(10) DEFAULT NULL COMMENT '图片：nopic=无图，onepic=单图，muitipic=多图',
  `seo_title` varchar(80) DEFAULT NULL COMMENT 'SEO标题',
  `seo_desc` varchar(200) DEFAULT NULL COMMENT 'SEO描述',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
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
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='信息栏目表';

-- ----------------------------
-- Records of info_col
-- ----------------------------
INSERT INTO `info_col` VALUES ('1', '新闻', '0', '1', '1', 'news', 'nopic', null, null, '', '_self', 'show', '100', null, null, null, null, '1', '1', '1', 'zh-cn');
INSERT INTO `info_col` VALUES ('2', '产品', '0', '1', '2', 'product', 'nopic', null, null, '', '_self', 'show', '100', null, null, null, null, '1', '1', '1', 'zh-cn');
INSERT INTO `info_col` VALUES ('3', '公司简介', '0', '1', '3', '', 'nopic', null, null, '', '_self', 'show', '100', null, null, null, null, '1', '1', '1', 'zh-cn');

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
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
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
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息单页表';

-- ----------------------------
-- Records of info_single
-- ----------------------------

-- ----------------------------
-- Table structure for info_tpl
-- ----------------------------
DROP TABLE IF EXISTS `info_tpl`;
CREATE TABLE `info_tpl` (
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
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='内容模型表';

-- ----------------------------
-- Records of info_tpl
-- ----------------------------
INSERT INTO `info_tpl` VALUES ('1', '新闻模板', 'news', 'news/show', 'info_news', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `info_tpl` VALUES ('2', '案例模板', 'cases', 'cases/show', 'info_cases', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `info_tpl` VALUES ('3', '单页模板', 'single', '', 'info_single', '', 'show', '100', null, null, null, null, 'zh-cn');

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
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

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
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='系统栏目表';

-- ----------------------------
-- Records of sys_col
-- ----------------------------
INSERT INTO `sys_col` VALUES ('1', '首页', 'fa fa-home', '0', '1', '', '', 'show', '1', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('2', '系统管理', 'fa fa-gear', '0', '1', '', '', 'show', '2', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('3', '内容管理', 'fa fa-file-text', '0', '1', '', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('4', '模块管理', 'fa fa-th-large', '0', '1', '', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('28', '后台管理', 'fa fa-desktop', '1', '2', '', '', 'show', '200', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('7', '我的面板', 'fa fa-th-large', '1', '2', 'welcome', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('8', '数据字典', null, '28', '3', 'sys_dict', '', 'show', '300', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('9', '配置组', null, '28', '3', 'config_group', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('10', '配置项', null, '28', '3', 'config_item', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('11', '网站配置', 'fa fa-cog', '2', '2', 'config', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('12', '栏目管理', 'fa fa-list-ul', '3', '2', 'info_col', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('13', '信息管理', 'fa fa-file-text', '3', '2', 'info', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('14', '模板管理', 'fa fa-folder', '3', '2', 'info_tpl', '', 'show', '300', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('15', '幻灯片', 'fa fa-slideshare', '4', '2', 'slide', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('16', '菜单管理', '', '28', '3', 'sys_col', '', 'show', '200', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('17', '角色管理', 'fa fa-users', '2', '2', 'sys_role', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('18', '用户管理', 'fa fa-user', '2', '2', 'sys_user', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('20', '广告管理', 'fa fa-picture-o', '3', '2', '', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('24', '单图管理', null, '20', '3', 'info_col_onepic', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('25', '多图管理', null, '20', '3', 'info_col_muitipic', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('31', '日志', 'fa fa-file-text', '1', '2', 'sys_log', '', 'show', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_col` VALUES ('38', '文件管理', 'fa fa-file-text', '4', '2', 'uploads', '', 'show', '100', null, null, null, null, 'zh-cn');

-- ----------------------------
-- Table structure for sys_col_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_col_auth`;
CREATE TABLE `sys_col_auth` (
  `col_id` int(10) NOT NULL COMMENT '系统栏目标识',
  `col_auth` varchar(10) NOT NULL COMMENT '系统栏目权限标识',
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统栏目权限表';

-- ----------------------------
-- Records of sys_col_auth
-- ----------------------------
INSERT INTO `sys_col_auth` VALUES ('8', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('7', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('13', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('13', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('13', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('13', 'insert', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('25', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('25', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('24', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('24', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('8', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('8', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('8', 'insert', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('9', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('9', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('9', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('9', 'insert', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('10', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('10', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('10', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('10', 'insert', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('17', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('17', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('18', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('18', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('18', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('18', 'insert', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('12', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('12', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('12', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('12', 'insert', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('14', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('14', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('14', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('14', 'insert', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('15', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('15', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('15', 'insert', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('16', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('16', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('16', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('16', 'insert', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('25', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('25', 'insert', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('31', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('31', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('11', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('33', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('33', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('33', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('33', 'insert', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('35', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('35', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('36', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('36', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('37', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('37', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('37', 'update', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('37', 'insert', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('38', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('38', 'del', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('17', 'insert', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('11', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('17', 'look', 'zh-cn');
INSERT INTO `sys_col_auth` VALUES ('15', 'look', 'zh-cn');

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
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='系统数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '后台栏目权限', '0', '1', 'sys_col_auth', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('2', '新增', '1', '2', 'insert', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('3', '修改', '1', '2', 'update', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('4', '删除', '1', '2', 'del', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('5', '查看', '1', '2', 'look', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('9', '显示', '0', '1', 'display', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('10', '显示', '9', '2', 'show', '#5cb85c', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('11', '隐藏', '9', '2', 'hide', '#d9534f', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('12', '配置项类型', '0', '1', 'config_type', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('13', '文本', '12', '2', 'text', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('14', '单选', '12', '2', 'radio', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('15', '复选', '12', '2', 'checkbox', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('16', '下拉列表', '12', '2', 'select', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('17', '文本域', '12', '2', 'textarea', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('18', '用户状态', '0', '1', 'user_status', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('19', '正常', '18', '2', 'normal', '#5cb85c', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('20', '冻结', '18', '2', 'forzen', '#d9534f', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('21', '图片', '0', '1', 'image', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('22', '无图', '21', '2', 'nopic', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('23', '单图', '21', '2', 'onepic', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('24', '多图', '21', '2', 'muitipic', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('26', '位置', '0', '1', 'location', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('27', '顶部导航', '26', '2', 'tnav', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('28', '底部导航', '26', '2', 'bnav', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('29', '打开方式', '0', '1', 'target', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('30', '当前窗口', '29', '2', '_self', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('31', '新窗口', '29', '2', '_blank', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('32', '日志状态', '0', '1', 'log_status', '#333333', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('33', '成功', '32', '2', 'success', '#5cb85c', '', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_dict` VALUES ('34', '失败', '32', '2', 'fail', '#d9534f', '', '100', null, null, null, null, 'zh-cn');

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
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '2', 'admin', '幻灯片', 'insert', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495893482', 'zh-cn');
INSERT INTO `sys_log` VALUES ('2', '2', 'admin', '幻灯片', 'del', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495893503', 'zh-cn');
INSERT INTO `sys_log` VALUES ('3', '2', 'admin', '文件管理', 'del', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495893619', 'zh-cn');
INSERT INTO `sys_log` VALUES ('4', '2', 'admin', '栏目管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1499478882', 'zh-cn');
INSERT INTO `sys_log` VALUES ('5', '2', 'admin', '栏目管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1499478896', 'zh-cn');
INSERT INTO `sys_log` VALUES ('6', '2', 'admin', '栏目管理', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1499478917', 'zh-cn');
INSERT INTO `sys_log` VALUES ('7', '2', 'admin', '栏目管理', 'insert', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1499478939', 'zh-cn');
INSERT INTO `sys_log` VALUES ('8', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1499479167', 'zh-cn');
INSERT INTO `sys_log` VALUES ('9', '2', 'admin', '栏目管理', 'update', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1499479226', 'zh-cn');
INSERT INTO `sys_log` VALUES ('10', '2', 'admin', '栏目管理', 'del', 'success', 'Chrome', '59.0.3071.115', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1499479250', 'zh-cn');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户标识',
  `login_ip` varchar(20) DEFAULT NULL COMMENT '登录ip地址',
  `login_time` int(10) DEFAULT NULL COMMENT '登录时间',
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='系统登录日志表';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('1', '2', '::1', '1495713076', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('2', '2', '::1', '1495755035', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('3', '2', '::1', '1495803429', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('4', '2', '::1', '1495810746', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('5', '2', '::1', '1495888499', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('6', '2', '::1', '1495890758', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('7', '2', '::1', '1498899557', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('8', '2', '::1', '1498958802', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('9', '2', '::1', '1498958850', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('10', '2', '::1', '1498975697', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('11', '2', '::1', '1498977862', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('12', '2', '::1', '1499477583', 'zh-cn');

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
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '1', '拥有所有权限', '100', null, null, null, null, 'zh-cn');
INSERT INTO `sys_role` VALUES ('3', '演示', '0', '演示使用', '100', null, null, null, null, 'zh-cn');

-- ----------------------------
-- Table structure for sys_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_auth`;
CREATE TABLE `sys_role_auth` (
  `role_id` int(10) DEFAULT NULL COMMENT '角色标识',
  `col_id` int(10) DEFAULT NULL COMMENT '系统栏目标识',
  `col_auth` varchar(10) DEFAULT NULL COMMENT '系统栏目权限',
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统角色权限表';

-- ----------------------------
-- Records of sys_role_auth
-- ----------------------------
INSERT INTO `sys_role_auth` VALUES ('2', '12', 'update', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '12', 'del', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '12', 'look', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '13', 'insert', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '13', 'update', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '13', 'del', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '20', '', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '24', 'update', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '24', 'look', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'insert', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '31', 'del', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '2', '', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '11', 'update', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'update', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'del', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'look', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '4', '', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '15', 'insert', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '15', 'update', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '15', 'del', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '15', 'look', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '12', 'insert', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '3', '', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '11', 'look', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '11', 'update', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('2', '2', '', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '11', 'look', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'insert', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'update', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'del', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'look', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'insert', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'update', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'del', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'look', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '1', '', 'zh-cn');

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
  `user_type` varchar(10) DEFAULT NULL COMMENT '用户类型：default=系统默认',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('2', '1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'normal', 'default', null, null, null, null, 'zh-cn');
INSERT INTO `sys_user` VALUES ('3', '3', 'demo', 'e10adc3949ba59abbe56e057f20f883e', 'demo', null, null, 'normal', null, null, null, null, null, 'zh-cn');

-- ----------------------------
-- Table structure for sys_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_auth`;
CREATE TABLE `sys_user_auth` (
  `user_id` int(10) DEFAULT NULL COMMENT '角色标识',
  `col_id` int(10) DEFAULT NULL COMMENT '系统栏目标识',
  `col_auth` varchar(10) DEFAULT NULL COMMENT '系统栏目权限',
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统用户权限表';

-- ----------------------------
-- Records of sys_user_auth
-- ----------------------------

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
  `lang` varchar(10) DEFAULT 'zh-cn' COMMENT '语言：zh-cn=中文，en=英文',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='上传文件表';

-- ----------------------------
-- Records of uploads
-- ----------------------------
