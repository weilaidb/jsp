<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 23:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Submit</title>
</head>
<body>
<form action="messagePane.jsp" method="post" name="form">
    <p>输入你的名字:</p>
    <input type="text" name="peopleName">
    <br>
    <p>输入你的留言标题:</p>
    <input type="text" name="Title">
    <br>
    <p>输入你的留言:</p>
    <br>
    <textarea name="messages" rows="10" cols="36" WRAP="physcial"></textarea>
    <br>
    <input type="submit" value="提交信息" name="submit">
</form>
<form action="showMessage.jsp" method="post" name="form">
    <input type="submit" value="查看留言板" name="submit">
</form>
</body>
</html>
