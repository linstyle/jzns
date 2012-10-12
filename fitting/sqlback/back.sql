/*
SQLyog Community Edition- MySQL GUI v7.15 
MySQL - 5.1.63-0ubuntu0.10.04.1-log : Database - jzns
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`jzns` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `jzns`;

/*Table structure for table `common_event_contents` */

DROP TABLE IF EXISTS `common_event_contents`;

CREATE TABLE `common_event_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned DEFAULT NULL COMMENT 'common_events的ID',
  `user_id` int(10) unsigned NOT NULL,
  `user_nickname` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `msg_content` char(140) COLLATE utf8_unicode_ci NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `common_event_contents` */

/*Table structure for table `common_event_follows` */

DROP TABLE IF EXISTS `common_event_follows`;

CREATE TABLE `common_event_follows` (
  `user_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `common_event_follows` */

/*Table structure for table `common_events` */

DROP TABLE IF EXISTS `common_events`;

CREATE TABLE `common_events` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` char(15) CHARACTER SET utf8 NOT NULL COMMENT '简短描述',
  `author_id` int(10) NOT NULL COMMENT '创建者ID',
  `author_nick_name` char(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者昵称',
  `message_count` int(10) DEFAULT '0' COMMENT '信息条数',
  `is_pass` smallint(1) DEFAULT '2' COMMENT '是否审核通过0:审核失败 1:审核通过 2:审核中',
  `lastupdate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `common_events` */


/*Table structure for table `person_events` */

DROP TABLE IF EXISTS `person_events`;

CREATE TABLE `person_events` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `messge_count` int(10) DEFAULT '0',
  `lastupdate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `person_events` */

/*Table structure for table `schema_migrations` */

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `schema_migrations` */

insert  into `schema_migrations`(`version`) values ('20120904032012');
insert  into `schema_migrations`(`version`) values ('20120905012028');
insert  into `schema_migrations`(`version`) values ('20120907002418');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` char(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password_digest` char(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `nick_name` char(5) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户昵称',
  `contact_me` char(48) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `is_pm` tinyint(1) DEFAULT '0',
  `lastlogin_time` datetime DEFAULT '2012-08-10 00:00:00' COMMENT '最后登录时间',
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册(插入)时间',
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
