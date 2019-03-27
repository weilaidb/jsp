<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/27
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="application/msword;charset=GBK" language="java"
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1">
    <%
//        指定下载名称
        response.setHeader("Content-Disposition","attachment;filename=mldn.doc");
    %>
    <tr><td>欢迎</td></tr>
    <tr><td>网址:www.bbs.com</td></tr>
    <tr><td>本页面将使用Word显示！</td></tr>
</table>
</body>
</html>
