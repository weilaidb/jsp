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
    <jsp:useBean id="girl" class="bean.Circle" scope="page"/>
<%--    通过上述useBean标记，用户获得了一个scope是page，id是girl的bean--%>
    <%
        girl.setRadius(100);
    %>
    <br>圆的半径是:<%=girl.getRadius()%>
    <br>圆的周期是:<%=girl.circleLength()%>
    <br>圆的面积是:<%=girl.circleArea()%>
</font>



</body>
</html>
