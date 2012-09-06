/*
SQLyog Community Edition- MySQL GUI v7.15 
MySQL - 5.5.23-log : Database - jzns
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`jzns` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `jzns`;

/*Table structure for table `common_events` */

DROP TABLE IF EXISTS `common_events`;

CREATE TABLE `common_events` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` char(15) CHARACTER SET utf8 NOT NULL COMMENT '简短描述',
  `message_count` int(10) DEFAULT '0' COMMENT '信息条数',
  `lastupdate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `common_events` */

insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (1,'我是1号',0,'2012-08-29 10:39:10');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (2,'我是2号',0,'2012-08-29 10:39:11');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (3,'我是3号',0,'2012-08-29 10:39:12');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (4,'我是4号',0,'2012-08-29 10:39:12');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (5,'我是5号',0,'2012-08-29 10:39:12');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (6,'我是6号',0,'2012-08-29 10:39:13');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (7,'我是7',0,'2012-08-29 10:39:13');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (8,'我是8号',0,'2012-08-29 10:39:13');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (9,'我是9号',0,'2012-08-29 10:39:15');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (10,'我是10号号号号号号号号号号号',3,'2012-08-29 14:20:17');

/*Table structure for table `common_events_contents` */

DROP TABLE IF EXISTS `common_events_contents`;

CREATE TABLE `common_events_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned DEFAULT NULL COMMENT 'common_events的ID',
  `user_id` int(10) unsigned NOT NULL,
  `user_nickname` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `content` char(140) COLLATE utf8_unicode_ci NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `common_events_contents` */

insert  into `common_events_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`content`,`insert_time`) values (26,10,0,'','11','2012-08-29 10:54:37');
insert  into `common_events_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`content`,`insert_time`) values (27,10,0,'','22','2012-08-29 10:55:51');
insert  into `common_events_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`content`,`insert_time`) values (28,10,1,'lindp','33','2012-08-29 14:20:17');

/*Table structure for table `common_events_follows` */

DROP TABLE IF EXISTS `common_events_follows`;

CREATE TABLE `common_events_follows` (
  `user_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `common_events_follows` */

insert  into `common_events_follows`(`user_id`,`event_id`) values (1,9);
insert  into `common_events_follows`(`user_id`,`event_id`) values (1,8);
insert  into `common_events_follows`(`user_id`,`event_id`) values (1,10);

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

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` char(24) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password_digest` char(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `nick_name` char(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户昵称',
  `lastlogin_time` datetime DEFAULT '2012-08-10 00:00:00' COMMENT '最后登录时间',
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册(插入)时间',
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`password_digest`,`nick_name`,`lastlogin_time`,`reg_time`) values (1,'lin_style@foxmail.com','$2a$10$lYWxNptRa14NNxlQiYBPRenTdwfZHW2DyAElekawynyQqF3Mrw.Eq','lindp','2012-08-29 14:10:56','2012-08-29 14:10:56');
insert  into `users`(`id`,`name`,`password_digest`,`nick_name`,`lastlogin_time`,`reg_time`) values (2,'a@a.com','$2a$10$7g7gJb1DJYwrpPXQUfyH2u3SIJKXhLomt8.2eBjcK4GbZfyOIPQyW','a','2012-08-13 09:13:16','2012-08-13 09:13:16');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;