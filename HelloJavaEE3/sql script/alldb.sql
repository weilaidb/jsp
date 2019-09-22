CREATE SCHEMA `alldb`;

use alldb;
CREATE TABLE `abc` (
  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'keyword',
  `content` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=664 DEFAULT CHARSET=utf8