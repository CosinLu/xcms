/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : mcms-branch

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-05-23 14:46:39
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
INSERT INTO `config` VALUES ('1', '标题', 'title', '轩宇网络工作室', '1', 'text', '', '', 'show', '100', null);
INSERT INTO `config` VALUES ('2', '关键字', 'keywords', '网站制作,网页设计,网站建设,网站开发,微网站,手机网站,html5,响应式网站,做网站,个人网站建设', '1', 'textarea', '', '', 'show', '100', null);
INSERT INTO `config` VALUES ('3', '描述', 'description', '轩宇网络工作室，打造行业领军品牌，高端网站建设', '1', 'textarea', '', '', 'show', '100', null);
INSERT INTO `config` VALUES ('4', '版权', 'copyright', '© Copyright 2015 轩宇网络 All Rights Reserved', '1', 'text', '', '', 'show', '100', null);
INSERT INTO `config` VALUES ('5', '备案号', 'icp_num', '京ICP备15054430号-1', '1', 'text', '', '', 'show', '100', null);
INSERT INTO `config` VALUES ('6', '统计/商桥', 'count_code', '<script type=\"text/javascript\">\nvar cnzz_protocol = ((\"https:\" == document.location.protocol) ? \" https://\" : \" http://\");document.write(unescape(\"%3Cspan id=\'cnzz_stat_icon_1261011855\'%3E%3C/span%3E%3Cscript src=\'\" + cnzz_protocol + \"s95.cnzz.com/stat.php%3Fid%3D1261011855\' type=\'text/javascript\'%3E%3C/script%3E\"));\n</script>', '1', 'textarea', '', '', 'show', '100', null);
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='配置组';

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='信息案例表';

-- ----------------------------
-- Records of info_cases
-- ----------------------------
INSERT INTO `info_cases` VALUES ('1', '3', '德州三生设计工作室', '1', '4,6,5,2,7,3,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,24,23,25,27,26,28,29,30,31,32,33,34', 'http://www.sheji100.cn/', '_blank', '<p style=\"text-indent: 2em; text-align: left;\">三生设计工作室是专注于企业品牌形象建设与提升的专业设计机构。主创人员来自各大美院，拥有一线设计公司多年工作经验！一直以来我们以先进的设计理念与国际化视野，为客户创造了更具高度、更具审美、更具商业价值的作品，并积累了丰富的商业设计经验，被众多企业认可。我们坚信好的设计可以创造无限价值！</p>', '_blank', 'show', '100', null, null, '1482306361', null, 'zh-cn');
INSERT INTO `info_cases` VALUES ('2', '3', '北京鑫洲隆源商贸有限公司', '35', '', 'http://www.dzxvip.com/', '_blank', '<p style=\"text-align: left; text-indent: 2em;\">&quot;北京鑫洲隆源商贸有限公司&quot;是一家通过实体店面和互联网相结合销售阳澄湖大闸蟹节日礼品、礼品卡的商贸公司。公司采取实体店和网络相结合的销售模式已经长达5年，借助于互联网这个平台，从事阳澄湖大闸蟹产品的订购、销售与服务的网站，拥有丰富的行业操作经验及互联网电子商务运营经验，有着极其完整的客户购买及用户体验系统。主打产品阳澄湖大闸蟹 、是阳澄湖大闸蟹行业上百品牌中的佼佼者。</p>', '_self', 'show', '100', null, null, '1482309077', null, 'zh-cn');
INSERT INTO `info_cases` VALUES ('3', '3', '亨通（北京）文化传媒有限公司', '40', '42,43,41,44', 'http://www.hengtongtv.com/', '_blank', '', '_self', 'show', '100', null, null, '1490169144', null, 'zh-cn');
INSERT INTO `info_cases` VALUES ('4', '4', '123', '0', '', '', '_self', '', '_self', 'show', '100', null, null, '1495381655', null, 'zh-cn');

