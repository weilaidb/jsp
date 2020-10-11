<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>File Download</title>
</head>
<body>
<p></p>
<form action="load.jsp" method="post" name="form">
    <br>选择要下载的文件:<br>
    <select name="filePath" size="3">
        <option selected value="d:/1000/a.txt">a.txt</option>
        <option selected value="d:/1000/b.txt">b.txt</option>
        <option selected value="d:/1000/c.txt">c.txt</option>
        <option selected value="d:/1000/d.txt">d.txt</option>
    </select>
    <br>
    <input type="submit" value="提交你的选择" name="submit">
</form>

</body>
</html>
