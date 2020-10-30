<%@ page import="base.CStringPub" %>
<%@ page import="sql.CSqlitePub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/30
  Time: 8:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sqlite" tagdir="/WEB-INF/tags/sqlite" %>
<html>
<head>
    <title>创建</title>
</head>
<body>
<a href="index.jsp">首页</a>
<font size="3">
    <form action="" method="post" name="form" accept-charset="gbk">
        创建表名:<input type="text" name="table">
        <input type="submit" value="提交" name="submit">
    </form>
</font>

<%
    String database = request.getParameter("database");
    String databaseProc = CSqlitePub.getSqliteWholePath(database);
    String table = request.getParameter("table");
    table = CStringPub.ifNullSetEmpty(table);
    System.out.println("databaseProc: " + databaseProc);
    System.out.println("table   : " + table);
%>

<sqlite:CreateTable database="<%=databaseProc%>" table="<%=table%>"/>
库<%=CSqlitePub.getSqlitePathTrimDriver(databaseProc)%><br>
操作结果:<%=table%><%=result%>

</body>
</html>
