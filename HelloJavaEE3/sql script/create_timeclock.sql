-- drop database if exists showui;
create database if not exists showui;
use showui;
drop table if exists timeclock;
create table timeclock (  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
name varchar(3000),
PRIMARY KEY (`id`),
UNIQUE KEY `name_UNIQUE` (`id`)
)  ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;
-- insert into timeclock values(NULL, '10 你好吗');