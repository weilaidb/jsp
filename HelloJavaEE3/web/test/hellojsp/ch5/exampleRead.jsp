<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="file" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>exampleRead</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<file:ReadTag dir="D:/" fileName="hello.txt"/>
    从文件中读取的内容:
    <br>
    <textarea name="read" rows="100%" cols="100%"><%=result%></textarea>
<%--    result是Tag文件返回的对象--%>


</font>


</body>
</html>
