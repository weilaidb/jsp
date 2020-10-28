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
<%--
设计内容:
1.常用链接
2.查询表的内容，按名称
3.
--%>
<font size="3">
    <a href="showtables.jsp">常用链接</a>
    <form action="" method="post" name="form">
        请输入Sqlite位置:
        <input type="text" name="database">
        <input type="submit" value="查询" name="submit">
    </form>
</font>
<%
    String database = request.getParameter("database");
    String databaseProc = CStringPub.ifNullSetEmpty(database);
    if(databaseProc.isEmpty())
    {
        databaseProc = CSqlitePub.getSqliteWholePath();
    }
    else
    {
        databaseProc = CSqlitePub.getSqlitePathWithDriver(databaseProc);
    }
%>

<sqlite:ShowTables database="<%=databaseProc%>"/>
Sqlite库[<%=CSqlitePub.getSqlitePathTrimDriver(databaseProc)%>]有以下表:<br/>
<%=tablelist%>

</body>
</html>
