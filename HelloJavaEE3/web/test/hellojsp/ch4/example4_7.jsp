<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/9
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Select</title>
</head>
<body bgcolor="#00ffff">

<font size="3">
    <form action="sum.jsp" method="post" name="form">
        选择计算和的方式:<br>
<%--        此处size为显示的行数--%>
        <select name="sum" size="3">
            <option selected value="1">计算1到n的连续和</option>
            <option value="2">计算1到n的平方和</option>
            <option value="3">计算1到n的立方和</option>
        </select>
        <br>选择n的值:<br>
        <select name="n">
            <option value="10">n=10</option>
            <option value="20">n=20</option>
            <option value="30">n=30</option>
            <option value="40">n=40</option>
            <option value="50">n=50</option>
            <option value="60">n=60</option>
            <option value="100">n=100</option>
        </select>
        <br>
        <input type="submit" value="提交你的选择" name="submit">
    </form>
</font>

</body>
</html>
