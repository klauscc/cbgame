# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.38)
# Database: chubaogame
# Generation Time: 2016-02-01 13:53:34 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table cb_article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_article`;

CREATE TABLE `cb_article` (
  `articleId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章Id',
  `userId` int(11) NOT NULL COMMENT '发布者Id',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `post` varchar(255) DEFAULT NULL COMMENT '海报',
  `top` tinyint(1) DEFAULT NULL COMMENT '置顶',
  `timeAdded` datetime NOT NULL COMMENT '添加日期',
  `timeEdit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`articleId`),
  KEY `fk_article_userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cb_article` WRITE;
/*!40000 ALTER TABLE `cb_article` DISABLE KEYS */;

INSERT INTO `cb_article` (`articleId`, `userId`, `title`, `content`, `post`, `top`, `timeAdded`, `timeEdit`, `isDelete`)
VALUES
	(1,1,'关于我们','<p> CooTek(触宝科技)是一家创新型的高科技企业,主要研发并销售基于手机的创新型软件。创业至今已与多家海内外知名厂商、运营商建立合作关系。公司于2009年2月荣获全球移动通信系统协会 (GSMA) 颁发的全球移动创新大奖总冠军，这是中国企业历史上首次荣获该项移动领域的世界级大奖。公司又于2009年11月夺得美国高通举办的QPrize创业计划大赛的中国区冠军。 </p> \n<p> 智能手机是CooTek看好的方向。iPhone的火爆，Android的异军突起，WM和Symbian的龙争虎斗，加上3G的登台亮相，我们相信在智能手机上定会有一番好戏上演，而移动应用软件必将成为创业者一展身手的舞台！ </p> \n<p> 目前公司的研发团队拥有来自微软、英特尔、NTT Data等顶尖外企的资深专家，也有ACM获奖、成绩优异的交大学生。创业至今，已与多家海内外知名厂商、运营商建立长期合作关系。公司业务发展迅猛，希望能招募更多优秀的人才加入我们，共创辉煌！ </p>',NULL,NULL,'2016-01-24 14:01:51','2016-01-31 05:55:28',0),
	(2,1,'联系我们','联系我们&nbsp;',NULL,NULL,'2016-01-24 14:02:17','2016-01-31 04:35:32',0),
	(3,1,'家长监护/简介','家长监护简介 ',NULL,NULL,'2016-01-24 14:00:21','2016-01-31 02:19:48',0),
	(4,1,'家长监护/流程','家长监护流程\r\n',NULL,NULL,'2016-01-24 14:01:06','2016-01-25 12:21:49',0),
	(5,1,'家长监护/常见问题','家长监护常见问题\n',NULL,NULL,'2016-01-24 14:02:51','2016-01-25 12:21:53',0),
	(6,1,'家长监护/联系我们','家长监护联系我们&nbsp;',NULL,NULL,'2016-01-24 14:03:23','2016-01-31 04:35:03',0);

/*!40000 ALTER TABLE `cb_article` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_comment`;

CREATE TABLE `cb_comment` (
  `commentId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论Id',
  `parentId` int(11) unsigned DEFAULT NULL COMMENT '父评论Id',
  `gameId` int(11) unsigned DEFAULT NULL COMMENT '评论游戏时，游戏Id',
  `articleId` int(10) unsigned DEFAULT NULL COMMENT '评论文章时，文章Id',
  `userId` int(11) unsigned DEFAULT NULL COMMENT '用户Id',
  `nickName` varchar(50) DEFAULT NULL COMMENT '昵称，未登录时',
  `content` varchar(1000) DEFAULT NULL COMMENT '评论内容',
  `rate` double NOT NULL DEFAULT '5' COMMENT '游戏评分',
  `timeAdded` datetime NOT NULL COMMENT '添加日期',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`commentId`),
  KEY `fk_parentComment` (`parentId`),
  KEY `fk_gameId` (`gameId`),
  KEY `fk_comment_articleId` (`articleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cb_comment` WRITE;
/*!40000 ALTER TABLE `cb_comment` DISABLE KEYS */;

