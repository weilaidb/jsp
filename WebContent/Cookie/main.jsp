<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%
   // 获取session创建时间
   Date createTime = new Date(session.getCreationTime());
   // 获取最后访问页面的时间
   Date lastAccessTime = new Date(session.getLastAccessedTime());
%>
<html>
<head>
<title>Session getMaxInactiveInterval</title>
</head>
<body>

<h1>Session getMaxInactiveInterval</h1>

<%int time = session.getMaxInactiveInterval();%>
超时时间为:<%=time %>


</body>
</html>