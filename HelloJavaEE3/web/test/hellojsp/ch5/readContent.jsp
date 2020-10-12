<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/12
  Time: 8:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="file" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>readContent</title>
</head>
<body bgcolor="#00ffff">
<font size="3">
<%
    String fileDir = request.getParameter("fileDir");
    String fileName = request.getParameter("fileName");
%>
    <file:Read fileDir="<%=fileDir%>" fileName="<%=fileName%>"/>
</font>

</body>
</html>
