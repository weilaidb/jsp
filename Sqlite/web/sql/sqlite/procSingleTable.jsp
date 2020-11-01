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
    String table    = request.getParameter("table");
    database = CStringPub.ifNullSetEmpty(database);
    table = CStringPub.ifNullSetEmpty(table);
%>

<html>
<head>
    <Script Language="JavaScript">
        function addTable()
        {
            document.form1.action="insertTable.jsp";
            document.form1.submit();
        }

        function deleteTable()
        {
            document.form1.action="deleteTable.jsp";
            document.form1.submit();
        }
    </Script>
    <title>常用记事本-<%=table%></title>
</head>
<body bgcolor="#c6ecd3">

<%--添加数据--%><%--删除数据--%>
<form action="" method="post" name="form1" accept-charset="gbk" target="_blank" class="form">
    <input type="hidden" name="database" value="<%=database%>">
    <input type="hidden" name="table" value="<%=table%>">
    <a href="index.jsp">首页</a>
    <input type="button" value="添加数据" type="submit" onclick="addTable()"/>
    <input type="button" value="删除数据" type="submit" onclick="deleteTable()"/>
</form>

<%--查询数据--%>
<font size="3">
    <form action="" method="post" name="form2" accept-charset="gbk">
        在[<%=table%>]查询内容:<br>
        <input type="text" name="findwords"><br>
        <input type="hidden" name="database" value="<%=database%>">
        <input type="hidden" name="table" value="<%=table%>">
        <input type="hidden" name="columns" value="ID,content">
        <input type="checkbox" name="item" value="limit" checked="checked">限制
        <input type="checkbox" name="order" value="order" checked="checked">反序
        <input type="checkbox" name="showlittle" value="showlittle" checked="checked">缩略显示
        <input type="submit" value="查询" name="submit">
    </form>
</font>


<%
    String item = request.getParameter("item");
    String order = request.getParameter("order");
    String columns = request.getParameter("columns");
    String findwords = request.getParameter("findwords");
    String showlittle = request.getParameter("showlittle");
    item = CStringPub.ifNullSetEmpty(item);
    order = CStringPub.ifNullSetEmpty(order);
    columns = CStringPub.ifNullSetEmpty(columns);
    findwords = CStringPub.ifNullSetEmpty(findwords);
    showlittle = CStringPub.ifNullSetEmpty(showlittle);
    System.out.println("columns:" + columns);
    System.out.println("findwords:" + findwords);
    System.out.println("showlittle:" + showlittle);

%>

<sqlite:QueryContent database="<%=database%>"
                     table="<%=table%>"
                     item="<%=item%>"
                     order="<%=order%>"
                     columns="<%=columns%>"
                     findwords="<%=findwords%>"
                     showlittle="<%=showlittle%>"
/>

查询结果[<%=CSqlitePub.procContentWithChinese(findwords)%>]:
<%=orderResult%>


</body>
</html>
