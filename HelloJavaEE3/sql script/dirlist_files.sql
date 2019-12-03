#drop database if exists files;
create database if not exists files;
use files;

drop table if exists dirlist;
create table dirlist (  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
name varchar(3000),
PRIMARY KEY (`id`),
UNIQUE KEY `name_UNIQUE` (`id`)
)  ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4;
insert into dirlist values(NULL, 'E:\\books');