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
<%
    System.out.println("============ forward 跳转之前============");
%>
<%
    response.sendRedirect("response_demo03.htm");
%>
<%
    System.out.println("============ forward 跳转之后============");
%>


</body>
</html>
