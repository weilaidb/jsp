drop database if exists files;
create database if not exists files;
use files;
drop table if exists explorerlist;
create table explorerlist (name varchar(4096))  ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;
insert into explorerlist values('C:');
insert into explorerlist values('D:');
insert into explorerlist values('E:');
insert into explorerlist values('E:\\books');
insert into explorerlist values('E:\\books\\java web\\Java Web开发实战经典.pdf');
insert into explorerlist values('E:\\mysqlbackup\\backup-mysql.bat');
insert into explorerlist values('E:\\mysqlbackup');
insert into explorerlist values('E:\\tarbao\\python\\AutoMyCCode');
insert into explorerlist values('E:\\tarbao\\egjsp\\eclipse-workspace\\TomcatTest\\HelloJavaEE3');
insert into explorerlist values('E:\\tarbao\\egjsp\\eclipse-workspace\\TomcatTest');
