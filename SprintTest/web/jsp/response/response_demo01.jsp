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
<%!
    //定义全局变量
    int count = 0;
%>

<%
    //设置两秒一刷新
    response.setHeader("refresh", "2");
%>
<h3>已经访问了<%=count++%>次!</h3>
</body>
</html>
