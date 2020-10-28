<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
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

<html>
<head>
    <title>常用记事本</title>
</head>
<body bgcolor="#00ffff">
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
%>
<form action="querytablesingle.jsp" method="post" name="form" class="form">
    <input type="hidden" name="database" value="<%=CSqlitePub.getSqlitePathTrimDriver(databaseProc)%>"/>
    <input type="submit" name="table" value="<%=table%>" class="submitbtn"/>
    <input type="hidden" name="item" value="limit" >
    <input type="hidden" name="order" value="order" >
    <input type="hidden" name="showlittle" value="showlittle" >

</form>
<%
    }
%>
</body>
</html>
