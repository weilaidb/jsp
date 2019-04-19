<%@ page import="com.cmd.RunCmd" %>
<%@ page import="com.cmd.EncodingUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/19
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>路径</title>
</head>
<%
    String basePath = application.getContextPath();
%>
<body>
<%
    String path = request.getParameter("openpath");
    if (path != null && path.trim() != "") {
//        path = path.replace("\\", "\\\\");
        try {
            path = new String(path.getBytes("iso-8859-1"), "utf-8");
//            System.out.println("open path is " + path);
//            out.write("open path is " + path);
//            out.write("open path is convert uri " + EncodingUtil.encodeURIComponent(path));
            //先对参数进行编码
            RunCmd.explorerdir(path);
        } catch (Exception e) {
            e.printStackTrace();
            out.write(e.getMessage());
        }
    }
%>
<h1>系统盘</h1>

<%

    String[] openlist = {
            "C:",
            "D:",
            "E:",
            "E:\\books",
            "E:\\books\\java web\\Java Web开发实战经典.pdf",
    };

    for (int i = 0; i < openlist.length; i++) {
%>
<h1><a href="explorer.jsp?openpath=<%=EncodingUtil.encodeURIComponent(openlist[i])%>"><%=openlist[i]%>
</a><br></h1>
<%
    }
%>

</body>
</html>
