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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `common_event_contents` */

insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (1,2,1,'lin_s','大的','2012-10-03 15:05:34',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (2,7,3,'名字最长是','大的','2012-10-03 22:12:23',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (3,7,3,'名字最长是','大的','2012-10-03 22:12:42','无标题.bmp','image/bmp',509574,'2012-10-03 22:12:41');

/*Table structure for table `common_event_follows` */

DROP TABLE IF EXISTS `common_event_follows`;

CREATE TABLE `common_event_follows` (
  `user_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `common_event_follows` */

insert  into `common_event_follows`(`user_id`,`event_id`) values (1,2);
insert  into `common_event_follows`(`user_id`,`event_id`) values (1,1);
insert  into `common_event_follows`(`user_id`,`event_id`) values (3,7);
insert  into `common_event_follows`(`user_id`,`event_id`) values (1,29);

/*Table structure for table `common_events` */

DROP TABLE IF EXISTS `common_events`;

CREATE TABLE `common_events` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` char(15) CHARACTER SET utf8 NOT NULL COMMENT '简短描述',
  `author_id` int(10) NOT NULL COMMENT '创建者ID',
  `author_nick_name` char(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者昵称',
  `message_count` int(10) DEFAULT '0' COMMENT '信息条数',
  `is_pass` tinyint(1) DEFAULT '2' COMMENT '是否审核通过0:审核失败 1:审核通过 2:审核中',
  `lastupdate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `common_events` */

insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (1,'test 1',0,NULL,0,0,'2012-09-28 08:41:21');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (2,'test2',0,NULL,1,0,'2012-10-03 15:05:34');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (3,'方法',1,'lin_s',0,0,'2012-10-03 15:24:39');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (4,'哈哈哈哈',3,'名字最长是',0,0,'2012-10-03 16:07:41');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (5,'创建事件的名字可以多长长呢呢呢',3,'名字最长是',0,0,'2012-10-03 16:54:35');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (6,'大的',3,'名字最长是',0,0,'2012-10-03 16:57:02');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (7,'大的',3,'名字最长是',2,0,'2012-10-03 22:12:42');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (8,'1',1,'lin_s',0,0,'2012-10-07 00:10:37');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (9,'2',1,'lin_s',0,0,'2012-10-07 00:10:39');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (10,'3',1,'lin_s',0,0,'2012-10-07 00:10:41');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (11,'4',1,'lin_s',0,0,'2012-10-07 00:10:42');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (12,'5',1,'lin_s',0,0,'2012-10-07 00:10:44');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (13,'6',1,'lin_s',0,0,'2012-10-07 00:10:46');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (14,'7',1,'lin_s',0,0,'2012-10-07 00:10:48');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (15,'8',1,'lin_s',0,0,'2012-10-07 00:10:51');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (16,'9',1,'lin_s',0,0,'2012-10-07 00:10:58');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (17,'10',1,'lin_s',0,0,'2012-10-07 00:11:00');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (18,'10',1,'lin_s',0,0,'2012-10-07 00:11:03');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (19,'11',1,'lin_s',0,0,'2012-10-07 00:11:07');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (20,'12',1,'lin_s',0,0,'2012-10-07 00:11:09');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (21,'13',1,'lin_s',0,0,'2012-10-07 00:11:11');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (22,'14',1,'lin_s',0,0,'2012-10-07 00:11:12');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (23,'15',1,'lin_s',0,0,'2012-10-07 00:11:14');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (24,'16',1,'lin_s',0,0,'2012-10-07 00:11:16');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (25,'17',1,'lin_s',0,0,'2012-10-07 00:11:18');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (26,'18',1,'lin_s',0,0,'2012-10-07 00:11:20');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (27,'19',1,'lin_s',0,0,'2012-10-07 00:11:22');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (28,'20',1,'lin_s',0,0,'2012-10-07 00:11:26');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (29,'21',1,'lin_s',0,0,'2012-10-07 00:11:28');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (30,'22',1,'lin_s',0,0,'2012-10-07 00:12:27');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (31,'身上',1,'lin_s',0,0,'2012-10-07 23:01:38');
insert  into `common_events`(`id`,`title`,`author_id`,`author_nick_name`,`message_count`,`is_pass`,`lastupdate_time`) values (32,'身上',1,'lin_s',0,0,'2012-10-07 23:01:45');

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

insert  into `users`(`id`,`name`,`password_digest`,`nick_name`,`contact_me`,`is_pm`,`lastlogin_time`,`reg_time`) values (1,'lin_style@foxmail.com','$2a$10$uAey7DYy4TOb5vH9zUSJDevZKhNfzec05/TnR1geBIzx5Vl32XeYO','lin_s',NULL,1,'2012-10-07 20:22:38','2012-10-07 20:22:38');
insert  into `users`(`id`,`name`,`password_digest`,`nick_name`,`contact_me`,`is_pm`,`lastlogin_time`,`reg_time`) values (2,'a@a.com','$2a$10$w8TdUpI86OpHc97mZIzQi.G0W.c1I2A18gpLknpjMtiIVKcZPtBpG','a',NULL,0,'2012-10-01 13:34:35','2012-10-01 13:34:35');
insert  into `users`(`id`,`name`,`password_digest`,`nick_name`,`contact_me`,`is_pm`,`lastlogin_time`,`reg_time`) values (3,'a1@a.com','$2a$10$9pOsWhIJ4Jfl25rUpZTJ1e2AOecJfLPBwwXslmBMJwraWdS8Kqy.2','名字最长是','',0,'2012-10-06 19:49:34','2012-10-06 19:49:34');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
