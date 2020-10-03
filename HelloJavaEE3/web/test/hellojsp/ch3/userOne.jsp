<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/3 0003
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.text.*" %>
<%@taglib prefix="computer" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>userOne</title>
</head>
<body bgcolor="#00ffff">
<computer:GiveRoot coefficientA="3" coefficientB="6" coefficientC="-2"/>
<h4>方程的根保留3位小数点，并计算两个根的和：</h4>
<%
    NumberFormat f = NumberFormat.getInstance();
    f.setMaximumFractionDigits(3);
    if(rootOne != null && rootTwo != null)
    {
        double r1 = rootOne.doubleValue();//rootOne是GetRoot.tag文件返回的Double型对象
        double r2 = rootTwo.doubleValue();//rootTwo是GetRoot.tag文件返回的Double型对象
        String s1 = f.format(r1);
        String s2 = f.format(r2);
        out.println("<br>根1:" + s1);
        out.println("<br>根2:" + s2);
        double sum = r1 + r2;
        out.println("<br>根1与根2之和:" + sum);
    }
    else {
        out.println("<br>方程没有实根");
    }
%>
</body>
</html>
