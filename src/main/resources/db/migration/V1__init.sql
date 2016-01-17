# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.38)
# Database: chubaogame
# Generation Time: 2016-01-16 10:44:15 +0000
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
  `timeAdded` datetime NOT NULL COMMENT '添加日期',
  `timeEdit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`articleId`),
  KEY `fk_article_userId` (`userId`),
  CONSTRAINT `fk_article_userId` FOREIGN KEY (`userId`) REFERENCES `cb_user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
  `delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`commentId`),
  KEY `fk_parentComment` (`parentId`),
  KEY `fk_gameId` (`gameId`),
  KEY `fk_comment_articleId` (`articleId`),
  CONSTRAINT `fk_comment_articleId` FOREIGN KEY (`articleId`) REFERENCES `cb_article` (`articleId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gameId` FOREIGN KEY (`gameId`) REFERENCES `cb_game` (`gameId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_parentComment` FOREIGN KEY (`parentId`) REFERENCES `cb_comment` (`commentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cb_game
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_game`;

CREATE TABLE `cb_game` (
  `gameId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '游戏Id',
  `typeId` int(11) unsigned DEFAULT NULL COMMENT '游戏类型Id，外键',
  `developerId` int(11) unsigned DEFAULT NULL COMMENT '开发商Id，外键',
  `userId` int(11) DEFAULT NULL,
  `price` varchar(30) DEFAULT '' COMMENT '资费',
  `publishTime` datetime NOT NULL COMMENT '发布日期',
  `size` double DEFAULT NULL COMMENT '游戏大小',
  `platform` varchar(30) DEFAULT '' COMMENT '适用平台',
  `downloadTimes` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `rateTimes` int(11) NOT NULL DEFAULT '0' COMMENT '评论次数',
  `downloadUrl` varchar(50) DEFAULT '' COMMENT '下载链接',
  `images` varchar(500) DEFAULT '' COMMENT '游戏截图',
  `post` varchar(50) DEFAULT '' COMMENT '游戏海报',
  `timeAdded` datetime NOT NULL COMMENT '添加时间',
  `timeEdit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '编辑时间',
  `delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`gameId`),
  KEY `fk_typeId` (`typeId`),
  KEY `fk_developerId` (`developerId`),
  KEY `fk_game_userId` (`userId`),
  CONSTRAINT `fk_game_userId` FOREIGN KEY (`userId`) REFERENCES `cb_user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_developerId` FOREIGN KEY (`developerId`) REFERENCES `cb_game_developer` (`developerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_typeId` FOREIGN KEY (`typeId`) REFERENCES `cb_game_type` (`typeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cb_game_developer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_game_developer`;

CREATE TABLE `cb_game_developer` (
  `developerId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '开发者Id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '开发者名称',
  `timeAdded` datetime NOT NULL COMMENT '添加日期',
  `timeEdit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`developerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cb_game_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_game_type`;

CREATE TABLE `cb_game_type` (
  `typeId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '游戏类型Id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `timeAdded` datetime NOT NULL COMMENT '添加时间',
  `timeEdit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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



# Dump of table cb_user_authorities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_user_authorities`;

CREATE TABLE `cb_user_authorities` (
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `authority` enum('ADMIN','USER') NOT NULL DEFAULT 'USER' COMMENT '权限',
  UNIQUE KEY `ix_auth_username` (`userId`,`authority`),
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `cb_user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
