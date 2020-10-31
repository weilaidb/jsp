<%@ page import="sql.CSqlitePub" %>
<%@ page import="base.CStringPub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/31
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/sqlite/link" %>
<link href="../../../css/csspub.css" rel="stylesheet" type="text/css">
<html>
<head>
    <title>添加链接</title>
</head>
<body>
<%
    String database = request.getParameter("database");
    String databaseProc = CSqlitePub.getSqliteWholePath(database);
    String table = CStringPub.requesParaIfNullSetEmpty(request, "table");
    String content = CStringPub.requesParaIfNullSetEmpty(request, "content");
    String note = CStringPub.requesParaIfNullSetEmpty(request, "note");
    System.out.println("databaseProc: " + databaseProc);
    System.out.println("table   : " + table);
%>

<form action="" method="post" name="form1" accept-charset="gbk" class="form">
    <input type="hidden" name="database" value="<%=databaseProc%>">
    <input type="hidden" name="table" value="<%=table%>">
    <a href="index.jsp">首页</a><br>
    网址:<input type="text" name="content" class="text"><br>
    名称:<input type="text" name="note" class="text"><br>
    <input type="submit" value="添加链接" type="submit"/>
</form>


<link:InsertTable database="<%=databaseProc%>" table="<%=table%>" content="<%=content%>" note="<%=note%>"></link:InsertTable>
<%=result%>

</body>
</html>
