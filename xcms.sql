/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : xcms

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-11-21 18:47:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for common_dict
-- ----------------------------
DROP TABLE IF EXISTS `common_dict`;
CREATE TABLE `common_dict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pid` int(10) unsigned DEFAULT '0',
  `level` tinyint(2) DEFAULT NULL,
  `ident` varchar(20) DEFAULT NULL,
  `field` varchar(20) DEFAULT NULL,
  `color` char(7) DEFAULT NULL,
  `is_sys` tinyint(1) DEFAULT '0',
  `sort` int(10) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='通用字典表';

-- ----------------------------
-- Records of common_dict
-- ----------------------------
INSERT INTO `common_dict` VALUES ('1', '操作', '0', '1', 'sys_menu_auth', null, '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('2', '新增', '1', '2', 'insert', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('3', '编辑', '1', '2', 'update', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('4', '删除', '1', '2', 'del', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('5', '查看', '1', '2', 'look', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('9', '显示', '0', '1', 'display', null, '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('10', '显示', '9', '2', 'show', '', '#5cb85c', '0', '100');
INSERT INTO `common_dict` VALUES ('11', '隐藏', '9', '2', 'hide', '', '#d9534f', '0', '100');
INSERT INTO `common_dict` VALUES ('12', '配置项类型', '0', '1', 'config_type', null, '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('13', '文本', '12', '2', 'text', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('14', '单选', '12', '2', 'radio', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('15', '复选', '12', '2', 'checkbox', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('16', '下拉列表', '12', '2', 'select', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('17', '文本域', '12', '2', 'textarea', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('18', '用户状态', '0', '1', 'user_status', null, '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('19', '正常', '18', '2', 'normal', null, '#5cb85c', '0', '100');
INSERT INTO `common_dict` VALUES ('20', '冻结', '18', '2', 'forzen', null, '#d9534f', '0', '100');
INSERT INTO `common_dict` VALUES ('26', '位置', '0', '1', 'position', null, '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('27', '顶部', '26', '2', 'top', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('28', '底部', '26', '2', 'bottom', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('29', '打开方式', '0', '1', 'target', null, '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('30', '当前窗口', '29', '2', '_self', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('31', '新窗口', '29', '2', '_blank', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('32', '日志状态', '0', '1', 'log_status', null, '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('33', '成功', '32', '2', 'success', null, '#5cb85c', '0', '100');
INSERT INTO `common_dict` VALUES ('34', '失败', '32', '2', 'fail', null, '#d9534f', '0', '100');
INSERT INTO `common_dict` VALUES ('35', '用户类型', '0', '1', 'user_type', null, '#333333', '1', '100');
INSERT INTO `common_dict` VALUES ('36', '生产者', '35', '2', 'pro', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('37', '开发者', '35', '2', 'dev', null, '#d9534f', '0', '100');
INSERT INTO `common_dict` VALUES ('47', '审核状态', '0', '1', 'audit_status', null, '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('48', '待审核', '47', '2', 'wait', null, '#007cf9', '0', '100');
INSERT INTO `common_dict` VALUES ('49', '已通过', '47', '2', 'passed', null, '#5cb85c', '0', '100');
INSERT INTO `common_dict` VALUES ('50', '未通过', '47', '2', 'nopass', null, '#d9534f', '0', '100');
INSERT INTO `common_dict` VALUES ('51', '行业分类', '0', '1', 'industry', '', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('55', '金融', '51', '2', '', '', '#333333', '0', '100');
INSERT INTO `common_dict` VALUES ('56', 'IT', '51', '2', null, null, null, '0', '100');
INSERT INTO `common_dict` VALUES ('64', '123', '51', '2', null, null, null, '0', '100');
INSERT INTO `common_dict` VALUES ('65', '876', '51', '2', null, null, null, '0', '100');
INSERT INTO `common_dict` VALUES ('66', '1111111', '51', '2', null, null, null, '0', '100');
INSERT INTO `common_dict` VALUES ('67', '阿打算发斯蒂芬', '51', '2', null, null, null, '0', '100');
INSERT INTO `common_dict` VALUES ('68', '大', '51', '2', null, null, null, '0', '100');
INSERT INTO `common_dict` VALUES ('69', '阿斯蒂芬阿斯蒂芬阿斯蒂芬', '51', '2', null, null, null, '0', '100');
INSERT INTO `common_dict` VALUES ('70', '空间和规范的', '51', '2', null, null, null, '0', '100');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `variable` varchar(100) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `param` varchar(100) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='基本配置表';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '标题', 'title', '轩宇网络工作室', 'base', 'text', '', '', 'show', '100');
INSERT INTO `config` VALUES ('2', '关键字', 'keywords', '网站制作,网页设计,网站建设,网站开发,微网站,手机网站,html5,响应式网站,做网站,个人网站建设', 'base', 'textarea', '', null, 'show', '100');
INSERT INTO `config` VALUES ('3', '描述', 'description', '轩宇网络工作室，打造行业领军品牌，高端网站建设', 'base', 'textarea', '', null, 'show', '100');
INSERT INTO `config` VALUES ('4', '版权', 'copyright', '@ 轩宇网络', 'base', 'text', '', null, 'show', '100');
INSERT INTO `config` VALUES ('5', '备案号', 'icp_num', '京ICP备15054430号-1', 'base', 'text', '', null, 'show', '100');
INSERT INTO `config` VALUES ('6', '统计/商桥', 'count_code', '', 'base', 'textarea', '', null, 'show', '100');
INSERT INTO `config` VALUES ('7', '状态', 'status', '1', 'status', 'radio', '1|正常,0|关闭', null, 'show', '100');
INSERT INTO `config` VALUES ('8', '关闭说明', 'close_explain', '网站升级，敬请期待！', 'status', 'textarea', '', null, 'show', '100');

-- ----------------------------
-- Table structure for config_group
-- ----------------------------
DROP TABLE IF EXISTS `config_group`;
CREATE TABLE `config_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统配置组';

-- ----------------------------
-- Records of config_group
-- ----------------------------
INSERT INTO `config_group` VALUES ('1', '基本配置', 'base', 'show', '100');
INSERT INTO `config_group` VALUES ('2', '网站状态', 'status', 'show', '100');

-- ----------------------------
-- Table structure for friendship_link
-- ----------------------------
DROP TABLE IF EXISTS `friendship_link`;
CREATE TABLE `friendship_link` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `thumb` int(10) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(10) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of friendship_link
-- ----------------------------
INSERT INTO `friendship_link` VALUES ('1', '', '0', '', '_self', 'show', '10');

-- ----------------------------
-- Table structure for info_article
-- ----------------------------
DROP TABLE IF EXISTS `info_article`;
CREATE TABLE `info_article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `original_link` varchar(255) DEFAULT NULL,
  `auther` varchar(30) DEFAULT NULL,
  `thumb` varchar(10) DEFAULT NULL,
  `content` text,
  `tag` varchar(100) DEFAULT NULL,
  `target` varchar(10) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT '100',
  `create_time` int(10) DEFAULT NULL,
  `create_user` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `update_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='信息文章表';

-- ----------------------------
-- Records of info_article
-- ----------------------------
INSERT INTO `info_article` VALUES ('2', '1', 'php动态更改post_max_size, upload_max_filesize等值', '', '', '', '<p style=\"text-align: left;\">在配置文件里有些PHP配置选项可以用 int_set() 函数直接在项目里修改，有些值却不行。</p><p style=\"text-align: left;\">例如：post_max_size和upload_max_filesize</p><p style=\"text-align: left;\">int_set(‘post_max_size’,’1024M’) 和 int_set(‘upload_max_filesize’, ‘1024M’) 都修改不了原值。</p><p style=\"text-align: left;\">在PHP文档有说明三个修改指令：</p><p style=\"text-align: left;\">PHP_INI_PERDIR 可以在php.ini,httpd.conf,.htaccess 文件修改</p><p style=\"text-align: left;\">PHP_INI_SYSTEM 可以在php.ini,httpd.conf 中修改 PHP_INI_ALL</p><p style=\"text-align: left;\">只有修改范围是这个的才能用int_set 修改</p><p style=\"text-align: left;\">如果想动态的修改不是 PHP_INI_ALL 又是 PHP_INI_PERDIR 属性的正确方法是：</p><p style=\"text-align: left;\">在文件所在目录下的.htaccess 文件里写下这些修改配置项：</p><pre class=\"brush:html;toolbar:false\">&lt;!--lang:shell--&gt;\r\n&lt;IFModule&nbsp;mod_php5.c&gt;\r\nphp_value&nbsp;upload_max_filesize&nbsp;2000M\r\nphp_value&nbsp;post_max_size&nbsp;2500M\r\nphp_value&nbsp;max_file_uploads&nbsp;50\r\n&lt;/IFModule&gt;</pre><p style=\"text-align: left;\">其中 post_max_size 大于 upload_max_filesize 为佳</p><p><br/></p>', '2,3', '_self', 'show', '100', '1508422064', null, null, null);
INSERT INTO `info_article` VALUES ('3', '1', 'php上传大文件失败需配置upload_max_filesize和post_max_size', '', '', '', '<p style=\"text-align: left;\"><strong>php.ini配置文件</strong></p><p style=\"text-align: left;\">upload_max_filesize = 2M //允许上传的最大值</p><p style=\"text-align: left;\">post_max_size = 3M //post提交允许发送的最大值</p><p style=\"text-align: left;\"><br/></p><p style=\"text-align: left;\"><strong>文件上传的其他注意事项</strong></p><p style=\"text-align: left;\">在上传大文件时，会有上传速度慢的感觉，当超过一定的时间，会报脚本执行超过30秒的错误，这是因为在php.ini配置文件中max_execution_time配置选项在作怪，其表示每个脚本最大允许执行时间(秒)，0 表示没有限制。你可以适当调整max_execution_time的值，不推荐设定为0。</p><p><br/></p>', '2,3', '_self', 'show', '100', '1508422560', null, null, null);
INSERT INTO `info_article` VALUES ('4', '1', '使用@media实现IE hack的方法', '', '', '', '<p style=\"text-align: left;\">随着Responsive设计的流行，Medial Queries可算是越来越让人观注了。他可以让Web前端工程实现不同设备下的样式选择，让站点在不同的设备中实现不同的效果。这个早前在w3cplus已经介绍过，如果你还没有接触，不仿点击这里详细阅读。今天在看blog时发现一个其他的使用方法，就是利用@media来做一些IE下的特殊效果。</p><p style=\"text-align: left;\">众所周知，有些时候为了实现IE下的某些效果与现代浏览器一致，我们不得不使用一些hack手段来实现目的。比如说使用“\\0”，“\\”和“\\9”来仅让IE某些版本识别，而对于现代浏览器来说，他会直接无视这些代码。今天我想为大家介绍的是使用@media实现IE hack的方法：</p><p style=\"text-align: left;\"><br/></p><p style=\"text-align: left;\"><strong>仅IE6和IE7识别</strong></p><pre class=\"brush:css;toolbar:false\">@media&nbsp;screen\\9&nbsp;{&nbsp;.selector&nbsp;{&nbsp;property:&nbsp;value;&nbsp;}&nbsp;}</pre><p style=\"text-align: left;\"><strong>仅IE6和IE7、IE8识别&nbsp;</strong></p><pre class=\"brush:css;toolbar:false\">@media&nbsp;\\0screen,screen\\9&nbsp;{&nbsp;.selector&nbsp;{&nbsp;property:&nbsp;value;&nbsp;}&nbsp;}</pre><p style=\"text-align: left;\"><strong>仅IE8识别&nbsp;</strong></p><pre class=\"brush:css;toolbar:false\">@media&nbsp;\\0screen&nbsp;{&nbsp;.selector&nbsp;{&nbsp;property:&nbsp;value;&nbsp;}&nbsp;}</pre><p style=\"text-align: left;\"><strong>仅IE8-10识别&nbsp;</strong></p><pre class=\"brush:css;toolbar:false\">@media&nbsp;screen\\0&nbsp;{&nbsp;.selector&nbsp;{&nbsp;property:&nbsp;value;&nbsp;}&nbsp;}</pre><p style=\"text-align: left;\"><strong>仅IE9和IE10识别&nbsp;</strong></p><pre class=\"brush:css;toolbar:false\">@media&nbsp;screen&nbsp;and&nbsp;(min-width:0\\0)&nbsp;{&nbsp;.selector&nbsp;{&nbsp;property:&nbsp;value;&nbsp;}&nbsp;}</pre><p style=\"text-align: left;\"><strong>仅IE10识别&nbsp;</strong></p><pre class=\"brush:css;toolbar:false\">@media&nbsp;screen&nbsp;and&nbsp;(-ms-high-contrast:&nbsp;active),&nbsp;(-ms-high-contrast:&nbsp;none)&nbsp;{&nbsp;/*&nbsp;IE10-specific&nbsp;styles&nbsp;go&nbsp;here&nbsp;*/&nbsp;}</pre><p style=\"text-align: left;\"><br/></p><p style=\"text-align: left;\">上面几个@media配合“\\”、“\\0”和“\\9”就能让不同版本的IE识别，那么具体项目中我们要怎么使用呢？</p><p style=\"text-align: left;\">打个比方，如果你的body中设置了一个红色的背景，而想让不同版本IE变成别的颜色，那么我们就可以这么操作</p><pre class=\"brush:css;toolbar:false\">body&nbsp;{&nbsp;background:&nbsp;red;&nbsp;}&nbsp;/*IE6、IE7变成绿色*/&nbsp;\r\n@media&nbsp;all\\9&nbsp;{&nbsp;body&nbsp;{&nbsp;background:&nbsp;green;&nbsp;}&nbsp;}&nbsp;/*IE8变成蓝色*/&nbsp;\r\n@media&nbsp;\\0screen&nbsp;{&nbsp;body&nbsp;{&nbsp;background:&nbsp;blue;&nbsp;}&nbsp;}&nbsp;/*IE9和IE10变成黄色*/&nbsp;\r\n@media&nbsp;screen&nbsp;and&nbsp;(min-width:0\\0)&nbsp;{&nbsp;body&nbsp;{&nbsp;background:&nbsp;yellow;&nbsp;}&nbsp;}</pre><p style=\"text-align: left;\">IE的Hack方法我向来不提倡使用，但这些方法很少有人知道，贴上来与大家分享，希望在不得已的情况之下，这些hack方法能帮你解决问题，特别是国内的苦逼前端人员。</p><p><br/></p>', '4', '_self', 'show', '100', '1508422850', null, null, null);
INSERT INTO `info_article` VALUES ('5', '1', '安装wampserver时提示丢失MSVCR110.dll', '', '', '', '<p style=\"text-align: left;\">对于32位系统，安装Wampserver 后启动的时候提示系统错误：MSVCR110.dll丢失。</p><p style=\"text-align: left;\">于是卸载原来的WAMPSERVER 。安装vcredist_x86.exe，重新安装WAMPSERVER 2之后，问题解决了</p><p style=\"text-align: left;\">对于64位系统，则需要下载wampserver 64位版，并且安装vcredist_x64.exe</p><p style=\"text-align: left;\">下载地址：</p><p style=\"text-align: left;\"><a href=\"https://sourceforge.net/projects/wampserver/files/?source=navbar\" target=\"_blank\">https://sourceforge.net/projects/wampserver/files/?source=navbar</a></p><p style=\"text-align: left;\">vcredist_x64.exe 和vcredist_x86.exe下载地址：</p><p style=\"text-align: left;\"><a href=\"http://www.microsoft.com/zh-cn/download/details.aspx?id=30679\" target=\"_blank\">http://www.microsoft.com/zh-cn/download/details.aspx?id=30679</a></p><p><br/></p>', '2', '_self', 'show', '100', '1508423050', null, null, null);
INSERT INTO `info_article` VALUES ('6', '1', '修改WampServer的附件上传限制的方法', '', '', '', '<p style=\"text-align: left;\"><strong>方法一：修改 php.ini 文件</strong></p><p style=\"text-align: left;\">相关参数解释：</p><p style=\"text-align: left;\">file_uploads = on ;是否允许通过HTTP上传文件的开关。默认为ON即是开。</p><p style=\"text-align: left;\">upload_tmp_dir ;文件上传至服务器上存储临时文件的地方，如果没指定就会用系统默认的临时文件夹。</p><p style=\"text-align: left;\">upload_max_filesize = 2m ;望文生意，即允许上传文件大小的最大值。默认为2M</p><p style=\"text-align: left;\">post_max_size = 8m ;指通过表单POST给PHP的所能接收的最大值，包括表单里的所有值。默认为8M</p><p style=\"text-align: left;\">max_execution_time = 30 ;每个PHP页面运行的最大时间值(秒)，默认30秒</p><p style=\"text-align: left;\">max_input_time = 60 ;每个PHP页面接收数据所需的最大时间，默认60秒</p><p style=\"text-align: left;\">memory_limit = 128m ;每个PHP页面所吃掉的最大内存，默认128M。如果觉得小了，可以设置大点。128够用。</p><p style=\"text-align: left;\">max_execution_time = 600</p><p style=\"text-align: left;\">max_input_time = 600</p><p style=\"text-align: left;\">upload_max_filesize = 32m</p><p style=\"text-align: left;\">post_max_size = 32m</p><p style=\"text-align: left;\">把上述参数修改后，在网络所允许的正常情况下，就可以上传大体积文件了。</p><p style=\"text-align: left;\"><br/></p><p style=\"text-align: left;\"><strong>方法二：利用.htaccess文件</strong></p><p style=\"text-align: left;\">此法不用直接.修改php.ini，适用于虚拟主机。</p><p style=\"text-align: left;\">配置Apache支持.htaccess</p><p style=\"text-align: left;\">//找到</p><p style=\"text-align: left;\">Options FollowSymLinks</p><p style=\"text-align: left;\">AllowOverride None</p><p style=\"text-align: left;\">//修改为</p><p style=\"text-align: left;\">Options FollowSymLinks</p><p style=\"text-align: left;\">AllowOverride All</p><p style=\"text-align: left;\">//就可以了</p><p style=\"text-align: left;\">在目录下新建一个.htaccess文件，windows默认是不允许这么干的，可以在Dreamweaver的文件管理下新建，就不会了。</p><p style=\"text-align: left;\">.htaccess里写入</p><p style=\"text-align: left;\">php_value post_max_size 12m</p><p style=\"text-align: left;\">php_value upload_max_filesize 12m</p><p style=\"text-align: left;\">php_value max_execution_time 120</p><p style=\"text-align: left;\">php_value max_input_time 240</p><p style=\"text-align: left;\"><br/></p><p style=\"text-align: left;\"><strong>补充解释</strong></p><p style=\"text-align: left;\">使用ini_set(“post_max_size”,”80M”);的方法是行不通的。</p><p style=\"text-align: left;\">post_max_size的可修改范围是PHP_INI_PERDIR。</p><p style=\"text-align: left;\">PHP_INI_PERDIR是域内指令只能在php.ini、httpd.conf或.htaccess文件中修改，故行不通。</p><p style=\"text-align: left;\">php_value name value</p><p style=\"text-align: left;\">设定指定指令的值。仅能用于 PHP_INI_ALL 和 PHP_INI_PERDIR 类型的指令。要清除上一个设定的值，将值设为 none 。</p><p style=\"text-align: left;\">注: 不要用 php_value 来设定布尔值。应该用 php_flag （见下面）来替代。</p><p style=\"text-align: left;\">php_flag name on|off</p><p style=\"text-align: left;\">用于设定布尔值类型的配置指令。仅能用于 PHP_INI_ALL 和 PHP_INI_PERDIR 类型的指令。</p><p style=\"text-align: left;\">php_admin_value name value</p><p style=\"text-align: left;\">设定指定指令的值。不能在 .htaccess 文件中使用。任何在 php_admin_value 中设定的值不能被 .htaccess 或者 virtualhost 中的指令覆盖。要清除上一个设定的值，将值设为 none 。</p><p style=\"text-align: left;\">php_admin_flag name on|off</p><p style=\"text-align: left;\">用于设定布尔值类型的配置指令。不能在 .htaccess 文件中使用。任何在 php_admin_flag 中设定的值不能被 .htaccess 或者 virtualhost 中的指令覆盖。</p><p><br/></p>', '2', '_self', 'show', '100', '1508423128', null, null, null);
INSERT INTO `info_article` VALUES ('7', '1', '如何增加网站访问量', '', '', '', '<p style=\"text-align: left; text-indent: 2em;\">大多数企业想要做好网络营销，都会首先建立一个属于自己的网站，网站的访问量就成了这一行业最热门的话题，一个网站，不管内部建设得再好，没有访问量也等于零，不推广出去增加流量，也只是做给自己人看而已，对营销起不到实际的作用，如何增加访问量，首先基础要打牢。</p><p style=\"text-align: left; text-indent: 2em;\"><strong><br/></strong></p><p style=\"text-align: left;\"><strong>如何增加网站访问量</strong></p><p style=\"text-align: left; text-indent: 2em;\">所谓的基础，就是网站在建立之初的定位问题，主要是要面向哪一类人群，主要用途是什么，根据定位来决定网站内容，然后对页面进行美化设计，设计风格要符合产品特点，整体的框架结构要看起来融洽，不能一个页面一种风格，网页上所用到的图片也要和内容有相关性，整体的色调要吻合，协调一致。只有内容和页面美工相互结合，才能制作出不错的网页效果，作出成功的主页，只有这些基础的做好了之后，才会有信息和底气去对网站进行推广。</p><p style=\"text-align: left;\"><br/></p><p style=\"text-align: left; text-indent: 2em;\">搜索引擎是每一个网民都会使用的东西，有不知道的问题的时候，大家都会想到网上搜索答案，所以，对于企业来说，搜索引擎是增加网站访问量必须要用到的方式，是最为原始也效果比较明确的一种推广方式，国内一些大的搜索引擎都是网站必须要去登记的，而做登记是免费的，比如搜狐，新浪，雅虎等。用这个方法就要设置关键词，可以选取热门词语，可以吸引人们的眼球，就算里面的内容跟标题的关键词没有太大相关性，但也可以吸引网民点击，当用户进行搜索的时候，如果关键词跟搜索的词差不多，网站就会成为搜索的结果之一，关键词选择好，网址就更容易被点击。</p><p style=\"text-align: left;\"><br/></p><p style=\"text-align: left; text-indent: 2em;\">也可以主动地去做宣传，利用好聊天室，email等手段，在浏览网页的时候，看到聊天室就进去留言，说几句话，微网站左右写宣传，或者用邮件的方式把信息推广出去，这些方式是效果最直接的。也可以利用论坛，微博等网络交流平台，去上面发布信息，推广网站，虽然操作起来有点麻烦，但效果也是最为直接的。</p><p style=\"text-align: left;\"><br/></p><p style=\"text-align: left; text-indent: 2em;\">还有一种最普遍的网站推广办法就是使用链接，选择一个具有行业相关性的，比自己大一点的网站，交换链接，如果对方的访问量很大，也能给自己网站带来流量。但这种方式不适合刚做网站的企业，因为刚起步，你的网站比较小，访问量也少，对方肯定不愿意跟你交换友情链接，那对他们是没有多大用处的，除非对方的访问量也一样的少，但这样的友情链接收到的效果一定是不理想的。</p><p style=\"text-align: left;\"><br/></p><p style=\"text-align: left; text-indent: 2em;\">用户体验也需要特别注意，网站在建站的时候，就要选择流畅的服务器，才能给用户带来良好的体验，在访问过程中才不会出现障碍，网站的速度也会直接影响到网站的访问量，一个网页假如要很长时间才打得开，那用户多数是不愿因继续浏览下去的。</p>', '1', '_self', 'show', '100', '1508466093', null, null, null);
INSERT INTO `info_article` VALUES ('8', '1', '一款开源且轻量级的行内工具栏编辑器（MediumEditor）', 'http://www.toutiao.com/i6473594578493506062/', 'IT痕迹', '', '<blockquote style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 1em; margin-bottom: 1em; padding-top: 12px; padding-bottom: 12px; position: relative; font-size: 16px; line-height: 1.5; color: rgb(153, 153, 153); background: rgb(244, 245, 246); border-width: 1px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-color: rgb(232, 232, 232); border-image: initial; white-space: normal; user-select: text !important; text-align: left;\"><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; user-select: text !important; text-align: left;\">MediumEditor是一个简单的开源（MIT协议）行内编辑器工具栏，支持鼠标选择然后进行编辑，使用简单，是基于JavaScript编写的，不依赖于任何第三方开源库，兼容主流浏览器及IE9，使用contenteditable API可以实现一个富文本编辑器（contenteditable的作用非常强大，可以让div、span、li、table、p等元素设置为可写状态，详情可以自行搜索）。</p></blockquote><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20171020/1508466839104713.jpg\" alt=\"3e600000f2c8552ea935.jpg\" title=\"1508466839104713.jpg\"/></p><p><br/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">1、下载及初始化<br/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><a href=\"https://github.com/yabwe/medium-editor\" target=\"_blank\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; user-select: text !important; font-weight: 700;\">https://github.com/yabwe/medium-editor</span></a></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">下载完成后把文件放到项目任意位置，在页面中引入js、css文件即可；第三个文件是主题可根据你的需求来定。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20171020/1508466867140163.jpg\" alt=\"3e6100011d6bb95d25dc.jpg\" title=\"1508466867140163.jpg\"/></p><p><br/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">然后在body元素中创建一个DOM容器，用于实例化MediumEditor，如&lt;div class=&quot;editable&quot;&gt;&lt;/div&gt;</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20171020/1508466888103663.jpg\" alt=\"3e6100011e9e97c0f939.jpg\" title=\"1508466888103663.jpg\"/></p><p><br/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">最后输入如下代码，运行脚本，一个MediumEditor简单初始化就完成了。刷新页面后就能看到效果。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20171020/1508466898916060.jpg\" alt=\"3e5d0003f64b7eda1424.jpg\" title=\"1508466898916060.jpg\"/></p><p><br/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20171020/1508467214104911.gif\" alt=\"3e600000f1ab0ea42c2d.gif\" title=\"1508467214104911.gif\"/></p><p><br/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">npm安装命令：npm install medium-editor</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">bower安装命令：bower install medium-editor</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">2、扩展demo演示</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">①图像上传<br/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><a href=\"https://github.com/orthes/medium-editor-insert-plugin\" target=\"_blank\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; user-select: text !important; font-weight: 700;\">https://github.com/orthes/medium-editor-insert-plugin</span></a></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20171020/1508466932134207.gif\" alt=\"3e6100012a25e23534a1.gif\" title=\"1508466932134207.gif\"/></p><p><br/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">②表格编辑</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><a href=\"https://github.com/yabwe/medium-editor-tables\" target=\"_blank\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; user-select: text !important; font-weight: 700;\">https://github.com/yabwe/medium-editor-tables</span></a></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20171020/1508466949247260.gif\" alt=\"3e62000121000075cec3.gif\" title=\"1508466949247260.gif\"/></p><p><br/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">③自定义按钮</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><a href=\"https://github.com/arcs-/medium-button\" target=\"_blank\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; user-select: text !important; font-weight: 700;\">https://github.com/arcs-/medium-button</span></a></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20171020/1508466980119241.jpg\" alt=\"3e5e00038cb131a83767.jpg\" title=\"1508466980119241.jpg\"/></p><p><br/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">④多个占位符（placeholders）</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><a href=\"https://github.com/smiled0g/medium-editor-multi-placeholders-plugin\" target=\"_blank\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; user-select: text !important; font-weight: 700;\">https://github.com/smiled0g/medium-editor-multi-placeholders-plugin</span></a></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20171020/1508466998792301.gif\" alt=\"3e630001308222fe7ef2.gif\" title=\"1508466998792301.gif\"/></p><p><br/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">⑤与Handsontable扩展</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><a href=\"https://github.com/asselinpaul/medium-editor-handsontable\" target=\"_blank\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; user-select: text !important; font-weight: 700;\">https://github.com/asselinpaul/medium-editor-handsontable</span></a></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20171020/1508467017157410.gif\" alt=\"3e61000133cf8ac6929e.gif\" title=\"1508467017157410.gif\"/></p><p><br/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">⑥媒体编辑按钮</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><a href=\"https://github.com/orhanveli/medium-editor-embed-button\" target=\"_blank\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; user-select: text !important; font-weight: 700;\">https://github.com/orhanveli/medium-editor-embed-button</span></a></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20171020/1508467049471843.gif\" alt=\"3e5f000140cd44b5499a.gif\" title=\"1508467049471843.gif\"/></p><p><br/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">还有其他的扩展插件我就不一一介绍了，有兴趣的可以前往官网查看详情。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">官方网站：</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><a href=\"https://yabwe.github.io/medium-editor/\" target=\"_blank\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; user-select: text !important; font-weight: 700;\">https://yabwe.github.io/medium-editor/</span></a></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">API文档：</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><a href=\"https://github.com/yabwe/medium-editor/blob/master/OPTIONS.md\" target=\"_blank\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; user-select: text !important; font-weight: 700;\">https://github.com/yabwe/medium-editor/blob/master/OPTIONS.md</span></a></p><hr/><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20171020/1508467081813601.jpg\" alt=\"3e6000011516b5b4ccb7.jpg\" title=\"1508467081813601.jpg\"/></p><p><br/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-size: 16px; white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">MediumEditor内置多个事件、方法、配置属性，可自定义事件，内置多个主题可选择，能更好的适应你页面的风格，提供插件构建方式，在当前功能不满足你需求的情况下，也能让你轻松写出符合需求的扩展，可以与Angular、React、Django、Aurelia、Meteor等技术进行整合。</p><p><br/></p>', '4', '_self', 'show', '100', '1508466647', null, null, null);
INSERT INTO `info_article` VALUES ('9', '1', '使用 Xdebug 在 PHPStorm 中调试 PHP 程序(框架/原生均适用)', 'https://segmentfault.com/a/1190000011387666', '多厘', '', '<h2 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">序言</h2><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">Xdebug 作为 PHP 调试工具，提供了丰富的调试函数和配置，可以直观的看到 PHP 源代码的步进和性能数据，以便优化PHP代码。</p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">使用 phpstorm + xdebug 来调试 php 程序是借助强大的IDE监听功能, 更方便的调试程序. 提高我们的编码效率, 固然 var_dump, print_r 等函数也能提供相应的功能, 但是自动化的工具更能够事半功倍. 下面我根据自己的使用介绍下如何进行调试和配置.</p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">, 一种方式是用外部设置的 session, 另外一种是在 phpstorm 中配置页面入口然后使用内置的监听来访问, 原理相同, 下面我们从原理开始讲解</p><h2 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">调试原理</h2><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/7c8bad15595a7ed97230e075124cb9ff?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><h2 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">配置调试环境</h2><h3 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">1) 配置 xdebug</h3><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">这里使用了最小化配置, 对于 profile 等功能没有配置</p><pre class=\"hljs nix\" style=\"font-size: 16px; line-height: 1.93rem; overflow: auto; color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); user-select: text !important;\">[xdebug]zend_extension=&quot;/usr/local/opt/php70-xdebug/xdebug.so&quot;xdebug.remote_enable=1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;启用远程调试xdebug.remote_connect_back=1&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;忽略&nbsp;remote_host&nbsp;配置,&nbsp;不关注主机配置,&nbsp;开发者使用最舒服xdebug.remote_port=9050&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;监听端口</pre><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">注意</span>&nbsp;这里监听端口默认是 9000 , 和 php 默认监听重复, 注意尽量不用使用 9000, 以免出现不生效的情况.</p><h3 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">2) 设置 phpstorm 配置并开启监听</h3><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">这里是让 phpstorm 通过监听端口的方式获取到xdebug 断点传送过来的数据</p><h4 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">2.1) 配置端口</h4><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">我们这里监听的是 9500 端口, 和 xdebug 配置监听数据端口一致</p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/0f3541ef3cc8d38bf319ec9947e62367?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><h4 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">2.2) 开启phpstorm 数据监听</h4><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">切换 “开始监听PHP调试连接” 按钮。</p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/51e327e3900fd588b9197c0a7cce7a80?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/97ad6e188132b5297b7a73bef6fb7bda?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><h3 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">3) 在 phpstorm 中设置断点</h3><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">点击行号右侧空白, 设置断点</p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/acd330342c7f6c6f60c3c04c52e8838b?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><h3 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">4) 设置 debug session</h3><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">debug session 的工具的目的是设置一个cookie, 让每次发送数据的时候都会携带这个 cookie, 从而识别监听.</p><h4 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">4.1) 安装工具</h4><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">安装 chrome 扩展&nbsp;<a href=\"https://link.juejin.im/?target=https%3A%2F%2Fchrome.google.com%2Fwebstore%2Fdetail%2Fxdebug-helper%2Feadndfjplgieldjbigjakmdgkmoaaaoc\" target=\"_blank\" style=\"background-color: transparent; text-decoration-line: none; cursor: pointer; color: rgb(34, 85, 153); user-select: text !important;\">Xdebug helper</a></p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/2debce49ca9a129664a6da2dd0a0902b?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><h4 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">4.2) 点击 图标设置session</h4><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/4b846397c523322b7e974b4e13e16e5b?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">已经设置了cookie, Key 是&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">XDEBUG_SESSION</code>, 值是&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">PHPSTORM</code>, 我认为这里的值无关紧要, 对于 phpstorm 来说, 是能够监控到的.</p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/9441c121af16ebc2d84d8dbe3dcf3fc2?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><h3 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">5) 运行页面</h3><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">这里我们在断点位置可以看到输出的内容项目</p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/c1963450d54a6e4e06cf0c8ba7d15628?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><h2 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">另一种方式: 内部调用</h2><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">这里的另外一种方式的服务器配置方式和流程完全一致, 就是第四步和第五步有所不同, 实现的原理是在phpstorm中设置运行的服务器, 然后通过 debug 模式自动设置&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">XDEBUG_SESSION</code>, 并且自动开启监听.</p><h3 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">内部调用: 4) 设置 debug session</h3><h4 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">4.1) 设置 web 访问的服务器</h4><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">例如我这里的本地域名是&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">l.dailian.sour-lemon.com</code>, 我们需要配置一个本地服务器来打开这个页面, 我们首先配置一台服务器.</p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/58718bb4ea4cee028d30821d88b14a1d?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">注意</span>&nbsp;这里的配置的域名是你本地已经配置好开发环境的域名, 端口号是 本地开发所使用的端口, 我这里是&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">l.dailian.sour-lemon.com</code>&nbsp;和 80</p><h4 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">4.2) 配置调试页面</h4><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">我们这里创建的调试页面的类型是&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">PHP Web Application</code>, 服务器选择的是刚才已经建立好的服务器<br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/0d0a8653c7ec0d367b77082a3a0fac1c?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><h3 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">内部调用: 5) 运行测试页面</h3><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">这样运行的情况下上面的&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">2.2) 开启phpstorm 数据监听</code>&nbsp;步骤可以忽略掉, 这里不需要开启这个监听.</p><h4 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">5.1) 开始 debug</h4><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">点击 debug 按钮, 这里会自动打开一个页面并且传递一个唯一的ID(可能是进程 ID)作为 debug 值</p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/110060849312958db8ad4fa407f9ed45?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">打开的url地址是:&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">http://l.dailian.sour-lemon.com/?XDEBUG_SESSION_START=13608</code>, 这里的数值是会变动的.</p><h4 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">5.2) 查看 debug 面板</h4><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">打开 debug 面板, 会看到相对应的监听 idekey, 这里和上一步设置的key是一致的, 同样也和 cookie 中的设置的&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">XDEBUG_SESSION</code>&nbsp;值一致<br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/7907adc7c4be4fc108baa077e7daf73a?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/edd70cfcf849b88e0a6a80db571d2302?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><h2 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">其他帮助</h2><h3 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">1. 查看兼容性</h3><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">第一次运行的时候可以通过 phpstorm 自带的工具来检查配置的兼容性.</p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">Run &gt; Web Server Debug Validation</code></p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/04834ea05a2915159123cb384d113a94?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><h3 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">2. debug 帮助面板说明</h3><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><br/></p><p style=\"text-align: center;\"><span class=\"img-wrap\" style=\"user-select: text !important;\"><img src=\"https://user-gold-cdn.xitu.io/2017/9/27/2cd9bf236c0d2ef6f143943fe82c240a?imageView2/0/w/1280/h/960/ignore-error/1\"/></span></p><p><br/></p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">左侧</span><br/>绿色三角形 ：&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">Resume Program</code>，表示將继续执行，直到下一个中断点停止。<br/>红色方形 ：&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">Stop</code>，表示中断当前程序调试。</p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">上方</span><br/>第一个图形示 ：&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">Step Over</code>，跳过当前函数。<br/>第二个图形示 ：&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">Step Into</code>，进入当前函数內部的程序（相当于观察程序一步一步执行）。<br/>第三个图形示 ：&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">Force Step Into</code>，強制进入当前函数內部的程序。<br/>第四个图形示 ：&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">Step Out</code>，跳出当前函数內部的程式。<br/>第五个图形示 ：&nbsp;<code style=\"font-size: 1rem; padding: 0.26rem 0.53em; word-break: break-word; color: rgb(78, 89, 128); background-color: rgb(248, 248, 248); border-radius: 2px; overflow-x: auto; user-select: text !important;\">Run to Cursor</code>，定位到当前光标。</p><p style=\"line-height: 2.27rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\"><span style=\"user-select: text !important; font-weight: 700;\">框架说明</span><br/>Frames : 加载的文件列表<br/>Variables ： 可以观察到所有全局变量、当前局部变量的数值<br/>Watches ： 可以新增变量，观察变量随着程序执行的变化。</p><h2 style=\"color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important; text-align: left;\">参考文章</h2><ul style=\"padding: 0px 0px 0px 2.7rem; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255); user-select: text !important;\" class=\" list-paddingleft-2\"><li><p style=\"text-align: left;\"><a href=\"https://link.juejin.im/?target=https%3A%2F%2Fconfluence.jetbrains.com%2Fdisplay%2FPhpStorm%2FZero-configuration%2BWeb%2BApplication%2BDebugging%2Bwith%2BXdebug%2Band%2BPhpStorm%23Zero-configurationWebApplicationDebuggingwithXdebugandPhpStorm-2.PreparePhpStorm\" target=\"_blank\" style=\"background-color: transparent; text-decoration-line: none; cursor: pointer; color: rgb(34, 85, 153); user-select: text !important;\">Zero-configuration Web Application Debugging with Xdebug and PhpStorm</a></p></li><li><p style=\"text-align: left;\"><a href=\"https://link.juejin.im/?target=https%3A%2F%2Fsegmentfault.com%2Fa%2F1190000005878593\" target=\"_blank\" style=\"background-color: transparent; text-decoration-line: none; cursor: pointer; color: rgb(34, 85, 153); user-select: text !important;\">使用 PHPStorm 与 Xdebug 调试 Laravel (一)</a></p></li></ul><p><br/></p>', '2,5,6', '_self', 'show', '100', '1508723485', null, null, null);

-- ----------------------------
-- Table structure for info_cases
-- ----------------------------
DROP TABLE IF EXISTS `info_cases`;
CREATE TABLE `info_cases` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `thumb` int(10) DEFAULT NULL,
  `images` varchar(50) DEFAULT NULL,
  `content` text,
  `target` varchar(10) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT '100',
  `create_time` int(10) DEFAULT NULL,
  `create_user` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `update_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息案例表';

-- ----------------------------
-- Records of info_cases
-- ----------------------------

-- ----------------------------
-- Table structure for info_category
-- ----------------------------
DROP TABLE IF EXISTS `info_category`;
CREATE TABLE `info_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pid` int(10) unsigned DEFAULT '0',
  `level` tinyint(2) DEFAULT NULL,
  `model_id` int(10) DEFAULT NULL,
  `dir` varchar(30) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(10) DEFAULT NULL,
  `seo_title` varchar(100) DEFAULT NULL,
  `seo_desc` varchar(200) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `is_add_next` tinyint(1) DEFAULT '1',
  `is_update` tinyint(1) DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='信息栏目表';

-- ----------------------------
-- Records of info_category
-- ----------------------------
INSERT INTO `info_category` VALUES ('1', '文章', '0', '1', '1', 'article', '', '_self', null, null, 'show', '100', '1', '1', '1');
INSERT INTO `info_category` VALUES ('2', '作品', '0', '1', '2', 'work', '', '_self', null, null, 'show', '100', '1', '1', '1');
INSERT INTO `info_category` VALUES ('4', '企业官网', '2', '2', '2', 'qiyeguanwang', '', '_self', null, null, 'show', '100', '1', '1', '1');
INSERT INTO `info_category` VALUES ('7', '专题', '2', '2', '2', 'zhuanti', '', '_self', null, null, 'show', '100', '1', '1', '1');

-- ----------------------------
-- Table structure for info_category_adv
-- ----------------------------
DROP TABLE IF EXISTS `info_category_adv`;
CREATE TABLE `info_category_adv` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `indent` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `create_time` int(10) DEFAULT NULL,
  `create_user` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `update_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息栏目广告表';

-- ----------------------------
-- Records of info_category_adv
-- ----------------------------

-- ----------------------------
-- Table structure for info_model
-- ----------------------------
DROP TABLE IF EXISTS `info_model`;
CREATE TABLE `info_model` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL,
  `list_model` varchar(50) DEFAULT NULL,
  `detail_model` varchar(50) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='信息模型表';

-- ----------------------------
-- Records of info_model
-- ----------------------------
INSERT INTO `info_model` VALUES ('1', '文章模型', 'info_article', 'article', 'detail', 'show', '100');
INSERT INTO `info_model` VALUES ('2', '作品模型', 'info_work', 'work', 'detail', 'show', '100');

-- ----------------------------
-- Table structure for info_page
-- ----------------------------
DROP TABLE IF EXISTS `info_page`;
CREATE TABLE `info_page` (
  `cid` int(10) unsigned NOT NULL,
  `content` text,
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信息单页表';

-- ----------------------------
-- Records of info_page
-- ----------------------------

-- ----------------------------
-- Table structure for navigation
-- ----------------------------
DROP TABLE IF EXISTS `navigation`;
CREATE TABLE `navigation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pid` int(10) unsigned DEFAULT '0',
  `level` tinyint(2) DEFAULT NULL,
  `category` int(10) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(10) DEFAULT NULL,
  `position` varchar(10) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `is_add_next` tinyint(1) DEFAULT '1',
  `is_update` tinyint(1) DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of navigation
-- ----------------------------
INSERT INTO `navigation` VALUES ('1', '专栏', '0', '1', '0', 'zhuanlan', '_self', 'top', 'hide', '100', '1', '1', '1');
INSERT INTO `navigation` VALUES ('2', '收藏集', '0', '1', '0', 'collections', '_self', 'top', 'hide', '100', '1', '1', '1');
INSERT INTO `navigation` VALUES ('3', '发现', '0', '1', '0', 'explore', '_self', 'top', 'hide', '100', '1', '1', '1');
INSERT INTO `navigation` VALUES ('4', '作品', '0', '1', '0', 'work', '_self', 'top', 'show', '100', '1', '1', '1');

-- ----------------------------
-- Table structure for slide
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image` int(10) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(10) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES ('5', '123', '43', '', '_self', 'show', '100');
INSERT INTO `slide` VALUES ('6', '234', '42', '', '_self', 'show', '100');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `login_ip` varchar(20) DEFAULT NULL,
  `login_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='系统登录日志表';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('1', '4', '::1', '1508414362');
INSERT INTO `sys_login_log` VALUES ('2', '4', '::1', '1508460498');
INSERT INTO `sys_login_log` VALUES ('3', '4', '::1', '1508484330');
INSERT INTO `sys_login_log` VALUES ('4', '4', '::1', '1508504478');
INSERT INTO `sys_login_log` VALUES ('5', '4', '::1', '1508570716');
INSERT INTO `sys_login_log` VALUES ('6', '4', '::1', '1508576653');
INSERT INTO `sys_login_log` VALUES ('7', '4', '::1', '1508581538');
INSERT INTO `sys_login_log` VALUES ('8', '4', '::1', '1508722492');
INSERT INTO `sys_login_log` VALUES ('9', '4', '::1', '1508724486');
INSERT INTO `sys_login_log` VALUES ('10', '4', '::1', '1508740936');
INSERT INTO `sys_login_log` VALUES ('11', '4', '::1', '1508742384');
INSERT INTO `sys_login_log` VALUES ('12', '4', '::1', '1508743050');
INSERT INTO `sys_login_log` VALUES ('13', '4', '::1', '1508743580');
INSERT INTO `sys_login_log` VALUES ('14', '4', '::1', '1508751785');
INSERT INTO `sys_login_log` VALUES ('15', '4', '::1', '1508751820');
INSERT INTO `sys_login_log` VALUES ('16', '4', '::1', '1508806589');
INSERT INTO `sys_login_log` VALUES ('17', '4', '::1', '1508807444');
INSERT INTO `sys_login_log` VALUES ('18', '4', '::1', '1508814769');
INSERT INTO `sys_login_log` VALUES ('19', '4', '::1', '1508815244');
INSERT INTO `sys_login_log` VALUES ('20', '4', '::1', '1508816450');
INSERT INTO `sys_login_log` VALUES ('21', '4', '::1', '1509012752');
INSERT INTO `sys_login_log` VALUES ('22', '4', '::1', '1509065011');
INSERT INTO `sys_login_log` VALUES ('23', '4', '::1', '1509073971');
INSERT INTO `sys_login_log` VALUES ('24', '4', '::1', '1509077428');
INSERT INTO `sys_login_log` VALUES ('25', '4', '::1', '1509088579');
INSERT INTO `sys_login_log` VALUES ('26', '4', '::1', '1509091916');
INSERT INTO `sys_login_log` VALUES ('27', '4', '::1', '1509521013');
INSERT INTO `sys_login_log` VALUES ('28', '4', '::1', '1509530998');
INSERT INTO `sys_login_log` VALUES ('29', '4', '::1', '1509585336');
INSERT INTO `sys_login_log` VALUES ('30', '4', '::1', '1509604356');
INSERT INTO `sys_login_log` VALUES ('31', '4', '::1', '1509615293');
INSERT INTO `sys_login_log` VALUES ('32', '4', '::1', '1509677113');
INSERT INTO `sys_login_log` VALUES ('33', '4', '::1', '1509692554');
INSERT INTO `sys_login_log` VALUES ('34', '4', '::1', '1509701966');
INSERT INTO `sys_login_log` VALUES ('35', '4', '::1', '1510622223');
INSERT INTO `sys_login_log` VALUES ('36', '4', '::1', '1510651067');
INSERT INTO `sys_login_log` VALUES ('37', '4', '::1', '1510707170');
INSERT INTO `sys_login_log` VALUES ('38', '4', '::1', '1510730688');
INSERT INTO `sys_login_log` VALUES ('39', '4', '::1', '1510741241');
INSERT INTO `sys_login_log` VALUES ('40', '4', '::1', '1510794111');
INSERT INTO `sys_login_log` VALUES ('41', '4', '::1', '1510825974');
INSERT INTO `sys_login_log` VALUES ('42', '4', '::1', '1510880354');
INSERT INTO `sys_login_log` VALUES ('43', '4', '::1', '1511141140');
INSERT INTO `sys_login_log` VALUES ('44', '4', '::1', '1511167969');
INSERT INTO `sys_login_log` VALUES ('45', '4', '::1', '1511225559');
INSERT INTO `sys_login_log` VALUES ('46', '4', '::1', '1511229926');
INSERT INTO `sys_login_log` VALUES ('47', '4', '::1', '1511235065');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `is_menu` tinyint(1) DEFAULT '1',
  `icon` varchar(20) DEFAULT NULL,
  `pid` int(10) DEFAULT '0',
  `level` tinyint(2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `user_type` varchar(10) DEFAULT NULL,
  `display` char(4) DEFAULT NULL,
  `sort` int(10) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '起始页', '1', 'fa fa-home', '0', '1', '', '', 'pro', 'show', '10');
INSERT INTO `sys_menu` VALUES ('2', '系统管理', '1', 'fa fa-laptop', '0', '1', '', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('3', '内容管理', '1', 'fa fa-folder', '0', '1', '', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('4', '模块管理', '1', 'fa fa-th-large', '0', '1', '', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('7', '我的面板', '1', 'fa fa-list-alt', '1', '2', 'welcome', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('9', '配置组', '1', 'fa fa-cogs', '1', '2', 'config_group', '', 'dev', 'show', '200');
INSERT INTO `sys_menu` VALUES ('10', '配置项', '1', 'fa fa-cog', '1', '2', 'config_item', '', 'dev', 'show', '200');
INSERT INTO `sys_menu` VALUES ('11', '网站配置', '1', 'fa fa-cog', '2', '2', 'config', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('12', '栏目管理', '1', 'fa fa-columns', '3', '2', 'info_category', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('13', '信息管理', '1', 'fa fa-list', '3', '2', 'info', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('14', '模型管理', '1', 'fa fa-codepen', '3', '2', 'info_model', '', 'pro', 'show', '110');
INSERT INTO `sys_menu` VALUES ('15', '幻灯片', '1', 'fa fa-slideshare', '4', '2', 'slide', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('16', '菜单管理', '1', 'fa fa-bars', '1', '2', 'sys_menu', '', 'dev', 'show', '200');
INSERT INTO `sys_menu` VALUES ('17', '角色管理', '1', 'fa fa-users', '2', '2', 'sys_role', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('18', '用户管理', '1', 'fa fa-user', '2', '2', 'sys_user', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('31', '操作日志', '1', 'fa fa-list', '1', '2', 'sys_oplog', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('41', '导航管理', '1', 'fa fa-bars', '4', '2', 'navigation', '', 'pro', 'show', '130');
INSERT INTO `sys_menu` VALUES ('42', '友情链接', '1', 'fa fa-link', '4', '2', 'friendship_link', '', 'pro', 'show', '110');
INSERT INTO `sys_menu` VALUES ('48', '通用字典', '1', 'fa fa-book', '4', '2', 'common_dict', '', 'pro', 'show', '140');
INSERT INTO `sys_menu` VALUES ('50', '广告管理', '1', 'fa fa-image', '3', '2', 'info_category_adv', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('51', '角色权限', '0', 'fa fa-file-text', '17', '3', 'sys_role_auth', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('52', '用户权限', '0', 'fa fa-file-text', '18', '3', 'sys_user_auth', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('53', '文章', '0', 'fa fa-file-text', '13', '3', 'info_article', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('54', '作品', '0', 'fa fa-file-text', '13', '3', 'info_work', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('55', '单页', '0', 'fa fa-file-text', '13', '3', 'info_page', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('56', '标签管理', '1', 'fa fa-tag', '4', '2', 'tag', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('60', '注册用户', '1', 'fa fa-user', '4', '2', 'user', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('61', '评论管理', '1', 'fa fa-comments', '4', '2', 'comment', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('62', '媒体库', '1', 'fa fa-inbox', '4', '2', 'uploads', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('63', 'CRM', '1', 'fa fa-users', '0', '1', '', '', 'pro', 'show', '100');
INSERT INTO `sys_menu` VALUES ('64', '客户管理', '1', 'fa fa-user', '63', '2', 'customer', '', 'pro', 'show', '100');

-- ----------------------------
-- Table structure for sys_menu_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_auth`;
CREATE TABLE `sys_menu_auth` (
  `sys_menu_id` int(10) NOT NULL,
  `sys_menu_auth` varchar(10) NOT NULL
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
INSERT INTO `sys_menu_auth` VALUES ('15', 'look');
INSERT INTO `sys_menu_auth` VALUES ('15', 'del');
INSERT INTO `sys_menu_auth` VALUES ('15', 'update');
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
INSERT INTO `sys_menu_auth` VALUES ('17', 'update');
INSERT INTO `sys_menu_auth` VALUES ('11', 'update');
INSERT INTO `sys_menu_auth` VALUES ('17', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('15', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('41', 'look');
INSERT INTO `sys_menu_auth` VALUES ('41', 'del');
INSERT INTO `sys_menu_auth` VALUES ('41', 'update');
INSERT INTO `sys_menu_auth` VALUES ('41', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('42', 'look');
INSERT INTO `sys_menu_auth` VALUES ('42', 'del');
INSERT INTO `sys_menu_auth` VALUES ('42', 'update');
INSERT INTO `sys_menu_auth` VALUES ('42', 'insert');
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
INSERT INTO `sys_menu_auth` VALUES ('53', 'look');
INSERT INTO `sys_menu_auth` VALUES ('53', 'del');
INSERT INTO `sys_menu_auth` VALUES ('53', 'update');
INSERT INTO `sys_menu_auth` VALUES ('53', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('54', 'look');
INSERT INTO `sys_menu_auth` VALUES ('54', 'del');
INSERT INTO `sys_menu_auth` VALUES ('54', 'update');
INSERT INTO `sys_menu_auth` VALUES ('54', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('51', 'update');
INSERT INTO `sys_menu_auth` VALUES ('52', 'update');
INSERT INTO `sys_menu_auth` VALUES ('55', 'look');
INSERT INTO `sys_menu_auth` VALUES ('55', 'update');
INSERT INTO `sys_menu_auth` VALUES ('56', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('56', 'update');
INSERT INTO `sys_menu_auth` VALUES ('56', 'del');
INSERT INTO `sys_menu_auth` VALUES ('56', 'look');
INSERT INTO `sys_menu_auth` VALUES ('58', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('58', 'update');
INSERT INTO `sys_menu_auth` VALUES ('58', 'del');
INSERT INTO `sys_menu_auth` VALUES ('58', 'look');
INSERT INTO `sys_menu_auth` VALUES ('59', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('59', 'update');
INSERT INTO `sys_menu_auth` VALUES ('59', 'del');
INSERT INTO `sys_menu_auth` VALUES ('59', 'look');
INSERT INTO `sys_menu_auth` VALUES ('60', 'look');
INSERT INTO `sys_menu_auth` VALUES ('60', 'del');
INSERT INTO `sys_menu_auth` VALUES ('60', 'update');
INSERT INTO `sys_menu_auth` VALUES ('60', 'insert');
INSERT INTO `sys_menu_auth` VALUES ('61', 'update');
INSERT INTO `sys_menu_auth` VALUES ('61', 'del');
INSERT INTO `sys_menu_auth` VALUES ('61', 'look');
INSERT INTO `sys_menu_auth` VALUES ('62', 'look');
INSERT INTO `sys_menu_auth` VALUES ('62', 'del');
INSERT INTO `sys_menu_auth` VALUES ('62', 'update');
INSERT INTO `sys_menu_auth` VALUES ('64', 'look');
INSERT INTO `sys_menu_auth` VALUES ('64', 'del');
INSERT INTO `sys_menu_auth` VALUES ('64', 'update');
INSERT INTO `sys_menu_auth` VALUES ('64', 'insert');

-- ----------------------------
-- Table structure for sys_oplog
-- ----------------------------
DROP TABLE IF EXISTS `sys_oplog`;
CREATE TABLE `sys_oplog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `opera` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `browser` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `hostname` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
-- Records of sys_oplog
-- ----------------------------
INSERT INTO `sys_oplog` VALUES ('1', '4', 'xadmin', '幻灯片', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508736880');
INSERT INTO `sys_oplog` VALUES ('2', '4', 'xadmin', '幻灯片', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508737357');
INSERT INTO `sys_oplog` VALUES ('3', '4', 'xadmin', '栏目管理', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508737861');
INSERT INTO `sys_oplog` VALUES ('4', '4', 'xadmin', '栏目管理', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508737932');
INSERT INTO `sys_oplog` VALUES ('5', '4', 'xadmin', '企业官网', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508743603');
INSERT INTO `sys_oplog` VALUES ('6', '4', 'xadmin', '企业官网', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508743616');
INSERT INTO `sys_oplog` VALUES ('7', '4', 'xadmin', '企业官网', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508743626');
INSERT INTO `sys_oplog` VALUES ('8', '4', 'xadmin', '企业官网', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508746960');
INSERT INTO `sys_oplog` VALUES ('9', '4', 'xadmin', '企业官网', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508747009');
INSERT INTO `sys_oplog` VALUES ('10', '4', 'xadmin', '企业官网', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508747039');
INSERT INTO `sys_oplog` VALUES ('11', '4', 'xadmin', '企业官网', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508747159');
INSERT INTO `sys_oplog` VALUES ('12', '4', 'xadmin', '企业官网', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508749042');
INSERT INTO `sys_oplog` VALUES ('13', '4', 'xadmin', '企业官网', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508750654');
INSERT INTO `sys_oplog` VALUES ('14', '4', 'xadmin', '企业官网', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508752717');
INSERT INTO `sys_oplog` VALUES ('15', '4', 'xadmin', '企业官网', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508752900');
INSERT INTO `sys_oplog` VALUES ('16', '4', 'xadmin', '企业官网', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508806674');
INSERT INTO `sys_oplog` VALUES ('17', '4', 'xadmin', '企业官网', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508806707');
INSERT INTO `sys_oplog` VALUES ('18', '4', 'xadmin', '企业官网', 'update', 'success', 'Spartan', '16.16299', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508815446');
INSERT INTO `sys_oplog` VALUES ('19', '4', 'xadmin', '企业官网', 'update', 'success', 'Spartan', '16.16299', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508815455');
INSERT INTO `sys_oplog` VALUES ('20', '4', 'xadmin', '企业官网', 'update', 'success', 'Spartan', '16.16299', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508815462');
INSERT INTO `sys_oplog` VALUES ('21', '4', 'xadmin', '栏目管理', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1508816468');
INSERT INTO `sys_oplog` VALUES ('22', '4', 'xadmin', '用户管理', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509012766');
INSERT INTO `sys_oplog` VALUES ('23', '4', 'xadmin', '菜单管理', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509012815');
INSERT INTO `sys_oplog` VALUES ('24', '4', 'xadmin', '菜单管理', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509012822');
INSERT INTO `sys_oplog` VALUES ('25', '4', 'xadmin', '通用字典', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509013978');
INSERT INTO `sys_oplog` VALUES ('26', '4', 'xadmin', '通用字典', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509014300');
INSERT INTO `sys_oplog` VALUES ('27', '4', 'xadmin', '通用字典', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509014308');
INSERT INTO `sys_oplog` VALUES ('28', '4', 'xadmin', '通用字典', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509014319');
INSERT INTO `sys_oplog` VALUES ('29', '4', 'xadmin', '通用字典', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509014332');
INSERT INTO `sys_oplog` VALUES ('30', '4', 'xadmin', '通用字典', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509014340');
INSERT INTO `sys_oplog` VALUES ('31', '4', 'xadmin', '通用字典', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509014347');
INSERT INTO `sys_oplog` VALUES ('32', '4', 'xadmin', '通用字典', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509014422');
INSERT INTO `sys_oplog` VALUES ('33', '4', 'xadmin', '通用字典', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509014430');
INSERT INTO `sys_oplog` VALUES ('34', '4', 'xadmin', '注册用户', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509017966');
INSERT INTO `sys_oplog` VALUES ('35', '4', 'xadmin', '评论管理', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509065140');
INSERT INTO `sys_oplog` VALUES ('36', '4', 'xadmin', '评论管理', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509075045');
INSERT INTO `sys_oplog` VALUES ('37', '4', 'xadmin', '评论管理', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509075140');
INSERT INTO `sys_oplog` VALUES ('38', '4', 'xadmin', '评论管理', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509075146');
INSERT INTO `sys_oplog` VALUES ('39', '4', 'xadmin', '评论管理', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509075471');
INSERT INTO `sys_oplog` VALUES ('40', '4', 'xadmin', '评论管理', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509076322');
INSERT INTO `sys_oplog` VALUES ('41', '4', 'xadmin', '菜单管理', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509521596');
INSERT INTO `sys_oplog` VALUES ('42', '4', 'xadmin', '菜单管理', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509526479');
INSERT INTO `sys_oplog` VALUES ('43', '4', 'xadmin', '上传文件', 'del', 'fail', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509585816');
INSERT INTO `sys_oplog` VALUES ('44', '4', 'xadmin', '上传文件', 'del', 'fail', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509586105');
INSERT INTO `sys_oplog` VALUES ('45', '4', 'xadmin', '上传文件', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509586243');
INSERT INTO `sys_oplog` VALUES ('46', '4', 'xadmin', '上传文件', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509586250');
INSERT INTO `sys_oplog` VALUES ('47', '4', 'xadmin', '上传文件', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509586707');
INSERT INTO `sys_oplog` VALUES ('48', '4', 'xadmin', '上传文件', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509586788');
INSERT INTO `sys_oplog` VALUES ('49', '4', 'xadmin', '上传文件', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509586812');
INSERT INTO `sys_oplog` VALUES ('50', '4', 'xadmin', '上传文件', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509586843');
INSERT INTO `sys_oplog` VALUES ('51', '4', 'xadmin', '上传文件', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509587402');
INSERT INTO `sys_oplog` VALUES ('52', '4', 'xadmin', '上传文件', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509587415');
INSERT INTO `sys_oplog` VALUES ('53', '4', 'xadmin', '上传文件', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509587427');
INSERT INTO `sys_oplog` VALUES ('54', '4', 'xadmin', '幻灯片', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509604376');
INSERT INTO `sys_oplog` VALUES ('55', '4', 'xadmin', '幻灯片', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509699404');
INSERT INTO `sys_oplog` VALUES ('56', '4', 'xadmin', '幻灯片', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509699419');
INSERT INTO `sys_oplog` VALUES ('57', '4', 'xadmin', '友情链接', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509699460');
INSERT INTO `sys_oplog` VALUES ('58', '4', 'xadmin', '友情链接', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1509699470');
INSERT INTO `sys_oplog` VALUES ('59', '4', 'xadmin', '菜单管理', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510623847');
INSERT INTO `sys_oplog` VALUES ('60', '4', 'xadmin', '菜单管理', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510623871');
INSERT INTO `sys_oplog` VALUES ('61', '4', 'xadmin', '菜单管理', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510623882');
INSERT INTO `sys_oplog` VALUES ('62', '4', 'xadmin', '幻灯片', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510716457');
INSERT INTO `sys_oplog` VALUES ('63', '4', 'xadmin', '幻灯片', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510716463');
INSERT INTO `sys_oplog` VALUES ('64', '4', 'xadmin', '幻灯片', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510716470');
INSERT INTO `sys_oplog` VALUES ('65', '4', 'xadmin', '幻灯片', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510717939');
INSERT INTO `sys_oplog` VALUES ('66', '4', 'xadmin', '幻灯片', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510717951');
INSERT INTO `sys_oplog` VALUES ('67', '4', 'xadmin', '菜单管理', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510826100');
INSERT INTO `sys_oplog` VALUES ('68', '4', 'xadmin', '行业分类', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510881755');
INSERT INTO `sys_oplog` VALUES ('69', '4', 'xadmin', '行业分类', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510882077');
INSERT INTO `sys_oplog` VALUES ('70', '4', 'xadmin', '通用字典', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510883399');
INSERT INTO `sys_oplog` VALUES ('71', '4', 'xadmin', '通用字典', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510883421');
INSERT INTO `sys_oplog` VALUES ('72', '4', 'xadmin', '通用字典', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510883463');
INSERT INTO `sys_oplog` VALUES ('73', '4', 'xadmin', '通用字典', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510883877');
INSERT INTO `sys_oplog` VALUES ('74', '4', 'xadmin', '通用字典', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510884356');
INSERT INTO `sys_oplog` VALUES ('75', '4', 'xadmin', '菜单管理', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510885110');
INSERT INTO `sys_oplog` VALUES ('76', '4', 'xadmin', '通用字典', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510908905');
INSERT INTO `sys_oplog` VALUES ('77', '4', 'xadmin', '通用字典', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510908917');
INSERT INTO `sys_oplog` VALUES ('78', '4', 'xadmin', '通用字典', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510908978');
INSERT INTO `sys_oplog` VALUES ('79', '4', 'xadmin', '通用字典', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510908987');
INSERT INTO `sys_oplog` VALUES ('80', '4', 'xadmin', '通用字典', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510908991');
INSERT INTO `sys_oplog` VALUES ('81', '4', 'xadmin', '通用字典', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510908996');
INSERT INTO `sys_oplog` VALUES ('82', '4', 'xadmin', '通用字典', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510909030');
INSERT INTO `sys_oplog` VALUES ('83', '4', 'xadmin', '客户管理', 'insert', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1510915492');
INSERT INTO `sys_oplog` VALUES ('84', '4', 'xadmin', '评论管理', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1511142405');
INSERT INTO `sys_oplog` VALUES ('85', '4', 'xadmin', '评论管理', 'del', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1511142410');
INSERT INTO `sys_oplog` VALUES ('86', '4', 'xadmin', '客户管理', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1511233018');
INSERT INTO `sys_oplog` VALUES ('87', '4', 'xadmin', '菜单管理', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1511241213');
INSERT INTO `sys_oplog` VALUES ('88', '4', 'xadmin', '菜单管理', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1511241250');
INSERT INTO `sys_oplog` VALUES ('89', '4', 'xadmin', '菜单管理', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1511241270');
INSERT INTO `sys_oplog` VALUES ('90', '4', 'xadmin', '菜单管理', 'update', 'success', 'Chrome', '62.0.3202.62', 'Windows 10', 'DESKTOP-PRO736K', '::1', '1511251857');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `role_type` tinyint(1) DEFAULT '2' COMMENT '角色类型：0=开发者，1=超级管理员【拥有所有生产者的权限】，2=普通管理员',
  `remark` varchar(100) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '1', '拥有所有权限', '100');
INSERT INTO `sys_role` VALUES ('3', '演示', '2', '演示使用', '100');
INSERT INTO `sys_role` VALUES ('4', '开发者', '0', '开发者', '100');

-- ----------------------------
-- Table structure for sys_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_auth`;
CREATE TABLE `sys_role_auth` (
  `role_id` int(10) DEFAULT NULL,
  `sys_menu_id` int(10) DEFAULT NULL,
  `sys_menu_auth` varchar(10) DEFAULT NULL
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
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'del');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'insert');
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'look');
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
INSERT INTO `sys_role_auth` VALUES ('3', '18', 'update');
INSERT INTO `sys_role_auth` VALUES ('3', '57', '');
INSERT INTO `sys_role_auth` VALUES ('3', '58', 'del');
INSERT INTO `sys_role_auth` VALUES ('3', '58', 'insert');
INSERT INTO `sys_role_auth` VALUES ('3', '58', 'look');
INSERT INTO `sys_role_auth` VALUES ('3', '58', 'update');
INSERT INTO `sys_role_auth` VALUES ('3', '59', 'del');
INSERT INTO `sys_role_auth` VALUES ('3', '59', 'insert');
INSERT INTO `sys_role_auth` VALUES ('3', '59', 'look');
INSERT INTO `sys_role_auth` VALUES ('3', '59', 'update');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'update');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'look');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'insert');
INSERT INTO `sys_role_auth` VALUES ('3', '17', 'del');
INSERT INTO `sys_role_auth` VALUES ('3', '11', 'update');
INSERT INTO `sys_role_auth` VALUES ('3', '11', 'look');
INSERT INTO `sys_role_auth` VALUES ('3', '2', '');
INSERT INTO `sys_role_auth` VALUES ('3', '31', 'del');
INSERT INTO `sys_role_auth` VALUES ('3', '1', '');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `user_type` tinyint(1) DEFAULT '2' COMMENT '用户类型：0=开发者，1=系统默认，2=普通',
  `password` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `status` char(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('2', '1', 'admin', '1', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, 'normal');
INSERT INTO `sys_user` VALUES ('3', '3', 'demo', '2', 'e10adc3949ba59abbe56e057f20f883e', 'demo', null, null, 'normal');
INSERT INTO `sys_user` VALUES ('4', '4', 'xadmin', '0', 'e5e0bcfcf67ec6e9a69f38eb060e1cb8', 'Meng Xianghan', '开发者', null, 'normal');

-- ----------------------------
-- Table structure for sys_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_auth`;
CREATE TABLE `sys_user_auth` (
  `user_id` int(10) DEFAULT NULL,
  `sys_menu_id` int(10) DEFAULT NULL,
  `sys_menu_auth` varchar(10) DEFAULT NULL
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='上传文件表';

-- ----------------------------
-- Records of uploads
-- ----------------------------
INSERT INTO `uploads` VALUES ('41', 'ef9c41f43f449c5c6a6f9dadd09b33c0.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20171103/', 'D:/wamp/www/uploads/upload/20171103/ef9c41f43f449c5c6a6f9dadd09b33c0.jpg', '/uploads/upload/20171103/', '/uploads/upload/20171103/ef9c41f43f449c5c6a6f9dadd09b33c0.jpg', 'ef9c41f43f449c5c6a6f9dadd09b33c0', '/uploads/upload/20171103/ef9c41f43f449c5c6a6f9dadd09b33c0', 'ef9c41f43f449c5c6a6f9dadd09b33c0.jpg', 'datika2.jpg', '.jpg', '163.38', '1', '127', '127', 'jpeg', 'width=\"1189\" height=\"1683\"', null, '1509699403');
INSERT INTO `uploads` VALUES ('42', '08252d6c80d4614cb786917f662f2e4b.jpg', 'image/jpeg', 'D:/wamp/www/uploads/upload/20171103/', 'D:/wamp/www/uploads/upload/20171103/08252d6c80d4614cb786917f662f2e4b.jpg', '/uploads/upload/20171103/', '/uploads/upload/20171103/08252d6c80d4614cb786917f662f2e4b.jpg', '08252d6c80d4614cb786917f662f2e4b', '/uploads/upload/20171103/08252d6c80d4614cb786917f662f2e4b', '08252d6c80d4614cb786917f662f2e4b.jpg', 'datika3.jpg', '.jpg', '163.16', '1', '127', '127', 'jpeg', 'width=\"1189\" height=\"1683\"', null, '1509699418');
INSERT INTO `uploads` VALUES ('43', '1a0928d8a8f5627b91e10a2b1e32929c.png', 'image/png', 'D:/wamp/www/uploads/upload/20171115/', 'D:/wamp/www/uploads/upload/20171115/1a0928d8a8f5627b91e10a2b1e32929c.png', '/uploads/upload/20171115/', '/uploads/upload/20171115/1a0928d8a8f5627b91e10a2b1e32929c.png', '1a0928d8a8f5627b91e10a2b1e32929c', '/uploads/upload/20171115/1a0928d8a8f5627b91e10a2b1e32929c', '1a0928d8a8f5627b91e10a2b1e32929c.png', 'logo.png', '.png', '230.79', '1', '127', '127', 'png', 'width=\"1904\" height=\"420\"', null, '1510716454');
