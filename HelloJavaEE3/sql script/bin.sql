CREATE SCHEMA `alldbbin` DEFAULT CHARACTER SET binary ;

use alldbbin;
CREATE TABLE `abcbin` (
  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'keyword',
  `content` mediumtext,
  `content_bin` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8mb4