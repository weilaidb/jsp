<%@ page import="com.commmon.SqlInterface" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/19
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>

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
    //    打开的文件列表
    SqlInterface inter = new SqlInterface();
    String dbName = "files";
    String tableName = "dirlist";
%>

<%
    String filenames = "";
    String result = "数据为空";
    try {
        filenames = request.getParameter("insertfilename");
        if(!filenames.trim().isEmpty()) {
            result = inter.insertName(dbName, tableName, filenames);
        }
    } catch (Exception e) {
//        out.print("\n");
    }

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
<%
    String basePath = application.getContextPath();
%>
<body onload="ClearTextArea()">
<h1><a href="<%=basePath%>/index.jsp">首页</a>
    <a href="iterator.jsp" target="_blank">文件列表</a>
</h1>
<form name="form1" method="post" action="iterinsert.jsp">
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
