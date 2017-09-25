/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : mcms

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-09-25 15:34:19
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
  `level` tinyint(2) DEFAULT NULL COMMENT '级别【从0开始】',
  `ident` varchar(20) DEFAULT NULL COMMENT '唯一标识',
  `color` char(7) DEFAULT NULL COMMENT '颜色',
  `user_type` varchar(10) DEFAULT NULL COMMENT '用户类型：dev=开发者，pro=生产者',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='通用字典表';

-- ----------------------------
-- Records of common_dict
-- ----------------------------
INSERT INTO `common_dict` VALUES ('1', '操作', '0', '1', 'sys_col_auth', '#333333', 'dev', '100', null, null, null, null);
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
INSERT INTO `common_dict` VALUES ('21', '图片', '0', '1', 'image', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('22', '无图', '21', '2', 'nopic', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('23', '单图', '21', '2', 'onepic', '#333333', 'dev', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('24', '多图', '21', '2', 'muitipic', '#333333', 'dev', '100', null, null, null, null);
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
INSERT INTO `common_dict` VALUES ('39', '文章分类', '0', '1', 'article_type', '#333333', 'pro', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('40', '前端', '39', '2', 'qd', '#333333', 'pro', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('41', 'Android', '39', '2', 'android', '#333333', 'pro', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('42', '后端', '39', '2', 'hd', '#333333', 'pro', '100', null, null, null, null);
INSERT INTO `common_dict` VALUES ('43', '人工智能', '39', '2', 'rgzn', '#333333', 'pro', '100', null, null, null, null);

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
INSERT INTO `config` VALUES ('1', '标题', 'title', '轩宇网络工作室', '1', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('2', '关键字', 'keywords', '', '1', 'textarea', '', '', 'show', '100');
INSERT INTO `config` VALUES ('3', '描述', 'description', '', '1', 'textarea', '', '', 'show', '100');
INSERT INTO `config` VALUES ('4', '版权', 'copyright', '@ 轩宇网络', '1', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('5', '备案号', 'icp_num', '京ICP备15054430号-1', '1', 'text', '', '', 'show', '100');
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
-- Table structure for goods_col
-- ----------------------------
DROP TABLE IF EXISTS `goods_col`;
CREATE TABLE `goods_col` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '分类所属上级标识【默认0】',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别【从0开始】',
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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of goods_col
-- ----------------------------
INSERT INTO `goods_col` VALUES ('1', '家用电器', '0', '1', '', null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `goods_col` VALUES ('2', ' 数码时尚', '0', '1', '', null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `goods_col` VALUES ('3', '手机类型', '0', '1', '', null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `goods_col` VALUES ('7', '洗衣机', '1', '2', '', null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `goods_col` VALUES ('8', '冰箱', '1', '2', '', null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `goods_col` VALUES ('9', '电脑', '1', '2', '', null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `goods_col` VALUES ('10', '相机', '2', '2', '', null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `goods_col` VALUES ('11', 'MP3', '2', '2', '', null, null, '', 'show', '100', null, null, null, null, '1', '1', '1');

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
-- Table structure for info_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `info_article_comment`;
CREATE TABLE `info_article_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `article_id` int(10) DEFAULT NULL COMMENT '文章标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='信息文章评论表';

-- ----------------------------
-- Records of info_article_comment
-- ----------------------------
INSERT INTO `info_article_comment` VALUES ('11', '1');
INSERT INTO `info_article_comment` VALUES ('12', '1');
INSERT INTO `info_article_comment` VALUES ('13', '1');

-- ----------------------------
-- Table structure for info_article_reading_quantity
-- ----------------------------
DROP TABLE IF EXISTS `info_article_reading_quantity`;
CREATE TABLE `info_article_reading_quantity` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `article_id` int(10) DEFAULT NULL COMMENT '文章标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='信息文章阅读量表';

-- ----------------------------
-- Records of info_article_reading_quantity
-- ----------------------------
INSERT INTO `info_article_reading_quantity` VALUES ('11', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('12', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('13', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('14', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('15', '3');
INSERT INTO `info_article_reading_quantity` VALUES ('16', '3');
INSERT INTO `info_article_reading_quantity` VALUES ('17', '3');
INSERT INTO `info_article_reading_quantity` VALUES ('18', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('19', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('20', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('21', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('22', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('23', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('24', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('25', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('26', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('27', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('28', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('29', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('30', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('31', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('32', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('33', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('34', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('35', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('36', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('37', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('38', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('39', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('40', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('41', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('42', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('43', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('44', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('45', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('46', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('47', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('48', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('49', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('50', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('51', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('52', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('53', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('54', '1');
INSERT INTO `info_article_reading_quantity` VALUES ('55', '1');

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
  `dir` varchar(30) DEFAULT NULL COMMENT '目录',
  `url` varchar(255) DEFAULT NULL COMMENT '链接【设置后分类将使用此url】',
  `target` varchar(10) DEFAULT NULL COMMENT '打开方式',
  `pic` varchar(10) DEFAULT NULL COMMENT '图片：nopic=无图，onepic=单图，muitipic=多图',
  `seo_title` varchar(80) DEFAULT NULL COMMENT 'SEO标题',
  `seo_desc` varchar(200) DEFAULT NULL COMMENT 'SEO描述',
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='信息栏目表';

-- ----------------------------
-- Records of info_col
-- ----------------------------
INSERT INTO `info_col` VALUES ('1', '文章', '0', '1', '1', 'article', '', '_self', 'nopic', null, null, 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('2', '模板', '0', '1', '2', 'template', '', '_self', 'nopic', null, null, 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('3', '产品', '0', '1', '2', 'product', '', '_self', 'nopic', null, null, 'show', '100', null, null, null, null, '1', '1', '1');

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
INSERT INTO `info_col_onepic` VALUES ('1', '587', '', '', null, null, null, null);

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
INSERT INTO `info_single` VALUES ('3', '', '<p>公司简介详细</p>', null, null, null, null);

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
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

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
  `pid` int(10) unsigned DEFAULT '0' COMMENT '分类所属上级标识【默认0】',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别【从0开始】',
  `col` tinyint(10) DEFAULT NULL COMMENT '栏目',
  `url` varchar(255) DEFAULT NULL COMMENT '链接【设置后分类将使用此url】',
  `target` varchar(10) DEFAULT NULL COMMENT '打开方式',
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='导航表';

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
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES ('6', '测试图片上传2', '563', '', '_self', 'show', '100', null, null, null, null);
INSERT INTO `slide` VALUES ('5', '测试图片上传', '564', '', '_self', 'show', '100', null, null, null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='系统栏目表';

-- ----------------------------
-- Records of sys_col
-- ----------------------------
INSERT INTO `sys_col` VALUES ('1', '起始页', 'fa fa-home', '0', '1', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('2', '系统管理', 'fa fa-laptop', '0', '1', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('3', '内容管理', 'fa fa-folder', '0', '1', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('4', '模块管理', 'fa fa-th-large', '0', '1', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('7', '我的面板', 'fa fa-list-alt', '1', '2', 'welcome', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('9', '配置组', 'fa fa-cogs', '1', '2', 'config_group', '', 'dev', 'show', '200', null, null, null, null);
INSERT INTO `sys_col` VALUES ('10', '配置项', 'fa fa-cog', '1', '2', 'config_item', '', 'dev', 'show', '200', null, null, null, null);
INSERT INTO `sys_col` VALUES ('11', '网站配置', 'fa fa-cog', '2', '2', 'config', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('12', '栏目管理', 'fa fa-columns', '3', '2', 'info_col', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('13', '信息管理', 'fa fa-list', '3', '2', 'info', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('14', '模板管理', 'fa fa-codepen', '2', '2', 'sys_tpl', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('15', '幻灯片', 'fa fa-slideshare', '4', '2', 'slide', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('16', '菜单管理', 'fa fa-bars', '1', '2', 'sys_col', '', 'dev', 'show', '200', null, null, null, null);
INSERT INTO `sys_col` VALUES ('17', '角色管理', 'fa fa-users', '2', '2', 'sys_role', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('18', '用户管理', 'fa fa-user', '2', '2', 'sys_user', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('20', '广告管理', 'fa fa-picture-o', '3', '2', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('24', '单图管理', null, '20', '3', 'info_col_onepic', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('25', '多图管理', null, '20', '3', 'info_col_muitipic', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('31', '日志', 'fa fa-list', '1', '2', 'sys_log', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('38', '文件管理', 'fa fa-file-text-o', '4', '2', 'uploads', '', 'pro', 'hide', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('41', '导航管理', 'fa fa-bars', '2', '2', 'navigation', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('42', '友情链接', 'fa fa-link', '4', '2', 'link', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('43', '商品管理', 'fa fa-shopping-bag', '0', '1', '', '', 'pro', 'hide', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('44', '商品分类', 'fa fa-th-large', '43', '2', 'goods_col', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('45', '商品品牌', 'fa fa-diamond', '43', '2', 'goods_brand', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('46', '商品类型', 'fa fa-th', '43', '2', 'goods_type', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('47', '用户评论', 'fa fa-comments', '43', '2', 'user_comment', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('48', '通用字典', 'fa fa-book', '2', '2', 'common_dict', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('49', '标签管理', 'fa fa-tag', '4', '2', 'tags', '', 'pro', 'show', '100', null, null, null, null);

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
INSERT INTO `sys_col_auth` VALUES ('7', 'look');
INSERT INTO `sys_col_auth` VALUES ('13', 'look');
INSERT INTO `sys_col_auth` VALUES ('13', 'del');
INSERT INTO `sys_col_auth` VALUES ('13', 'update');
INSERT INTO `sys_col_auth` VALUES ('13', 'insert');
INSERT INTO `sys_col_auth` VALUES ('25', 'look');
INSERT INTO `sys_col_auth` VALUES ('25', 'del');
INSERT INTO `sys_col_auth` VALUES ('24', 'look');
INSERT INTO `sys_col_auth` VALUES ('24', 'update');
INSERT INTO `sys_col_auth` VALUES ('9', 'look');
INSERT INTO `sys_col_auth` VALUES ('9', 'del');
INSERT INTO `sys_col_auth` VALUES ('9', 'update');
INSERT INTO `sys_col_auth` VALUES ('9', 'insert');
INSERT INTO `sys_col_auth` VALUES ('10', 'look');
INSERT INTO `sys_col_auth` VALUES ('10', 'del');
INSERT INTO `sys_col_auth` VALUES ('10', 'update');
INSERT INTO `sys_col_auth` VALUES ('10', 'insert');
INSERT INTO `sys_col_auth` VALUES ('17', 'look');
INSERT INTO `sys_col_auth` VALUES ('17', 'del');
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
INSERT INTO `sys_col_auth` VALUES ('11', 'look');
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
INSERT INTO `sys_col_auth` VALUES ('17', 'update');
INSERT INTO `sys_col_auth` VALUES ('11', 'update');
INSERT INTO `sys_col_auth` VALUES ('17', 'insert');
INSERT INTO `sys_col_auth` VALUES ('15', 'look');
INSERT INTO `sys_col_auth` VALUES ('41', 'look');
INSERT INTO `sys_col_auth` VALUES ('41', 'del');
INSERT INTO `sys_col_auth` VALUES ('41', 'update');
INSERT INTO `sys_col_auth` VALUES ('41', 'insert');
INSERT INTO `sys_col_auth` VALUES ('42', 'insert');
INSERT INTO `sys_col_auth` VALUES ('42', 'update');
INSERT INTO `sys_col_auth` VALUES ('42', 'del');
INSERT INTO `sys_col_auth` VALUES ('42', 'look');
INSERT INTO `sys_col_auth` VALUES ('44', 'look');
INSERT INTO `sys_col_auth` VALUES ('44', 'del');
INSERT INTO `sys_col_auth` VALUES ('44', 'update');
INSERT INTO `sys_col_auth` VALUES ('44', 'insert');
INSERT INTO `sys_col_auth` VALUES ('45', 'look');
INSERT INTO `sys_col_auth` VALUES ('45', 'del');
INSERT INTO `sys_col_auth` VALUES ('45', 'update');
INSERT INTO `sys_col_auth` VALUES ('45', 'insert');
INSERT INTO `sys_col_auth` VALUES ('46', 'look');
INSERT INTO `sys_col_auth` VALUES ('46', 'del');
INSERT INTO `sys_col_auth` VALUES ('46', 'update');
INSERT INTO `sys_col_auth` VALUES ('46', 'insert');
INSERT INTO `sys_col_auth` VALUES ('47', 'look');
INSERT INTO `sys_col_auth` VALUES ('47', 'del');
INSERT INTO `sys_col_auth` VALUES ('47', 'update');
INSERT INTO `sys_col_auth` VALUES ('48', 'look');
INSERT INTO `sys_col_auth` VALUES ('48', 'del');
INSERT INTO `sys_col_auth` VALUES ('48', 'update');
INSERT INTO `sys_col_auth` VALUES ('48', 'insert');
INSERT INTO `sys_col_auth` VALUES ('49', 'insert');
INSERT INTO `sys_col_auth` VALUES ('49', 'update');
INSERT INTO `sys_col_auth` VALUES ('49', 'del');
INSERT INTO `sys_col_auth` VALUES ('49', 'look');

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
) ENGINE=MyISAM AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '4', 'madmin', '模板管理', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1502807222');
INSERT INTO `sys_log` VALUES ('2', '4', 'madmin', '模板管理', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1502807229');
INSERT INTO `sys_log` VALUES ('3', '4', 'madmin', '用户管理', 'del', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1502807338');
INSERT INTO `sys_log` VALUES ('4', '4', 'madmin', '菜单管理', 'insert', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1502807555');
INSERT INTO `sys_log` VALUES ('5', '4', 'madmin', '菜单管理', 'insert', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1502807619');
INSERT INTO `sys_log` VALUES ('6', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1502807653');
INSERT INTO `sys_log` VALUES ('7', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1502807713');
INSERT INTO `sys_log` VALUES ('8', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1502807723');
INSERT INTO `sys_log` VALUES ('9', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502845237');
INSERT INTO `sys_log` VALUES ('10', '4', 'madmin', '菜单管理', 'insert', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502845270');
INSERT INTO `sys_log` VALUES ('11', '4', 'madmin', '菜单管理', 'insert', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502845282');
INSERT INTO `sys_log` VALUES ('12', '4', 'madmin', '菜单管理', 'insert', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502845319');
INSERT INTO `sys_log` VALUES ('13', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502845428');
INSERT INTO `sys_log` VALUES ('14', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502845455');
INSERT INTO `sys_log` VALUES ('15', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502845605');
INSERT INTO `sys_log` VALUES ('16', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502845677');
INSERT INTO `sys_log` VALUES ('17', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502845687');
INSERT INTO `sys_log` VALUES ('18', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502845712');
INSERT INTO `sys_log` VALUES ('19', '4', 'madmin', '商品分类', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502853746');
INSERT INTO `sys_log` VALUES ('20', '4', 'madmin', '商品分类', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502853771');
INSERT INTO `sys_log` VALUES ('21', '4', 'madmin', '商品分类', 'update', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502853787');
INSERT INTO `sys_log` VALUES ('22', '4', 'madmin', '商品分类', 'insert', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502853814');
INSERT INTO `sys_log` VALUES ('23', '4', 'madmin', '商品分类', 'insert', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502853820');
INSERT INTO `sys_log` VALUES ('24', '4', 'madmin', '商品分类', 'insert', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502853827');
INSERT INTO `sys_log` VALUES ('25', '4', 'madmin', '商品分类', 'insert', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502853913');
INSERT INTO `sys_log` VALUES ('26', '4', 'madmin', '商品分类', 'insert', 'success', 'Chrome', '60.0.3112.90', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1502853920');
INSERT INTO `sys_log` VALUES ('27', '4', 'madmin', '幻灯片', 'insert', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503374736');
INSERT INTO `sys_log` VALUES ('28', '4', 'madmin', '幻灯片', 'del', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503374740');
INSERT INTO `sys_log` VALUES ('29', '4', 'madmin', '幻灯片', 'insert', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503374748');
INSERT INTO `sys_log` VALUES ('30', '4', 'madmin', '幻灯片', 'insert', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503374752');
INSERT INTO `sys_log` VALUES ('31', '4', 'madmin', '幻灯片', 'del', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503374760');
INSERT INTO `sys_log` VALUES ('32', '4', 'madmin', '配置组', 'update', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503375051');
INSERT INTO `sys_log` VALUES ('33', '4', 'madmin', '商品分类', 'insert', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503376489');
INSERT INTO `sys_log` VALUES ('34', '4', 'madmin', '商品分类', 'insert', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503376496');
INSERT INTO `sys_log` VALUES ('35', '4', 'madmin', '商品分类', 'del', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503376539');
INSERT INTO `sys_log` VALUES ('36', '4', 'madmin', '商品分类', 'del', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503376542');
INSERT INTO `sys_log` VALUES ('37', '4', 'madmin', '商品分类', 'insert', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503376548');
INSERT INTO `sys_log` VALUES ('38', '4', 'madmin', '商品分类', 'insert', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503376552');
INSERT INTO `sys_log` VALUES ('39', '4', 'madmin', '商品分类', 'insert', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503376558');
INSERT INTO `sys_log` VALUES ('40', '4', 'madmin', '商品分类', 'del', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503376564');
INSERT INTO `sys_log` VALUES ('41', '4', 'madmin', '商品分类', 'del', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503376567');
INSERT INTO `sys_log` VALUES ('42', '4', 'madmin', '商品分类', 'del', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503376570');
INSERT INTO `sys_log` VALUES ('43', '4', 'madmin', '商品分类', 'insert', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503376574');
INSERT INTO `sys_log` VALUES ('44', '4', 'madmin', '商品分类', 'del', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503376579');
INSERT INTO `sys_log` VALUES ('45', '4', 'madmin', '网站配置', 'update', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503543863');
INSERT INTO `sys_log` VALUES ('51', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1503674399');
INSERT INTO `sys_log` VALUES ('52', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1503674450');
INSERT INTO `sys_log` VALUES ('53', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1503674471');
INSERT INTO `sys_log` VALUES ('54', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.101', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1503674501');
INSERT INTO `sys_log` VALUES ('55', '4', 'madmin', '栏目管理', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1503805690');
INSERT INTO `sys_log` VALUES ('56', '4', 'madmin', '栏目管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-FTTP3GQ', '127.0.0.1', '1503830669');
INSERT INTO `sys_log` VALUES ('57', '4', 'madmin', '网站配置', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503893077');
INSERT INTO `sys_log` VALUES ('58', '4', 'madmin', '文件管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503986766');
INSERT INTO `sys_log` VALUES ('59', '4', 'madmin', '文件管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503986867');
INSERT INTO `sys_log` VALUES ('60', '4', 'madmin', '文件管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503986873');
INSERT INTO `sys_log` VALUES ('61', '4', 'madmin', '文件管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1503998891');
INSERT INTO `sys_log` VALUES ('62', '4', 'madmin', '文件管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504168368');
INSERT INTO `sys_log` VALUES ('63', '4', 'madmin', '文件管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504168376');
INSERT INTO `sys_log` VALUES ('64', '4', 'madmin', '文件管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504168380');
INSERT INTO `sys_log` VALUES ('65', '4', 'madmin', '文件管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504168383');
INSERT INTO `sys_log` VALUES ('66', '4', 'madmin', '文件管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504168388');
INSERT INTO `sys_log` VALUES ('67', '4', 'madmin', '幻灯片', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504488318');
INSERT INTO `sys_log` VALUES ('68', '4', 'madmin', '栏目管理', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504490438');
INSERT INTO `sys_log` VALUES ('69', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504490444');
INSERT INTO `sys_log` VALUES ('70', '4', 'madmin', '栏目管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504490452');
INSERT INTO `sys_log` VALUES ('71', '4', 'madmin', '幻灯片', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504493889');
INSERT INTO `sys_log` VALUES ('72', '4', 'madmin', '幻灯片', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504604460');
INSERT INTO `sys_log` VALUES ('73', '4', 'madmin', '幻灯片', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504607788');
INSERT INTO `sys_log` VALUES ('74', '4', 'madmin', '幻灯片', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504607807');
INSERT INTO `sys_log` VALUES ('75', '4', 'madmin', '幻灯片', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504672961');
INSERT INTO `sys_log` VALUES ('76', '4', 'madmin', '幻灯片', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504673433');
INSERT INTO `sys_log` VALUES ('77', '4', 'madmin', '幻灯片', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504673452');
INSERT INTO `sys_log` VALUES ('78', '4', 'madmin', '幻灯片', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504686317');
INSERT INTO `sys_log` VALUES ('79', '4', 'madmin', '幻灯片', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504750097');
INSERT INTO `sys_log` VALUES ('80', '4', 'madmin', '幻灯片', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504750103');
INSERT INTO `sys_log` VALUES ('81', '4', 'madmin', '幻灯片', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504756750');
INSERT INTO `sys_log` VALUES ('82', '4', 'madmin', '幻灯片', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504756765');
INSERT INTO `sys_log` VALUES ('83', '4', 'madmin', '幻灯片', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504778428');
INSERT INTO `sys_log` VALUES ('84', '4', 'madmin', '幻灯片', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504779097');
INSERT INTO `sys_log` VALUES ('85', '4', 'madmin', '幻灯片', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504779618');
INSERT INTO `sys_log` VALUES ('86', '4', 'madmin', '幻灯片', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504779629');
INSERT INTO `sys_log` VALUES ('87', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504832325');
INSERT INTO `sys_log` VALUES ('88', '4', 'madmin', '公司简介', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504841330');
INSERT INTO `sys_log` VALUES ('89', '4', 'madmin', '公司简介', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504849249');
INSERT INTO `sys_log` VALUES ('90', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504867807');
INSERT INTO `sys_log` VALUES ('91', '4', 'madmin', '菜单管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1504867823');
INSERT INTO `sys_log` VALUES ('92', '2', 'admin', '通用字典', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505119619');
INSERT INTO `sys_log` VALUES ('93', '4', 'madmin', '通用字典', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505119766');
INSERT INTO `sys_log` VALUES ('94', '4', 'madmin', '菜单管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505120848');
INSERT INTO `sys_log` VALUES ('95', '4', 'madmin', '角色管理', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505185059');
INSERT INTO `sys_log` VALUES ('96', '4', 'madmin', '角色管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505185067');
INSERT INTO `sys_log` VALUES ('97', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505283301');
INSERT INTO `sys_log` VALUES ('98', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505283311');
INSERT INTO `sys_log` VALUES ('99', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505283321');
INSERT INTO `sys_log` VALUES ('100', '4', 'madmin', '栏目管理', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505284169');
INSERT INTO `sys_log` VALUES ('101', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505284198');
INSERT INTO `sys_log` VALUES ('102', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505284221');
INSERT INTO `sys_log` VALUES ('103', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505284310');
INSERT INTO `sys_log` VALUES ('104', '4', 'madmin', '导航管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505285441');
INSERT INTO `sys_log` VALUES ('105', '4', 'madmin', '导航管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505285487');
INSERT INTO `sys_log` VALUES ('106', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505286462');
INSERT INTO `sys_log` VALUES ('107', '4', 'madmin', '导航管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505286481');
INSERT INTO `sys_log` VALUES ('108', '4', 'madmin', '菜单管理', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505288355');
INSERT INTO `sys_log` VALUES ('109', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505289031');
INSERT INTO `sys_log` VALUES ('110', '4', 'madmin', '通用字典', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505290192');
INSERT INTO `sys_log` VALUES ('111', '4', 'madmin', '通用字典', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505290232');
INSERT INTO `sys_log` VALUES ('112', '4', 'madmin', '通用字典', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505290247');
INSERT INTO `sys_log` VALUES ('113', '4', 'madmin', '通用字典', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505290264');
INSERT INTO `sys_log` VALUES ('114', '4', 'madmin', '通用字典', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505290349');
INSERT INTO `sys_log` VALUES ('115', '4', 'madmin', '通用字典', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505290360');
INSERT INTO `sys_log` VALUES ('116', '4', 'madmin', '通用字典', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505290372');
INSERT INTO `sys_log` VALUES ('117', '4', 'madmin', '通用字典', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505290390');
INSERT INTO `sys_log` VALUES ('118', '4', 'madmin', '通用字典', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505290408');
INSERT INTO `sys_log` VALUES ('119', '4', 'madmin', '导航管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505290677');
INSERT INTO `sys_log` VALUES ('120', '4', 'madmin', '导航管理', 'del', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505290681');
INSERT INTO `sys_log` VALUES ('121', '4', 'madmin', '模板管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505291970');
INSERT INTO `sys_log` VALUES ('122', '4', 'madmin', '模板管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505291981');
INSERT INTO `sys_log` VALUES ('123', '4', 'madmin', '栏目管理', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505292112');
INSERT INTO `sys_log` VALUES ('124', '4', 'madmin', '栏目管理', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505292383');
INSERT INTO `sys_log` VALUES ('125', '4', 'madmin', '栏目管理', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505292401');
INSERT INTO `sys_log` VALUES ('126', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505292412');
INSERT INTO `sys_log` VALUES ('127', '4', 'madmin', '导航管理', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505292440');
INSERT INTO `sys_log` VALUES ('128', '4', 'madmin', '导航管理', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505292452');
INSERT INTO `sys_log` VALUES ('129', '4', 'madmin', '导航管理', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505292460');
INSERT INTO `sys_log` VALUES ('130', '4', 'madmin', '文章', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505297929');
INSERT INTO `sys_log` VALUES ('131', '4', 'madmin', '文章', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505298066');
INSERT INTO `sys_log` VALUES ('132', '4', 'madmin', '网站配置', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505298112');
INSERT INTO `sys_log` VALUES ('133', '4', 'madmin', '网站配置', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505355980');
INSERT INTO `sys_log` VALUES ('134', '4', 'madmin', '网站配置', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505356121');
INSERT INTO `sys_log` VALUES ('135', '4', 'madmin', '文章', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505366344');
INSERT INTO `sys_log` VALUES ('136', '4', 'madmin', '文章', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505366509');
INSERT INTO `sys_log` VALUES ('137', '4', 'madmin', '文章', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505366876');
INSERT INTO `sys_log` VALUES ('138', '4', 'madmin', '文章', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505367013');
INSERT INTO `sys_log` VALUES ('139', '4', 'madmin', '文章', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505367018');
INSERT INTO `sys_log` VALUES ('140', '4', 'madmin', '文章', 'update', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505367025');
INSERT INTO `sys_log` VALUES ('141', '4', 'madmin', '文章', 'insert', 'success', 'Chrome', '60.0.3112.113', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505368397');
INSERT INTO `sys_log` VALUES ('142', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505449734');
INSERT INTO `sys_log` VALUES ('143', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505449741');
INSERT INTO `sys_log` VALUES ('144', '4', 'madmin', '模板管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505788094');
INSERT INTO `sys_log` VALUES ('145', '4', 'madmin', '模板管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505788101');
INSERT INTO `sys_log` VALUES ('146', '4', 'madmin', '模板管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505788294');
INSERT INTO `sys_log` VALUES ('147', '4', 'madmin', '模板管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505788304');
INSERT INTO `sys_log` VALUES ('148', '4', 'madmin', '模板管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505788312');
INSERT INTO `sys_log` VALUES ('149', '4', 'madmin', '模板管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505788339');
INSERT INTO `sys_log` VALUES ('150', '4', 'madmin', '模板管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505788346');
INSERT INTO `sys_log` VALUES ('151', '4', 'madmin', '模板管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505788354');
INSERT INTO `sys_log` VALUES ('152', '4', 'madmin', '文章', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505880697');
INSERT INTO `sys_log` VALUES ('153', '4', 'madmin', '文章', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505882688');
INSERT INTO `sys_log` VALUES ('154', '4', 'madmin', '文章', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505891254');
INSERT INTO `sys_log` VALUES ('155', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505978237');
INSERT INTO `sys_log` VALUES ('156', '4', 'madmin', '导航管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505978257');
INSERT INTO `sys_log` VALUES ('157', '4', 'madmin', '导航管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1505978272');
INSERT INTO `sys_log` VALUES ('158', '4', 'madmin', '友情链接', 'insert', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506043050');
INSERT INTO `sys_log` VALUES ('159', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506043134');
INSERT INTO `sys_log` VALUES ('160', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506043177');
INSERT INTO `sys_log` VALUES ('161', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506043685');
INSERT INTO `sys_log` VALUES ('162', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506043732');
INSERT INTO `sys_log` VALUES ('163', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506043906');
INSERT INTO `sys_log` VALUES ('164', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506043962');
INSERT INTO `sys_log` VALUES ('165', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506043980');
INSERT INTO `sys_log` VALUES ('166', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506044015');
INSERT INTO `sys_log` VALUES ('167', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506044054');
INSERT INTO `sys_log` VALUES ('168', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506044116');
INSERT INTO `sys_log` VALUES ('169', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506044126');
INSERT INTO `sys_log` VALUES ('170', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506044133');
INSERT INTO `sys_log` VALUES ('171', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506044142');
INSERT INTO `sys_log` VALUES ('172', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506044161');
INSERT INTO `sys_log` VALUES ('173', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506044185');
INSERT INTO `sys_log` VALUES ('174', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506044223');
INSERT INTO `sys_log` VALUES ('175', '4', 'madmin', '文章', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506048052');
INSERT INTO `sys_log` VALUES ('176', '4', 'madmin', '文章', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506048245');
INSERT INTO `sys_log` VALUES ('177', '4', 'madmin', '文章', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506048378');
INSERT INTO `sys_log` VALUES ('178', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506056903');
INSERT INTO `sys_log` VALUES ('179', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506056968');
INSERT INTO `sys_log` VALUES ('180', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506057151');
INSERT INTO `sys_log` VALUES ('181', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506057217');
INSERT INTO `sys_log` VALUES ('182', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506057228');
INSERT INTO `sys_log` VALUES ('183', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506057421');
INSERT INTO `sys_log` VALUES ('184', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506057449');
INSERT INTO `sys_log` VALUES ('185', '4', 'madmin', '幻灯片', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506057465');
INSERT INTO `sys_log` VALUES ('186', '4', 'madmin', '友情链接', 'insert', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506057615');
INSERT INTO `sys_log` VALUES ('187', '4', 'madmin', '友情链接', 'del', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506057621');
INSERT INTO `sys_log` VALUES ('188', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506058072');
INSERT INTO `sys_log` VALUES ('189', '4', 'madmin', '单图管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506058083');
INSERT INTO `sys_log` VALUES ('190', '4', 'madmin', '栏目管理', 'update', 'success', 'Chrome', '61.0.3163.79', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506058495');
INSERT INTO `sys_log` VALUES ('191', '4', 'madmin', '文章', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506312038');
INSERT INTO `sys_log` VALUES ('192', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506312059');
INSERT INTO `sys_log` VALUES ('193', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506312071');
INSERT INTO `sys_log` VALUES ('194', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506312197');
INSERT INTO `sys_log` VALUES ('195', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506312212');
INSERT INTO `sys_log` VALUES ('196', '4', 'madmin', '文章', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506313282');
INSERT INTO `sys_log` VALUES ('197', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506317174');
INSERT INTO `sys_log` VALUES ('198', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506319090');
INSERT INTO `sys_log` VALUES ('199', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506319106');
INSERT INTO `sys_log` VALUES ('200', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506319110');
INSERT INTO `sys_log` VALUES ('201', '4', 'madmin', '标签管理', 'del', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506319125');
INSERT INTO `sys_log` VALUES ('202', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506319254');
INSERT INTO `sys_log` VALUES ('203', '4', 'madmin', '标签管理', 'del', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506321647');
INSERT INTO `sys_log` VALUES ('204', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506321654');
INSERT INTO `sys_log` VALUES ('205', '4', 'madmin', '标签管理', 'del', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506321686');
INSERT INTO `sys_log` VALUES ('206', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506321744');
INSERT INTO `sys_log` VALUES ('207', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506321751');
INSERT INTO `sys_log` VALUES ('208', '4', 'madmin', '标签管理', 'del', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506321760');
INSERT INTO `sys_log` VALUES ('209', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506322407');
INSERT INTO `sys_log` VALUES ('210', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506322468');
INSERT INTO `sys_log` VALUES ('211', '4', 'madmin', '标签管理', 'del', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506322476');
INSERT INTO `sys_log` VALUES ('212', '4', 'madmin', '标签管理', 'del', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506322482');
INSERT INTO `sys_log` VALUES ('213', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506322567');
INSERT INTO `sys_log` VALUES ('214', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506322598');
INSERT INTO `sys_log` VALUES ('215', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506322656');
INSERT INTO `sys_log` VALUES ('216', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506322709');
INSERT INTO `sys_log` VALUES ('217', '4', 'madmin', '标签管理', 'del', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506322724');
INSERT INTO `sys_log` VALUES ('218', '4', 'madmin', '标签管理', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506322824');
INSERT INTO `sys_log` VALUES ('219', '4', 'madmin', '标签管理', 'del', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506322850');
INSERT INTO `sys_log` VALUES ('220', '4', 'madmin', '友情链接', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506323281');
INSERT INTO `sys_log` VALUES ('221', '4', 'madmin', '友情链接', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506323286');
INSERT INTO `sys_log` VALUES ('222', '4', 'madmin', '友情链接', 'insert', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506323302');
INSERT INTO `sys_log` VALUES ('223', '4', 'madmin', '友情链接', 'update', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506323318');
INSERT INTO `sys_log` VALUES ('224', '4', 'madmin', '友情链接', 'del', 'success', 'Chrome', '61.0.3163.100', 'Windows 10', 'DESKTOP-PRO736K', '127.0.0.1', '1506324829');

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
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='系统登录日志表';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('1', '4', '127.0.0.1', '1502786515');
INSERT INTO `sys_login_log` VALUES ('2', '4', '127.0.0.1', '1502806890');
INSERT INTO `sys_login_log` VALUES ('3', '4', '127.0.0.1', '1502866672');
INSERT INTO `sys_login_log` VALUES ('4', '4', '127.0.0.1', '1502961494');
INSERT INTO `sys_login_log` VALUES ('5', '4', '127.0.0.1', '1503374721');
INSERT INTO `sys_login_log` VALUES ('6', '4', '127.0.0.1', '1503396031');
INSERT INTO `sys_login_log` VALUES ('7', '4', '127.0.0.1', '1503450746');
INSERT INTO `sys_login_log` VALUES ('8', '4', '127.0.0.1', '1503536529');
INSERT INTO `sys_login_log` VALUES ('9', '4', '127.0.0.1', '1503543850');
INSERT INTO `sys_login_log` VALUES ('10', null, '127.0.0.1', '1503558838');
INSERT INTO `sys_login_log` VALUES ('11', null, '127.0.0.1', '1503558852');
INSERT INTO `sys_login_log` VALUES ('12', null, '127.0.0.1', '1503558863');
INSERT INTO `sys_login_log` VALUES ('13', null, '127.0.0.1', '1503558870');
INSERT INTO `sys_login_log` VALUES ('14', null, '127.0.0.1', '1503558886');
INSERT INTO `sys_login_log` VALUES ('15', null, '127.0.0.1', '1503558893');
INSERT INTO `sys_login_log` VALUES ('16', null, '127.0.0.1', '1503623041');
INSERT INTO `sys_login_log` VALUES ('17', null, '127.0.0.1', '1503652794');
INSERT INTO `sys_login_log` VALUES ('18', null, '127.0.0.1', '1503652968');
INSERT INTO `sys_login_log` VALUES ('19', null, '127.0.0.1', '1503654434');
INSERT INTO `sys_login_log` VALUES ('20', null, '127.0.0.1', '1503654449');
INSERT INTO `sys_login_log` VALUES ('21', null, '127.0.0.1', '1503654923');
INSERT INTO `sys_login_log` VALUES ('22', null, '127.0.0.1', '1503655059');
INSERT INTO `sys_login_log` VALUES ('23', null, '127.0.0.1', '1503655086');
INSERT INTO `sys_login_log` VALUES ('24', null, '127.0.0.1', '1503655294');
INSERT INTO `sys_login_log` VALUES ('25', null, '127.0.0.1', '1503655388');
INSERT INTO `sys_login_log` VALUES ('26', null, '127.0.0.1', '1503655409');
INSERT INTO `sys_login_log` VALUES ('27', null, '127.0.0.1', '1503655422');
INSERT INTO `sys_login_log` VALUES ('28', '2', '127.0.0.1', '1503655567');
INSERT INTO `sys_login_log` VALUES ('29', '4', '127.0.0.1', '1503655703');
INSERT INTO `sys_login_log` VALUES ('30', '2', '127.0.0.1', '1503655711');
INSERT INTO `sys_login_log` VALUES ('31', '4', '127.0.0.1', '1503656913');
INSERT INTO `sys_login_log` VALUES ('32', '4', '127.0.0.1', '1503664641');
INSERT INTO `sys_login_log` VALUES ('33', '4', '127.0.0.1', '1503711589');
INSERT INTO `sys_login_log` VALUES ('34', '4', '127.0.0.1', '1503745169');
INSERT INTO `sys_login_log` VALUES ('35', '2', '127.0.0.1', '1503745189');
INSERT INTO `sys_login_log` VALUES ('36', '4', '127.0.0.1', '1503745215');
INSERT INTO `sys_login_log` VALUES ('37', '4', '127.0.0.1', '1503796490');
INSERT INTO `sys_login_log` VALUES ('38', '4', '127.0.0.1', '1503797212');
INSERT INTO `sys_login_log` VALUES ('39', '4', '127.0.0.1', '1503797322');
INSERT INTO `sys_login_log` VALUES ('40', '4', '127.0.0.1', '1503797361');
INSERT INTO `sys_login_log` VALUES ('41', '4', '127.0.0.1', '1503797380');
INSERT INTO `sys_login_log` VALUES ('42', '4', '127.0.0.1', '1503815540');
INSERT INTO `sys_login_log` VALUES ('43', '4', '127.0.0.1', '1503830627');
INSERT INTO `sys_login_log` VALUES ('44', '4', '127.0.0.1', '1503836720');
INSERT INTO `sys_login_log` VALUES ('45', '4', '127.0.0.1', '1503882283');
INSERT INTO `sys_login_log` VALUES ('46', '4', '127.0.0.1', '1503882523');
INSERT INTO `sys_login_log` VALUES ('47', '4', '127.0.0.1', '1503893815');
INSERT INTO `sys_login_log` VALUES ('48', '4', '127.0.0.1', '1503893853');
INSERT INTO `sys_login_log` VALUES ('49', '4', '127.0.0.1', '1503904155');
INSERT INTO `sys_login_log` VALUES ('50', '4', '127.0.0.1', '1503907213');
INSERT INTO `sys_login_log` VALUES ('51', '4', '127.0.0.1', '1503907278');
INSERT INTO `sys_login_log` VALUES ('52', '4', '127.0.0.1', '1503968124');
INSERT INTO `sys_login_log` VALUES ('53', '4', '127.0.0.1', '1503986737');
INSERT INTO `sys_login_log` VALUES ('54', '4', '127.0.0.1', '1504054702');
INSERT INTO `sys_login_log` VALUES ('55', '4', '127.0.0.1', '1504073541');
INSERT INTO `sys_login_log` VALUES ('56', '4', '127.0.0.1', '1504088387');
INSERT INTO `sys_login_log` VALUES ('57', '4', '127.0.0.1', '1504142964');
INSERT INTO `sys_login_log` VALUES ('58', '4', '127.0.0.1', '1504231715');
INSERT INTO `sys_login_log` VALUES ('59', '4', '127.0.0.1', '1504487610');
INSERT INTO `sys_login_log` VALUES ('60', '4', '127.0.0.1', '1504493723');
INSERT INTO `sys_login_log` VALUES ('61', '4', '127.0.0.1', '1504493747');
INSERT INTO `sys_login_log` VALUES ('62', '4', '127.0.0.1', '1504572700');
INSERT INTO `sys_login_log` VALUES ('63', '4', '127.0.0.1', '1504582535');
INSERT INTO `sys_login_log` VALUES ('64', '4', '127.0.0.1', '1504660334');
INSERT INTO `sys_login_log` VALUES ('65', '4', '127.0.0.1', '1504663116');
INSERT INTO `sys_login_log` VALUES ('66', '4', '127.0.0.1', '1504663124');
INSERT INTO `sys_login_log` VALUES ('67', '4', '127.0.0.1', '1504686297');
INSERT INTO `sys_login_log` VALUES ('68', '4', '127.0.0.1', '1504746144');
INSERT INTO `sys_login_log` VALUES ('69', '4', '127.0.0.1', '1504747745');
INSERT INTO `sys_login_log` VALUES ('70', '4', '127.0.0.1', '1504764103');
INSERT INTO `sys_login_log` VALUES ('71', '4', '127.0.0.1', '1504832300');
INSERT INTO `sys_login_log` VALUES ('72', '4', '127.0.0.1', '1505092143');
INSERT INTO `sys_login_log` VALUES ('73', '4', '127.0.0.1', '1505110659');
INSERT INTO `sys_login_log` VALUES ('74', '4', '127.0.0.1', '1505117760');
INSERT INTO `sys_login_log` VALUES ('75', '2', '127.0.0.1', '1505119438');
INSERT INTO `sys_login_log` VALUES ('76', '4', '127.0.0.1', '1505119582');
INSERT INTO `sys_login_log` VALUES ('77', '2', '127.0.0.1', '1505119606');
INSERT INTO `sys_login_log` VALUES ('78', '4', '127.0.0.1', '1505119758');
INSERT INTO `sys_login_log` VALUES ('79', '2', '127.0.0.1', '1505120572');
INSERT INTO `sys_login_log` VALUES ('80', '4', '127.0.0.1', '1505120585');
INSERT INTO `sys_login_log` VALUES ('81', '4', '127.0.0.1', '1505121377');
INSERT INTO `sys_login_log` VALUES ('82', '4', '127.0.0.1', '1505126833');
INSERT INTO `sys_login_log` VALUES ('83', '4', '127.0.0.1', '1505178854');
INSERT INTO `sys_login_log` VALUES ('84', '2', '127.0.0.1', '1505187863');
INSERT INTO `sys_login_log` VALUES ('85', '4', '127.0.0.1', '1505187969');
INSERT INTO `sys_login_log` VALUES ('86', '4', '127.0.0.1', '1505195398');
INSERT INTO `sys_login_log` VALUES ('87', '4', '127.0.0.1', '1505267341');
INSERT INTO `sys_login_log` VALUES ('88', '4', '127.0.0.1', '1505268389');
INSERT INTO `sys_login_log` VALUES ('89', '4', '127.0.0.1', '1505355953');
INSERT INTO `sys_login_log` VALUES ('90', '4', '127.0.0.1', '1505379557');
INSERT INTO `sys_login_log` VALUES ('91', '4', '127.0.0.1', '1505439661');
INSERT INTO `sys_login_log` VALUES ('92', '4', '127.0.0.1', '1505439677');
INSERT INTO `sys_login_log` VALUES ('93', '4', '127.0.0.1', '1505449502');
INSERT INTO `sys_login_log` VALUES ('94', '4', '127.0.0.1', '1505459818');
INSERT INTO `sys_login_log` VALUES ('95', '4', '127.0.0.1', '1505788076');
INSERT INTO `sys_login_log` VALUES ('96', '4', '127.0.0.1', '1505874694');
INSERT INTO `sys_login_log` VALUES ('97', '4', '127.0.0.1', '1505876118');
INSERT INTO `sys_login_log` VALUES ('98', '4', '127.0.0.1', '1505899452');
INSERT INTO `sys_login_log` VALUES ('99', '4', '127.0.0.1', '1505978212');
INSERT INTO `sys_login_log` VALUES ('100', '4', '127.0.0.1', '1506043002');
INSERT INTO `sys_login_log` VALUES ('101', '4', '127.0.0.1', '1506056874');
INSERT INTO `sys_login_log` VALUES ('102', '4', '127.0.0.1', '1506311108');

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
  `status` char(6) DEFAULT NULL COMMENT '状态：normal=正常，forzen=冻结',
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
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='标签表';

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', '架构', 'show', '100', null, null, null, null);
INSERT INTO `tags` VALUES ('2', '开源', 'show', '100', null, null, null, null);
INSERT INTO `tags` VALUES ('3', '算法', 'show', '100', null, null, null, null);
INSERT INTO `tags` VALUES ('4', '全栈', 'show', '100', null, null, null, null);
INSERT INTO `tags` VALUES ('5', 'vue.js', 'show', '100', null, null, null, null);
INSERT INTO `tags` VALUES ('6', '产品经理', 'show', '100', null, null, null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=592 DEFAULT CHARSET=utf8 COMMENT='上传文件表';

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

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '孟祥涵', 'e10adc3949ba59abbe56e057f20f883e', '18810622636', '');
INSERT INTO `user` VALUES ('2', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '');
