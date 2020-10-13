<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/13
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="inquire" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>inquire</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<%
    String database = request.getParameter("dataBaseName");
    String tName = request.getParameter("tableName");
    String id = request.getParameter("user");
    String secret = request.getParameter("password");
%>
    <inquire:QueryTab dataBaseName="<%=database%>" tableName="<%=tName%>" password="<%=secret%>" user="<%=id%>"/>
    在<%=biao%>表查询到记录:
    <br><%=queryResult%>
</font>

</body>
</html>
