<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/18
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.ReadFile" %>
<html>
<head>
    <title>read</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<jsp:useBean id="file" class="bean.ReadFile" scope="session"/>
    <jsp:setProperty name="file" property="fileDir"/>
    <p>该目录<jsp:getProperty name="file" property="fileDir"/></p>
    有如下文件<br>
    <jsp:getProperty name="file" property="listFile"/>
    <form action="" method="post" name="form">
        输入一个文件名字:
        <input type="text" name="filename">
        <input type="submit" value="提交" name="submit">
    </form>
    <jsp:setProperty name="file" property="filename" param="filename"/>
    文件:<jsp:getProperty name="file" property="filename"/>
    内容如下:<br>
    <jsp:getProperty name="file" property="readContent"/>
    <br>
    <a href="select.jsp">重新选择目录</a>
</font>


</body>
</html>
