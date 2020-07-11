-- drop database if exists showui;
create database if not exists codesets;
use codesets;
drop table if exists ios;
create table language_c(  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
classname varchar(300),
funcname_chinese varchar(300),
funcname_english varchar(300),
implement varchar(3000),
note varchar(300),
version varchar(300),
create_time datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
UNIQUE KEY `name_UNIQUE` (`id`)
)  ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4;
-- insert into language_c values(NULL, '10 你好吗');
