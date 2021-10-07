<%@ page import="string.CStringPub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>登陆操作</h1>
    <h2>登陆失败，请重新<a href="login.jsp">登陆</a>! </h2>
    <%
        out.write(CStringPub.ifNullSetEmpty(session.getAttribute("tips").toString()));
    %>
</center>
</body>
</html>
