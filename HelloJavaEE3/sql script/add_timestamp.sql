mysql 增加时间字段
alter table sign_customer add COLUMN update_time timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ;
alter table abc add COLUMN update_time timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ;
alter table abcbin add COLUMN update_time timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ;

建表自动增加时间戳
create_time datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

分类: mysql

