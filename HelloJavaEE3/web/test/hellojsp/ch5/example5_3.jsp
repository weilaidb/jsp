<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>List Files</title>
</head>
<body bgcolor="#00ffff">
<font size="2">
    <%
        File dir = new File("D:/test/webapps/");
        File file[] = dir.listFiles();
    %>
    <br>目录有:
    <%
        for (int i = 0; i < file.length; i++) {
            if (file[i].isDirectory()) {
                out.print("<br>" + file[i].toString());
            }
        }
    %>
    <br>文件名字:
    <%
        for (int i = 0; i < file.length; i++) {
            if (file[i].isFile()) {
                out.print("<br>" + file[i].toString());
            }
        }
    %>
</font>



</body>
</html>
