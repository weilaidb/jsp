<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/14
  Time: 12:42
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
    this.getServletConfig().getServletContext()
            .setAttribute("info", "www.weilaidb.com");
%>
</body>
</html>
