<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/5 0005
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>处理汉字乱码</title>
</head>
<body>
获取文本框提交的信息：
<%
    String textContent = request.getParameter("boy");
    byte b[] = textContent.getBytes("GBK");
//    byte b[] = textContent.getBytes("ISO-8859-1");
    textContent = new String(b);
%>
<%=textContent%>
<%
    String buttonName = request.getParameter("submit");
    byte c[] = buttonName.getBytes("GBK");
//    byte c[] = textContent.getBytes("ISO-8859-1");
    buttonName = new String(c);
%>
<%=buttonName%>
</body>
</html>
