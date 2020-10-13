<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/13
  Time: 8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="inquire" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Mysql</title>
</head>
<body bgcolor="#00ffff">
<font size="3">
    <form action="inquire.jsp" method="post" name="form">
        输入数据库名:
        <input type="text" name="dataBaseName" size="8">
        输入表的名字:
        <input type="text" name="tableName" size="8">
        <br>输入用户名:
        <input type="text" name="user" size="6">(默认是root)
        <input type="text" name="password" size="6">(默认是空)
        <input type="submit" value="提交" name="g">
    </form>
</font>

</body>
</html>
