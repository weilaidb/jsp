<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/2 0002
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <jsp:include page="head.txt"/>
</head>
<body bgcolor="yellow">
<p>
    <font size="5" color="red">This is error.jsp</font>
    <%
        String s= request.getParameter("mess");
        out.println("<br>传递过来的错误信息" + s);
    %>
    <br>
    <img src="error.jpg" width="120" height="120"/>

</p>

</body>
</html>
