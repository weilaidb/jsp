<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 6:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>refresh time</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<p>现在的时间是:<br>
    <%
        out.println("" + new Date());
        response.setHeader("Refresh", "5");
    %>
</font>
</body>
</html>
