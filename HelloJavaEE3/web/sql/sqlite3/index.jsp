<%@ page import="base.CStringPub" %>
<%@ page import="weilaidb.CSqlitePub" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %><%--
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
    常用链接
    <a href="addlink.jsp">添加链接</a>
    <form action="" method="post" name="form">
        请输入Sqlite位置:
        <input type="text" name="database">
<%--        请输入表名:--%>
<%--        <input type="text" name="table">--%>
        <input type="submit" value="查询" name="submit">
<%--        <input type="checkbox" name="item" value="limit" checked="checked">限制--%>
<%--        <input type="checkbox" name="order" value="order" checked="checked">反序--%>
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
<%--<%=tablelist%>--%>
<%
    String strList = tablelist.toString().replaceAll("\\[","").replaceAll("]","");
    List<String> tables = Arrays.asList(strList.toString().split(",")); //通过逗号间隔重新提取出每个字符成员，转成List<String>
    for (String table :
            tables) {
%>
<font size="3">
    <form action="data.jsp" method="post" name="form">
        <input type="text" name="table" value="<%=table%>" size="20" >
        <input type="submit" value="查询" name="submit">
<%--        <%=table%>--%>
    </form>
</font>

<%


        out.print("");
    }
%>
</body>
</html>
