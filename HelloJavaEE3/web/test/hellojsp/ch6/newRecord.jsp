<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/14
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="inquire" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>newRecord</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<%
    String nu = request.getParameter("number");
    String na = request.getParameter("name");
    String mT = request.getParameter("year");
    String pr = request.getParameter("price");
    byte bb[] = na.getBytes("GBK");
    na = new String(bb);
%>
    <inquire:InsertRecord number="<%=nu%>" name="<%=na%>" year="<%=mT%>" price="<%=pr%>"/>
    <br>product表添加记录后的记录是:
    <inquire:QueryTab dataBaseName="warehouse" tableName="product" user="root" password="Zzerp123"/>
    <br><%=queryResult%>
</font>


</body>
</html>