-- ----------------------------
-- Table structure for info_col
-- ----------------------------
DROP TABLE IF EXISTS `info_col`;
CREATE TABLE `info_col` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `dir` varchar(50) DEFAULT NULL COMMENT '目录',
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
INSERT INTO `info_col` VALUES ('1', '案例', '', '0', '1', '0', '', 'nopic', null, null, '', '_self', 'show', '100', null, null, null, null, '1', '1', '0', null);
INSERT INTO `info_col` VALUES ('2', '文章', 'news', '0', '1', '1', '', 'nopic', null, null, '', '_self', 'show', '100', null, null, null, null, '1', '1', '0', null);
INSERT INTO `info_col` VALUES ('3', '企业官网', 'website', '1', '2', '2', '', 'onepic', null, null, '', '_self', 'show', '100', null, null, null, null, '1', '1', '1', null);
INSERT INTO `info_col` VALUES ('4', '平台门户', 'workportal', '1', '2', '2', '', 'muitipic', null, null, '', '_self', 'show', '100', null, null, null, null, '1', '1', '1', null);
INSERT INTO `info_col` VALUES ('5', '关于我们', '', '0', '1', '3', '', 'nopic', null, null, '', '_self', 'show', '100', null, null, null, null, '1', '1', '1', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='信息文章表';

-- ----------------------------
-- Records of info_news
-- ----------------------------
INSERT INTO `info_news` VALUES ('1', '2', '在2017年将会更加风行的6个Web开拓趋势', '每到岁尾，人们总爱好瞻望下一年，Web 开拓范畴也不例外。在 Web 开拓范畴，技巧革新的速率堪比光速，将来老是超乎咱们的设想，咱们只能尽本身所能做一些正当的猜测。', '<p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">每到岁尾，人们总爱好瞻望下一年，Web 开拓范畴也不例外。在 Web 开拓范畴，技巧革新的速率堪比光速，将来老是超乎咱们的设想，咱们只能尽本身所能做一些正当的猜测。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">如下是咱们必要存眷的一些趋势：</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">1、<span style=\"font-size: 16px;\">更加挪动优先</span></p><p style=\"text-align:center\"><img src=\"http://p3.pstatp.com/large/13180010d89b007df373\" img_width=\"500\" img_height=\"311\" alt=\"在2017年将会更加风行的6个Web开拓趋势\" style=\"margin: 1em auto; padding: 0px; max-width: 100%; border: 0px; display: block;\"/></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">相应式计划明显是今朝 Web 开拓范畴的重要趋势之一，而且这一趋势还将连续一段时间。固然如今的相应式计划大部分还因此 PC 版优先，但是，假如有一天咱们把 PC 版放到比挪动版次要的地位上，也没什么猎奇异的。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">许多 Web 开拓者曾经开端转向以挪动优先计划来做他们的相应式计划和开拓。这意味一个重大转变，值得咱们跟进。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">2、<span style=\"font-size: 16px;\">更多应用疾速原型开拓对象</span></p><p style=\"text-align:center\"><img src=\"http://p9.pstatp.com/large/12d1000ec6e8d87be42c\" img_width=\"640\" img_height=\"480\" alt=\"在2017年将会更加风行的6个Web开拓趋势\" style=\"margin: 1em auto; padding: 0px; max-width: 100%; border: 0px; display: block;\"/></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">咱们在 2016 年开端测验考试应用疾速原型开拓对象，而 2017 年将是这类技巧真正迸发的一年。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">“UXpin、Webflow、Invision 和别的许多疾速原型开拓对象，让计划师不消写一行代码，就能为网站和办事疾速创立低保真和高保真原型，便于计划师权衡它们的可用性和雅观性。” Web 计划师 Jamie Leeson says 如是说，“许多对象也容许你在阅读器中计划原型并从对象里真正启动网站本身。”</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">疾速原型对象的一个长处是它们能让开拓者/计划师与终极用户同时获益。两边可以或许提早对产物页面和交互杀青同等，防止了终极交付的产物和用户预期的不符。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">3、<span style=\"font-size: 16px;\">简化的 Web 计划</span></p><p style=\"text-align:center\"><img src=\"http://p2.pstatp.com/large/131a0010d4356e9e8402\" img_width=\"640\" img_height=\"440\" alt=\"在2017年将会更加风行的6个Web开拓趋势\" style=\"margin: 1em auto; padding: 0px; max-width: 100%; border: 0px; display: block;\"/></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">在 2016 年，咱们看到简化的 Web 计划获得普遍承认。现实上极简计划成为大部分行业的重要趋势。在 2017 年，预期极简计划会继承风行，纵然有变更也是一些微小的转变。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">固然页面上留白将继承被认为是有代价的，然则也不消奇异有些网站开端回归到应用基于文本内容的笔墨添补。你可以或许找到更多类似于如许的网页，它们正当地结合了留白和文本，创造出一个视觉上简略，而信息内容很丰硕的网页，也带给用户很好的体验。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">4、<span style=\"font-size: 16px;\">更加看重人工智能</span></p><p style=\"text-align:center\"><img src=\"http://p3.pstatp.com/large/131b000dad68c5245dea\" img_width=\"640\" img_height=\"398\" alt=\"在2017年将会更加风行的6个Web开拓趋势\" style=\"margin: 1em auto; padding: 0px; max-width: 100%; border: 0px; display: block;\"/></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">你曾经听说了人工智能（AI），然则你对 Web 计划和开拓中的人工智能认识吗？在 2017 年，咱们等待 Web 与 AI 的碰撞，带来更强大的网页，为网站主和用户同时带来代价。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">供给收集主机办事的 Wix，是这一范畴的领头羊。他们如今供给了一个进程来扣问用户一些成绩，而后应用一个基于 AI 的平台依据用户的答复供给给用户最相符他们必要的 Web 计划。这异常酷，值得一看。</p><p style=\"text-align:center\"><img src=\"http://p1.pstatp.com/large/13170010dd80543a1019\" img_width=\"640\" img_height=\"414\" alt=\"在2017年将会更加风行的6个Web开拓趋势\" style=\"margin: 1em auto; padding: 0px; max-width: 100%; border: 0px; display: block;\"/></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">5、<span style=\"font-size: 16px;\">更多单页站点</span></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">如今不风行那种有各类 Tab 页和许多子页面的网站了。在 2017 年，你可以或许等待看到更多的单页站点。因为用户更爱好用滚屏方法阅读网页，各公司将会惹起看重并结束浪费时间在计划和开拓用户不爱好的层层相套的子页面上。这一趋势将简化互联网并带来更迷人和身临其境的网页阅读体验，每个人都邑感觉到愉悦。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">6、<span style=\"font-size: 16px;\">虚拟现实</span></p><p style=\"text-align:center\"><img src=\"http://p3.pstatp.com/large/12cb0009b8cc3b69d3fb\" img_width=\"640\" img_height=\"428\" alt=\"在2017年将会更加风行的6个Web开拓趋势\" style=\"margin: 1em auto; padding: 0px; max-width: 100%; border: 0px; display: block;\"/></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">假如要评论辩论 2017 年技巧趋势，怎能不提到虚拟现实（VR）？2017 年将是 VR 成为主流的一年，这意味着 Web 开拓者将经由过程 VR 来吸引用户。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">咱们曾经看到一些公司好比 Mozilla 和 Google 投资开拓 VR 与 Web 之间的 API。愈来愈多的 VR 应用程序将在接下来的几个月里相继问世，以是假如看到愈来愈多的虚拟现实元素出如今 Web 上，也别感到奇异。</p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">7、<span style=\"font-size: 16px;\">总结</span></p><p style=\"margin-top: 1em; margin-bottom: 0px; padding: 0px; font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(34, 34, 34); text-align: left; text-indent: 2em;\">当你开端做 2017 年的名目时，将这些 Web 趋势铭刻于心。整体的现实是在接下来几个月里，许多器械都邑迎来成长和变更。多往前看一步，你可以或许确保你老是立足于潮水之巅。</p>', '_self', 'show', '100', null, null, '1482225575', null, 'zh-cn');
INSERT INTO `info_news` VALUES ('2', '2', 'HTML5、多边平台，企业不死的两个互联网机遇', '11月底，Facebook Messenger推出H5游戏平台Instant Games，首批放出17个H5游戏（包括吃豆人、太空侵入者等）。从现在起，Facebook用户可以在聊天时发起即时游戏，并', '', '_self', 'show', '100', null, null, '1485078219', null, 'zh-cn');

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
INSERT INTO `info_single` VALUES ('5', '关于我们的摘要', '<p><img src=\"/uploads/ueditor/image/20170523/1495521249493445.png\" alt=\"English.png\" title=\"1495521249493445.png\"/>关于我们</p>', null, null, null, null, 'zh-cn');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

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
INSERT INTO `sys_col` VALUES ('13', '信息管理', 'fa fa-file-text', '3', '2', 'information', '', 'show', '100', null, null, null, null, 'zh-cn');
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
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '2', 'admin', '幻灯片', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495289227', 'zh-cn');
INSERT INTO `sys_log` VALUES ('2', '2', 'admin', '用户管理', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495292969', 'zh-cn');
INSERT INTO `sys_log` VALUES ('3', '3', 'demo', '网站配置', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495293017', 'zh-cn');
INSERT INTO `sys_log` VALUES ('4', '3', 'demo', '网站配置', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495293032', 'zh-cn');
INSERT INTO `sys_log` VALUES ('5', '2', 'admin', '栏目管理', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495305463', 'zh-cn');
INSERT INTO `sys_log` VALUES ('6', '2', 'admin', '栏目管理', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495305485', 'zh-cn');
INSERT INTO `sys_log` VALUES ('7', '2', 'admin', '栏目管理', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495305503', 'zh-cn');
INSERT INTO `sys_log` VALUES ('8', '2', 'admin', '角色管理', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495338048', 'zh-cn');
INSERT INTO `sys_log` VALUES ('9', '2', 'admin', '角色管理', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495338053', 'zh-cn');
INSERT INTO `sys_log` VALUES ('10', '2', 'admin', '角色权限', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495347396', 'zh-cn');
INSERT INTO `sys_log` VALUES ('11', '2', 'admin', '角色管理', 'del', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495363667', 'zh-cn');
INSERT INTO `sys_log` VALUES ('12', '2', 'admin', '角色权限', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495363699', 'zh-cn');
INSERT INTO `sys_log` VALUES ('13', '2', 'admin', '角色权限', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495363711', 'zh-cn');
INSERT INTO `sys_log` VALUES ('14', '2', 'admin', '角色权限', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495364954', 'zh-cn');
INSERT INTO `sys_log` VALUES ('15', '2', 'admin', '角色权限', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495365369', 'zh-cn');
INSERT INTO `sys_log` VALUES ('16', '2', 'admin', '角色权限', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495365426', 'zh-cn');
INSERT INTO `sys_log` VALUES ('17', '2', 'admin', '角色权限', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495365441', 'zh-cn');
INSERT INTO `sys_log` VALUES ('18', '2', 'admin', '角色权限', 'update', 'fail', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495367136', 'zh-cn');
INSERT INTO `sys_log` VALUES ('19', '2', 'admin', '角色权限', 'update', 'success', 'Spartan', '15.15063', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495367221', 'zh-cn');
INSERT INTO `sys_log` VALUES ('20', '2', 'admin', '角色权限', 'update', 'success', 'Spartan', '15.15063', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495367233', 'zh-cn');
INSERT INTO `sys_log` VALUES ('21', '2', 'admin', '角色权限', 'update', 'success', 'Spartan', '15.15063', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495367240', 'zh-cn');
INSERT INTO `sys_log` VALUES ('22', '2', 'admin', '角色权限', 'update', 'success', 'Spartan', '15.15063', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495367253', 'zh-cn');
INSERT INTO `sys_log` VALUES ('23', '2', 'admin', '角色权限', 'update', 'success', 'Spartan', '15.15063', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495367272', 'zh-cn');
INSERT INTO `sys_log` VALUES ('24', '2', 'admin', '幻灯片', 'del', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495377989', 'zh-cn');
INSERT INTO `sys_log` VALUES ('25', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495379371', 'zh-cn');
INSERT INTO `sys_log` VALUES ('26', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495380889', 'zh-cn');
INSERT INTO `sys_log` VALUES ('27', '2', 'admin', '平台门户', 'insert', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495381655', 'zh-cn');
INSERT INTO `sys_log` VALUES ('28', '2', 'admin', '菜单管理', 'del', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495381997', 'zh-cn');
INSERT INTO `sys_log` VALUES ('29', '2', 'admin', '配置组', 'update', 'success', 'Chrome', '58.0.3029.110', 'Windows 10', 'DESKTOP-FTTP3GQ', '::1', '1495382208', 'zh-cn');
INSERT INTO `sys_log` VALUES ('30', '2', 'admin', '关于我们', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495416604', 'zh-cn');
INSERT INTO `sys_log` VALUES ('31', '2', 'admin', '关于我们', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495416613', 'zh-cn');
INSERT INTO `sys_log` VALUES ('32', '2', 'admin', '关于我们', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495416815', 'zh-cn');
INSERT INTO `sys_log` VALUES ('33', '2', 'admin', '配置组', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495416843', 'zh-cn');
INSERT INTO `sys_log` VALUES ('34', '2', 'admin', '角色权限', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495417184', 'zh-cn');
INSERT INTO `sys_log` VALUES ('35', '2', 'admin', '角色权限', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495417275', 'zh-cn');
INSERT INTO `sys_log` VALUES ('36', '2', 'admin', '配置组', 'insert', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495423530', 'zh-cn');
INSERT INTO `sys_log` VALUES ('37', '2', 'admin', '配置组', 'del', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495423645', 'zh-cn');
INSERT INTO `sys_log` VALUES ('38', '2', 'admin', '配置组', 'insert', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495423661', 'zh-cn');
INSERT INTO `sys_log` VALUES ('39', '2', 'admin', '配置组', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495423702', 'zh-cn');
INSERT INTO `sys_log` VALUES ('40', '2', 'admin', '配置组', 'del', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495423740', 'zh-cn');
INSERT INTO `sys_log` VALUES ('41', '2', 'admin', '配置组', 'insert', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495423830', 'zh-cn');
INSERT INTO `sys_log` VALUES ('42', '2', 'admin', '配置组', 'del', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495423845', 'zh-cn');
INSERT INTO `sys_log` VALUES ('43', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495439420', 'zh-cn');
INSERT INTO `sys_log` VALUES ('44', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495439466', 'zh-cn');
INSERT INTO `sys_log` VALUES ('45', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495439478', 'zh-cn');
INSERT INTO `sys_log` VALUES ('46', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495439520', 'zh-cn');
INSERT INTO `sys_log` VALUES ('47', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495439620', 'zh-cn');
INSERT INTO `sys_log` VALUES ('48', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495439681', 'zh-cn');
INSERT INTO `sys_log` VALUES ('49', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495439870', 'zh-cn');
INSERT INTO `sys_log` VALUES ('50', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495439975', 'zh-cn');
INSERT INTO `sys_log` VALUES ('51', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495509592', 'zh-cn');
INSERT INTO `sys_log` VALUES ('52', '2', 'admin', '栏目管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495517014', 'zh-cn');
INSERT INTO `sys_log` VALUES ('53', '2', 'admin', '栏目管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495517021', 'zh-cn');
INSERT INTO `sys_log` VALUES ('54', '2', 'admin', '模型管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495518198', 'zh-cn');
INSERT INTO `sys_log` VALUES ('55', '2', 'admin', '模型管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495518208', 'zh-cn');
INSERT INTO `sys_log` VALUES ('56', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495518682', 'zh-cn');
INSERT INTO `sys_log` VALUES ('57', '2', 'admin', '模板管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495518700', 'zh-cn');
INSERT INTO `sys_log` VALUES ('58', '2', 'admin', '模板管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495518709', 'zh-cn');
INSERT INTO `sys_log` VALUES ('59', '2', 'admin', '模板管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495518718', 'zh-cn');
INSERT INTO `sys_log` VALUES ('60', '2', 'admin', '模板管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495518727', 'zh-cn');
INSERT INTO `sys_log` VALUES ('61', '2', 'admin', '模板管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495519035', 'zh-cn');
INSERT INTO `sys_log` VALUES ('62', '2', 'admin', '关于我们', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495521263', 'zh-cn');
INSERT INTO `sys_log` VALUES ('63', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495521698', 'zh-cn');
INSERT INTO `sys_log` VALUES ('64', '2', 'admin', '菜单管理', 'update', 'success', 'Chrome', '58.0.3029.96', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1495521827', 'zh-cn');

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
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='系统登录日志表';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('1', '2', '::1', '1495289358', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('2', '2', '::1', '1495289369', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('3', '2', '::1', '1495291087', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('4', '2', '::1', '1495291116', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('5', '2', '::1', '1495292959', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('6', '3', '::1', '1495292983', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('7', '2', '::1', '1495293052', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('8', '2', '::1', '1495304154', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('9', '2', '::1', '1495337293', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('10', '2', '::1', '1495363650', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('11', '3', '::1', '1495363981', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('12', '2', '::1', '1495364936', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('13', '3', '::1', '1495366721', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('14', '2', '::1', '1495367128', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('15', '3', '::1', '1495367147', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('16', '2', '::1', '1495367182', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('17', '3', '::1', '1495367379', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('18', '2', '::1', '1495369369', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('19', '2', '::1', '1495369452', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('20', '2', '::1', '1495369473', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('21', '2', '::1', '1495369643', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('22', '3', '::1', '1495379938', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('23', '2', '::1', '1495380429', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('24', '2', '::1', '1495380565', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('25', '2', '::1', '1495380743', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('26', '2', '::1', '1495380761', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('27', '2', '::1', '1495416550', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('28', '2', '::1', '1495418486', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('29', '2', '::1', '1495418844', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('30', '2', '::1', '1495418895', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('31', '3', '::1', '1495419869', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('32', '3', '::1', '1495420344', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('33', '3', '::1', '1495420432', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('34', '2', '::1', '1495421859', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('35', '3', '::1', '1495422387', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('36', '2', '::1', '1495422403', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('37', '2', '::1', '1495425196', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('38', '2', '::1', '1495437710', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('39', '2', '::1', '1495505779', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('40', '2', '::1', '1495519825', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('41', '2', '::1', '1495519984', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('42', '2', '::1', '1495520070', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('43', '2', '::1', '1495520518', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('44', '2', '::1', '1495521544', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('45', '2', '::1', '1495521560', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('46', '2', '::1', '1495521580', 'zh-cn');
INSERT INTO `sys_login_log` VALUES ('47', '2', '::1', '1495521617', 'zh-cn');

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
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'insert', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'update', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'del', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'look', 'zh-cn');
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
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'insert', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'update', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'del', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'look', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '4', '', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '15', 'insert', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '15', 'update', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '15', 'del', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '11', 'update', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '2', '', 'zh-cn');
INSERT INTO `sys_role_auth` VALUES ('3', '31', 'del', 'zh-cn');
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
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='上传文件表';

-- ----------------------------
-- Records of uploads
-- ----------------------------
INSERT INTO `uploads` VALUES ('67', '8b281335313a9300fe2c2e934bf932e7.png', 'image/png', 'D:/wamp/www/uploads/20170523/', 'D:/wamp/www/uploads/20170523/8b281335313a9300fe2c2e934bf932e7.png', '/uploads/20170523/', '/uploads/20170523/8b281335313a9300fe2c2e934bf932e7.png', '8b281335313a9300fe2c2e934bf932e7', '8b281335313a9300fe2c2e934bf932e7.png', 'English.png', '.png', '3.51', '1', '86', '57', 'png', 'width=\"86\" height=\"57\"', '', 'zh-cn');
INSERT INTO `uploads` VALUES ('68', '6d70186ad394565523462961a506983e.png', 'image/png', 'D:/wamp/www/uploads/20170523/', 'D:/wamp/www/uploads/20170523/6d70186ad394565523462961a506983e.png', '/uploads/20170523/', '/uploads/20170523/6d70186ad394565523462961a506983e.png', '6d70186ad394565523462961a506983e', '6d70186ad394565523462961a506983e.png', 'Korean.png', '.png', '3.30', '1', '86', '57', 'png', 'width=\"86\" height=\"57\"', '', 'zh-cn');
