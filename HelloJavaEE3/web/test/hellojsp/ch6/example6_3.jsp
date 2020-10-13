<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/13
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="inquire" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>随机查询</title>
</head>
<body bgcolor="#00ffff">

<font size="3">
    <form action="random.jsp" method="post" name="form">
        <p>随机查询记录</p>
        输入数据库名:<input type="text" name="databaseName" size="8">
        <br>输入表的名字:<input type="text" name="tableName" size="15d">
        <br>输入用户名:<input type="text" name="user" size="3">(默认是root)
        <br>输入密码:<input type="text" name="password" size="3">(默认为空)
        <br>输入查询的记录数:<input type="text" name="count" size="3">
        <input type="submit" value="提交" name="g">
    </form>
</font>

</body>
</html>
