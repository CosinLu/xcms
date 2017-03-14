/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : mcms

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-03-14 13:44:47
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='基本配置表';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '标题', 'title', '轩宇网络工作室', '1', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('2', '关键字', 'keywords', '网站制作,网页设计,网站建设,网站开发,微网站,手机网站,html5,响应式网站,做网站,个人网站建设', '1', 'textarea', '', '', 'show', '100');
INSERT INTO `config` VALUES ('3', '描述', 'description', '轩宇网络工作室，打造行业领军品牌，高端网站建设', '1', 'textarea', '', '', 'show', '100');
INSERT INTO `config` VALUES ('4', '版权', 'copyright', '© Copyright 2015 轩宇网络 All Rights Reserved', '1', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('5', '备案号', 'icp_num', '京ICP备15054430号-1', '1', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('6', '统计/商桥', 'count_code', '<script type=\"text/javascript\">\nvar cnzz_protocol = ((\"https:\" == document.location.protocol) ? \" https://\" : \" http://\");document.write(unescape(\"%3Cspan id=\'cnzz_stat_icon_1261011855\'%3E%3C/span%3E%3Cscript src=\'\" + cnzz_protocol + \"s95.cnzz.com/stat.php%3Fid%3D1261011855\' type=\'text/javascript\'%3E%3C/script%3E\"));\n</script>', '1', 'textarea', '', '', 'show', '100');
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='信息案例表';

-- ----------------------------
-- Records of info_cases
-- ----------------------------
INSERT INTO `info_cases` VALUES ('1', '3', '德州三生设计工作室', '1', '4,6,5,2,7,3,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,24,23,25,27,26,28,29,30,31,32,33,34', 'http://www.sheji100.cn/', '_blank', '<p style=\"text-indent: 2em; text-align: left;\">三生设计工作室是专注于企业品牌形象建设与提升的专业设计机构。主创人员来自各大美院，拥有一线设计公司多年工作经验！一直以来我们以先进的设计理念与国际化视野，为客户创造了更具高度、更具审美、更具商业价值的作品，并积累了丰富的商业设计经验，被众多企业认可。我们坚信好的设计可以创造无限价值！</p>', '_blank', 'show', '100', null, null, '1482306361', null);
INSERT INTO `info_cases` VALUES ('2', '3', '北京鑫洲隆源商贸有限公司', '35', '', 'http://www.dzxvip.com/', '_blank', '<p style=\"text-align: left; text-indent: 2em;\">&quot;北京鑫洲隆源商贸有限公司&quot;是一家通过实体店面和互联网相结合销售阳澄湖大闸蟹节日礼品、礼品卡的商贸公司。公司采取实体店和网络相结合的销售模式已经长达5年，借助于互联网这个平台，从事阳澄湖大闸蟹产品的订购、销售与服务的网站，拥有丰富的行业操作经验及互联网电子商务运营经验，有着极其完整的客户购买及用户体验系统。主打产品阳澄湖大闸蟹 、是阳澄湖大闸蟹行业上百品牌中的佼佼者。</p>', '_self', 'show', '100', null, null, '1482309077', null);
INSERT INTO `info_cases` VALUES ('3', '3', '亨通（北京）文化传媒有限公司', '40', '39,40,42,43,41,44,45,46,48,47,50,49,51,53,54,52,57,55,56', 'http://www.hengtongtv.com/', '_blank', '', '_self', 'show', '100', null, null, '1488260647', null);

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
  `sys_tpl_id` int(11) DEFAULT NULL COMMENT '模板类型标识',
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='信息栏目表';

-- ----------------------------
-- Records of info_col
-- ----------------------------
INSERT INTO `info_col` VALUES ('1', '案例', 'cases', '0', '1', '2', '', 'nopic', null, null, '', 'tnav', '_self', 'show', '100', null, null, null, null, '1', '1', '0');
INSERT INTO `info_col` VALUES ('2', '文章', 'news', '0', '1', '1', '', 'nopic', null, null, '', 'tnav', '_self', 'show', '100', null, null, null, null, '1', '1', '0');
INSERT INTO `info_col` VALUES ('3', '企业官网', 'website', '1', '2', '2', '', 'nopic', null, null, '', '', '_self', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('4', '平台门户', 'workportal', '1', '2', '2', '', 'nopic', null, null, '', '', '_self', 'show', '100', null, null, null, null, '1', '1', '1');
INSERT INTO `info_col` VALUES ('5', '关于我们', '', '0', '1', '3', '', 'nopic', null, null, '', '', '_self', 'show', '100', null, null, null, null, '1', '1', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='信息文章表';

-- ----------------------------
-- Records of info_news
-- ----------------------------
INSERT INTO `info_news` VALUES ('1', '2', '在2017年将会更加风行的6个Web开拓趋势', '每到岁尾，人们总爱好瞻望下一年，Web 开拓范畴也不例外。在 Web 开拓范畴，技巧革新的速率堪比光速，将来老是超乎咱们的设想，咱们只能尽本身所能做一些正当的猜测。', '<p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">每到岁尾，人们总爱好瞻望下一年，Web 开拓范畴也不例外。在 Web 开拓范畴，技巧革新的速率堪比光速，将来老是超乎咱们的设想，咱们只能尽本身所能做一些正当的猜测。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">如下是咱们必要存眷的一些趋势：</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">1、<span style=\"font-size: 16px;\">更加挪动优先</span></p><p style=\"text-align:center\"><img src=\"http://p3.pstatp.com/large/13180010d89b007df373\" img_width=\"500\" img_height=\"311\" alt=\"在2017年将会更加风行的6个Web开拓趋势\" style=\"margin: 1em auto; padding: 0px; max-width: 100%; border: 0px; display: block;\"/></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">相应式计划明显是今朝 Web 开拓范畴的重要趋势之一，而且这一趋势还将连续一段时间。固然如今的相应式计划大部分还因此 PC 版优先，但是，假如有一天咱们把 PC 版放到比挪动版次要的地位上，也没什么猎奇异的。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">许多 Web 开拓者曾经开端转向以挪动优先计划来做他们的相应式计划和开拓。这意味一个重大转变，值得咱们跟进。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">2、<span style=\"font-size: 16px;\">更多应用疾速原型开拓对象</span></p><p style=\"text-align:center\"><img src=\"http://p9.pstatp.com/large/12d1000ec6e8d87be42c\" img_width=\"640\" img_height=\"480\" alt=\"在2017年将会更加风行的6个Web开拓趋势\" style=\"margin: 1em auto; padding: 0px; max-width: 100%; border: 0px; display: block;\"/></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">咱们在 2016 年开端测验考试应用疾速原型开拓对象，而 2017 年将是这类技巧真正迸发的一年。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">“UXpin、Webflow、Invision 和别的许多疾速原型开拓对象，让计划师不消写一行代码，就能为网站和办事疾速创立低保真和高保真原型，便于计划师权衡它们的可用性和雅观性。” Web 计划师 Jamie Leeson says 如是说，“许多对象也容许你在阅读器中计划原型并从对象里真正启动网站本身。”</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">疾速原型对象的一个长处是它们能让开拓者/计划师与终极用户同时获益。两边可以或许提早对产物页面和交互杀青同等，防止了终极交付的产物和用户预期的不符。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">3、<span style=\"font-size: 16px;\">简化的 Web 计划</span></p><p style=\"text-align:center\"><img src=\"http://p2.pstatp.com/large/131a0010d4356e9e8402\" img_width=\"640\" img_height=\"440\" alt=\"在2017年将会更加风行的6个Web开拓趋势\" style=\"margin: 1em auto; padding: 0px; max-width: 100%; border: 0px; display: block;\"/></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">在 2016 年，咱们看到简化的 Web 计划获得普遍承认。现实上极简计划成为大部分行业的重要趋势。在 2017 年，预期极简计划会继承风行，纵然有变更也是一些微小的转变。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">固然页面上留白将继承被认为是有代价的，然则也不消奇异有些网站开端回归到应用基于文本内容的笔墨添补。你可以或许找到更多类似于如许的网页，它们正当地结合了留白和文本，创造出一个视觉上简略，而信息内容很丰硕的网页，也带给用户很好的体验。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">4、<span style=\"font-size: 16px;\">更加看重人工智能</span></p><p style=\"text-align:center\"><img src=\"http://p3.pstatp.com/large/131b000dad68c5245dea\" img_width=\"640\" img_height=\"398\" alt=\"在2017年将会更加风行的6个Web开拓趋势\" style=\"margin: 1em auto; padding: 0px; max-width: 100%; border: 0px; display: block;\"/></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">你曾经听说了人工智能（AI），然则你对 Web 计划和开拓中的人工智能认识吗？在 2017 年，咱们等待 Web 与 AI 的碰撞，带来更强大的网页，为网站主和用户同时带来代价。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">供给收集主机办事的 Wix，是这一范畴的领头羊。他们如今供给了一个进程来扣问用户一些成绩，而后应用一个基于 AI 的平台依据用户的答复供给给用户最相符他们必要的 Web 计划。这异常酷，值得一看。</p><p style=\"text-align:center\"><img src=\"http://p1.pstatp.com/large/13170010dd80543a1019\" img_width=\"640\" img_height=\"414\" alt=\"在2017年将会更加风行的6个Web开拓趋势\" style=\"margin: 1em auto; padding: 0px; max-width: 100%; border: 0px; display: block;\"/></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">5、<span style=\"font-size: 16px;\">更多单页站点</span></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">如今不风行那种有各类 Tab 页和许多子页面的网站了。在 2017 年，你可以或许等待看到更多的单页站点。因为用户更爱好用滚屏方法阅读网页，各公司将会惹起看重并结束浪费时间在计划和开拓用户不爱好的层层相套的子页面上。这一趋势将简化互联网并带来更迷人和身临其境的网页阅读体验，每个人都邑感觉到愉悦。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">6、<span style=\"font-size: 16px;\">虚拟现实</span></p><p style=\"text-align:center\"><img src=\"http://p3.pstatp.com/large/12cb0009b8cc3b69d3fb\" img_width=\"640\" img_height=\"428\" alt=\"在2017年将会更加风行的6个Web开拓趋势\" style=\"margin: 1em auto; padding: 0px; max-width: 100%; border: 0px; display: block;\"/></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">假如要评论辩论 2017 年技巧趋势，怎能不提到虚拟现实（VR）？2017 年将是 VR 成为主流的一年，这意味着 Web 开拓者将经由过程 VR 来吸引用户。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">咱们曾经看到一些公司好比 Mozilla 和 Google 投资开拓 VR 与 Web 之间的 API。愈来愈多的 VR 应用程序将在接下来的几个月里相继问世，以是假如看到愈来愈多的虚拟现实元素出如今 Web 上，也别感到奇异。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">7、<span style=\"font-size: 16px;\">总结</span></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">当你开端做 2017 年的名目时，将这些 Web 趋势铭刻于心。整体的现实是在接下来几个月里，许多器械都邑迎来成长和变更。多往前看一步，你可以或许确保你老是立足于潮水之巅。</p>', '_self', 'show', '100', null, null, '1482225575', null);
INSERT INTO `info_news` VALUES ('2', '2', 'HTML5、多边平台，企业不死的两个互联网机遇', '11月底，Facebook Messenger推出H5游戏平台Instant Games，首批放出17个H5游戏（包括吃豆人、太空侵入者等）。从现在起，Facebook用户可以在聊天时发起即时游戏，并', '123', '_self', 'show', '100', null, null, '1485078219', null);
INSERT INTO `info_news` VALUES ('3', '2', '', '', null, '_self', 'show', '100', null, null, '1489129272', null);

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
INSERT INTO `info_single` VALUES ('5', '关于我们摘要', '<p>关于我们的内容</p>', null, null, null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES ('1', '1', '37', 'http://www.baidu.com/', '', 'show', '100', null, null, null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='系统栏目表';

-- ----------------------------
-- Records of sys_col
-- ----------------------------
INSERT INTO `sys_col` VALUES ('1', '首页', '0', '1', '', '', '', '', '', 'pro', 'show', '1', null, null, null, null);
INSERT INTO `sys_col` VALUES ('2', '网站', '0', '1', '', '', '', '', '', 'pro', 'show', '2', null, null, null, null);
INSERT INTO `sys_col` VALUES ('3', '信息', '0', '1', '', '', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('4', '扩展', '0', '1', '', '', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('28', '后台管理', '1', '2', '', '', '', '', '', 'dev', 'show', '200', null, null, null, null);
INSERT INTO `sys_col` VALUES ('6', '权限管理', '2', '2', '', '', '', '', '', 'pro', 'show', '200', null, null, null, null);
INSERT INTO `sys_col` VALUES ('7', '我的面板', '1', '2', '', 'welcome', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('8', '数据字典', '28', '3', '', 'sys_dict', '', '', '', 'dev', 'show', '300', null, null, null, null);
INSERT INTO `sys_col` VALUES ('9', '配置组', '29', '3', '', 'config_group', '', '', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('10', '配置项', '29', '3', '', 'config_item', '', '', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('11', '网站配置', '2', '2', '', 'config', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('12', '信息栏目', '3', '2', '', 'info_col', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('13', '信息管理', '3', '2', '', 'information', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('14', '模板管理', '1', '2', '', 'sys_tpl', '', '', '', 'dev', 'show', '300', null, null, null, null);
INSERT INTO `sys_col` VALUES ('15', '幻灯片', '4', '2', '', 'slide', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('16', '后台菜单', '28', '3', '', 'sys_col', '', '', '', 'dev', 'show', '200', null, null, null, null);
INSERT INTO `sys_col` VALUES ('17', '角色管理', '6', '3', '', 'sys_role', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('18', '用户管理', '6', '3', '', 'sys_user', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('20', '栏目图片', '3', '2', '', '', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('24', '单图管理', '20', '3', '', 'info_col_onepic', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('25', '多图管理', '20', '3', '', 'info_col_muitipic', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('31', '操作日志', '1', '2', '', 'sys_log', '', '', '', 'pro', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('29', '配置管理', '1', '2', '', '', '', '', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('32', '微信', '0', '1', '', '', '', '', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('33', '自定义菜单', '32', '2', '', 'wx_menu', '', '', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('34', '自动回复', '32', '2', '', '', '', '', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('35', '被添加自动回复', '34', '3', '', 'wx_beadded', '', '', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('36', '消息自动恢复', '34', '3', '', 'wx_autoreply', '', '', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('37', '关键词自动回复', '34', '3', '', 'wx_smartreply', '', '', '', 'dev', 'show', '100', null, null, null, null);
INSERT INTO `sys_col` VALUES ('38', '文件管理', '4', '2', '', 'uploads', '', '', '', 'pro', 'show', '100', null, null, null, null);

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
INSERT INTO `sys_col_auth` VALUES ('14', 'look');
INSERT INTO `sys_col_auth` VALUES ('14', 'del');
INSERT INTO `sys_col_auth` VALUES ('14', 'update');
INSERT INTO `sys_col_auth` VALUES ('14', 'insert');
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
INSERT INTO `sys_col_auth` VALUES ('32', 'look');
INSERT INTO `sys_col_auth` VALUES ('32', 'del');
INSERT INTO `sys_col_auth` VALUES ('32', 'update');
INSERT INTO `sys_col_auth` VALUES ('32', 'insert');
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('2', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('3', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('4', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('5', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('6', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('7', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('8', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('9', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('10', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('11', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('12', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('13', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('14', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('15', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('16', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('17', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('18', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_log` VALUES ('19', null, 'sdfasdfasdf', null, null, null, null, null, null, null, null, null);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统登录日志表';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '1', '拥有所有权限', '100', null, null, null, null);
INSERT INTO `sys_role` VALUES ('2', '文章管理员', '0', '', '100', null, null, null, null);
INSERT INTO `sys_role` VALUES ('3', '演示', '0', '', '100', null, null, null, null);

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
INSERT INTO `sys_role_auth` VALUES ('2', '11', 'update');
INSERT INTO `sys_role_auth` VALUES ('2', '11', 'look');
INSERT INTO `sys_role_auth` VALUES ('2', '3', '');
INSERT INTO `sys_role_auth` VALUES ('2', '12', 'insert');
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
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'update');
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'del');
INSERT INTO `sys_role_auth` VALUES ('2', '25', 'look');
INSERT INTO `sys_role_auth` VALUES ('3', '1', '');
INSERT INTO `sys_role_auth` VALUES ('3', '7', 'look');
INSERT INTO `sys_role_auth` VALUES ('3', '31', 'del');
INSERT INTO `sys_role_auth` VALUES ('3', '31', 'look');
INSERT INTO `sys_role_auth` VALUES ('3', '2', '');
INSERT INTO `sys_role_auth` VALUES ('3', '11', 'update');
INSERT INTO `sys_role_auth` VALUES ('3', '11', 'look');
INSERT INTO `sys_role_auth` VALUES ('3', '3', '');
INSERT INTO `sys_role_auth` VALUES ('3', '12', 'insert');
INSERT INTO `sys_role_auth` VALUES ('3', '12', 'update');
INSERT INTO `sys_role_auth` VALUES ('3', '12', 'look');
INSERT INTO `sys_role_auth` VALUES ('3', '13', 'insert');
INSERT INTO `sys_role_auth` VALUES ('3', '13', 'update');
INSERT INTO `sys_role_auth` VALUES ('3', '13', 'look');

-- ----------------------------
-- Table structure for sys_tpl
-- ----------------------------
DROP TABLE IF EXISTS `sys_tpl`;
CREATE TABLE `sys_tpl` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` char(50) DEFAULT NULL COMMENT '名称',
  `list_ctrl` varchar(20) DEFAULT NULL COMMENT '列表页控制器',
  `list_method` varchar(20) DEFAULT NULL COMMENT '列表页方法',
  `show_ctrl` varchar(20) DEFAULT NULL COMMENT '详情页控制器',
  `show_method` varchar(20) DEFAULT NULL COMMENT '详情页方法',
  `sys_ctrl` varchar(20) DEFAULT NULL COMMENT '系统控制器',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `display` char(4) DEFAULT NULL COMMENT '显示：hide=隐藏，show=显示',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `create_user` int(10) DEFAULT NULL COMMENT '创建者',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='模板类型表';

-- ----------------------------
-- Records of sys_tpl
-- ----------------------------
INSERT INTO `sys_tpl` VALUES ('1', '文章', 'news', 'lists', 'news', 'show', 'info_news', '', 'show', '100', null, null, null, null);
INSERT INTO `sys_tpl` VALUES ('2', '案例', 'cases', 'lists', 'cases', 'show', 'info_cases', '', 'show', '100', null, null, null, null);
INSERT INTO `sys_tpl` VALUES ('3', '单页', '', '', '', '', 'info_single', '', 'show', '100', null, null, null, null);

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
INSERT INTO `sys_user` VALUES ('1', '1', 'xuanyunet', '5a690d842935c51f26f473e025c1b97a', null, null, null, 'normal', 'dev', '1', null, null, null, null);
INSERT INTO `sys_user` VALUES ('2', '1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'normal', 'pro', '1', null, null, null, null);
INSERT INTO `sys_user` VALUES ('3', '3', 'test', '098f6bcd4621d373cade4e832627b4f6', 'test', null, null, 'normal', 'pro', '0', null, null, null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='上传文件表';

-- ----------------------------
-- Records of uploads
-- ----------------------------
INSERT INTO `uploads` VALUES ('39', 'd1cfda930b11c178449fffa4dd282e63.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/d1cfda930b11c178449fffa4dd282e63.jpg', '/uploads/20170228/', '/uploads/20170228/d1cfda930b11c178449fffa4dd282e63.jpg', 'd1cfda930b11c178449fffa4dd282e63', 'd1cfda930b11c178449fffa4dd282e63.jpg', '亨通传媒_01.jpg', '.jpg', '34.49', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('40', '386ab7831daf14ad13dc4913475f480b.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/386ab7831daf14ad13dc4913475f480b.jpg', '/uploads/20170228/', '/uploads/20170228/386ab7831daf14ad13dc4913475f480b.jpg', '386ab7831daf14ad13dc4913475f480b', '386ab7831daf14ad13dc4913475f480b.jpg', '亨通传媒_02.jpg', '.jpg', '49.46', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('41', '8f6622b4585edad3bb205c39f99ae4f9.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/8f6622b4585edad3bb205c39f99ae4f9.jpg', '/uploads/20170228/', '/uploads/20170228/8f6622b4585edad3bb205c39f99ae4f9.jpg', '8f6622b4585edad3bb205c39f99ae4f9', '8f6622b4585edad3bb205c39f99ae4f9.jpg', '亨通传媒_05.jpg', '.jpg', '57.37', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('42', '136385aa61888e869940d080b6e667d0.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/136385aa61888e869940d080b6e667d0.jpg', '/uploads/20170228/', '/uploads/20170228/136385aa61888e869940d080b6e667d0.jpg', '136385aa61888e869940d080b6e667d0', '136385aa61888e869940d080b6e667d0.jpg', '亨通传媒_03.jpg', '.jpg', '70.29', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('43', '51c556940b8a772828e7a5372e4d7046.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/51c556940b8a772828e7a5372e4d7046.jpg', '/uploads/20170228/', '/uploads/20170228/51c556940b8a772828e7a5372e4d7046.jpg', '51c556940b8a772828e7a5372e4d7046', '51c556940b8a772828e7a5372e4d7046.jpg', '亨通传媒_04.jpg', '.jpg', '49.16', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('44', '196c3112f5b76a7b90ac914660ba17bc.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/196c3112f5b76a7b90ac914660ba17bc.jpg', '/uploads/20170228/', '/uploads/20170228/196c3112f5b76a7b90ac914660ba17bc.jpg', '196c3112f5b76a7b90ac914660ba17bc', '196c3112f5b76a7b90ac914660ba17bc.jpg', '亨通传媒_06.jpg', '.jpg', '82.95', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('45', 'd9e1922798ff2547a03b457dfcef70b8.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/d9e1922798ff2547a03b457dfcef70b8.jpg', '/uploads/20170228/', '/uploads/20170228/d9e1922798ff2547a03b457dfcef70b8.jpg', 'd9e1922798ff2547a03b457dfcef70b8', 'd9e1922798ff2547a03b457dfcef70b8.jpg', '亨通传媒_07.jpg', '.jpg', '83.96', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('46', 'ae348789f921e1ca960c8b81b8eca474.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/ae348789f921e1ca960c8b81b8eca474.jpg', '/uploads/20170228/', '/uploads/20170228/ae348789f921e1ca960c8b81b8eca474.jpg', 'ae348789f921e1ca960c8b81b8eca474', 'ae348789f921e1ca960c8b81b8eca474.jpg', '亨通传媒_08.jpg', '.jpg', '66.12', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('47', 'f636e4286eed7e68fd911983224bcb41.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/f636e4286eed7e68fd911983224bcb41.jpg', '/uploads/20170228/', '/uploads/20170228/f636e4286eed7e68fd911983224bcb41.jpg', 'f636e4286eed7e68fd911983224bcb41', 'f636e4286eed7e68fd911983224bcb41.jpg', '亨通传媒_10.jpg', '.jpg', '72.65', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('48', '7dcdc68483fbebc11ff4f4f9bbe3ee65.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/7dcdc68483fbebc11ff4f4f9bbe3ee65.jpg', '/uploads/20170228/', '/uploads/20170228/7dcdc68483fbebc11ff4f4f9bbe3ee65.jpg', '7dcdc68483fbebc11ff4f4f9bbe3ee65', '7dcdc68483fbebc11ff4f4f9bbe3ee65.jpg', '亨通传媒_09.jpg', '.jpg', '66.58', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('49', 'c0f911cd5800c413eccf6fd8246d602f.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/c0f911cd5800c413eccf6fd8246d602f.jpg', '/uploads/20170228/', '/uploads/20170228/c0f911cd5800c413eccf6fd8246d602f.jpg', 'c0f911cd5800c413eccf6fd8246d602f', 'c0f911cd5800c413eccf6fd8246d602f.jpg', '亨通传媒_12.jpg', '.jpg', '75.23', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('50', 'd6a49a069f806f5819dbf734a7d87894.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/d6a49a069f806f5819dbf734a7d87894.jpg', '/uploads/20170228/', '/uploads/20170228/d6a49a069f806f5819dbf734a7d87894.jpg', 'd6a49a069f806f5819dbf734a7d87894', 'd6a49a069f806f5819dbf734a7d87894.jpg', '亨通传媒_11.jpg', '.jpg', '86.90', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('51', '6ff695329193227993dcfa8a769bcbb2.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/6ff695329193227993dcfa8a769bcbb2.jpg', '/uploads/20170228/', '/uploads/20170228/6ff695329193227993dcfa8a769bcbb2.jpg', '6ff695329193227993dcfa8a769bcbb2', '6ff695329193227993dcfa8a769bcbb2.jpg', '亨通传媒_13.jpg', '.jpg', '43.10', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('52', 'fe472a35e930becb722cd6710db80602.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/fe472a35e930becb722cd6710db80602.jpg', '/uploads/20170228/', '/uploads/20170228/fe472a35e930becb722cd6710db80602.jpg', 'fe472a35e930becb722cd6710db80602', 'fe472a35e930becb722cd6710db80602.jpg', '亨通传媒_16.jpg', '.jpg', '49.27', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('53', '7eb6d898fe7ae517d5cf1416c9bbfb9c.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/7eb6d898fe7ae517d5cf1416c9bbfb9c.jpg', '/uploads/20170228/', '/uploads/20170228/7eb6d898fe7ae517d5cf1416c9bbfb9c.jpg', '7eb6d898fe7ae517d5cf1416c9bbfb9c', '7eb6d898fe7ae517d5cf1416c9bbfb9c.jpg', '亨通传媒_14.jpg', '.jpg', '22.64', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('54', '880d69be7fc2e58727385713fc06f2fb.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/880d69be7fc2e58727385713fc06f2fb.jpg', '/uploads/20170228/', '/uploads/20170228/880d69be7fc2e58727385713fc06f2fb.jpg', '880d69be7fc2e58727385713fc06f2fb', '880d69be7fc2e58727385713fc06f2fb.jpg', '亨通传媒_15.jpg', '.jpg', '53.57', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('55', '4d04b9715a75ec4407ec498b59a79c29.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/4d04b9715a75ec4407ec498b59a79c29.jpg', '/uploads/20170228/', '/uploads/20170228/4d04b9715a75ec4407ec498b59a79c29.jpg', '4d04b9715a75ec4407ec498b59a79c29', '4d04b9715a75ec4407ec498b59a79c29.jpg', '亨通传媒_18.jpg', '.jpg', '41.10', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');
INSERT INTO `uploads` VALUES ('56', '27869051ef809e53a241fb9c758e41d0.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/27869051ef809e53a241fb9c758e41d0.jpg', '/uploads/20170228/', '/uploads/20170228/27869051ef809e53a241fb9c758e41d0.jpg', '27869051ef809e53a241fb9c758e41d0', '27869051ef809e53a241fb9c758e41d0.jpg', '亨通传媒_19.jpg', '.jpg', '1.30', '1', '127', '9', 'jpeg', 'width=\"1060\" height=\"9\"', '');
INSERT INTO `uploads` VALUES ('57', '59ebd5c99d2a7cc9ab99aecca3eef8ca.jpg', 'image/jpeg', 'E:/wamp/www/uploads/20170228/', 'E:/wamp/www/uploads/20170228/59ebd5c99d2a7cc9ab99aecca3eef8ca.jpg', '/uploads/20170228/', '/uploads/20170228/59ebd5c99d2a7cc9ab99aecca3eef8ca.jpg', '59ebd5c99d2a7cc9ab99aecca3eef8ca', '59ebd5c99d2a7cc9ab99aecca3eef8ca.jpg', '亨通传媒_17.jpg', '.jpg', '54.89', '1', '127', '127', 'jpeg', 'width=\"1060\" height=\"250\"', '');

-- ----------------------------
-- Table structure for wx_beadded
-- ----------------------------
DROP TABLE IF EXISTS `wx_beadded`;
CREATE TABLE `wx_beadded` (
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='微信被添加自动回复表';

-- ----------------------------
-- Records of wx_beadded
-- ----------------------------

-- ----------------------------
-- Table structure for wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `wx_menu`;
CREATE TABLE `wx_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `ident` varchar(50) DEFAULT NULL COMMENT '唯一标识',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '分类所属上级标识【默认0】',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别【从0开始】',
  `sys_tpl_id` int(11) DEFAULT NULL COMMENT '模板类型标识',
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义菜单表';

-- ----------------------------
-- Records of wx_menu
-- ----------------------------
