<%@ page import="base.CStringPub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/30
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sqlite" tagdir="/WEB-INF/tags/sqlite" %>

<html>
<head>
    <title>删除数据</title>
</head>
<body bgcolor="#008b8b">
<%
    String database = request.getParameter("database");
    String table    = request.getParameter("table");
    String id    = request.getParameter("id");
    database = CStringPub.ifNullSetEmpty(database);
    table = CStringPub.ifNullSetEmpty(table);
    id = CStringPub.ifNullSetEmpty(id);
%>

<form action="" method="post" name="form1" accept-charset="gbk">
    <a href="index.jsp">首页</a>
    输入要删除的ID
    <input type="text" name="id" value="">
    <input type="hidden" name="database" value="<%=database%>">
    <input type="hidden" name="table" value="<%=table%>">
    <input type="submit" name="delete" value="删除">
</form>

<sqlite:DeleteTable database="<%=database%>" table="<%=table%>" id="<%=id%>"/>
操作结果:<%=result%>

</body>
</html>
