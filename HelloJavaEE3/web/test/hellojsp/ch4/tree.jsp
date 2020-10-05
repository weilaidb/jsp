<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/5 0005
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8" %>
<html>
<head>
    <title>Tree</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
    获取文本提交的信息:
    <%
        String textContent = request.getParameter("boy");
    %>
    <%= textContent %>
    <br>获取按钮的名字:
    <%
        String buttonName = request.getParameter("submit");
    %>

    <%=buttonName%>
</font>
</body>
</html>
