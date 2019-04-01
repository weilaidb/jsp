<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/1
  Time: 7:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>3秒后跳转到 首页，如果没有跳转请按<a href="../../index.jsp">这里</a>! </h3>
<%
response.setHeader("refresh", "3;URL=../../index.jsp");
%>
</body>
</html>
