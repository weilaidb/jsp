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
    <title>取出Cookie</title>
</head>
<body>
<%
    Cookie c[] = request.getCookies(); //取得全部的 Cookie
    for(int x = 0; x < c.length; x++) {
%>
        <h3><%=c[x].getName()%>  --> <%=c[x].getValue()%> </h3>
<%
    }
%>


</body>
</html>
