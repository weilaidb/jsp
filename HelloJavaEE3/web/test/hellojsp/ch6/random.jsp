<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/13
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="inquire" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Random</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<%
    String dName = request.getParameter("databaseName");
    String tName = request.getParameter("tableName");
    String id = request.getParameter("user");
    String secret = request.getParameter("password");
    String n = request.getParameter("count");

    if (id.trim().length() == 0) {
        id = "root";
    }
%>
    <inquire:RandomQuery databaseName="<%=dName%>" tableName="<%=tName%>" user="<%=id%>" password="<%=secret%>" count="<%=n%>"/>
    在<%=biao%>表随机查询到<%=randomCount%>条记录:
    <br><%=queryResult%>
</font>


</body>
</html>
