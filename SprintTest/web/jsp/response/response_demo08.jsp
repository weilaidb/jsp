<%@ page import="java.net.CookieHandler" %><%--
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
    <title>为Cookie设置保存时间</title>
</head>
<body>
<%
    Cookie c1 = new Cookie("myname", "future");
    Cookie c2 = new Cookie("shijie", "meihao");
    c1.setMaxAge(60); // Cookie保存60秒
    c2.setMaxAge(60);
    response.addCookie(c1);
    response.addCookie(c2);
%>


</body>
</html>
