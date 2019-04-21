<%@ page import="com.cmd.RunCmd" %>
<%@ page import="com.cmd.EncodingUtil" %>
<%@ page import="com.net.ClientSendMsg2QtServer" %>
<%@ page import="static com.commmon.getEncoding.getEncoding" %>
<%@ page import="javafx.scene.control.TextFormatter" %>
<%@ page import="com.commmon.ChangeCharset" %>
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
<%--<%@page contentType="text/html;charset=gb2312" %>--%>
<%
//    打开的文件列表
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
            System.out.println("open path     is " + path);
            System.out.println("open path     is " + new String(path.getBytes("UTF-8")));
            System.out.println("open path     is " + new String(path.getBytes("GB2312")));
            System.out.println("open path     is " + new String(path.getBytes("GBK")));
            System.out.println("open path     is " + new String(path.getBytes("iso-8859-1")));
            System.out.println("open path     is " + new String(path.getBytes("US-ASCII")));
            if(Charset.defaultCharset().equals("GBK"))
            {
//                path = new String(path.getBytes("GBK"), "iso-8859-1");
                path = new String(path.getBytes("GBK"), "US-ASCII");
                System.out.println("defaultCharset " + Charset.defaultCharset());
            }else {
//                path = new String(path.getBytes("UTF-8"), "US-ASCII");
//                path = new String(path.getBytes("UTF-8"), "iso-8859-1");
//                path = new String(path.getBytes("UTF-8"), "GB2312");
//                path = new String(path.getBytes("UTF-8"), "GBK");
//                path = new String(path.getBytes("GBK"), "US-ASCII");
//                path = new String(path.getBytes("GBK"), "iso-8859-1");
//                path = new String(path.getBytes("GBK"), "UTF-8");
//                path = new String(path.getBytes("GBK"), "GB2312");
//                path = new String(path.getBytes("GBK"), "GBK");
//                path = new String(path.getBytes("US-ASCII"), "GBK");
//                path = new String(path.getBytes("iso-8859-1"), "GBK");
                System.out.println("~~else~~ ");
                System.out.println("defaultCharset " + Charset.defaultCharset());
                System.out.println("open path     is " + path);
            }

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
