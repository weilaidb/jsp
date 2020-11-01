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
<link href="../../css/csspub.css" rel="stylesheet" type="text/css">

<%
    String database = request.getParameter("database");
    String table = request.getParameter("table");
    String item = request.getParameter("item");
    String order = request.getParameter("order");
    String databaseProc = CSqlitePub.getSqliteWholePath(database);
    table = CStringPub.ifNullSetEmpty(table);
    item = CStringPub.ifNullSetEmpty(item);
    order = CStringPub.ifNullSetEmpty(order);
%>

<html>
<head>
    <title>常用记事本-<%=table%></title>
</head>
<body bgcolor="#c6ecd3">
<%--
设计内容:
1.常用链接
2.查询表的内容，按名称
3.
--%>
<font size="3">
    <a href="showtables.jsp">添加链接</a>
    <form action="" method="post" name="form" accept-charset="gbk">
        请输入Sqlite位置:
        <input type="text" name="database">
        请输入表名:
        <input type="text" name="table">
        <input type="submit" value="查询" name="submit">
        <input type="checkbox" name="item" value="limit" checked="checked">限制
        <input type="checkbox" name="order" value="order" checked="checked">反序
    </form>
</font>

<sqlite:QuerySqlite database="<%=databaseProc%>" table="<%=table%>" item="<%=item%>" order="<%=order%>"/>
Sqlite库[<%=CSqlitePub.getSqlitePathTrimDriver(databaseProc)%>]有以下表:
<%=tablelist%>
查询表[<%=table%>]结果:
<%=orderResult%>

</body>
</html>
