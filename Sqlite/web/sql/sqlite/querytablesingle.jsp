<%@ page import="base.CStringPub" %>
<%@ page import="sql.CSqlitePub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/25
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="sqlite" tagdir="/WEB-INF/tags/sqlite" %>
<html>
<head>
    <title>常用记事本-Sqlite</title>
</head>
<body bgcolor="#00ffff">
<%
    String table = request.getParameter("table");
    String database = request.getParameter("database");
    database = CStringPub.ifNullSetEmpty(database);
    table = CStringPub.ifNullSetEmpty(table);
    System.out.println("database: " + database);
    System.out.println("table   : " + table);
%>

<font size="3">
<%--    <a href="showtables.jsp">添加链接</a>--%>
    <form action="" method="post" name="form">
        在[<%=table%>]查询内容:<br>
        <input type="text" name="findwords">
        <input type="hidden" name="database" value="<%=database%>">
        <input type="hidden" name="table" value="<%=table%>">
        <input type="checkbox" name="item" value="limit" checked="checked">限制
        <input type="checkbox" name="order" value="order" checked="checked">反序
        <input type="submit" value="查询" name="submit">
        <br>
        查找的列:
        <input type="text" name="columns" value="ID,content">
    </form>
</font>

<%
    String item = request.getParameter("item");
    String order = request.getParameter("order");
    String columns = request.getParameter("columns");
    item = CStringPub.ifNullSetEmpty(item);
    order = CStringPub.ifNullSetEmpty(order);
    columns = CStringPub.ifNullSetEmpty(columns);
    System.out.println("columns:" + columns);

%>

<sqlite:QueryContent database="<%=database%>" table="<%=table%>" item="<%=item%>" order="<%=order%>" columns="<%=columns%>"/>
查询结果:
<%=orderResult%>
<%--<sqlite:QuerySqlite database="<%=database%>" table="<%=table%>" item="<%=item%>" order="<%=order%>"/>--%>
<%--<br></br>Sqlite库[<%=database%>]有以下表:--%>
<%--<%=tablelist%>--%>
<%--<br>查询表[<%=table%>]结果:--%>
<%--<%=orderResult%>--%>

</body>
</html>
