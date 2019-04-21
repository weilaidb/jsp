<%@ page import="com.cmd.EncodingUtil" %>
<%@ page import="com.net.ClientSendMsg2QtServer" %>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.util.List" %>
<%@ page import="com.commmon.SqlInterface" %>
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
    String tableName = "explorerlist";

    List<String> openlist = inter.getAll(dbName, tableName, "");
//    for (String file :
//            openlist) {
//        System.out.println(file);
//    }

%>
<html>
<head>
    <title>打开文件列表</title>
</head>
<%
    String basePath = application.getContextPath();
%>
<%
    request.setCharacterEncoding("UTF-8");//传值编码
    response.setContentType("text/html;charset=UTF-8");//设置传输编码
%>

<body>

<a href="<%=basePath%>/index.jsp">首页</a>
<a href="explorer.jsp">主页</a>
<a href="insertfile.jsp" target="_blank">写入文件列表</a>
<h1>收藏文件列表</h1>
<%
    String path = request.getParameter("openpath");
    if (path != null && path.trim() != "") {
        try {
            System.out.println("defaultCharset " + Charset.defaultCharset());
            System.out.println("open path     is " + path);

            ClientSendMsg2QtServer.sendStr2QtServer(path);
        } catch (Exception e) {
            e.printStackTrace();
            out.write(e.getMessage());
        }
    }

    for (String file :
            openlist) {

%>
<h3><a href="explorer.jsp?openpath=<%=EncodingUtil.encodeURIComponent(file)%>"><%=file%>
</a><br></h3>
<%
    }
%>

</body>
</html>
