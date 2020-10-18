<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/18
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>目录内容查看</title>
</head>
<body bgcolor="yellow">
<p>请选择一个目录:</p>
<font size="3">
<form action="read.jsp" method="post" name="form">
    <br>选择n的值:<br>
    <select name="fileDir">
        <option value="D:/1000/">D:/1000/</option>
        <option value="C:/">C:/</option>
        <option value="E:/">E:/</option>
        <option value="G:/">G:/</option>
    </select>
    <input type="submit" value="提交" name="submit">
</form>


</font>


</body>
</html>
