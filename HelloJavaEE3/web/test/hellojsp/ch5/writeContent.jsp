<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/12
  Time: 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="file" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>writeContent</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<%
    String fileDir = request.getParameter("fileDir");
    String fileName = request.getParameter("fileName");
    String fileContent = request.getParameter("fileContent");
    byte c[] = fileContent.getBytes("GBK");
    fileContent = new String(c);
    //创建文件
    File dir = new File(fileDir);
    dir.mkdirs();
%>
    
    <file:Write fileContent="<%=fileContent%>" fileDir="<%=fileDir%>" fileName="<%=fileName%>"></file:Write>
</font>


</body>
</html>
