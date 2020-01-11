drop database if exists files;
create database if not exists files;
use files;
drop table if exists explorerlist;
create table explorerlist (  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
name varchar(3000),
create_time datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
UNIQUE KEY `name_UNIQUE` (`id`)
)  ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4;
insert into explorerlist values(NULL, 'C:');
insert into explorerlist values(NULL, 'D:');
insert into explorerlist values(NULL, 'E:');
insert into explorerlist values(NULL, 'E:\\books');
insert into explorerlist values(NULL, 'E:\\books\\java web\\Java Web开发实战经典.pdf');
insert into explorerlist values(NULL, 'E:\\mysqlbackup\\backup-mysql.bat');
insert into explorerlist values(NULL, 'E:\\mysqlbackup');
insert into explorerlist values(NULL, 'E:\\tarbao\\python\\AutoMyCCode');
insert into explorerlist values(NULL, 'E:\\tarbao\\egjsp\\eclipse-workspace\\TomcatTest\\HelloJavaEE3');
insert into explorerlist values(NULL, 'E:\\tarbao\\egjsp\\eclipse-workspace\\TomcatTest');



drop table if exists dirlist;
create table dirlist (  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
name varchar(3000),
PRIMARY KEY (`id`),
UNIQUE KEY `name_UNIQUE` (`id`)
)  ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4;
insert into dirlist values(NULL, 'E:\\books');