INSERT INTO `cb_comment` (`commentId`, `parentId`, `gameId`, `articleId`, `userId`, `nickName`, `content`, `rate`, `timeAdded`, `isDelete`)
VALUES
	(1,NULL,5,NULL,1,'test','评论1评论1评论1',5,'2016-01-20 12:24:32',0),
	(2,NULL,5,NULL,NULL,'哈哈','评论2评论2评论2',5,'2016-01-28 11:24:18',0),
	(3,NULL,5,NULL,NULL,'啦啦','评论3评论3评论3评论3评论3评论3评论3评论3评论3评论3评论3评论3评论3',5,'2016-01-28 12:24:18',0),
	(4,NULL,5,NULL,NULL,'花费多少','发的说法是电风扇',5,'2016-01-28 14:55:07',0),
	(5,NULL,5,NULL,NULL,'用户2078984813','',5,'2016-01-28 14:59:08',0),
	(6,NULL,5,NULL,NULL,'kankanf','fsdfdsf',3.7607421875,'2016-01-28 14:59:44',0),
	(7,NULL,5,NULL,NULL,'haha','fdfdfdfdfd',5,'2016-01-28 20:51:04',0),
	(8,NULL,5,NULL,NULL,'fdfsd','fsdfdsfsdf',5,'2016-01-28 20:55:21',0),
	(9,NULL,5,NULL,NULL,'用户2139941285','fsdfsdfsdfs',5,'2016-01-28 23:19:58',0),
	(10,NULL,5,NULL,NULL,'kkk','f道法啊是fd',5,'2016-01-28 23:40:13',0),
	(11,NULL,5,NULL,NULL,'用户610470860','fsdfsdfsfas',5,'2016-01-28 23:41:00',0),
	(12,NULL,5,NULL,NULL,'用户1089467452','fdsfsdfs',5,'2016-01-29 00:10:00',0),
	(13,NULL,5,NULL,NULL,'用户1057635844','fsdfas',5,'2016-01-29 00:10:18',0),
	(14,NULL,5,NULL,NULL,'用户-1887636907','fdsfsdf',5,'2016-01-29 00:12:38',0);

/*!40000 ALTER TABLE `cb_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_game
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_game`;

CREATE TABLE `cb_game` (
  `gameId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '游戏Id',
  `typeId` int(11) unsigned DEFAULT NULL COMMENT '游戏类型Id',
  `developerId` int(11) unsigned DEFAULT NULL COMMENT '开发商Id',
  `userId` int(11) DEFAULT NULL COMMENT '发布者id',
  `name` varchar(50) DEFAULT NULL COMMENT '游戏名称',
  `content` longtext COMMENT '游戏内容',
  `price` varchar(30) DEFAULT '' COMMENT '资费',
  `publishTime` datetime NOT NULL COMMENT '发布日期',
  `size` double DEFAULT NULL COMMENT '游戏大小',
  `platform` varchar(30) DEFAULT '' COMMENT '适用平台',
  `downloadTimes` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `rateTimes` int(11) NOT NULL DEFAULT '0' COMMENT '评论次数',
  `rates` double DEFAULT NULL COMMENT '评分',
  `downloadUrl` varchar(255) DEFAULT '' COMMENT '下载链接',
  `images` varchar(1000) DEFAULT '' COMMENT '游戏截图',
  `post` varchar(255) DEFAULT '' COMMENT '游戏海报',
  `top` tinyint(4) DEFAULT '0' COMMENT '是否置顶，越大越高.0~7',
  `timeAdded` datetime NOT NULL COMMENT '添加时间',
  `timeEdit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '编辑时间',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`gameId`),
  KEY `fk_typeId` (`typeId`),
  KEY `fk_developerId` (`developerId`),
  KEY `fk_game_userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cb_game` WRITE;
/*!40000 ALTER TABLE `cb_game` DISABLE KEYS */;

INSERT INTO `cb_game` (`gameId`, `typeId`, `developerId`, `userId`, `name`, `content`, `price`, `publishTime`, `size`, `platform`, `downloadTimes`, `rateTimes`, `rates`, `downloadUrl`, `images`, `post`, `top`, `timeAdded`, `timeEdit`, `isDelete`)
VALUES
	(1,1,1,1,'测试1','这是测试1这是测试1这是测试1这是测试1这是测试1这是测试1这是测试1这是测试1....','免费','2016-01-19 10:43:50',20.6,'安卓',4,5,5,'','','/home/assets/img/sliders/revolution/bg1.jpg',0,'2016-01-19 10:43:50','2016-01-22 17:30:10',0),
	(2,2,1,NULL,'测试2','这是测试2这是测试2这是测试2这是测试2这是测试2这是测试2这是测试2这是测试2这是测试2这是测试2这是测试2','付费','2016-01-22 17:27:53',NULL,'苹果ios',0,0,5,NULL,'','/home/assets/img/sliders/revolution/bg2.jpg',1,'2016-01-22 17:27:53','2016-01-27 12:47:08',0),
	(3,1,1,1,'测试3','这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3','付费','2016-01-22 17:27:53',100,'安卓',0,0,5,'','','/home/assets/img/sliders/revolution/bg3.jpg',1,'2016-01-22 17:29:53','2016-01-22 17:33:55',0),
	(4,2,1,1,'测试4','这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4','付费','2016-01-22 17:27:53',100,'安卓',0,0,5,'','','/home/assets/img/sliders/revolution/bg3.jpg',0,'2016-01-22 17:29:53','2016-01-26 15:12:04',0),
	(5,1,1,NULL,'hahah','fdsfsdfds发郭德纲的非官方的飞洒发\n<img src=\"http://api.map.baidu.com/staticimage?center=121.473704%2C31.230393&amp;zoom=14&amp;width=558&amp;height=360&amp;markers=121.473704%2C31.230393&amp;markerStyles=l%2CA\" alt=\"\">\n<img src=\"http://localhost:8080/game-website-1.0.0/common/plugins/kindEditor/plugins/emoticons/images/0.gif\" alt=\"\">','道具收费','2016-01-25 14:15:24',NULL,'安卓',0,0,NULL,NULL,'/home/assets/img/sliders/revolution/bg3.jpg|/home/assets/img/sliders/revolution/bg3.jpg|/home/assets/img/sliders/revolution/bg3.jpg|/home/assets/img/sliders/revolution/bg3.jpg|/home/assets/img/sliders/revolution/bg3.jpg','/home/assets/img/sliders/revolution/bg3.jpg',1,'2016-01-25 14:18:44','2016-01-31 12:24:33',0),
	(6,2,1,NULL,'hahah','fdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvc','道具收费','2016-01-25 14:19:33',NULL,'安卓',0,0,NULL,NULL,'','/home/assets/img/sliders/revolution/bg3.jpg',0,'2016-01-25 14:21:15','2016-01-26 23:31:15',1),
	(7,1,1,NULL,'hahah','fdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvcfdfdfdvcvcvc','道具收费','2016-01-25 14:19:33',NULL,'安卓',0,0,NULL,NULL,'','/home/assets/img/sliders/revolution/bg3.jpg',1,'2016-01-25 14:25:30','2016-01-26 23:31:08',1);

