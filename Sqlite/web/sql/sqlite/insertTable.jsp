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
<link href="../../css/csspub.css" rel="stylesheet" type="text/css">

<%
    String table = request.getParameter("table");
    String database = request.getParameter("database");
    database = CStringPub.ifNullSetEmpty(database);
    table = CStringPub.ifNullSetEmpty(table);
    System.out.println("database: " + database);
    System.out.println("table   : " + table);
%>

<html>
<head>
    <script type="text/javascript" src="js/clipboard.js"></script>
    <title>添加内容</title>
</head>
<body onload="ClearTextArea()">

<%--查看数据--%>
<form action="procSingleTable.jsp" method="post" name="form" accept-charset="gbk">
    <input type="hidden" name="database" value="<%=database%>">
    <input type="hidden" name="table" value="<%=table%>">
    <input type="hidden" name="columns" value="ID,content">
    <input type="hidden" name="item" value="limit" checked="checked">
    <input type="hidden" name="order" value="order" checked="checked">
    <input type="hidden" name="showlittle" value="showlittle" checked="checked">
    <a href="index.jsp">首页</a>
    <input type="submit" value="查看数据" name="submit">
</form>

<form action="" method="post" name="form1" accept-charset="gbk">
    请输入保存数据：
    <input type="hidden" name="database" value="<%=database%>">
    <input type="hidden" name="table" value="<%=table%>">
    <input type="submit" name="Submit" value="点击保存" class="clsSubmitBtn"/>
    <input type="button" id="id_cleararea" name="cleararea" value="清空" class="clsSubmitBtn"
           onclick="ClearTextArea()">
    <%--<input type="button" id="id_paste2area" name="paste2area" value="粘贴" class="submitbtn"--%>
    <%--onclick="ClipBoard2TextArea()"/>--%>
    <br/>
    <textarea id="id_insertdb" name="content"
              class="dia_wabbit">
    </textarea>
</form>
<%
    database       = request.getParameter("database");
    table          = request.getParameter("table");
    String content = request.getParameter("content");
    String databaseProc = CSqlitePub.getSqliteWholePath(database);
    table   = CStringPub.ifNullSetEmpty(table);
    content = CStringPub.ifNullSetEmpty(content);
    System.out.println("databaseProc: " + databaseProc);
    System.out.println("table   : " + table);
    System.out.println("content   : " + content);
%>

<sqlite:InsertTable database="<%=databaseProc%>" table="<%=table%>" content="<%=content%>"/>
操作结果:[<%=result%>] <br>
提示:<%=CSqlitePub.getSqlitePathTrimDriver(databaseProc)%> 表<%=table%>

<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font></h2>

</body>
</html>
