<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="com.commmon.FileInterface" %>
<html>
<head>
    <title>遍历文件目录</title>
    <style type="text/css">
        ul {
            list-style: none;
        }

        li {
            float: left;
            margin-left: 20px;
            margin-top: 20px;
        }

        body {
            text-align: left;
            font-size: 15px;
            color: #06C;
        }

        a {
            font-size: 22px;
        }

        a:link, a:visited {
            color: #06C;
            text-decoration: none;
        }

        a:hover {
            color: #f00;
        }
    </style>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/jquery/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            var name = $("#names").val();
            $("#data").html("");
            $("#data").append(name)
        });
    </script>
</head>
<body>

<%!StringBuffer result = new StringBuffer();%>

<%
    String url = request.getRequestURL().toString();
    if (url.endsWith("/")) {
        url = url.substring(0, url.length());
    }
    url = url.substring(url.lastIndexOf("/") + 1);

    System.out.println(url);
    String path = application.getRealPath("/");
    System.out.println(path);
    FileInterface fileins = new FileInterface();
    String[] fileNames = fileins.getFileList(path);
//    fileins.traverseFolder(path);
    List<String> fileList = fileins.getAllFileList(path);
%>
<div id="main">
    <h1>文件列表</h1>
    <input type="hidden" id="names" value="<%=result.toString()%>"/>
    <ul id="data"></ul>
</div>

<%--<div id="main">--%>
    <%--<%--%>
        <%--result = new StringBuffer();--%>
        <%--for (String str : fileNames) {--%>
    <%--%>--%>
    <%--<h4><a href="<%=str%>"><%=str%>--%>
    <%--</a></h4>--%>
    <%--<%--%>
        <%--}--%>
    <%--%>--%>
<%--</div>--%>

<div id="main">
    <%
        for (String str : fileList) {
    %>
    <h3><a href="<%=str%>"><%=str%>
    </a></h3>
    <%
        }
    %>
</div>




</body>
</html>


<%--<%@ page import="com.commmon.SqlInterface" %>--%>
<%--&lt;%&ndash;--%>
<%--Created by IntelliJ IDEA.--%>
<%--User: dell--%>
<%--Date: 2019/4/19--%>
<%--Time: 21:59--%>
<%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java"--%>
<%--pageEncoding="utf-8" %>--%>

<%--&lt;%&ndash;================css配置=========================&ndash;%&gt;--%>
<%--<style type="text/css">--%>
<%--.submitbtn {--%>
<%--height: 40px;--%>
<%--width: 80px;--%>
<%--}--%>

<%--.dia_wbkbig {--%>
<%--width: 100%;--%>
<%--height: 80%;--%>
<%--alignment: center;--%>
<%--align-content: center;--%>
<%--}--%>
<%--</style>--%>
<%--<%--%>
<%--//    打开的文件列表--%>
<%--SqlInterface inter = new SqlInterface();--%>
<%--String dbName = "files";--%>
<%--String tableName = "explorerlist";--%>
<%--%>--%>

<%--<%--%>
<%--String filenames = "";--%>
<%--String result = "数据为空";--%>
<%--try {--%>
<%--filenames = request.getParameter("insertfilename");--%>
<%--if(!filenames.trim().isEmpty()) {--%>
<%--result = inter.insertName(dbName, tableName, filenames);--%>
<%--}--%>
<%--} catch (Exception e) {--%>
<%--//        out.print("\n");--%>
<%--}--%>

<%--%>--%>


<%--&lt;%&ndash;================javascript定义=========================&ndash;%&gt;--%>
<%--<script>--%>
<%--function ClearTextArea() {--%>
<%--document.getElementById("id_insertfile").value = "";--%>
<%--}--%>
<%--function LoadTextArea(str) {--%>
<%--document.getElementById("id_insertfile").value = str;--%>
<%--}--%>
<%--function browseFolder(path) {--%>
<%--try {--%>
<%--var Message = "\u8bf7\u9009\u62e9\u6587\u4ef6\u5939"; //选择框提示信息--%>
<%--var Shell = new ActiveXObject("Shell.Application");--%>
<%--var Folder = Shell.BrowseForFolder(0, Message, 64, 17); //起始目录为：我的电脑--%>
<%--//var Folder = Shell.BrowseForFolder(0,Message,0); //起始目录为：桌面--%>
<%--if (Folder != null) {--%>
<%--Folder = Folder.items(); // 返回 FolderItems 对象--%>
<%--Folder = Folder.item(); // 返回 Folderitem 对象--%>
<%--Folder = Folder.Path; // 返回路径--%>
<%--if (Folder.charAt(Folder.length - 1) != "") {--%>
<%--Folder = Folder + "";--%>
<%--}--%>
<%--document.getElementById(path).value = Folder;--%>
<%--return Folder;--%>
<%--}--%>
<%--}--%>
<%--catch (e) {--%>
<%--alert(e.message);--%>
<%--}--%>
<%--}--%>
<%--</script>--%>

<%--<html>--%>
<%--<head>--%>
<%--<title>写入文件</title>--%>
<%--</head>--%>
<%--<%--%>
<%--String basePath = application.getContextPath();--%>
<%--%>--%>
<%--<body onload="ClearTextArea()">--%>
<%--<h1><a href="<%=basePath%>/index.jsp">首页</a>--%>
<%--&lt;%&ndash;<a href="explorer.jsp" target="_blank">文件列表</a>&ndash;%&gt;--%>
<%--</h1>--%>
<%--<tr>--%>
<%--<td>选择导入数据源：</td>--%>
<%--<td><input id="path" type="text" name="path" size="30"></td>--%>
<%--<td><input type=button value="选择" onclick="browseFolder('path')"></td>--%>
<%--</tr>**重点内容**--%>

<%--<%=result%>--%>

<%--</body>--%>
<%--</html>--%>
