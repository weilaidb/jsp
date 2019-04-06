<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/6
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="emp_insert_do.jsp" method="post">
    雇员编号:<input type="text" name="empno"><br>
    雇员姓名:<input type="text" name="ename"><br>
    雇员职位:<input type="text" name="job"><br>
    雇佣日期:<input type="text" name="hiredate"><br>
    基本工资:<input type="text" name="sal"><br>
    <input type="submit" value="注册">
    <input type="reset" value="重置">
</form>
</body>
</html>
