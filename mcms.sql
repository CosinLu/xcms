/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : mcms

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-09-28 15:05:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for common_dict
-- ----------------------------
DROP TABLE IF EXISTS `common_dict`;
CREATE TABLE `common_dict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '分类所属上级标识【默认0】',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别',
  `ident` varchar(20) DEFAULT NULL COMMENT '唯一标识',
  `color` char(7) DEFAULT NULL COMMENT '颜色',
  `user_type` varchar(10) DEFAULT NULL COMMENT '用户类型',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='通用字典表';

-- ----------------------------
-- Records of common_dict
-- ----------------------------
INSERT INTO `common_dict` VALUES ('1', '操作', '0', '1', 'sys_menu_auth', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('2', '新增', '1', '2', 'insert', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('3', '修改', '1', '2', 'update', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('4', '删除', '1', '2', 'del', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('5', '查看', '1', '2', 'look', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('9', '显示', '0', '1', 'display', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('10', '显示', '9', '2', 'show', '#5cb85c', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('11', '隐藏', '9', '2', 'hide', '#d9534f', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('12', '配置项类型', '0', '1', 'config_type', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('13', '文本', '12', '2', 'text', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('14', '单选', '12', '2', 'radio', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('15', '复选', '12', '2', 'checkbox', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('16', '下拉列表', '12', '2', 'select', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('17', '文本域', '12', '2', 'textarea', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('18', '用户状态', '0', '1', 'user_status', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('19', '正常', '18', '2', 'normal', '#5cb85c', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('20', '冻结', '18', '2', 'forzen', '#d9534f', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('26', '位置', '0', '1', 'position', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('27', '顶部', '26', '2', 'top', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('28', '底部', '26', '2', 'bottom', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('29', '打开方式', '0', '1', 'target', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('30', '当前窗口', '29', '2', '_self', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('31', '新窗口', '29', '2', '_blank', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('32', '日志状态', '0', '1', 'log_status', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('33', '成功', '32', '2', 'success', '#5cb85c', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('34', '失败', '32', '2', 'fail', '#d9534f', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('35', '用户类型', '0', '1', 'user_type', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('36', '生产者', '35', '2', 'pro', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('37', '开发者', '35', '2', 'dev', '#d9534f', 'dev', '100', null, null, null, null);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `variable` varchar(100) DEFAULT NULL COMMENT '变量名',
  `value` varchar(500) DEFAULT NULL COMMENT '值',
  `category` varchar(20) DEFAULT NULL COMMENT '类别',
  `type` varchar(50) DEFAULT NULL COMMENT '配置项类型',
  `param` varchar(100) DEFAULT NULL COMMENT '参数',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `display` char(4) DEFAULT NULL COMMENT '显示',
  `sort` int(10) unsigned DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='基本配置表';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '标题', 'title', '轩宇网络工作室', 'base', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('2', '关键字', 'keywords', '', 'base', 'textarea', '', '', 'show', '100');
INSERT INTO `config` VALUES ('3', '描述', 'description', '', 'base', 'textarea', '', '', 'show', '100');
INSERT INTO `config` VALUES ('4', '版权', 'copyright', '@ 轩宇网络', 'base', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('5', '备案号', 'icp_num', '京ICP备15054430号-1', 'base', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('6', '统计/商桥', 'count_code', '', 'base', 'textarea', '', '', 'show', '100');
INSERT INTO `config` VALUES ('7', '状态', 'status', '1', 'status', 'radio', '1|正常,0|关闭', '', 'show', '100');
INSERT INTO `config` VALUES ('8', '关闭说明', 'close_explain', '网站升级，敬请期待！', 'status', 'textarea', '', '', 'show', '100');

-- ----------------------------
-- Table structure for config_group
-- ----------------------------
DROP TABLE IF EXISTS `config_group`;
CREATE TABLE `config_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `category` varchar(20) DEFAULT NULL COMMENT '类别',
  `display` char(4) DEFAULT NULL COMMENT '显示',
  `sort` int(10) DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='配置组';

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
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `cid` int(10) DEFAULT NULL COMMENT '信息栏目标识',
  `title` varchar(500) DEFAULT NULL COMMENT '标题',
  `original_link` varchar(255) DEFAULT NULL COMMENT '原文链接',
  `auther` varchar(30) DEFAULT NULL COMMENT '作者',
  `image` varchar(10) DEFAULT NULL COMMENT '图片',
  `content` text COMMENT '内容',
  `tags` varchar(20) DEFAULT NULL COMMENT '标签',
  `target` varchar(10) DEFAULT NULL COMMENT 'url打开方式',
  `display` char(4) DEFAULT NULL COMMENT '状态',
  `sort` int(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='信息文章表';

-- ----------------------------
-- Records of info_article
-- ----------------------------
INSERT INTO `info_article` VALUES ('1', '1', '基于Vue全家桶制作的的高仿美团APP', 'https://juejin.im/post/59b8ea926fb9a00a636a2f48', '白小明', '582', '<h2 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">技术栈</h2><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">【前端】</p><ul style=\"padding: 0px 0px 0px 2.7rem; color: rgb(51, 51, 51); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important;\" class=\" list-paddingleft-2\"><li><p style=\"text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">Vue</span>：构建用户界面的 MVVM 框架，核心是响应的数据绑定和组系统件</p></li><li><p style=\"text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">vue-router</span>：为单页面应用提供的路由系统，项目上线前使用了路由懒加载技术，来异步加载路由优化性能</p></li><li><p style=\"text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">vuex</span>：Vue 集中状态管理，在多个组件共享某些状态时非常便捷</p></li><li><p style=\"text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">vue-resource</span>：服务端通讯，项目后期改用&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">axios</code></p></li><li><p style=\"text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">axios</span>：服务端通讯。基于&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">Promise</code>&nbsp;的网络请求插件</p></li><li><p style=\"text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">vue-lazyload</span>：第三方图片懒加载库，优化页面加载速度</p></li><li><p style=\"text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">better-scroll</span>：iscroll 的优化版，使移动端滑动体验更加流畅</p></li><li><p style=\"text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">Mint UI</span>：一套基于 Vue 2.0 的移动端组件库，出自饿了么前端</p></li><li><p style=\"text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">Sass(Scss)</span>：css 预编译处理器</p></li><li><p style=\"text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">ES6</span>：ECMAScript 新一代语法，模块化、解构赋值、Promise、Class 等方法非常好用</p></li><li><p style=\"text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">Moment.js</span>：日期时间格式化插件</p></li></ul><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">【后端及数据库】</p>', 'qd,hd', '_blank', 'show', '100', '1505297925', null, null, null);
INSERT INTO `info_article` VALUES ('3', '1', '安卓工程师到底要不要使用苹果手机', '', '亦枫', '583', '<p>是打发斯蒂芬阿斯蒂芬阿斯蒂</p>', '1,3', '_self', 'show', '100', '1505368278', null, null, null);

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
  `display` char(4) DEFAULT NULL COMMENT '显示',
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
  `pid` int(10) unsigned DEFAULT '0' COMMENT '分类所属上级标识',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别',
  `tpl_id` int(11) DEFAULT NULL COMMENT '模板标识',
  `dir` varchar(30) DEFAULT NULL COMMENT '目录',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` varchar(10) DEFAULT NULL COMMENT '打开方式',
  `seo_title` varchar(80) DEFAULT NULL COMMENT 'SEO标题',
  `seo_desc` varchar(200) DEFAULT NULL COMMENT 'SEO描述',
  `display` char(4) DEFAULT NULL COMMENT '显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  `add_next_auth` tinyint(1) DEFAULT '1' COMMENT '新增下级权限：0=禁止，1=允许',
  `edit_auth` tinyint(1) DEFAULT '1' COMMENT '编辑权限：0=禁止，1=允许',
  `del_auth` tinyint(1) DEFAULT '1' COMMENT '删除权限：0=禁止，1=允许',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='信息栏目表';

-- ----------------------------
-- Records of info_col
-- ----------------------------
INSERT INTO `info_col` VALUES ('1', '文章', '0', '1', '1', 'article', '', '_self', null, null, 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('2', '模板', '0', '1', '2', 'template', '', '_self', null, null, 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('3', '产品', '0', '1', '2', 'product', '', '_self', null, null, 'show', '100', null, null, null, null, '1', '1', '1');

-- ----------------------------
-- Table structure for info_col_adv
-- ----------------------------
DROP TABLE IF EXISTS `info_col_adv`;
CREATE TABLE `info_col_adv` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `cid` int(11) DEFAULT NULL COMMENT '信息栏目标识',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `image` varchar(100) DEFAULT NULL COMMENT '上传文件标识',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `display` char(4) DEFAULT NULL COMMENT '显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息栏目广告表';

-- ----------------------------
-- Records of info_col_adv
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
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `image` varchar(100) DEFAULT NULL COMMENT '上传文件标识',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `target` varchar(10) DEFAULT NULL COMMENT 'url打开方式',
  `display` char(4) DEFAULT NULL COMMENT '显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '分类所属上级标识',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别',
  `col` tinyint(10) DEFAULT NULL COMMENT '栏目',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` varchar(10) DEFAULT NULL COMMENT '打开方式',
  `position` varchar(10) DEFAULT NULL COMMENT '位置',
  `display` char(4) DEFAULT NULL COMMENT '显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  `add_next_auth` tinyint(1) DEFAULT '1' COMMENT '新增下级权限：0=禁止，1=允许',
  `edit_auth` tinyint(1) DEFAULT '1' COMMENT '编辑权限：0=禁止，1=允许',
  `del_auth` tinyint(1) DEFAULT '1' COMMENT '删除权限：0=禁止，1=允许',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of navigation
-- ----------------------------
INSERT INTO `navigation` VALUES ('1', '文章', '0', '1', '1', 'article', '_self', 'top', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `navigation` VALUES ('2', '产品', '0', '1', '3', 'product', '_self', 'top', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `navigation` VALUES ('3', '模板', '0', '1', '2', 'template', '_self', 'top', 'show', '100', null, null, null, null, '1', '1', '1');

-- ----------------------------
-- Table structure for slide
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `image` varchar(100) DEFAULT NULL COMMENT '上传文件标识',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `target` varchar(10) DEFAULT NULL COMMENT 'url打开方式',
  `display` char(4) DEFAULT NULL COMMENT '显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES ('7', '123', '595', '', '_self', 'show', '100', null, null, null, null);
INSERT INTO `slide` VALUES ('8', '345', '597', '', '_self', 'show', '100', null, null, null, null);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户标识',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `col_name` varchar(10) DEFAULT NULL COMMENT '栏目名称',
  `opera` varchar(20) DEFAULT NULL COMMENT '操作',
  `status` varchar(10) DEFAULT NULL COMMENT '状态',
  `browser` varchar(50) DEFAULT NULL COMMENT '浏览器名称',
  `version` varchar(50) DEFAULT NULL COMMENT '浏览器版本号',
  `platform` varchar(50) DEFAULT NULL COMMENT '平台',
  `hostname` varchar(50) DEFAULT NULL COMMENT '主机名',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `time` int(10) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '4', 'madmin', '通用字典', 'del', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506394195');
INSERT INTO `sys_log` VALUES ('2', '4', 'madmin', '通用字典', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506394308');
INSERT INTO `sys_log` VALUES ('3', '4', 'madmin', '菜单管理', 'del', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506394346');
INSERT INTO `sys_log` VALUES ('4', '4', 'madmin', '菜单管理', 'del', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506394510');
INSERT INTO `sys_log` VALUES ('5', '4', 'madmin', '配置组', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506395512');
INSERT INTO `sys_log` VALUES ('6', '4', 'madmin', '配置组', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506395522');
INSERT INTO `sys_log` VALUES ('7', '4', 'madmin', '配置项', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506397662');
INSERT INTO `sys_log` VALUES ('8', '4', 'madmin', '配置项', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506397678');
INSERT INTO `sys_log` VALUES ('9', '4', 'madmin', '配置项', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506397685');
INSERT INTO `sys_log` VALUES ('10', '4', 'madmin', '配置项', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506397692');
INSERT INTO `sys_log` VALUES ('11', '4', 'madmin', '配置项', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506397698');
INSERT INTO `sys_log` VALUES ('12', '4', 'madmin', '配置项', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506397705');
INSERT INTO `sys_log` VALUES ('13', '4', 'madmin', '配置项', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506397711');
INSERT INTO `sys_log` VALUES ('14', '4', 'madmin', '配置项', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506397718');
INSERT INTO `sys_log` VALUES ('15', '4', 'madmin', '网站配置', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506398271');
INSERT INTO `sys_log` VALUES ('16', '4', 'madmin', '网站配置', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506398275');
INSERT INTO `sys_log` VALUES ('17', '4', 'madmin', '网站配置', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506398280');
INSERT INTO `sys_log` VALUES ('18', '4', 'madmin', '网站配置', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506399206');
INSERT INTO `sys_log` VALUES ('19', '4', 'madmin', '网站配置', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506399209');
INSERT INTO `sys_log` VALUES ('20', '4', 'madmin', '网站配置', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506399213');
INSERT INTO `sys_log` VALUES ('21', '4', 'madmin', '导航管理', 'insert', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506439245');
INSERT INTO `sys_log` VALUES ('22', '4', 'madmin', '导航管理', 'del', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506439394');
INSERT INTO `sys_log` VALUES ('23', '4', 'madmin', '导航管理', 'insert', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506439405');
INSERT INTO `sys_log` VALUES ('24', '4', 'madmin', '导航管理', 'insert', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506439412');
INSERT INTO `sys_log` VALUES ('25', '4', 'madmin', '导航管理', 'insert', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506439421');
INSERT INTO `sys_log` VALUES ('26', '4', 'madmin', '导航管理', 'insert', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506439430');
INSERT INTO `sys_log` VALUES ('27', '4', 'madmin', '导航管理', 'del', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506439465');
INSERT INTO `sys_log` VALUES ('28', '4', 'madmin', '配置组', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506516652');
INSERT INTO `sys_log` VALUES ('29', '4', 'madmin', '配置组', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506516722');
INSERT INTO `sys_log` VALUES ('30', '4', 'madmin', '配置组', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506516730');
INSERT INTO `sys_log` VALUES ('31', '4', 'madmin', '配置组', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506516736');
INSERT INTO `sys_log` VALUES ('32', '4', 'madmin', '幻灯片', 'insert', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506518491');
INSERT INTO `sys_log` VALUES ('33', '4', 'madmin', '幻灯片', 'insert', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506518961');
INSERT INTO `sys_log` VALUES ('34', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506520924');
INSERT INTO `sys_log` VALUES ('35', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506520935');
INSERT INTO `sys_log` VALUES ('36', '4', 'madmin', '菜单管理', 'del', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506520944');
INSERT INTO `sys_log` VALUES ('37', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506520961');
INSERT INTO `sys_log` VALUES ('38', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506520974');
INSERT INTO `sys_log` VALUES ('39', '4', 'madmin', '菜单管理', 'insert', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506522406');
INSERT INTO `sys_log` VALUES ('40', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506522432');
INSERT INTO `sys_log` VALUES ('41', '4', 'madmin', '菜单管理', 'del', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506522911');
INSERT INTO `sys_log` VALUES ('42', '4', 'madmin', '菜单管理', 'del', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506522918');
INSERT INTO `sys_log` VALUES ('43', '4', 'madmin', '菜单管理', 'del', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506522939');
INSERT INTO `sys_log` VALUES ('44', '4', 'madmin', '通用字典', 'insert', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506523020');
INSERT INTO `sys_log` VALUES ('45', '4', 'madmin', '通用字典', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506523132');
INSERT INTO `sys_log` VALUES ('46', '4', 'madmin', '通用字典', 'del', 'fail', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506523141');
INSERT INTO `sys_log` VALUES ('47', '4', 'madmin', '通用字典', 'del', 'fail', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506523149');
INSERT INTO `sys_log` VALUES ('48', '4', 'madmin', '通用字典', 'del', 'fail', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506523221');
INSERT INTO `sys_log` VALUES ('49', '4', 'madmin', '通用字典', 'del', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1506523272');
INSERT INTO `sys_log` VALUES ('50', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506567256');
INSERT INTO `sys_log` VALUES ('51', '4', 'madmin', '通用字典', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1506567389');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='系统登录日志表';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('1', '4', '127.0.0.1', '1506388201');
INSERT INTO `sys_login_log` VALUES ('2', '4', '::1', '1506388850');
INSERT INTO `sys_login_log` VALUES ('3', '4', '::1', '1506426810');
INSERT INTO `sys_login_log` VALUES ('4', '4', '::1', '1506434767');
INSERT INTO `sys_login_log` VALUES ('5', '4', '::1', '1506514712');
INSERT INTO `sys_login_log` VALUES ('6', '4', '::1', '1506516549');
INSERT INTO `sys_login_log` VALUES ('7', '4', '::1', '1506582070');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `pid` int(10) DEFAULT '0' COMMENT '上级标识',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_type` varchar(10) DEFAULT NULL COMMENT '用户类型',
  `display` char(4) DEFAULT NULL COMMENT '显示',
  `sort` int(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '起始页', 'fa fa-home', '0', '1', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('2', '系统管理', 'fa fa-laptop', '0', '1', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('3', '内容管理', 'fa fa-folder', '0', '1', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('4', '模块管理', 'fa fa-th-large', '0', '1', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('7', '我的面板', 'fa fa-list-alt', '1', '2', 'welcome', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('9', '配置组', 'fa fa-cogs', '1', '2', 'config_group', '', 'dev', 'show', '200', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('10', '配置项', 'fa fa-cog', '1', '2', 'config_item', '', 'dev', 'show', '200', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('11', '网站配置', 'fa fa-cog', '2', '2', 'config', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('12', '栏目管理', 'fa fa-columns', '3', '2', 'info_col', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('13', '信息管理', 'fa fa-list', '3', '2', 'info', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('14', '模板管理', 'fa fa-codepen', '2', '2', 'sys_tpl', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('15', '幻灯片', 'fa fa-slideshare', '4', '2', 'slide', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('16', '菜单管理', 'fa fa-bars', '1', '2', 'sys_menu', '', 'dev', 'show', '200', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('17', '角色管理', 'fa fa-users', '2', '2', 'sys_role', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('18', '用户管理', 'fa fa-user', '2', '2', 'sys_user', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('31', '日志', 'fa fa-list', '1', '2', 'sys_log', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('38', '文件管理', 'fa fa-file-text-o', '4', '2', 'uploads', '', 'pro', 'hide', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('41', '导航管理', 'fa fa-bars', '2', '2', 'navigation', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('42', '友情链接', 'fa fa-link', '4', '2', 'link', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('43', '商品管理', 'fa fa-shopping-bag', '0', '1', '', '', 'pro', 'hide', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('48', '通用字典', 'fa fa-book', '2', '2', 'common_dict', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('50', '广告管理', 'fa fa-image', '3', '2', 'info_col_adv', '', 'pro', 'show', '100', null, null, null, null);

-- ----------------------------
-- Table structure for sys_menu_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_auth`;
CREATE TABLE `sys_menu_auth` (
  `sys_menu_id` int(10) NOT NULL COMMENT '系统菜单标识',
  `sys_menu_auth` varchar(10) NOT NULL COMMENT '系统菜单权限标识'
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
INSERT INTO `sys_menu_auth` VALUES ('42', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('42', 'update');
INSERT INTO `sys_menu_auth` VALUES ('42', 'del');
INSERT INTO `sys_menu_auth` VALUES ('42', 'look');
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统角色表';

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
  `display` char(4) DEFAULT NULL COMMENT '显示',
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
INSERT INTO `sys_tpl` VALUES ('1', '文章模板', 'article', 'article/detail', 'info_article', '', 'show', '100', null, null, null, null);
INSERT INTO `sys_tpl` VALUES ('2', '案例模板', 'cases', 'cases/detail', 'info_cases', '', 'show', '100', null, null, null, null);
INSERT INTO `sys_tpl` VALUES ('3', '单页模板', 'single', '', 'info_single', '', 'show', '100', null, null, null, null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `role_id` int(10) unsigned DEFAULT NULL COMMENT '角色标识',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `user_type` tinyint(1) DEFAULT '2' COMMENT '用户类型：0=开发者，1=系统默认，2=普通',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `realname` varchar(50) DEFAULT NULL COMMENT '姓名',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` char(6) DEFAULT NULL COMMENT '状态',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('2', '1', 'admin', '1', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'normal', null, null, null, null);
INSERT INTO `sys_user` VALUES ('3', '3', 'demo', '2', 'e10adc3949ba59abbe56e057f20f883e', 'demo', null, null, 'normal', null, null, null, null);
INSERT INTO `sys_user` VALUES ('4', '4', 'madmin', '0', 'e10adc3949ba59abbe56e057f20f883e', 'Meng Xianghan', '开发者', null, 'normal', null, null, null, null);

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
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `display` char(4) DEFAULT NULL COMMENT '显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标签表';

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for uploads
-- ----------------------------
DROP TABLE IF EXISTS `uploads`;
CREATE TABLE `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
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
) ENGINE=MyISAM AUTO_INCREMENT=598 DEFAULT CHARSET=utf8 COMMENT='上传文件表';

-- ----------------------------
-- Records of uploads
-- ----------------------------
INSERT INTO `uploads` VALUES ('563', '3ed90863a4453548d6b00927be2afeb2.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170907/', 'D:/wamp/www/uploads/upload/20170907/3ed90863a4453548d6b00927be2afeb2.jpg', '/uploads/upload/20170907/', '/uploads/upload/20170907/3ed90863a4453548d6b00927be2afeb2.jpg', '3ed90863a4453548d6b00927be2afeb2', '/uploads/upload/20170907/3ed90863a4453548d6b00927be2afeb2', '3ed90863a4453548d6b00927be2afeb2.jpg', '59a8fe5fN31ffc167.jpg', '.jpg', '107.75', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('564', '1d865349f69e2d9482936ff30128b1f4.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170907/', 'D:/wamp/www/uploads/upload/20170907/1d865349f69e2d9482936ff30128b1f4.jpg', '/uploads/upload/20170907/', '/uploads/upload/20170907/1d865349f69e2d9482936ff30128b1f4.jpg', '1d865349f69e2d9482936ff30128b1f4', '/uploads/upload/20170907/1d865349f69e2d9482936ff30128b1f4', '1d865349f69e2d9482936ff30128b1f4.jpg', '59a79038N19b55fd0.jpg', '.jpg', '249.36', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('565', 'cfb30c89ed98ac09a214dd324e82854d.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170908/', 'D:/wamp/www/uploads/upload/20170908/cfb30c89ed98ac09a214dd324e82854d.jpg', '/uploads/upload/20170908/', '/uploads/upload/20170908/cfb30c89ed98ac09a214dd324e82854d.jpg', 'cfb30c89ed98ac09a214dd324e82854d', '/uploads/upload/20170908/cfb30c89ed98ac09a214dd324e82854d', 'cfb30c89ed98ac09a214dd324e82854d.jpg', '59ae1b90Nf4d63425.jpg', '.jpg', '93.42', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('566', '2065a68aa226f22b486ba0abd58b75ff.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170908/', 'D:/wamp/www/uploads/upload/20170908/2065a68aa226f22b486ba0abd58b75ff.jpg', '/uploads/upload/20170908/', '/uploads/upload/20170908/2065a68aa226f22b486ba0abd58b75ff.jpg', '2065a68aa226f22b486ba0abd58b75ff', '/uploads/upload/20170908/2065a68aa226f22b486ba0abd58b75ff', '2065a68aa226f22b486ba0abd58b75ff.jpg', '59ad05bdNae81e2b2.jpg', '.jpg', '189.91', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('567', '70430de916f8f5320db656049d5419c9.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170908/', 'D:/wamp/www/uploads/upload/20170908/70430de916f8f5320db656049d5419c9.jpg', '/uploads/upload/20170908/', '/uploads/upload/20170908/70430de916f8f5320db656049d5419c9.jpg', '70430de916f8f5320db656049d5419c9', '/uploads/upload/20170908/70430de916f8f5320db656049d5419c9', '70430de916f8f5320db656049d5419c9.jpg', '59af4fdeN7a69c937.jpg', '.jpg', '98.98', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('568', '0fb1a6453fa9c1f17b3888ab5d542cf5.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170908/', 'D:/wamp/www/uploads/upload/20170908/0fb1a6453fa9c1f17b3888ab5d542cf5.jpg', '/uploads/upload/20170908/', '/uploads/upload/20170908/0fb1a6453fa9c1f17b3888ab5d542cf5.jpg', '0fb1a6453fa9c1f17b3888ab5d542cf5', '/uploads/upload/20170908/0fb1a6453fa9c1f17b3888ab5d542cf5', '0fb1a6453fa9c1f17b3888ab5d542cf5.jpg', '59af95ecN177a895c.jpg', '.jpg', '129.83', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('569', '01a7be5a0a2d09397fa609dd00cd9d1a.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170908/', 'D:/wamp/www/uploads/upload/20170908/01a7be5a0a2d09397fa609dd00cd9d1a.jpg', '/uploads/upload/20170908/', '/uploads/upload/20170908/01a7be5a0a2d09397fa609dd00cd9d1a.jpg', '01a7be5a0a2d09397fa609dd00cd9d1a', '/uploads/upload/20170908/01a7be5a0a2d09397fa609dd00cd9d1a', '01a7be5a0a2d09397fa609dd00cd9d1a.jpg', '59afba1cN5384b387.jpg', '.jpg', '96.15', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('570', '965335e6f832669638e9b490c5b2a38b.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170908/', 'D:/wamp/www/uploads/upload/20170908/965335e6f832669638e9b490c5b2a38b.jpg', '/uploads/upload/20170908/', '/uploads/upload/20170908/965335e6f832669638e9b490c5b2a38b.jpg', '965335e6f832669638e9b490c5b2a38b', '/uploads/upload/20170908/965335e6f832669638e9b490c5b2a38b', '965335e6f832669638e9b490c5b2a38b.jpg', '59af4fdeN7a69c937.jpg', '.jpg', '98.98', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('571', '63800ed742032da7872efc635fac7b8c.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170908/', 'D:/wamp/www/uploads/upload/20170908/63800ed742032da7872efc635fac7b8c.jpg', '/uploads/upload/20170908/', '/uploads/upload/20170908/63800ed742032da7872efc635fac7b8c.jpg', '63800ed742032da7872efc635fac7b8c', '/uploads/upload/20170908/63800ed742032da7872efc635fac7b8c', '63800ed742032da7872efc635fac7b8c.jpg', '59ae4fe1Na9de03ee.jpg', '.jpg', '95.71', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('572', '7f7e9905afab174c088b355f778d5a9c.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170908/', 'D:/wamp/www/uploads/upload/20170908/7f7e9905afab174c088b355f778d5a9c.jpg', '/uploads/upload/20170908/', '/uploads/upload/20170908/7f7e9905afab174c088b355f778d5a9c.jpg', '7f7e9905afab174c088b355f778d5a9c', '/uploads/upload/20170908/7f7e9905afab174c088b355f778d5a9c', '7f7e9905afab174c088b355f778d5a9c.jpg', '59ae4fe1Na9de03ee.jpg', '.jpg', '95.71', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('573', '49e8607ee1a14c60f0ddf35ac28c3b73.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170908/', 'D:/wamp/www/uploads/upload/20170908/49e8607ee1a14c60f0ddf35ac28c3b73.jpg', '/uploads/upload/20170908/', '/uploads/upload/20170908/49e8607ee1a14c60f0ddf35ac28c3b73.jpg', '49e8607ee1a14c60f0ddf35ac28c3b73', '/uploads/upload/20170908/49e8607ee1a14c60f0ddf35ac28c3b73', '49e8607ee1a14c60f0ddf35ac28c3b73.jpg', '59ae4fe1Na9de03ee.jpg', '.jpg', '95.71', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('574', '5fc573cf47b844b4372ba3c401c64b20.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170908/', 'D:/wamp/www/uploads/upload/20170908/5fc573cf47b844b4372ba3c401c64b20.jpg', '/uploads/upload/20170908/', '/uploads/upload/20170908/5fc573cf47b844b4372ba3c401c64b20.jpg', '5fc573cf47b844b4372ba3c401c64b20', '/uploads/upload/20170908/5fc573cf47b844b4372ba3c401c64b20', 'ee0ab0870d6b9e0f7e05194ab76422cc.jpg', '123.jpg', '.jpg', '107.75', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('575', '53aa6611c941800fb5953a566c03f954.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170908/', 'D:/wamp/www/uploads/upload/20170908/53aa6611c941800fb5953a566c03f954.jpg', '/uploads/upload/20170908/', '/uploads/upload/20170908/53aa6611c941800fb5953a566c03f954.jpg', '53aa6611c941800fb5953a566c03f954', '/uploads/upload/20170908/53aa6611c941800fb5953a566c03f954', '53aa6611c941800fb5953a566c03f954.jpg', '59af4fdeN7a69c937.jpg', '.jpg', '98.98', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('576', '3b5b040d1613061dc0d19e894dfd56ab.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170908/', 'D:/wamp/www/uploads/upload/20170908/3b5b040d1613061dc0d19e894dfd56ab.jpg', '/uploads/upload/20170908/', '/uploads/upload/20170908/3b5b040d1613061dc0d19e894dfd56ab.jpg', '3b5b040d1613061dc0d19e894dfd56ab', '/uploads/upload/20170908/3b5b040d1613061dc0d19e894dfd56ab', '3b5b040d1613061dc0d19e894dfd56ab.jpg', '59af4fdeN7a69c937.jpg', '.jpg', '98.98', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('577', 'a70bff2443b6398b3e9617cce20491e5.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170908/', 'D:/wamp/www/uploads/upload/20170908/a70bff2443b6398b3e9617cce20491e5.jpg', '/uploads/upload/20170908/', '/uploads/upload/20170908/a70bff2443b6398b3e9617cce20491e5.jpg', 'a70bff2443b6398b3e9617cce20491e5', '/uploads/upload/20170908/a70bff2443b6398b3e9617cce20491e5', 'a70bff2443b6398b3e9617cce20491e5.jpg', '59af4fdeN7a69c937.jpg', '.jpg', '98.98', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('578', '6b8aaec826b8ac0f68e48dfb492183a3.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170908/', 'D:/wamp/www/uploads/upload/20170908/6b8aaec826b8ac0f68e48dfb492183a3.jpg', '/uploads/upload/20170908/', '/uploads/upload/20170908/6b8aaec826b8ac0f68e48dfb492183a3.jpg', '6b8aaec826b8ac0f68e48dfb492183a3', '/uploads/upload/20170908/6b8aaec826b8ac0f68e48dfb492183a3', '6b8aaec826b8ac0f68e48dfb492183a3.jpg', '59af4fdeN7a69c937.jpg', '.jpg', '98.98', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('579', '61ec25344f6b1a015ca529157e9c2359.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170914/', 'D:/wamp/www/uploads/upload/20170914/61ec25344f6b1a015ca529157e9c2359.jpg', '/uploads/upload/20170914/', '/uploads/upload/20170914/61ec25344f6b1a015ca529157e9c2359.jpg', '61ec25344f6b1a015ca529157e9c2359', '/uploads/upload/20170914/61ec25344f6b1a015ca529157e9c2359', '61ec25344f6b1a015ca529157e9c2359.jpg', '59af4fdeN7a69c937.jpg', '.jpg', '98.98', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('580', 'b193f701f8b8fdc632a0faa14be93722.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170914/', 'D:/wamp/www/uploads/upload/20170914/b193f701f8b8fdc632a0faa14be93722.jpg', '/uploads/upload/20170914/', '/uploads/upload/20170914/b193f701f8b8fdc632a0faa14be93722.jpg', 'b193f701f8b8fdc632a0faa14be93722', '/uploads/upload/20170914/b193f701f8b8fdc632a0faa14be93722', 'b193f701f8b8fdc632a0faa14be93722.jpg', '59af4fdeN7a69c937.jpg', '.jpg', '98.98', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('581', '1fd243f63d5fc0eb292951626ee0a7b0.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170914/', 'D:/wamp/www/uploads/upload/20170914/1fd243f63d5fc0eb292951626ee0a7b0.jpg', '/uploads/upload/20170914/', '/uploads/upload/20170914/1fd243f63d5fc0eb292951626ee0a7b0.jpg', '1fd243f63d5fc0eb292951626ee0a7b0', '/uploads/upload/20170914/1fd243f63d5fc0eb292951626ee0a7b0', '1fd243f63d5fc0eb292951626ee0a7b0.jpg', 'logo.jpg', '.jpg', '66.00', '1', '127', '127', 'jpeg', 'width=\"640\" height=\"640\"', null);
INSERT INTO `uploads` VALUES ('582', 'b69388252e0f395d6ed480a294fe0ed4.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170914/', 'D:/wamp/www/uploads/upload/20170914/b69388252e0f395d6ed480a294fe0ed4.jpg', '/uploads/upload/20170914/', '/uploads/upload/20170914/b69388252e0f395d6ed480a294fe0ed4.jpg', 'b69388252e0f395d6ed480a294fe0ed4', '/uploads/upload/20170914/b69388252e0f395d6ed480a294fe0ed4', 'b69388252e0f395d6ed480a294fe0ed4.jpg', '59af4fdeN7a69c937.jpg', '.jpg', '98.98', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('583', '09a43399acfbbb70650eb864add333c1.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170914/', 'D:/wamp/www/uploads/upload/20170914/09a43399acfbbb70650eb864add333c1.jpg', '/uploads/upload/20170914/', '/uploads/upload/20170914/09a43399acfbbb70650eb864add333c1.jpg', '09a43399acfbbb70650eb864add333c1', '/uploads/upload/20170914/09a43399acfbbb70650eb864add333c1', '09a43399acfbbb70650eb864add333c1.jpg', '14fe14754790460b632ddfeb248efd54.jpg', '.jpg', '5.06', '1', '120', '120', 'jpeg', 'width=\"120\" height=\"120\"', null);
INSERT INTO `uploads` VALUES ('584', '3d0105e83519f4da22bb910a298935cf.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170922/', 'D:/wamp/www/uploads/upload/20170922/3d0105e83519f4da22bb910a298935cf.jpg', '/uploads/upload/20170922/', '/uploads/upload/20170922/3d0105e83519f4da22bb910a298935cf.jpg', '3d0105e83519f4da22bb910a298935cf', '/uploads/upload/20170922/3d0105e83519f4da22bb910a298935cf', '3d0105e83519f4da22bb910a298935cf.jpg', '59af4fdeN7a69c937.jpg', '.jpg', '98.98', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('585', 'a34b76f769d7fb373aeb3dbfc645810b.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170922/', 'D:/wamp/www/uploads/upload/20170922/a34b76f769d7fb373aeb3dbfc645810b.jpg', '/uploads/upload/20170922/', '/uploads/upload/20170922/a34b76f769d7fb373aeb3dbfc645810b.jpg', 'a34b76f769d7fb373aeb3dbfc645810b', '/uploads/upload/20170922/a34b76f769d7fb373aeb3dbfc645810b', 'a34b76f769d7fb373aeb3dbfc645810b.jpg', '59af4fdeN7a69c937.jpg', '.jpg', '98.98', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('586', '0cc26c8b8f17eac8a281e45f71f3d562.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170922/', 'D:/wamp/www/uploads/upload/20170922/0cc26c8b8f17eac8a281e45f71f3d562.jpg', '/uploads/upload/20170922/', '/uploads/upload/20170922/0cc26c8b8f17eac8a281e45f71f3d562.jpg', '0cc26c8b8f17eac8a281e45f71f3d562', '/uploads/upload/20170922/0cc26c8b8f17eac8a281e45f71f3d562', '0cc26c8b8f17eac8a281e45f71f3d562.jpg', '59af95ecN177a895c.jpg', '.jpg', '129.83', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('587', 'a38359e177deafa303dc914872722b32.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170922/', 'D:/wamp/www/uploads/upload/20170922/a38359e177deafa303dc914872722b32.jpg', '/uploads/upload/20170922/', '/uploads/upload/20170922/a38359e177deafa303dc914872722b32.jpg', 'a38359e177deafa303dc914872722b32', '/uploads/upload/20170922/a38359e177deafa303dc914872722b32', 'a38359e177deafa303dc914872722b32.jpg', '59a79038N19b55fd0.jpg', '.jpg', '249.36', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('588', '3f11ebe93f492e6bd91e2c12aa331edc.png', 'image/png', 'D:/wamp/www/uploads/upload/20170925/', 'D:/wamp/www/uploads/upload/20170925/3f11ebe93f492e6bd91e2c12aa331edc.png', '/uploads/upload/20170925/', '/uploads/upload/20170925/3f11ebe93f492e6bd91e2c12aa331edc.png', '3f11ebe93f492e6bd91e2c12aa331edc', '/uploads/upload/20170925/3f11ebe93f492e6bd91e2c12aa331edc', '3f11ebe93f492e6bd91e2c12aa331edc.png', 'logo-1.png', '.png', '4.00', '1', '127', '127', 'png', 'width=\"160\" height=\"160\"', null);
INSERT INTO `uploads` VALUES ('589', '54bea80650341d3ce290201a2d4ac283.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170925/', 'D:/wamp/www/uploads/upload/20170925/54bea80650341d3ce290201a2d4ac283.jpg', '/uploads/upload/20170925/', '/uploads/upload/20170925/54bea80650341d3ce290201a2d4ac283.jpg', '54bea80650341d3ce290201a2d4ac283', '/uploads/upload/20170925/54bea80650341d3ce290201a2d4ac283', '54bea80650341d3ce290201a2d4ac283.jpg', '59a79038N19b55fd0.jpg', '.jpg', '249.36', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('590', '406ba3be42e4fae2b00bc0749e1c1d42.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170925/', 'D:/wamp/www/uploads/upload/20170925/406ba3be42e4fae2b00bc0749e1c1d42.jpg', '/uploads/upload/20170925/', '/uploads/upload/20170925/406ba3be42e4fae2b00bc0749e1c1d42.jpg', '406ba3be42e4fae2b00bc0749e1c1d42', '/uploads/upload/20170925/406ba3be42e4fae2b00bc0749e1c1d42', '406ba3be42e4fae2b00bc0749e1c1d42.jpg', '59af4fdeN7a69c937.jpg', '.jpg', '98.98', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('591', '12d06f3d3b357815df6384aa4f5d5d0c.png', 'image/png', 'D:/wamp/www/uploads/upload/20170925/', 'D:/wamp/www/uploads/upload/20170925/12d06f3d3b357815df6384aa4f5d5d0c.png', '/uploads/upload/20170925/', '/uploads/upload/20170925/12d06f3d3b357815df6384aa4f5d5d0c.png', '12d06f3d3b357815df6384aa4f5d5d0c', '/uploads/upload/20170925/12d06f3d3b357815df6384aa4f5d5d0c', '12d06f3d3b357815df6384aa4f5d5d0c.png', 'logo-1.png', '.png', '4.00', '1', '127', '127', 'png', 'width=\"160\" height=\"160\"', null);
INSERT INTO `uploads` VALUES ('592', '', '', '', '', '', '', '', '', '', '', '', null, '0', null, null, '', '', null);
INSERT INTO `uploads` VALUES ('593', '', '', '', '', '', '', '', '', '', '', '', null, '0', null, null, '', '', null);
INSERT INTO `uploads` VALUES ('594', '', '', '', '', '', '', '', '', '', '', '', null, '0', null, null, '', '', null);
INSERT INTO `uploads` VALUES ('595', 'b4b158f10429201c48baec2c2e929950.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170927/', 'D:/wamp/www/uploads/upload/20170927/b4b158f10429201c48baec2c2e929950.jpg', '/uploads/upload/20170927/', '/uploads/upload/20170927/b4b158f10429201c48baec2c2e929950.jpg', 'b4b158f10429201c48baec2c2e929950', '/uploads/upload/20170927/b4b158f10429201c48baec2c2e929950', 'b4b158f10429201c48baec2c2e929950.jpg', '59a7b9fbNae447273.jpg', '.jpg', '135.64', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
INSERT INTO `uploads` VALUES ('596', '', '', '', '', '', '', '', '', '', '', '', null, '0', null, null, '', '', null);
INSERT INTO `uploads` VALUES ('597', '63e33759dc47d54ce462614a13bdf08f.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20170927/', 'D:/wamp/www/uploads/upload/20170927/63e33759dc47d54ce462614a13bdf08f.jpg', '/uploads/upload/20170927/', '/uploads/upload/20170927/63e33759dc47d54ce462614a13bdf08f.jpg', '63e33759dc47d54ce462614a13bdf08f', '/uploads/upload/20170927/63e33759dc47d54ce462614a13bdf08f', '63e33759dc47d54ce462614a13bdf08f.jpg', '59a76c6dNa83d31a5.jpg', '.jpg', '184.50', '1', '127', '127', 'jpeg', 'width=\"790\" height=\"340\"', null);
