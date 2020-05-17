<%@ page import="com.cmd.EncodingUtil" %>
<%@ page import="com.net.ClientSendMsg2QtServer" %>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.util.List" %>
<%@ page import="com.commmon.SqlInterface" %>
<%@ page import="com.commmon.FileInterface" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/19
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%
    //    打开的文件列表
//    增加表项openlist，用以打开文件路径
    SqlInterface inter = new SqlInterface();
    String dbName = "files";
    String tableName = "dirlist";

    List<String> openlist = inter.getAll(dbName, tableName, "");
//    for (String file :
//            openlist) {
//        System.out.println(file);
//    }

%>
<html>
<head>
    <title>文件列表</title>
</head>
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
<%
    String basePath = application.getContextPath();
%>
<%
    request.setCharacterEncoding("UTF-8");//传值编码
    response.setContentType("text/html;charset=UTF-8");//设置传输编码
%>

<body>
<%
    //定时刷新页面
//    response.setHeader("Refresh","5;iterator.jsp");
%>

<h1><a href="<%=basePath%>/index.jsp" target="_blank">首页</a>
    <%--<a href="adddirectory.jsp" target="_blank">文件夹</a>--%>
    <a href="iterdelete.jsp" target="_blank">删除</a>
    <a href="iterinsert.jsp" target="_blank">写入</a>
</h1>
<h1>文件列表</h1>

<%
    List<String> fileList = null;
    String path = request.getParameter("openpath");
    if (path != null && path.trim() != "") {
        try {
            System.out.println("open path     is " + path);
            FileInterface fileins = new FileInterface();
            fileList = fileins.getAllFileList(path);

        } catch (Exception e) {
            e.printStackTrace();
            out.write(e.getMessage());
        }
    }
%>

<div id="main">
<%
    if(fileList != null)
    {
%>
        <%--<h1>查找到表</h1>--%>
<%
    for (String str :
            fileList) {

%>
        <h3><a href="<%=str%>"><%=str%></h3>
<%
    }
%>

<%
        return;
    }
%>
</div>



<%
    for (String file :
            openlist) {

%>
<h3><a href="iterator.jsp?openpath=<%=EncodingUtil.encodeURIComponent(file)%>"><%=file%>
</a><br></h3>
<%
    }
%>

</body>
</html>
