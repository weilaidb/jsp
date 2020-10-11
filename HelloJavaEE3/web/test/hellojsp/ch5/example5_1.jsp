<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>File</title>
</head>
<body bgcolor="#00ffff">
<font size="2">
<%
    File f1 = new File("D:/test/abcd.txt");
    File f2 = new File("jasper.sh");
%>
    <br>文件<%=f1.getName()%>是可读的吗？<%=f1.canRead()%>
    <br>文件<%=f1.getName()%>的长度是:<%=f1.length()%>
    <br>jasper.sh是目录吗？<%=f2.isDirectory()%>
    <br><%=f1.getName()%>的父目录是:<%=f1.getParent()%>
    <br><%=f2.getName()%>的绝对路径是:<%=f2.getAbsolutePath()%>
</font>


</body>
</html>
