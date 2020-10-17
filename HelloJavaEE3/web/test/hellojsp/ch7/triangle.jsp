<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/16
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.Triangle" %>
<jsp:useBean id="triangle" class="bean.Triangle" />
<html>
<head>
    <title>Triangle</title>
</head>
<body>
<font size="3">
    <form action="" method="post" name="form">
        <p>输入三角形的边A:<input type="text" name="sideA" value="0">
        <p>输入三角形的边B:<input type="text" name="sideB" value="0">
        <p>输入三角形的边C:<input type="text" name="sideC" value="0">
        <input type="submit" value="提交" name="submit">
        <p>你给出的三条边是:</p>
        <jsp:setProperty name="triangle" property="*"/>
        <br>边A是:<jsp:getProperty name="triangle" property="sideA"/>
        <br>边B是:<jsp:getProperty name="triangle" property="sideB"/>
        <br>边C是:<jsp:getProperty name="triangle" property="sideC"/>
        <p>这三个边能构成一个三角形吗?</p>
        <jsp:getProperty name="triangle" property="triangle"/>
        <p>面积是:<jsp:getProperty name="triangle" property="area"/></p>
    </form>
</font>
</body>
</html>
