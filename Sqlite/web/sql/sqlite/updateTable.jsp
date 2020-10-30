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
    String database = request.getParameter("database");
    String table = request.getParameter("table");
    String id = request.getParameter("id");
    String content = request.getParameter("content");
    database = CStringPub.ifNullSetEmpty(database);
    table = CStringPub.ifNullSetEmpty(table);
    content = CStringPub.ifNullSetEmpty(content);
    id = CStringPub.ifNullSetEmpty(id);
    System.out.println("database: " + database);
    System.out.println("table   : " + table);
    System.out.println("id   : " + id);
    System.out.println("content   : " + content);
%>

<html>
<head>
    <%--================javascript定义=========================--%>
    <script>
        function ClearTextArea() {
            document.getElementById("id_insertdb").value = "";
        }
    </script>

        <title>查看或更新内容</title>
</head>
<%--<body onload="ClearTextArea()">--%>

<sqlite:UpdateTable database="<%=database%>" table="<%=table%>" id="<%=id%>" content="<%=content%>"/>
<%=result%>
<form action="" method="post" name="form1" accept-charset="gbk">
    <%=table%>中<%=id%>数据为：
    <input type="hidden" name="database" value="<%=database%>">
    <input type="hidden" name="table" value="<%=table%>">
    <input type="hidden" name="id" value="<%=id%>">
    <input type="submit" name="Submit" value="点击保存" class="clsSubmitBtn"/>
    <input type="button" id="id_cleararea" name="cleararea" value="清空" class="clsSubmitBtn"
           onclick="ClearTextArea()">
    <%--<input type="button" id="id_paste2area" name="paste2area" value="粘贴" class="submitbtn"--%>
    <%--onclick="ClipBoard2TextArea()"/>--%>
    <br/>
    <textarea id="id_insertdb" name="content"
              class="dia_wabbit"><%=showtext%>
    </textarea>
</form>

<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font></h2>

</body>
</html>
