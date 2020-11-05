-- drop database if exists showui;
create database if not exists showui;
use showui;
drop table if exists java;
create table java (  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
name varchar(3000),
create_time datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
UNIQUE KEY `name_UNIQUE` (`id`)
)  ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4;
-- insert into pubuse values(NULL, '10 你好吗');


--使用以下命令创建sqlite3命令（提前)。
CREATE TABLE java(
[ID] INTEGER PRIMARY KEY,
[name] varchar(200),
create_time TimeStamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
update_time TimeStamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE singleitem_abc(
[ID] INTEGER PRIMARY KEY,
[name] varchar(200),
create_time TimeStamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
update_time TimeStamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
