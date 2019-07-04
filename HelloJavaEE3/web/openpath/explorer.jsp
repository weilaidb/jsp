<%@ page import="com.cmd.EncodingUtil" %>
<%@ page import="com.net.ClientSendMsg2QtServer" %>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.util.List" %>
<%@ page import="com.commmon.SqlInterface" %>
<%@ page import="com.file.CheckFile" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<link href="css/index.css" rel="stylesheet" type="text/css" />

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
    <title>文件列表</title>
</head>
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
    response.setHeader("Refresh","30;explorer.jsp");
%>

<h1><a href="<%=basePath%>/index.jsp">首页</a>
    <a href="adddirectory.jsp">文件夹</a>
    <a href="deletefile.jsp" target="_blank">删除</a>
    <a href="insertfile.jsp" target="_blank">写入</a>
</h1>
<h1>文件列表</h1>

<%
    String path = request.getParameter("openfile");
    if (path != null && path.trim() != "") {
        try {
            System.out.println("defaultCharset " + Charset.defaultCharset());
            System.out.println("open path     is " + path);
            String aftersult = CheckFile.addFileprefixIfNormal(path);
//            out.write("afterresult:" + aftersult);
//            ClientSendMsg2QtServer.sendStr2QtServer(aftersult);
        } catch (Exception e) {
            e.printStackTrace();
            out.write(e.getMessage());
        }
    }

    for (String file :
            openlist) {
//        File testFile = new File(testFilePath);


%>
<div class="showui">
<a href="explorer.jsp?openfile=<%=EncodingUtil.encodeURIComponent(file)%>"><%=file%>
</a></p>
</div>
<%
    }
%>

</body>
</html>
