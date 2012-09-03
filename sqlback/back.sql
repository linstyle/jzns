/*
SQLyog Community Edition- MySQL GUI v7.15 
MySQL - 5.1.63-0ubuntu0.10.04.1 : Database - jzns
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
  `user_nickname` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `content` char(140) COLLATE utf8_unicode_ci NOT NULL,
  `avatar_file_name` int(11) DEFAULT '0',
  `avatar_content_type` int(11) DEFAULT '0',
  `avatar_file_size` int(11) DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `common_event_contents` */

insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`content`,`avatar_file_name`,`avatar_content_type`,`avatar_file_size`,`insert_time`) values (26,10,0,'','11',0,0,0,'2012-08-29 10:54:37');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`content`,`avatar_file_name`,`avatar_content_type`,`avatar_file_size`,`insert_time`) values (27,10,0,'','22',0,0,0,'2012-08-29 10:55:51');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`content`,`avatar_file_name`,`avatar_content_type`,`avatar_file_size`,`insert_time`) values (28,10,1,'lindp','33',0,0,0,'2012-08-29 14:20:17');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`content`,`avatar_file_name`,`avatar_content_type`,`avatar_file_size`,`insert_time`) values (29,9,1,'lindp','44',0,0,0,'2012-08-30 08:28:14');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`content`,`avatar_file_name`,`avatar_content_type`,`avatar_file_size`,`insert_time`) values (30,9,1,'lindp','33',0,0,0,'2012-08-30 08:28:17');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`content`,`avatar_file_name`,`avatar_content_type`,`avatar_file_size`,`insert_time`) values (31,9,1,'lindp','22',0,0,0,'2012-08-30 08:28:19');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`content`,`avatar_file_name`,`avatar_content_type`,`avatar_file_size`,`insert_time`) values (32,9,1,'lindp','11',0,0,0,'2012-08-30 08:28:25');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`content`,`avatar_file_name`,`avatar_content_type`,`avatar_file_size`,`insert_time`) values (33,9,1,'lindp','55',0,0,0,'2012-08-30 08:45:23');

/*Table structure for table `common_event_follows` */

DROP TABLE IF EXISTS `common_event_follows`;

CREATE TABLE `common_event_follows` (
  `user_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `common_event_follows` */

insert  into `common_event_follows`(`user_id`,`event_id`) values (1,9);
insert  into `common_event_follows`(`user_id`,`event_id`) values (1,8);
insert  into `common_event_follows`(`user_id`,`event_id`) values (1,10);
insert  into `common_event_follows`(`user_id`,`event_id`) values (20120906,10);
insert  into `common_event_follows`(`user_id`,`event_id`) values (20120906,15);

/*Table structure for table `common_events` */

DROP TABLE IF EXISTS `common_events`;

CREATE TABLE `common_events` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` char(15) CHARACTER SET utf8 NOT NULL COMMENT '简短描述',
  `message_count` int(10) DEFAULT '0' COMMENT '信息条数',
  `lastupdate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `common_events` */

insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (1,'我是1号',0,'2012-08-29 10:39:10');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (2,'我是2号',0,'2012-08-29 10:39:11');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (3,'我是3号',0,'2012-08-29 10:39:12');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (4,'我是4号',0,'2012-08-29 10:39:12');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (5,'我是5号',0,'2012-08-29 10:39:12');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (6,'我是6号',0,'2012-08-29 10:39:13');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (7,'我是7',0,'2012-08-29 10:39:13');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (8,'我是8号',0,'2012-08-29 10:39:13');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (9,'我是9号',5,'2012-08-30 08:45:23');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (10,'我是10号号号号号号号号号号号',3,'2012-08-29 14:20:17');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (11,'111',0,'2012-09-01 18:13:53');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (12,'555',0,'2012-09-01 18:14:18');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (13,'33434',0,'2012-09-01 18:14:27');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (14,'ee',0,'2012-09-01 22:24:31');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (15,'eeff',0,'2012-09-01 22:25:08');

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
) ENGINE=InnoDB AUTO_INCREMENT=20120907 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`password_digest`,`nick_name`,`lastlogin_time`,`reg_time`) values (2,'a@a.com','$2a$10$7g7gJb1DJYwrpPXQUfyH2u3SIJKXhLomt8.2eBjcK4GbZfyOIPQyW','a','2012-08-13 09:13:16','2012-08-13 09:13:16');
insert  into `users`(`id`,`name`,`password_digest`,`nick_name`,`lastlogin_time`,`reg_time`) values (20120906,'lin_style@foxmail.com','$2a$10$lYWxNptRa14NNxlQiYBPRenTdwfZHW2DyAElekawynyQqF3Mrw.Eq','lindp','2012-09-03 08:30:26','2012-09-03 08:30:26');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
