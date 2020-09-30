<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/9/30
  Time: 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>forward动作标记</title>
</head>
<body>
<%
    double i = Math.random();
%>
<jsp:forward page="come.jsp">
    <jsp:param name="number" value="<%=i%>"/>
</jsp:forward>

</body>
</html>
