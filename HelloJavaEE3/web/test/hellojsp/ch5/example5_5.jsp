<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>删除文件或目录</title>
</head>
<body>
<%
    File f   = new File("D:/test/webapps/ch5/Students","abc.txt");
    File dir = new File("D:/test/webapps/ch5","Students");
    boolean b1 = f.delete();
    boolean b2 = dir.delete();
%>
<p>文件<%=f.getName()%>成功删除了吗？<%=b1%></p>
<p>目录<%=dir.getName()%>成功删除了吗？<%=b2%></p>
</body>
</html>
