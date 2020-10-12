<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/12
  Time: 7:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>giveContent</title>
</head>
<body bgcolor="yellow">
<font size="3">
    <form action="writeContent.jsp" method="post" name="form">
        请选择一个目录:
        <select name="fileDir">
            <option value="D:/1000/a">D:/1000/a</option>
            <option value="D:/1000/b">D:/1000/b</option>
            <option value="D:/1000/c">D:/1000/c</option>
            <option value="D:/1000/d">D:/1000/d</option>
        </select>
        <br>输入保存文件的名字:
        <input type="text" name="fileName">
        <br>输入文件的内容:<br>
        <textarea name="fileContent" rows="6" cols="38"></textarea>
        <input type="submit" value="提交" name="submit">
    </form>
</font>


</body>
</html>
