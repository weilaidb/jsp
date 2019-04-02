<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    response.setHeader("refresh", "2;URL=login.jsp");
    session.invalidate();
%>

<h3>您已经成功退出本系统，两秒后跳转回首页!</h3>
<h3>如果没有跳转，请按<a href="login.jsp">这里</a> </h3>







</body>
</html>
