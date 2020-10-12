<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/12
  Time: 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>lookContent</title>
    <a href="giveContent.jsp">我要写文件</a>
    <a href="lookContent.jsp">我要读文件</a>
</head>
<body bgcolor="yellow">
<font size="4">
    <form action="readContent.jsp" method="post" name="form">
        输入文件的路径（如:d:/1000):
        <input type="text" name="fileDir">
        <br>输入文件的名字（如hello.java)<input type="text" name="fileName">
        <br><input type="submit" value="读取" name="submit">
    </form>
</font>


</body>
</html>
