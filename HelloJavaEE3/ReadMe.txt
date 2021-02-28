功能:
1.优化界面，方便数据查询
2.增加网址和内容库分别显示
3.增加Python 计算器
4.增加从单一表中单一条中查找数据

Linux部署说明:
1.配置路径文件（仅针对代码集)
[duo@bogon reg]$ cat > /home/duo/D\:/mydb/autocodesets/config.txt
/home/duo/work/git/qtlibs_mingw730_32/release/32/reg
2.Sqlite数据库



======显示网页的方法 ：
索引 网址 显示内容
示例
1234 https://stackoverflow.com/  stackoverflow

======显示内容的方法
索引 显示内容 
示例
1234 诸行无常 万法皆空


======搭建环境时，注意事项:
1.Mysql版本使用5.x的版本
2.Tomcat版本没有限制
3.数据库安装时，修改root用户的密码
5.7 命令
set password for 'root'@'localhost'=password('Zzerp123');
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'Zzerp123' WITH GRANT OPTION;
FLUSH PRIVILEGES; 
select * from user;

创建依赖数据库

create database mldn;
use mldn;
DROP TABLE IF EXISTS user;
CREATE TABLE user(
    userid VARCHAR(30) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL

);
INSERT INTO user(userid,name,password) VALUES('admin', 'administrator','admin');



CREATE SCHEMA `alldb`;
use alldb;
CREATE TABLE `abc` (
  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'keyword',
  `content` mediumtext,
    create_time datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',  
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=664 DEFAULT CHARSET=utf8mb4;


