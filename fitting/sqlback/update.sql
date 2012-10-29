/*2012.10.29 扩大发消息内容长度*/
alter table `jzns`.`common_event_contents` change `msg_content` `msg_content` char(210) character set utf8 collate utf8_unicode_ci NOT NULL;