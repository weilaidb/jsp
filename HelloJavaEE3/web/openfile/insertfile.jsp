<%@ page import="com.commmon.SqlInterface" %>
<%@ page import="weilaidb.sql.JspAdapter" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/19
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@include file="../../common/basepath.jsp"%>
<%--================css配置=========================--%>
<style type="text/css">
    .submitbtn {
        height: 40px;
        width: 80px;
    }

    .dia_wbkbig {
        width: 100%;
        height: 80%;
        alignment: center;
        align-content: center;
    }
</style>
<%
    String dbName = "files";
    String tableName = "explorerlist";
    String result = JspAdapter.jspInsertData(request,dbName, tableName);
%>



<%--================javascript定义=========================--%>
<script>
    function ClearTextArea() {
        document.getElementById("id_insertfile").value = "";
    }
    function LoadTextArea(str) {
        document.getElementById("id_insertfile").value = str;
    }
</script>

<html>
<head>
    <title>写入文件</title>
</head>

<body onload="ClearTextArea()">
<h1><a href="<%=app_CurrentPath%>/index.jsp">首页</a>
    <a href="explorer.jsp">文件列表</a>
</h1>
<form name="form1" method="post" action="insertfile.jsp">
    <h1>
        写入文件列表：
        <input type="submit" name="Submit" value="点击保存" class="submitbtn"/>
        <input type="button" id="id_cleararea" name="cleararea" value="清空" class="submitbtn"
               onclick="ClearTextArea()">
        <br/>
        <textarea id="id_insertfile" name="insertfilename"
                  class="dia_wbkbig">
        </textarea>
    </h1>
</form>

<%=result%>

</body>
</html>
