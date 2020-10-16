<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/15
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.*" %>
<html>
<head>
    <title>useBean</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
    <jsp:useBean id="apple" class="bean.Circle2" scope="page"/>
    <br>圆的半径是:<jsp:getProperty name="apple" property="radius"/>
    <br>圆的面积是:<jsp:getProperty name="apple" property="circleArea"/>
    <br>圆的周长是:<jsp:getProperty name="apple" property="circleLength"/>
</font>

<%
    String str;
    int a = Integer.parseInt(str);
    long a = Long.parseLong(str);
    float a= Float.parseFloat(str);
    double a = Double.parseDouble(str);
%>



</body>
</html>
