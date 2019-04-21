<%@ page import="com.cmd.EncodingUtil" %>
<%@ page import="com.net.ClientSendMsg2QtServer" %>
<%@ page import="java.nio.charset.Charset" %>
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
    String[] openlist = {
            "C:",
            "D:",
            "E:",
            "E:\\books",
            "E:\\books\\java web\\Java Web开发实战经典.pdf",
            "E:\\mysqlbackup\\backup-mysql.bat",
            "E:\\mysqlbackup",
            "E:\\tarbao\\python\\AutoMyCCode",
            "E:\\tarbao\\egjsp\\eclipse-workspace\\TomcatTest\\HelloJavaEE3",
            "E:\\tarbao\\egjsp\\eclipse-workspace\\TomcatTest",
    };

%>
<html>
<head>
    <title>路径</title>
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

    for (int i = 0; i < openlist.length; i++) {
%>
<h2><a href="explorer.jsp?openpath=<%=EncodingUtil.encodeURIComponent(openlist[i])%>"><%=openlist[i]%>
</a><br></h2>
<%
    }
%>

</body>
</html>
