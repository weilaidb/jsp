<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="com.commmon.FileInterface" %>
<html>
<head>
    <title>添加</title>
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