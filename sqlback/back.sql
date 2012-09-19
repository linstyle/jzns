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
  `msg_content` char(140) COLLATE utf8_unicode_ci NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `common_event_contents` */

insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (26,10,0,'','11','2012-08-29 10:54:37',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (27,10,0,'','22','2012-08-29 10:55:51',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (28,10,1,'lindp','33','2012-08-29 14:20:17',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (29,9,1,'lindp','44','2012-08-30 08:28:14',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (30,9,1,'lindp','33','2012-08-30 08:28:17',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (31,9,1,'lindp','22','2012-08-30 08:28:19',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (32,9,1,'lindp','11','2012-08-30 08:28:25',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (33,9,1,'lindp','55','2012-08-30 08:45:23',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (34,15,20120907,'aa10','333','2012-09-07 09:41:41',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (35,14,20120907,'aa10','11','2012-09-07 09:41:57','58ee3d6d55fbb2fb781a96574f4a20a44623dc46.jpg','image/jpeg',128800,'2012-09-07 09:41:56');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (36,15,20120907,'aa10','地方','2012-09-07 09:51:14',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (37,15,20120907,'aa10','地方','2012-09-07 09:51:22','58ee3d6d55fbb2fb781a96574f4a20a44623dc46.jpg','image/jpeg',128800,'2012-09-07 09:51:22');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (38,15,20120907,'aa10','33','2012-09-07 09:54:10',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (39,15,20120907,'aa10','33','2012-09-10 09:09:01','58ee3d6d55fbb2fb781a96574f4a20a44623dc46.jpg','image/jpeg',128800,'2012-09-10 09:08:59');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (40,15,20120907,'aa10','、、','2012-09-10 10:04:13','你.jpg','image/jpeg',128800,'2012-09-10 10:04:13');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (41,15,20120907,'aa10','qq','2012-09-10 10:35:56',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (42,15,20120907,'aa10','4','2012-09-11 09:47:30',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (43,15,20120907,'aa10','l','2012-09-11 09:52:20',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (44,15,20120907,'aa10','p','2012-09-11 09:52:36',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (45,8,20120907,'aa10','0000','2012-09-11 09:53:32',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (46,8,20120907,'aa10','d','2012-09-11 10:01:21','未命名.jpg','image/jpeg',24965,'2012-09-11 10:01:21');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (47,8,20120907,'aa10','png','2012-09-11 10:02:43','无标题.png','image/png',7559,'2012-09-11 10:02:42');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (48,8,20120907,'aa10','dffdf','2012-09-11 10:10:30','无标题.png','image/png',7559,'2012-09-11 10:10:29');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (49,8,20120907,'aa10','ffffffff','2012-09-11 10:10:58','无标题.png','image/png',7559,'2012-09-11 10:10:58');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (50,8,20120907,'aa10','11','2012-09-11 10:12:00','未命名.jpg','image/jpeg',24965,'2012-09-11 10:11:59');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (51,8,20120907,'aa10','33','2012-09-11 10:14:29','无标题.png','image/png',7559,'2012-09-11 10:14:29');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (52,8,20120907,'aa10','33','2012-09-11 10:17:01',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (53,8,20120907,'aa10','44','2012-09-11 10:17:08','无标题.png','image/png',7559,'2012-09-11 10:17:08');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (54,8,20120907,'aa10','55','2012-09-11 10:18:43','无标题.bmp','image/bmp',509574,'2012-09-11 10:18:43');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (55,8,20120907,'aa10','66','2012-09-11 10:19:16','未命名.jpg','image/jpeg',24965,'2012-09-11 10:19:16');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (56,8,20120907,'aa10','556','2012-09-11 11:13:05','无标题.png','image/png',7559,'2012-09-11 11:13:05');
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (57,15,20120907,'aa10','还可输入 96字还可输入 96字还可输入 96字还可输入 96字还可输入 96字还可输入 96字还可输入 96字还可输入 96字还可输入 96字还可输入 96字还可输入 96字还可输入 96字还可输入 96字还可输入 96字还可输入 96字还可输入 96还可输入 96字还可','2012-09-13 09:01:12',NULL,NULL,NULL,NULL);
insert  into `common_event_contents`(`id`,`event_id`,`user_id`,`user_nickname`,`msg_content`,`insert_time`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`) values (58,17,2,'adfdf','搜索','2012-09-19 11:33:30',NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `common_events` */

insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (1,'我是1号',0,'2012-08-29 10:39:10');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (2,'我是2号',0,'2012-08-29 10:39:11');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (3,'我是3号',0,'2012-08-29 10:39:12');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (4,'我是4号',0,'2012-08-29 10:39:12');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (5,'我是5号',0,'2012-08-29 10:39:12');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (6,'我是6号',0,'2012-08-29 10:39:13');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (7,'我是7',0,'2012-08-29 10:39:13');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (8,'我是8号',12,'2012-09-11 11:13:05');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (9,'我是9号',5,'2012-08-30 08:45:23');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (10,'我是10号号号号号号号号号号号',3,'2012-08-29 14:20:17');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (11,'111',0,'2012-09-01 18:13:53');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (12,'555',0,'2012-09-01 18:14:18');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (13,'33434',0,'2012-09-01 18:14:27');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (14,'ee',1,'2012-09-07 09:41:57');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (15,'eeff',11,'2012-09-13 09:01:12');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (16,'大的',0,'2012-09-18 09:20:55');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (17,'ff',1,'2012-09-19 11:33:30');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (18,'ff1',0,'2012-09-18 09:57:28');
insert  into `common_events`(`id`,`title`,`message_count`,`lastupdate_time`) values (19,'fff',0,'2012-09-18 09:59:04');

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
  `nick_name` char(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户昵称',
  `contact_me` char(48) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `is_pm` tinyint(1) DEFAULT '0',
  `lastlogin_time` datetime DEFAULT '2012-08-10 00:00:00' COMMENT '最后登录时间',
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册(插入)时间',
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20120909 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`password_digest`,`nick_name`,`contact_me`,`is_pm`,`lastlogin_time`,`reg_time`) values (2,'a@a.com','$2a$10$7g7gJb1DJYwrpPXQUfyH2u3SIJKXhLomt8.2eBjcK4GbZfyOIPQyW','adfdf','多的dd',0,'2012-09-19 10:17:02','2012-09-19 10:20:01');
insert  into `users`(`id`,`name`,`password_digest`,`nick_name`,`contact_me`,`is_pm`,`lastlogin_time`,`reg_time`) values (20120906,'lin_style@foxmail.com','$2a$10$lYWxNptRa14NNxlQiYBPRenTdwfZHW2DyAElekawynyQqF3Mrw.Eq','lindp',NULL,1,'2012-09-19 08:18:51','2012-09-19 08:18:51');
insert  into `users`(`id`,`name`,`password_digest`,`nick_name`,`contact_me`,`is_pm`,`lastlogin_time`,`reg_time`) values (20120907,'aa10@aa10.com','$2a$10$k9GxzzKZ/NChx6qd1Ctl4eix4CyhmLrwOMNZkH1.8nPfUwCTt6dyS','aa10',NULL,0,'2012-09-13 08:54:53','2012-09-13 08:54:53');
insert  into `users`(`id`,`name`,`password_digest`,`nick_name`,`contact_me`,`is_pm`,`lastlogin_time`,`reg_time`) values (20120908,'aa11@aa10.com','$2a$10$jPKTOTFuLleTZnTxXg06M.FacvL86GciGLe9fXWSPpOGFA1GuX56u','干干','地地道道',0,'2012-09-18 09:20:50','2012-09-18 09:20:50');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
