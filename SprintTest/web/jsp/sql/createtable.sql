USE mldn;
DROP TABLE IF EXISTS emp;

CREATE TABLE emp(
empno  INT(4) PRIMARY KEY,
ename  VARCHAR (10) CHARACTER SET utf8 COLLATE 'utf8_general_ci',
job    VARCHAR (9) CHARACTER SET utf8 COLLATE 'utf8_general_ci',
hiredate DATE,
sal FLOAT (7,2)
);

INSERT INTO emp(empno, ename, job, hiredate, sal) VALUES (1111,'李李李','经理','2014-08-09',23033.3);
INSERT INTO emp(empno, ename, job, hiredate, sal) VALUES (2222,'李李李','经理','2014-08-09',23033.3);
INSERT INTO emp(empno, ename, job, hiredate, sal) VALUES (3333,'李李李','经理','2014-08-09',23033.3);
INSERT INTO emp(empno, ename, job, hiredate, sal) VALUES (44444,'李李李','经理','2014-08-09',23033.3);
INSERT INTO emp(empno, ename, job, hiredate, sal) VALUES (5555,'李李李','经理','2014-08-09',23033.3);
INSERT INTO emp(empno, ename, job, hiredate, sal) VALUES (6666,'李李李','经理','2014-08-09',23033.3);
INSERT INTO emp(empno, ename, job, hiredate, sal) VALUES (7777,'李李李','经理','2014-08-09',23033.3);
INSERT INTO emp(empno, ename, job, hiredate, sal) VALUES (8888,'李李李','经理','2014-08-09',23033.3);
