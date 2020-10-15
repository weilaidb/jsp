<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/15
  Time: 8:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%@ taglib prefix="look" tagdir="/WEB-INF/tags/student" %>
<html>
<head>
    <title>byName</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<%
    String number = request.getParameter("number");
    byte bb[] = number.getBytes("GBK");
    number = new String(bb);
%>
    <look:NumberCondition number="<%=number%>"/>
    根据学号<%=number%>查询到的记录:
    <br><%=queryResultByNumber%>
</font>


</body>
</html>
