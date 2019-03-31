<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String method = request.getMethod(); //取得提交方式
    String ip = request.getRemoteAddr(); //取得客户端的IP地址
    String path = request.getServletPath(); //取得访问路径
    String contextPath = request.getContextPath(); //取得上下文资源名称
%>
<h3>请求方式:<%=method%></h3>
<h3>IP 地址:<%=ip%></h3>
<h3>访问路径:<%=path%></h3>
<h3>上下文名称:<%=contextPath%></h3>



</body>
</html>
