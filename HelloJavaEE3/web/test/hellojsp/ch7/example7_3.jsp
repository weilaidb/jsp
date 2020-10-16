<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/15
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.*" %>
<html>
<head>
    <title>useBean</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
    <jsp:useBean id="girl" class="bean.Circle" scope="application"/>
<%--    通过上述useBean标记，用户获得了一个scope是page，id是girl的bean--%>
    <br>圆的半径是:<%=girl.getRadius()%>
    <%
    girl.setRadius(1000);
    %>
</font>



</body>
</html>
