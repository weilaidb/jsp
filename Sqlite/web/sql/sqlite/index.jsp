<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="sql.CSqlitePub" %>
<%@ page import="base.CStringPub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/25
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="sqlite" tagdir="/WEB-INF/tags/sqlite" %>
<link href="../../css/csspub.css" rel="stylesheet" type="text/css">

<html>
<head>
    <title>常用记事本</title>
</head>
<body bgcolor="#c6ecd3">
<a href="createTable.jsp">创建</a>
<%--删除表功能暂时不打开--%>
<%--<a href="delete.jsp">删除</a>--%>
<%
    String database = request.getParameter("database");
    String databaseProc = CSqlitePub.getSqliteWholePath(database);
%>

<sqlite:ShowTables database="<%=databaseProc%>"/>

<%
    String strList = tablelist.toString().replaceAll("\\[","").replaceAll("]","");
    List<String> tables = Arrays.asList(strList.toString().split(",")); //通过逗号间隔重新提取出每个字符成员，转成List<String>
    for (String table :
            tables) {
        if(CStringPub.isTrimEmpty(table))
        {
            continue;
        }
%>
<font size="4">
    <form action="procSingleTable.jsp" method="post" name="form" class="form" accept-charset="gbk">
        <input type="hidden" name="database" value="<%=CSqlitePub.getSqlitePathTrimDriver(databaseProc)%>"/>
        <input type="hidden" name="item" value="limit" >
        <input type="hidden" name="order" value="order" >
        <input type="hidden" name="columns" value="ID,content">
        <input type="hidden" name="showlittle" value="showlittle" >
        <input type="submit" name="table" value="<%=CStringPub.ifNullSetEmpty(table)%>" class="submitbtn"/>
    </form>
</font>

<%
    }
%>
</body>
</html>
