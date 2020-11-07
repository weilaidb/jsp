CREATE SCHEMA `alldb`;

use alldb;
CREATE TABLE `abc` (
  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'keyword',
  `content` mediumtext,
    create_time datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',  
  PRIMARY KEY (`id`),
);

--使用以下命令创建sqlite3命令（提前)。
CREATE TABLE  IF NOT EXISTS abc(
[ID] INTEGER PRIMARY KEY   AUTOINCREMENT,
[name] varchar(200),
[content] varchar(200),
[note] varchar(200),
create_time TimeStamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
update_time TimeStamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