/*!40000 ALTER TABLE `cb_game` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_game_developer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_game_developer`;

CREATE TABLE `cb_game_developer` (
  `developerId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '开发者Id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '开发者名称',
  `timeAdded` datetime NOT NULL COMMENT '添加日期',
  `timeEdit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`developerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cb_game_developer` WRITE;
/*!40000 ALTER TABLE `cb_game_developer` DISABLE KEYS */;

INSERT INTO `cb_game_developer` (`developerId`, `name`, `timeAdded`, `timeEdit`, `isDelete`)
VALUES
	(1,'触宝','2016-01-19 10:42:47','2016-01-19 10:42:51',0);

/*!40000 ALTER TABLE `cb_game_developer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_game_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_game_type`;

CREATE TABLE `cb_game_type` (
  `typeId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '游戏类型Id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `timeAdded` datetime NOT NULL COMMENT '添加时间',
  `timeEdit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cb_game_type` WRITE;
/*!40000 ALTER TABLE `cb_game_type` DISABLE KEYS */;

INSERT INTO `cb_game_type` (`typeId`, `name`, `timeAdded`, `timeEdit`, `isDelete`)
VALUES
	(1,'休闲','2016-01-19 10:42:25','2016-01-31 06:38:55',0),
	(2,'益智','2016-01-22 19:49:16','2016-01-31 06:37:08',0),
	(3,'体育','2016-01-31 06:36:52','2016-01-31 06:38:59',0),
	(4,'射击','2016-01-31 06:39:04','2016-01-31 06:39:07',0),
	(5,'角色','2016-01-31 06:39:17','2016-01-31 06:39:20',0),
	(6,'动作','2016-01-31 06:39:24','2016-01-31 06:40:01',0),
	(7,'冒险','2016-01-31 06:39:24','2016-01-31 06:40:02',0),
	(8,'棋牌','2016-01-31 06:39:24','2016-01-31 06:40:03',0),
	(9,'策略','2016-01-31 06:39:24','2016-01-31 06:40:05',0),
	(10,'其它','2016-01-31 06:39:24','2016-01-31 06:40:05',0);

/*!40000 ALTER TABLE `cb_game_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_user`;

CREATE TABLE `cb_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长序列',
  `userName` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `realName` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `idCard` varchar(20) DEFAULT NULL COMMENT '身份证',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(15) DEFAULT NULL COMMENT '手机号',
  `authority` enum('USER','ADMIN') DEFAULT 'USER' COMMENT '用户权限',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `locked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被锁定',
  `expired` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否过期',
  `credentialsExpired` tinyint(1) NOT NULL DEFAULT '0' COMMENT '密码是否过期',
  `timeAdded` datetime DEFAULT NULL COMMENT '添加日期',
  PRIMARY KEY (`userId`,`userName`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `username_UNIQUE` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息及用户登陆设备绑定手机相关信息表';

LOCK TABLES `cb_user` WRITE;
/*!40000 ALTER TABLE `cb_user` DISABLE KEYS */;

INSERT INTO `cb_user` (`userId`, `userName`, `password`, `realName`, `idCard`, `email`, `tel`, `authority`, `enabled`, `locked`, `expired`, `credentialsExpired`, `timeAdded`)
VALUES
	(1,'admin','bed1e34f7751f1bb799a2e3f097ee251','admin','420704199411084273','379749641@qq.com','18818212871','ADMIN',1,0,0,0,'2016-01-22 12:32:32'),
	(2,'ffdfd','828f4a1a84f71fe4417b56be6fa41be2','fsdfdsf','53010219200508011x','fdsf@fsd.com','18818212870','USER',1,0,0,0,'2016-01-31 01:00:29');

/*!40000 ALTER TABLE `cb_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_user_authorities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_user_authorities`;

CREATE TABLE `cb_user_authorities` (
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `authority` enum('ADMIN','USER') NOT NULL DEFAULT 'USER' COMMENT '权限',
  UNIQUE KEY `ix_auth_username` (`userId`,`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
