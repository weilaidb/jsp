mysql 增加时间字段
alter table sign_customer add COLUMN update_time timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ;
alter table abc add COLUMN update_time timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ;
alter table abcbin add COLUMN update_time timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ;

建表自动增加时间戳
create_time datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

分类: mysql

alter table java drop  COLUMN `create_time`;
alter table java drop  COLUMN `update_time`;


alter table java add COLUMN `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create time';
alter table java add COLUMN `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time';


alter table pupils add COLUMN `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create time';
alter table pupils add COLUMN `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time';

alter table timeclock add COLUMN `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create time';
alter table timeclock add COLUMN `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time';

alter table python add COLUMN `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create time';
alter table python add COLUMN `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time';


alter table linux_driver add COLUMN `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create time';
alter table linux_driver add COLUMN `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time';



mysql 添加列，修改列，删除列。
转载ws84643557 最后发布于2011-11-06 01:21:30 阅读数 318364  收藏


MySQL 添加列，修改列，删除列
ALTER TABLE：添加，修改，删除表的列，约束等表的定义。

查看列：desc 表名;
修改表名：alter table t_book rename to bbb;
添加列：alter table 表名 add column 列名 varchar(30);
删除列：alter table 表名 drop column 列名;
修改列名MySQL： alter table bbb change nnnnn hh int;
修改列名SQLServer：exec sp_rename't_student.name','nn','column';
修改列名Oracle：lter table bbb rename column nnnnn to hh int;
修改列属性：alter table t_book modify name varchar(22);
sp_rename：SQLServer 内置的存储过程，用与修改表的定义。





MySQL 查看约束，添加约束，删除约束 添加列，修改列，删除列

查看表的字段信息：desc 表名;
查看表的所有信息：show create table 表名;
添加主键约束：alter table 表名 add constraint 主键 （形如：PK_表名） primary key 表名(主键字段);
添加外键约束：alter table 从表 add constraint 外键（形如：FK_从表_主表） foreign key 从表(外键字段) references 主表(主键字段);
删除主键约束：alter table 表名 drop primary key;
删除外键约束：alter table 表名 drop foreign key 外键（区分大小写）;
修改表名：alter table t_book rename to bbb;
添加列：alter table 表名 add column 列名 varchar(30);
删除列：alter table 表名 drop column 列名;
修改列名MySQL： alter table bbb change nnnnn hh int;
修改列名SQLServer：exec sp_rename't_student.name','nn','column';
修改列名Oracle：alter table bbb rename column nnnnn to hh int;
修改列属性：alter table t_book modify name varchar(22);
sp_rename：SQLServer 内置的存储过程，用与修改表的定义。


