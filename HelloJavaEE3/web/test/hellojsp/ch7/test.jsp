<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/19
  Time: 7:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.Test" %>
<jsp:useBean id="test" class="bean.Test" scope="session"/>
<html>
<head>
    <title>考试小测验</title>
</head>
<body bgcolor="#00ffff">
<form action="" method="post">
    选择试题文件:
    <select name="filename" value="A.txt">
        <option value="D:/1000/A.txt">A.txt</option>
        <option value="D:/1000/B.txt">B.txt</option>
        <option value="D:/1000/C.txt">C.txt</option>
    </select>
    <input type="submit" name="sub" value="确定">
</form>
<jsp:setProperty name="test" property="filename" param="filename"/>
<br><font size="3" color="blue">
    <jsp:getProperty name="test" property="testContent"/>
</font>
<br><form action="" method="post">
    请选择:
    <input type="radio" name="selection" value="A">A
    <input type="radio" name="selection" value="B">B
    <input type="radio" name="selection" value="C">C
    <input type="radio" name="selection" value="D">D
    <input type="submit" name="tijiao" value="提交答案">
</form>
<jsp:setProperty name="test" property="selection"/>
你现在累计得分:<jsp:getProperty name="test" property="score"/>

</body>
</html>
