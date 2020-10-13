<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/12
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="file" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>InputContent</title>
</head>
<body bgcolor="yellow">
<font size="3">
    <form action="write.jsp" method="post" name="form">
        输入文件的内容:<br>
        <textarea name="ok" rows="8" cols="26"></textarea>
        <br>
        <input type="submit" value="加密内容写入到文件" name="submit">
    </form>
        <a href="read.jsp">读取文件</a>
</font>


</body>
</html>
