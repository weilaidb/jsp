<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/5 0005
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>处理汉字乱码</title>
</head>
<body bgcolor="#00ffff">
<font size="1">
    <form action="apple.jsp" method="post" name="form">
        <input type="text" name="boy" value="苹果:apple,12斤，5$">
        <input type="submit" value="提交" name="submit">
    </form>
</font>
<%
    out.print("<br>request.getProtocol():" + request.getProtocol());
    out.print("<br>request.getServletPath():" + request.getServletPath());
    out.print("<br>request.getContentLength():" + request.getContentLength());
    out.print("<br>request.getMethod():" + request.getMethod());
    out.print("<br>request.getHeader(\"accept\"):" + request.getHeader("accept"));
    out.print("<br>request.getHeaderNames():" + request.getHeaderNames());
    out.print("<br>request.getHeaders(\"name\"):" + request.getHeaders("name"));
    out.print("<br>request.getRemoteAddr():" + request.getRemoteAddr());
    out.print("<br>request.getRemoteHost():" + request.getRemoteHost());
    out.print("<br>request.getServerName():" + request.getServerName());
    out.print("<br>request.getServerPort():" + request.getServerPort());
    out.print("<br>request.getParameterNames():" + request.getParameterNames());

%>


</body>
</html>
