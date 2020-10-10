<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 8:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>third</title>
</head>
<body bgcolor="#00ffff">
我是third.jsp页面
<%
    String id = session.getId();
    out.println("<br>你的session对象的ID是:<br>" + id);
%>
<br>单击超链接，链接到first.jsp的页面
<br><a href="first.jsp">欢迎去first.jsp!</a>
</body>
</html>
