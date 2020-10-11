<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="download" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>load</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<%
    String path = request.getParameter("filePath");
%>
    <download:LoadFile filePath="<%=path%>"></download:LoadFile>
</font>


</body>
</html>
