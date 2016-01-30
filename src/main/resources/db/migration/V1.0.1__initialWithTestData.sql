# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.38)
# Database: chubaogame
# Generation Time: 2016-01-27 04:00:11 +0000
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
  `post` varchar(50) DEFAULT NULL COMMENT '海报',
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
	(1,1,'关于我们','关于我们\n',NULL,NULL,'2016-01-24 14:01:51','2016-01-24 14:01:56',0),
	(2,1,'联系我们','联系我们\n',NULL,NULL,'2016-01-24 14:02:17','2016-01-24 14:02:28',0),
	(3,1,'家长监护/简介','家长监护简介',NULL,NULL,'2016-01-24 14:00:21','2016-01-25 12:21:44',0),
	(4,1,'家长监护/流程','家长监护流程\r\n',NULL,NULL,'2016-01-24 14:01:06','2016-01-25 12:21:49',0),
	(5,1,'家长监护/常见问题','家长监护常见问题\n',NULL,NULL,'2016-01-24 14:02:51','2016-01-25 12:21:53',0),
	(6,1,'家长监护/联系我们','家长监护联系我们 \n<img src=\"http://haha.pfdfd.png\"> http://haha.jsfds.com \n<a href=\"http:fsf//fd\">1</a> \n<a></a>',NULL,NULL,'2016-01-24 14:03:23','2016-01-25 13:49:37',0);

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
  `content` int(11) DEFAULT NULL COMMENT '评论内容',
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
	(1,NULL,1,NULL,1,'',0,5,'2016-01-20 12:24:32',0);

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
  `downloadUrl` varchar(100) DEFAULT '' COMMENT '下载链接',
  `images` varchar(1000) DEFAULT '' COMMENT '游戏截图',
  `post` varchar(100) DEFAULT '' COMMENT '游戏海报',
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
	(2,2,1,NULL,'测试2','这是测试2这是测试2这是测试2这是测试2这是测试2这是测试2这是测试2这是测试2这是测试2这是测试2这是测试2','付费','2016-01-22 17:27:53',NULL,'苹果ios',0,0,5,NULL,'','/home/assets/img/sliders/revolution/bg2.jpg',1,'2016-01-22 17:27:53','2016-01-26 15:12:09',0),
	(3,1,1,1,'测试3','这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3这是测试3','付费','2016-01-22 17:27:53',100,'安卓',0,0,5,'','','/home/assets/img/sliders/revolution/bg3.jpg',1,'2016-01-22 17:29:53','2016-01-22 17:33:55',0),
	(4,2,1,1,'测试4','这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4这是测试4','付费','2016-01-22 17:27:53',100,'安卓',0,0,5,'','','/home/assets/img/sliders/revolution/bg3.jpg',0,'2016-01-22 17:29:53','2016-01-26 15:12:04',0),
	(5,1,1,NULL,'hahah','hahahhahahafdhahahhahahafdhahahhahahafdhahahhahahafdhahahhahahafdhahahhahahafdhahahhahahafdhahahhahahafd','道具收费','2016-01-25 14:15:24',NULL,'安卓',0,0,NULL,NULL,'/chubao/upload/images/20160126/20160126233350_1826668741.jpeg|/chubao/upload/images/20160126/20160126233350_1797744024.jpeg|/chubao/upload/images/20160126/20160126233350_1335799428.jpeg|/chubao/upload/images/20160126/20160126233350_1906907295.jpeg|/chubao/upload/images/20160126/20160126233350_-904307846.jpeg|/chubao/upload/images/20160126/20160126233350_-400110259.jpeg','/home/assets/img/sliders/revolution/bg3.jpg',0,'2016-01-25 14:18:44','2016-01-26 23:33:54',0),
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
	(1,'模拟经营','2016-01-19 10:42:25','2016-01-19 10:42:30',0),
	(2,'RPG','2016-01-22 19:49:16','2016-01-22 19:49:21',0);

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
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `locked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被锁定',
  `expired` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否过期',
  `credentialsExpired` tinyint(1) NOT NULL DEFAULT '0' COMMENT '密码是否过期',
  PRIMARY KEY (`userId`,`userName`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `username_UNIQUE` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息及用户登陆设备绑定手机相关信息表';

LOCK TABLES `cb_user` WRITE;
/*!40000 ALTER TABLE `cb_user` DISABLE KEYS */;

INSERT INTO `cb_user` (`userId`, `userName`, `password`, `realName`, `idCard`, `email`, `tel`, `enabled`, `locked`, `expired`, `credentialsExpired`)
VALUES
	(1,'test','test','test','420704199411084273','379749641@qq.com','18818212871',1,0,0,0);

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
