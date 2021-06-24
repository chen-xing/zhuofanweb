-- --------------------------------------------------------
-- 主机:                           47.110.65.148
-- 服务器版本:                        5.7.17 - MySQL Community Server (GPL)
-- 服务器操作系统:                      linux-glibc2.5
-- HeidiSQL 版本:                  9.5.0.5295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 zhuofanweb 的数据库结构
CREATE DATABASE IF NOT EXISTS `zhuofanweb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `zhuofanweb`;

-- 导出  表 zhuofanweb.it_news 结构
CREATE TABLE IF NOT EXISTS `it_news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `newsUuid` varchar(32) NOT NULL DEFAULT '' COMMENT 'uuid',
  `title` varchar(400) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(400) NOT NULL DEFAULT '' COMMENT '网址',
  `read_times` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `news_type` int(11) NOT NULL DEFAULT '0' COMMENT '1、csdn 2、博客园 3、开源中国 4、知乎',
  `news_biz_id` varchar(100) NOT NULL DEFAULT '0' COMMENT '新闻的业务id',
  `gmt_create` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `gmt_modify` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `news_biz_id` (`news_biz_id`),
  KEY `read_times` (`read_times`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8 COMMENT='it新闻';

-- 正在导出表  zhuofanweb.it_news 的数据：~49 rows (大约)
/*!40000 ALTER TABLE `it_news` DISABLE KEYS */;
INSERT IGNORE INTO `it_news` (`id`, `newsUuid`, `title`, `url`, `read_times`, `news_type`, `news_biz_id`, `gmt_create`, `gmt_modify`) VALUES
	(93, '89736662', '\n在萧山公安的5年运维', 'https://blog.csdn.net/sxper/article/details/89736662#commentBox', 1, 0, 'csdn_89736662', '2019-05-25 19:30:09.766', '2019-05-25 19:30:09.766'),
	(94, '90300070', '\nAndroid架构——MVP架构一点理解', 'https://blog.csdn.net/weixin_43499030/article/details/90300070#commentBox', 0, 0, 'csdn_90300070', '2019-05-25 19:30:09.779', '2019-05-25 19:30:09.779'),
	(95, '90298289', '\njava中的各种架构', 'https://blog.csdn.net/weixin_38911591/article/details/90298289#commentBox', 1, 0, 'csdn_90298289', '2019-05-25 19:30:09.793', '2019-05-25 19:30:09.793'),
	(96, '89711402', '\n大数据架构中的lambda架构以及unifield架构', 'https://blog.csdn.net/yoggieCDA/article/details/89711402#commentBox', 2, 0, 'csdn_89711402', '2019-05-25 19:30:09.927', '2019-05-25 19:30:09.927'),
	(97, '90109265', '\n【游戏开发】天龙八部小demo', 'https://blog.csdn.net/qq_23996157/article/details/90109265#commentBox', 0, 0, 'csdn_90109265', '2019-05-25 19:30:09.941', '2019-05-25 19:30:09.941'),
	(98, '90473846', '\n关于架构的思考之一：架构的定义及目的', 'https://blog.csdn.net/haponchang/article/details/90473846#commentBox', 0, 0, 'csdn_90473846', '2019-05-25 19:30:09.951', '2019-05-25 19:30:09.951'),
	(99, '90342650', '\n从零开始学架构——架构基础', 'https://blog.csdn.net/u013159507/article/details/90342650#commentBox', 0, 0, 'csdn_90342650', '2019-05-25 19:30:09.966', '2019-05-25 19:30:09.966'),
	(100, '89849447', '\nLNMP架构详解（1）——了解架构的基本信息', 'https://blog.csdn.net/meltsnow/article/details/89849447#commentBox', 0, 0, 'csdn_89849447', '2019-05-25 19:30:09.978', '2019-05-25 19:30:09.978'),
	(101, '89711651', '\n大数据架构中的流式架构和Kappa架构', 'https://blog.csdn.net/yoggieCDA/article/details/89711651#commentBox', 0, 0, 'csdn_89711651', '2019-05-25 19:30:09.990', '2019-05-25 19:30:09.990'),
	(102, '90401081', '\n【Android游戏开发】登录以及支付SDK总结', 'https://blog.csdn.net/qq_30054199/article/details/90401081#commentBox', 0, 0, 'csdn_90401081', '2019-05-25 19:30:10.009', '2019-05-25 19:30:10.009'),
	(103, 'xx', '【面试】如果你这样回答“什么是线程安全”，面试官都会对你刮目相看', 'https://www.cnblogs.com/lixinjie/p/10817860.html', 10782, 1, 'cnblogs_xx', '2019-05-25 19:30:10.201', '2019-05-25 19:30:10.201'),
	(104, 'xx', '【面试】迄今为止把同步/异步/阻塞/非阻塞/BIO/NIO/AIO讲的这么清楚的好文章（快快珍藏）', 'https://www.cnblogs.com/lixinjie/p/10811219.html', 9955, 1, 'cnblogs_xx', '2019-05-25 19:30:10.215', '2019-05-25 19:30:10.215'),
	(105, 'xx', '为啥程序会有bug？', 'https://www.cnblogs.com/Zachary-Fan/p/10582230.html', 7995, 1, 'cnblogs_xx', '2019-05-25 19:30:10.344', '2019-05-25 19:30:10.344'),
	(106, 'xx', '关于分布式锁原理的一些学习与思考-redis分布式锁，zookeeper分布式锁', 'https://www.cnblogs.com/JJJ1990/p/10496850.html', 7328, 1, 'cnblogs_xx', '2019-05-25 19:30:10.359', '2019-05-25 19:30:10.359'),
	(107, 'xx', 'ERP不规范，同事两行泪', 'https://www.cnblogs.com/chuma/p/10457878.html', 13102, 1, 'cnblogs_xx', '2019-05-25 19:30:10.368', '2019-05-25 19:30:10.368'),
	(108, 'xx', '只有程序员才能读懂的西游记', 'https://www.cnblogs.com/popsuper1982/p/10329438.html', 15083, 1, 'cnblogs_xx', '2019-05-25 19:30:10.379', '2019-05-25 19:30:10.379'),
	(109, 'xx', '从软件工程的角度解读任正非的新年公开信', 'https://www.cnblogs.com/dotey/p/10220520.html', 15563, 1, 'cnblogs_xx', '2019-05-25 19:30:10.393', '2019-05-25 19:30:10.393'),
	(110, 'xx', '通俗易懂，C#如何安全、高效地玩转任何种类的内存之Span的本质(一)。', 'https://www.cnblogs.com/justmine/p/10006621.html', 8646, 1, 'cnblogs_xx', '2019-05-25 19:30:10.408', '2019-05-25 19:30:10.408'),
	(111, 'xx', '分布式系统关注点——99%的人都能看懂的「熔断」以及最佳实践', 'https://www.cnblogs.com/Zachary-Fan/p/9976197.html', 11989, 1, 'cnblogs_xx', '2019-05-25 19:30:10.540', '2019-05-25 19:30:10.540'),
	(112, 'xx', '神经网络的基本工作原理', 'https://www.cnblogs.com/ms-uap/p/9928254.html', 15872, 1, 'cnblogs_xx', '2019-05-25 19:30:10.551', '2019-05-25 19:30:10.551'),
	(113, '90477001', '\n【重磅】微软正式宣布.NET5支持跨平台、移动开发', 'https://blog.csdn.net/zhenghhgz/article/details/90477001#commentBox', 0, 0, 'csdn_90477001', '2019-05-26 20:27:48.664', '2019-05-26 20:27:48.664'),
	(114, '89636641', '\nAS的Debug的一些常用的功能', 'https://blog.csdn.net/xueyoubangbang/article/details/89636641#commentBox', 0, 0, 'csdn_89636641', '2019-05-26 20:27:48.680', '2019-05-26 20:27:48.680'),
	(115, '89765536', '\n大数据与云计算、物联网有什么关系？大数据的几种应用前景分析', 'https://blog.csdn.net/dashujvyu/article/details/89765536#commentBox', 0, 0, 'csdn_89765536', '2019-05-26 20:27:48.693', '2019-05-26 20:27:48.693'),
	(116, '90118552', '\n面试移动开发实习生失败后，我对自己重新的定位', 'https://blog.csdn.net/yanyang633/article/details/90118552#commentBox', 4, 0, 'csdn_90118552', '2019-05-26 20:27:48.710', '2019-05-26 20:27:48.710'),
	(117, '89813983', '\n仿QQ登录、记住密码等功能实现', 'https://blog.csdn.net/weixin_43849104/article/details/89813983#commentBox', 0, 0, 'csdn_89813983', '2019-05-26 20:27:48.723', '2019-05-26 20:27:48.723'),
	(118, '89788700', '\nAndroid复盘——你真的了解setContentView吗？', 'https://blog.csdn.net/nenguou04/article/details/89788700#commentBox', 0, 0, 'csdn_89788700', '2019-05-26 20:27:48.734', '2019-05-26 20:27:48.734'),
	(119, '89678862', '\nGerrit（2）图形介绍', 'https://blog.csdn.net/wxt15708432837/article/details/89678862#commentBox', 1, 0, 'csdn_89678862', '2019-05-26 20:27:48.744', '2019-05-26 20:27:48.744'),
	(120, '90168067', '\n大数据与云计算：进入技术爆发期', 'https://blog.csdn.net/qq_38459998/article/details/90168067#commentBox', 1, 0, 'csdn_90168067', '2019-05-26 20:27:48.760', '2019-05-26 20:27:48.760'),
	(121, '90369570', '\n10个Web移动开发JavaScript框架', 'https://blog.csdn.net/weixin_44786530/article/details/90369570#commentBox', 0, 0, 'csdn_90369570', '2019-05-26 20:27:48.772', '2019-05-26 20:27:48.772'),
	(122, '90410145', '\n20年研发管理经验谈（一）', 'https://blog.csdn.net/weixin_39759846/article/details/90410145#commentBox', 0, 0, 'csdn_90410145', '2019-05-26 20:27:48.783', '2019-05-26 20:27:48.783'),
	(153, '89850607', '\n区块链-区块链特点', 'https://blog.csdn.net/qq_40452317/article/details/89850607#commentBox', 4, 0, 'csdn_89850607', '2019-05-28 20:06:22.535', '2019-05-28 20:06:22.535'),
	(154, '89788056', '\n区块链-区块链的概念', 'https://blog.csdn.net/qq_40452317/article/details/89788056#commentBox', 1, 0, 'csdn_89788056', '2019-05-28 20:06:22.549', '2019-05-28 20:06:22.549'),
	(155, '90550290', '\n区块链-区块链分叉', 'https://blog.csdn.net/qq_40452317/article/details/90550290#commentBox', 0, 0, 'csdn_90550290', '2019-05-28 20:06:22.561', '2019-05-28 20:06:22.561'),
	(156, '90375396', '\n《小岛区块链》之区块链起源', 'https://blog.csdn.net/weixin_44693781/article/details/90375396#commentBox', 0, 0, 'csdn_90375396', '2019-05-28 20:06:22.574', '2019-05-28 20:06:22.574'),
	(157, '89874505', '\n区块链-区块链分类', 'https://blog.csdn.net/qq_40452317/article/details/89874505#commentBox', 0, 0, 'csdn_89874505', '2019-05-28 20:06:22.586', '2019-05-28 20:06:22.586'),
	(158, '90510984', '\n区块链-构造区块链头', 'https://blog.csdn.net/qq_40452317/article/details/90510984#commentBox', 0, 0, 'csdn_90510984', '2019-05-28 20:06:22.599', '2019-05-28 20:06:22.599'),
	(159, '89811660', '\n区块链学习（三）区块链实例', 'https://blog.csdn.net/qq_34874784/article/details/89811660#commentBox', 1, 0, 'csdn_89811660', '2019-05-28 20:06:22.612', '2019-05-28 20:06:22.612'),
	(160, '89850431', '\n区块链-对区块链认识的误区', 'https://blog.csdn.net/qq_40452317/article/details/89850431#commentBox', 0, 0, 'csdn_89850431', '2019-05-28 20:06:22.625', '2019-05-28 20:06:22.625'),
	(161, '90291186', '\n轻松学习区块链2-简单区块链的实现', 'https://blog.csdn.net/wanghao72214/article/details/90291186#commentBox', 0, 0, 'csdn_90291186', '2019-05-28 20:06:22.638', '2019-05-28 20:06:22.638'),
	(162, '90349561', '\n轻松学习区块链4-区块链浏览器与人机交互', 'https://blog.csdn.net/wanghao72214/article/details/90349561#commentBox', 0, 0, 'csdn_90349561', '2019-05-28 20:06:22.650', '2019-05-28 20:06:22.650'),
	(193, '90638829', '\n20年研发管理经验谈（二）', 'https://blog.csdn.net/weixin_39759846/article/details/90638829#commentBox', 0, 0, 'csdn_90638829', '2019-05-30 14:05:04.912', '2019-05-30 14:05:04.912'),
	(195, '89397121', '\nCODING如何使用CODING研发管理统来敏捷开发', 'https://blog.csdn.net/u011078141/article/details/89397121#commentBox', 1, 0, 'csdn_89397121', '2019-05-30 14:05:04.927', '2019-05-30 14:05:04.927'),
	(196, '90638536', '\n【物联网】物联网数据分析与可视化', 'https://blog.csdn.net/lsj960922/article/details/90638536#commentBox', 0, 0, 'csdn_90638536', '2019-05-30 14:05:04.934', '2019-05-30 14:05:04.934'),
	(197, '90639366', '\n【物联网】阿里云物联网应用托管', 'https://blog.csdn.net/lsj960922/article/details/90639366#commentBox', 0, 0, 'csdn_90639366', '2019-05-30 14:05:04.940', '2019-05-30 14:05:04.940'),
	(198, '90405912', '\n【物联网】物联网安全---编辑中', 'https://blog.csdn.net/bandaoyu/article/details/90405912#commentBox', 1, 0, 'csdn_90405912', '2019-05-30 14:05:04.949', '2019-05-30 14:05:04.949'),
	(199, '90454104', '\n物联网卡在物联网中，主要有哪些作用？', 'https://blog.csdn.net/duozhishidai/article/details/90454104#commentBox', 0, 0, 'csdn_90454104', '2019-05-30 14:05:04.957', '2019-05-30 14:05:04.957'),
	(200, '90295100', '\n【物联网】物联网平台开发全栈教程', 'https://blog.csdn.net/lsj960922/article/details/90295100#commentBox', 0, 0, 'csdn_90295100', '2019-05-30 14:05:04.971', '2019-05-30 14:05:04.971'),
	(201, '90412011', '\n认识阿里云物联网与物联网项目的开发流程', 'https://blog.csdn.net/pengpengjy/article/details/90412011#commentBox', 0, 0, 'csdn_90412011', '2019-05-30 14:05:04.977', '2019-05-30 14:05:04.977'),
	(202, '89845792', '\n物联网卡到底是不是“坑”', 'https://blog.csdn.net/qq_40798435/article/details/89845792#commentBox', 3, 0, 'csdn_89845792', '2019-05-30 14:05:04.987', '2019-05-30 14:05:04.987');
/*!40000 ALTER TABLE `it_news` ENABLE KEYS */;

-- 导出  表 zhuofanweb.web_category 结构
CREATE TABLE IF NOT EXISTS `web_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gmt_create` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `gmt_modify` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='网址分类';

-- 正在导出表  zhuofanweb.web_category 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `web_category` DISABLE KEYS */;
INSERT IGNORE INTO `web_category` (`id`, `uuid`, `name`, `sort`, `deleted`, `gmt_create`, `gmt_modify`) VALUES
	(1, 'ffa87bb015a746fd82a7d2f88125aaea', '常用推荐', 1, 0, '2019-04-04 22:22:35.987', '2019-04-04 22:56:32.929'),
	(2, 'abe3f41e2de741b4a0195365483ec416', '大前端', 2, 0, '2019-04-04 22:22:40.900', '2019-04-04 22:56:32.942'),
	(3, '089800db9bbf40bbbd1a2b66b69cdc86', '大后端', 3, 0, '2019-04-04 22:23:36.398', '2019-04-04 22:56:32.956'),
	(4, '40c8aafdae324812b1c7cc5f8d35cc2b', '产品设计', 4, 0, '2019-04-04 22:23:47.335', '2019-04-04 22:56:32.968'),
	(5, '9ee38897022d42c696971af4ed516c18', '优秀博客', 5, 0, '2019-04-04 22:23:57.838', '2019-04-04 22:56:32.980'),
	(6, 'a97e84eaabc148efa2601526ba83c41b', '推荐工具', 6, 0, '2019-04-04 22:24:08.233', '2019-04-04 22:56:32.992'),
	(7, '2a4d4cfd64204237bbd66f743231ef14', '测试', 1, 0, '2019-04-10 19:21:59.293', '2019-04-10 19:46:49.742');
/*!40000 ALTER TABLE `web_category` ENABLE KEYS */;

-- 导出  表 zhuofanweb.web_url 结构
CREATE TABLE IF NOT EXISTS `web_url` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(200) NOT NULL DEFAULT '',
  `url` varchar(300) NOT NULL DEFAULT '',
  `description` varchar(300) NOT NULL DEFAULT '',
  `ico_image` varchar(300) NOT NULL DEFAULT '',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `web_category_uuid` varchar(32) NOT NULL DEFAULT '',
  `inner_url` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `template_url` varchar(300) NOT NULL DEFAULT '',
  `gmt_create` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `gmt_modify` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`),
  KEY `web_category_uuid` (`web_category_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='网址详情';

-- 正在导出表  zhuofanweb.web_url 的数据：~67 rows (大约)
/*!40000 ALTER TABLE `web_url` DISABLE KEYS */;
INSERT IGNORE INTO `web_url` (`id`, `uuid`, `title`, `url`, `description`, `ico_image`, `sort`, `deleted`, `web_category_uuid`, `inner_url`, `template_url`, `gmt_create`, `gmt_modify`) VALUES
	(1, '56ddb984d02649be81bbaf00ec8c5bae', '\r\n风清扬', 'https://www.hujiangtao.cn/', 'Full-time UI designer\r\n                                                        with an enduring interest in Coding.', 'https://static.hujiangtao.cn/static/2019/01/16/mu_320x320.jpg', 1, 1, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:45.867', '2019-04-06 15:59:51.070'),
	(2, 'ad7f36b244c04721b655a6f67583e8fc', '\r\njson格式化', '/json', 'json格式化', 'https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/apple.svg', 2, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, 'json/json', '2019-04-04 22:29:45.925', '2019-04-06 21:44:18.095'),
	(3, '249771a611ce4e4cbeaa010077cb7f9c', '\r\nyaml转json', '/yamltojson', 'yaml转json', 'https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/ok.svg', 3, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, 'yaml/yamltojson', '2019-04-04 22:29:45.980', '2019-04-10 13:14:56.897'),
	(4, '72f159f05cc448ccbc380b2172293d8c', '\r\nyaml与propertity互转', '/yamlpropertityl', 'yaml与propertity互转', 'https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/twitter.svg', 4, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, 'yaml/yamlpropertity', '2019-04-04 22:29:46.041', '2019-04-06 21:45:09.921'),
	(5, 'fae129fa1db54434a735070e68c0d8d0', '\r\n图片转base64', '/base64', '图片转base64', 'https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/blogger.svg', 5, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, 'base64/base64', '2019-04-04 22:29:46.126', '2019-04-06 21:45:49.233'),
	(6, 'a7043dd4143547138b57a11d2749b2b9', '\r\nGitHub', 'https://github.com/', '全球最大的程序员交友社区', 'https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/github.svg', 6, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:46.212', '2019-04-06 15:59:51.739'),
	(7, '046695d515204b99978798c377f3fc05', '\r\nStack Overflow', 'https://stackoverflow.com/', '优秀的程序员问答网站', 'https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/stackoverflow.svg', 7, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:46.302', '2019-04-06 15:59:51.849'),
	(8, '2da78bc0b8da4017aa41c960069dc39d', '\r\nGoogle', 'https://www.google.com', '伟大的Google', 'https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/google.svg', 8, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:46.403', '2019-04-06 15:59:51.979'),
	(9, 'b5e9eae7a36545a88ab7fafa219d24a7', '\r\nWikipedia', 'https://www.wikipedia.org/', '自由的百科全書，目前全网最大且最受大众欢迎的wiki手册', 'https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/wikipedia.svg', 9, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:46.522', '2019-04-06 15:59:52.089'),
	(10, '1d7152eb14914f81a4e124dc7a0f9b7b', '\r\nSegmentFault 思否', 'https://segmentfault.com', '每月帮助 1000 万开发者解决技术问题', 'https://static.hujiangtao.cn/static/2019/01/16/segmentfault.svg', 10, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:46.661', '2019-04-06 15:59:52.219'),
	(11, '5e9928674fc646c29d28469ad568a1fe', '\r\n百度', 'https://www.baidu.com', '最大的中文搜索引擎', 'https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/baidu.svg', 11, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:46.802', '2019-04-06 15:59:52.314'),
	(12, 'f5302b42fe114e3c85ff13d847d000cb', '\r\nIBM Developer', 'https://www.ibm.com/developerworks/cn/topics/', 'IBM技术文档', 'https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/ibm.svg', 12, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:46.947', '2019-04-06 15:59:52.439'),
	(13, '437d808335c8499092cea69ba9d3e1cf', '\r\n简书', 'https://www.jianshu.com/', '优质的创作社区', 'https://static.hujiangtao.cn/static/2019/01/16/jianshu.png', 13, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:47.103', '2019-04-06 15:59:52.569'),
	(14, '75da836ddc934cdca627bd87ff99d5e8', '\r\n知乎', 'https://www.zhihu.com/', '中文知识问答网站，有问题，上知乎，发现更大的世界', 'https://static.hujiangtao.cn/static/2019/01/15/zhihu.svg', 14, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:47.288', '2019-04-06 15:59:52.714'),
	(15, 'b106635cf3d24c9998b4532535d3cef0', '\r\n云栖社区', 'https://yq.aliyun.com/', '阿里云面向开发者的开放型技术平台', 'https://static.hujiangtao.cn/static/2019/01/16/aliyun.svg', 15, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:47.460', '2019-04-06 15:59:52.829'),
	(16, 'af1418a58a2e453f9b2d0d4b27efc229', '\r\n云+社区', 'https://cloud.tencent.com/developer', '来自腾讯的开发者技术分享社区', 'https://static.hujiangtao.cn/static/2019/01/16/tencent-cloud.svg', 16, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:47.643', '2019-04-06 15:59:52.919'),
	(17, '56f981fa746048df9be6d03ec7baf8d6', '\r\n博客园', 'https://www.cnblogs.com/', '一个面向开发者的知识分享社区', 'https://static.hujiangtao.cn/static/2019/01/16/cnblogs.svg', 17, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:47.836', '2019-04-06 15:59:53.034'),
	(18, '18588ae574ab4808858aa59146ff6cd6', '\r\nCSDN', 'https://www.csdn.net/', '早期的专业IT技术社区', 'https://static.hujiangtao.cn/static/2019/01/16/csdn.svg', 18, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:48.020', '2019-04-06 15:59:53.139'),
	(19, 'c932985d16de41d49b4b9a7f2d098f84', '\r\n开源中国', 'https://www.oschina.net/', '目前中国最大的开源技术社区，已收录近五万款开源软件', 'https://static.hujiangtao.cn/static/2019/01/16/oschina.svg', 19, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:48.245', '2019-04-06 15:59:53.239'),
	(20, '4eae3b95e2f748dcbf24b86f264cc597', '\r\nGit Doc', 'https://git-scm.com/doc', 'Git手册', 'https://static.hujiangtao.cn/static/2019/01/16/git-orange.png', 20, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:48.435', '2019-04-06 15:59:53.339'),
	(21, '51178336123840c9a9fdab82cb4ef387', '\r\n搜狗微信搜索', 'https://weixin.sogou.com/', '微信公众号，精彩内容独家收录，一搜即达', 'https://static.hujiangtao.cn/static/2019/01/16/sogou.svg', 21, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-04-04 22:29:48.654', '2019-04-06 15:59:53.434'),
	(22, 'd8dae591e9b5446f8c379e2f329a8c8c', '\r\nMDN Web 文档', 'https://developer.mozilla.org/zh-CN/', '提供开放网络（Open\r\n                                            Web）技术有关的信息，包括用于网站和渐进式网络应用的 HTML、CSS 和 API', 'https://static.hujiangtao.cn/static/2019/01/16/mozilla-mdn.png', 22, 0, 'abe3f41e2de741b4a0195365483ec416', 0, '', '2019-04-04 22:29:48.903', '2019-04-06 15:59:53.549'),
	(23, '1d6287cb70404b1f9e6112ff1b22bf86', '\r\nReact', 'https://reactjs.org/', 'React官网', 'https://static.hujiangtao.cn/static/2019/01/16/React.svg', 23, 0, 'abe3f41e2de741b4a0195365483ec416', 0, '', '2019-04-04 22:29:49.123', '2019-04-06 15:59:53.639'),
	(24, '9e90daa23a4547c584f09221a3625f6c', '\r\nVue', 'https://vuejs.org/index.html', 'Vue 官网', 'https://static.hujiangtao.cn/static/2019/01/16/Vue.svg', 24, 0, 'abe3f41e2de741b4a0195365483ec416', 0, '', '2019-04-04 22:29:49.344', '2019-04-06 15:59:53.754'),
	(25, 'dae41e426fef4f0b9e61989bec067b7b', '\r\nBootstrap', 'https://getbootstrap.com/', 'Bootstrap 官网', 'https://static.hujiangtao.cn/static/2019/01/16/Bootstrap.svg', 25, 0, 'abe3f41e2de741b4a0195365483ec416', 0, '', '2019-04-04 22:29:49.548', '2019-04-06 15:59:53.869'),
	(26, '316c9a2b81974dcba8711730f4c08159', '\r\njQuery', 'https://jquery.com/', 'jQuery 官网', 'https://static.hujiangtao.cn/static/2019/01/16/jQuery.svg', 26, 0, 'abe3f41e2de741b4a0195365483ec416', 0, '', '2019-04-04 22:29:49.750', '2019-04-06 15:59:53.980'),
	(27, '0efbe3ad199f4e4e84fbfcf186a50acb', '\r\nMaterial Design', 'https://material.io/design/', 'Material Design 设计官网', 'https://static.hujiangtao.cn/static/2019/01/16/material-design-lite.svg', 27, 0, 'abe3f41e2de741b4a0195365483ec416', 0, '', '2019-04-04 22:29:49.943', '2019-04-06 15:59:54.089'),
	(28, 'bd77fb2d46ec46fc904b3a94c8872161', '\r\nwebpack', 'https://webpack.js.org/', '一个模块打包器，打包所有的资源', 'https://static.hujiangtao.cn/static/2019/01/16/Webpack.svg', 28, 0, 'abe3f41e2de741b4a0195365483ec416', 0, '', '2019-04-04 22:29:50.136', '2019-04-06 15:59:54.189'),
	(29, 'b96f66a3ecf34c349085a3acb158df9d', '\r\nD3.js', 'https://d3js.org/', '流行的数据可视化利器', 'https://static.hujiangtao.cn/static/2019/01/16/d3js.svg', 29, 0, 'abe3f41e2de741b4a0195365483ec416', 0, '', '2019-04-04 22:29:50.325', '2019-04-06 15:59:54.299'),
	(30, '82f0c20cd81f48f48218db7d532ff5bd', '\r\n掘金', 'https://juejin.im/timeline', '一个帮助开发者成长的社区，较多的技术文章', 'https://static.hujiangtao.cn/static/2019/01/16/juejin.svg', 30, 0, 'abe3f41e2de741b4a0195365483ec416', 0, '', '2019-04-04 22:29:50.521', '2019-04-06 15:59:54.394'),
	(31, '64d33f2b21e840fb9c3a359826d77d2b', '\r\n印记中文', 'https://docschina.org/', '国外前端开发文档中文版镜像', 'https://static.hujiangtao.cn/static/2019/01/16/docschina.png', 31, 0, 'abe3f41e2de741b4a0195365483ec416', 0, '', '2019-04-04 22:29:50.735', '2019-04-06 15:59:54.489'),
	(32, '94cde942277845b8974a15e42c7fd7a2', '\r\nAlloyTeam', 'https://www.alloyteam.com/', '腾讯全端AlloyTeam团队，主要是Web', 'https://static.hujiangtao.cn/static/2019/01/16/alloyteam.png', 32, 0, 'abe3f41e2de741b4a0195365483ec416', 0, '', '2019-04-04 22:29:50.932', '2019-04-06 15:59:54.599'),
	(33, 'd6ad740a19e24ca79b6c3dfa6c238441', '\r\nTaobao FED', 'https://taobaofed.org/', '淘宝前端团队', 'https://static.webppx.com/static/2019/01/23/fed-logo.svg', 33, 0, 'abe3f41e2de741b4a0195365483ec416', 0, '', '2019-04-04 22:29:51.105', '2019-04-07 15:37:45.150'),
	(34, 'fe4f4b22e55f44b59ea39d38c93735de', '\r\n奇舞团', 'https://75team.com/', '奇虎360最大的前端团队', 'https://75team.com/static/upload/20170523/favicon.ico', 34, 0, 'abe3f41e2de741b4a0195365483ec416', 0, '', '2019-04-04 22:29:51.312', '2019-04-06 15:59:54.780'),
	(35, 'b2faedd15d5d4514b30cd2043461b80c', '\r\nJDC | 京东设计中心', 'https://jdc.jd.com/', '关注于电子商务视觉设计、交互设计、用户研究、前端开发', 'https://static.hujiangtao.cn/static/2019/01/16/JD.svg', 35, 0, 'abe3f41e2de741b4a0195365483ec416', 0, '', '2019-04-04 22:29:51.496', '2019-04-06 15:59:54.889'),
	(36, 'bad425cf69ed4e3584e12823f69f142b', '\r\n美团技术团队', 'https://tech.meituan.com/', '美团技术团队博客', 'https://static.hujiangtao.cn/static/2019/01/16/meituan-tech-180x180.png', 36, 0, '089800db9bbf40bbbd1a2b66b69cdc86', 0, '', '2019-04-04 22:29:51.672', '2019-04-06 15:59:54.989'),
	(37, '2e6e64318b1b481dbc83baa51ebbf8d4', '\r\n腾讯游戏DBA团队', 'https://tencentdba.com/', '\r\n                                            腾讯dba官方博客，游戏数据库服务，游戏云存储平台，tmysql，tspider，tmysqlparse开发维护', 'https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/qq.svg', 37, 0, '089800db9bbf40bbbd1a2b66b69cdc86', 0, '', '2019-04-04 22:29:51.866', '2019-04-06 15:59:55.114'),
	(38, '0d324ab33a62454dbba7dbc74da6f011', '\r\n运维生存时间', 'https://www.ttlsa.com/', 'Linux系统教程,运维经验分享', 'https://static.hujiangtao.cn/static/2019/01/16/ttlsa.png', 38, 0, '089800db9bbf40bbbd1a2b66b69cdc86', 0, '', '2019-04-04 22:29:52.060', '2019-04-06 15:59:55.220'),
	(39, '9e482dcfdb574afba539a2bc3b42d2ff', '\r\nIconFont', 'https://www.iconfont.cn/', '阿里矢量图标库，且提供矢量图标下载、在线存储、格式转换等功能', 'https://static.hujiangtao.cn/static/2019/01/16/iconfont.png', 39, 0, '40c8aafdae324812b1c7cc5f8d35cc2b', 0, '', '2019-04-04 22:29:52.277', '2019-04-06 15:59:55.319'),
	(40, '8f9e66c2c94a441fb08757599e26a1e2', '\r\nIconfinder', 'https://www.iconfinder.com/', '高质量付费图标下载', 'https://static.hujiangtao.cn/static/2019/01/16/iconfinder.png', 40, 0, '40c8aafdae324812b1c7cc5f8d35cc2b', 0, '', '2019-04-04 22:29:52.511', '2019-04-06 15:59:55.419'),
	(41, '699fd752463641d68bb8bcb57c6fa8b1', '\r\n百度脑图', 'https://naotu.baidu.com/', '百度在线脑图工具，使用方便', 'https://static.hujiangtao.cn/static/2019/01/16/baidu-naotu.png', 41, 0, '40c8aafdae324812b1c7cc5f8d35cc2b', 0, '', '2019-04-04 22:29:52.745', '2019-04-06 15:59:55.529'),
	(42, '2e3d04c1aaca47d289ec19b359b2db8e', '\r\n木先生', 'https://www.hujiangtao.cn', '木先生的个人网站', 'https://static.hujiangtao.cn/static/2019/01/16/mu_320x320.jpg', 42, 0, '9ee38897022d42c696971af4ed516c18', 0, '', '2019-04-04 22:29:52.979', '2019-04-06 15:59:55.639'),
	(43, '2c1866db0bee47d09ff49d7637730bf5', '\r\n阮一峰', 'https://www.ruanyifeng.com/blog/', '阮一峰的网络日志', 'https://static.hujiangtao.cn/static/2019/01/16/ruanyifeng.png', 43, 0, '9ee38897022d42c696971af4ed516c18', 0, '', '2019-04-04 22:29:53.199', '2019-04-06 15:59:55.729'),
	(44, '3b2977d5eb7c46cbb9b075a8469cc2fb', '\r\n张鑫旭', 'https://www.zhangxinxu.com/', '张鑫旭的个人博客，腾讯阅文集团前端', 'https://www.zhangxinxu.com/favicon.ico', 44, 0, '9ee38897022d42c696971af4ed516c18', 0, '', '2019-04-04 22:29:53.413', '2019-04-06 15:59:55.835'),
	(45, '30364387840c445881268fc6b80560d2', '\r\n静觅 - 崔庆才', 'https://cuiqingcai.com/', '崔庆才,静觅,网络,IT,技术,博客,PHP', 'https://static.hujiangtao.cn/static/2019/01/16/cuiqingcai.jpg', 45, 0, '9ee38897022d42c696971af4ed516c18', 0, '', '2019-04-04 22:29:53.618', '2019-04-06 15:59:55.939'),
	(46, 'a12fa7e787ce4df29aaaf894b6b1ecec', '\r\n廖雪峰', 'https://www.liaoxuefeng.com/', '\r\n                                            研究互联网产品和技术，提供原创中文精品教程，Python、Java基础教程', 'https://static.hujiangtao.cn/static/2019/01/16/liaoxuefeng.png', 46, 0, '9ee38897022d42c696971af4ed516c18', 0, '', '2019-04-04 22:29:53.842', '2019-04-06 15:59:56.039'),
	(47, '6cb9449d074a4e868efd893cb5a7e0b5', '\r\n小胡子哥', 'https://www.barretlee.com/', '阿里小胡子哥李靖', 'https://static.hujiangtao.cn/static/2019/01/16/barretlee.jpg', 47, 0, '9ee38897022d42c696971af4ed516c18', 0, '', '2019-04-04 22:29:54.075', '2019-04-06 15:59:56.154'),
	(48, 'b21276b95e99468ca8f107394da94375', '\r\n月光博客', 'https://www.williamlong.info/', '关注互联网和搜索引擎的IT科技博客', 'https://www.williamlong.info/favicon.ico', 48, 0, '9ee38897022d42c696971af4ed516c18', 0, '', '2019-04-04 22:29:54.306', '2019-04-06 15:59:56.249'),
	(49, '85dd416c24d24c2a87c8d9434ca7c82f', '\r\n战隼的学习探索', 'https://www.read.org.cn/', '不断探索和研究更加快速、有效的学习方法', 'https://static.hujiangtao.cn/static/2019/01/16/web-default.svg', 49, 0, '9ee38897022d42c696971af4ed516c18', 0, '', '2019-04-04 22:29:54.536', '2019-04-06 15:59:56.369'),
	(50, '334a0ea9b31f41cc959e6ae06577b56a', '\r\n【结构之法 算法之道】', 'https://blog.csdn.net/v_JULY_v', '职业专注AI教育，博客专注面试、算法、机器学习', 'https://static.hujiangtao.cn/static/2019/01/16/3_v_july_v.jpg', 50, 0, '9ee38897022d42c696971af4ed516c18', 0, '', '2019-04-04 22:29:54.768', '2019-04-06 15:59:56.489'),
	(51, 'bce4a63b9b324a2bb38b4e3e05474394', '\r\nBill Gates', 'https://www.gatesnotes.com/', 'Yes! The blog of Bill Gates', 'https://static.hujiangtao.cn/static/2019/01/16/bill-gates.png', 51, 0, '9ee38897022d42c696971af4ed516c18', 0, '', '2019-04-04 22:29:54.974', '2019-04-06 15:59:56.599'),
	(52, '487ef49b64614c0783e8fc89ba95aad1', '\r\nInfoQ推荐', 'https://www.infoq.cn/article/20-outstanding-enterprise-technology-blog', 'InfoQ推荐值得关注的 20 个优秀企业技术博客', 'https://static.hujiangtao.cn/static/2019/01/16/logo-infoq.svg', 52, 0, '9ee38897022d42c696971af4ed516c18', 0, '', '2019-04-04 22:29:55.223', '2019-04-06 15:59:56.714'),
	(53, 'ec896821af2749c0bde3a4df0ccf34fa', '\r\nTinyPNG', 'https://tinypng.com/', 'PNG/JPG图片在线压缩利器', 'https://static.hujiangtao.cn/static/2019/01/16/tinypng.png', 53, 0, 'a97e84eaabc148efa2601526ba83c41b', 0, '', '2019-04-04 22:29:55.425', '2019-04-06 15:59:57.070'),
	(54, '0665ca34badb4a4586cd7e8b3aba8e35', '\r\nSquoosh', 'https://github.com/GoogleChromeLabs/squoosh/', 'Google开源在线压缩、调整工具，支持WebP', 'https://static.hujiangtao.cn/static/2019/01/16/squoosh.webp', 54, 0, 'a97e84eaabc148efa2601526ba83c41b', 0, '', '2019-04-04 22:29:55.637', '2019-04-06 15:59:57.194'),
	(55, '25d353d3af374a65aa0ff6f71b92ea64', '\r\nGo!PNG', 'https://alloyteam.github.io/gopng/', 'AlloyTeam雪碧图在线生成工具', 'https://static.hujiangtao.cn/static/2019/01/16/alloyteam.png', 55, 0, 'a97e84eaabc148efa2601526ba83c41b', 0, '', '2019-04-04 22:29:55.835', '2019-04-06 15:59:57.289'),
	(56, '2f4727b8f27d4c178ead6bf5a52fcee4', '关于本站', '/about', '关于本站', 'https://75team.com/static/upload/20170523/favicon.ico', 0, 0, 'a97e84eaabc148efa2601526ba83c41b', 0, 'about', '2019-04-07 15:50:06.616', '2019-04-07 15:56:21.468'),
	(57, 'fffeb65f04e94f548e7ff4f006802884', '慧心斋', 'https://blog.csdn.net/cx308679291', '慧心斋\r\n千里之行始于足下\r\n', 'https://static.hujiangtao.cn/static/2019/01/16/csdn.svg', 56, 0, '9ee38897022d42c696971af4ed516c18', 0, '', '2019-04-10 13:18:32.548', '2019-04-10 13:20:39.104'),
	(58, 'fff9642911ad4972aa38500ffad3cf2e', '辛勤的蜜蜂', 'https://www.cnblogs.com/chen-xing/', '卓帆网\r\n古之立大事者，不惟有超世之才，亦必有坚忍不拔之志!', 'https://static.hujiangtao.cn/static/2019/01/16/cnblogs.svg', 57, 0, '9ee38897022d42c696971af4ed516c18', 0, '', '2019-04-10 13:22:53.975', '2019-04-10 13:23:01.448'),
	(59, 'fff3c51ecc0c4444a0c206764533c3bb', '燎原星火', 'https://my.oschina.net/u/2461283', '星星之火,可以燎原', 'https://static.hujiangtao.cn/static/2019/01/16/oschina.svg', 57, 0, '9ee38897022d42c696971af4ed516c18', 0, '', '2019-04-10 13:24:09.072', '2019-04-10 13:25:28.841'),
	(60, 'fff22ed6e38b409da1100a7f075852ca', '百度统计', 'https://tongji.baidu.com/web/welcome/login', '欢迎来到百度统计\r\n统计/推广/联盟 账号请在此登录', 'https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/baidu.svg', 58, 0, 'a97e84eaabc148efa2601526ba83c41b', 0, '', '2019-04-10 13:32:36.799', '2019-04-10 13:33:04.735'),
	(61, '231797f94ce941449f677d67f9db0b1c', 'TesterHome', 'https://testerhome.com/', 'TesterHome软件测试社区,人气最旺的软件测试技术门户,提供软件测试社区交流,测试沙龙', 'https://testerhome.com/assets/favicon-cd32144f74c18746f3dce33e1040e7dfe4c07c8e611e37f3868b1c16b5095da3.png', 0, 0, '2a4d4cfd64204237bbd66f743231ef14', 0, '', '2019-04-10 19:25:14.511', '2019-04-10 19:26:03.764'),
	(62, '231797f94ce941449f677d67f9db0b1c', 'HttpRunner', 'https://testerhome.com/opensource_projects/httprunner', '只需编写维护一份YAML/JSON脚本，即可实现自动化测试、性能测试', 'https://testerhome.com/uploads/opensource_project/2018/7d934997-08de-4479-b405-5ed748c23df9.jpg', 0, 0, '2a4d4cfd64204237bbd66f743231ef14', 0, '', '2019-04-10 19:27:46.956', '2019-04-10 19:33:05.035'),
	(63, '2a4d4cfd64204237bbd66f743231ef14', 'python学习', 'http://www.runoob.com/python/python-tutorial.html', '菜鸟教程 - 学的不仅是技术,更是梦想!', 'https://www.runoob.com/wp-content/uploads/2013/11/python.jpg', 3, 0, '2a4d4cfd64204237bbd66f743231ef14', 0, '', '2019-04-10 19:35:16.965', '2019-04-10 19:37:46.033'),
	(64, '231797f94ce941449f677d67f9db0b1c', '51testing', 'http://bbs.51testing.com/forum.php', '51Testing软件测试网-中国软件测试人的精神家园', 'http://bbs.51testing.com/static/image/common/logo.png', 4, 0, '2a4d4cfd64204237bbd66f743231ef14', 0, '', '2019-04-10 19:46:19.943', '2019-04-10 19:46:19.943'),
	(65, 'e6c4414abd9a480191fb8b593e34377f', '在线工具', 'http://tool.oschina.net/encrypt', 'OSCHINA.NET在线工具,ostools为开发设计人员提供在线工具', 'http://tool.oschina.net/img/favicon.ico', 5, 0, '2a4d4cfd64204237bbd66f743231ef14', 0, '', '2019-04-19 19:09:15.456', '2019-04-19 19:12:02.914'),
	(66, 'fff22ed6e38b409da1100a6f075852ca', '卓希云盘', 'http://chenzhuofan.top:6010', '高效、安全、方便', 'https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/dropbox.svg', 58, 0, 'a97e84eaabc148efa2601526ba83c41b', 0, '', '2019-05-22 14:48:45.459', '2019-05-22 14:52:21.148'),
	(67, 'ad7f36b244c04721b655a6f67583e8ff', 'it早报', '/news/1', '爬虫自动获取csdn、博客园、开源中国等it社区的一线新闻集中展示', 'https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/pdf.svg', 0, 0, 'ffa87bb015a746fd82a7d2f88125aaea', 0, '', '2019-05-25 16:48:47.268', '2019-05-25 19:41:26.225');
/*!40000 ALTER TABLE `web_url` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
