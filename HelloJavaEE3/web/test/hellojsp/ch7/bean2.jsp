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
<body bgcolor="yellow">
<font size="4">
    <jsp:useBean id="girl" class="bean.Circle" scope="session"/>
<%--    通过上述useBean标记，用户获得了一个scope是page，id是girl的bean--%>
    <br>圆的半径是:<%=girl.getRadius()%>
    <%girl.setRadius(600);%>
    <p>修改后的回的半径是:</p>
    <%=girl.getRadius()%>
</font>



</body>
</html>
