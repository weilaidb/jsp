<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/15
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.Student" %>
<html>
<head>
    <title>Student</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
    <jsp:useBean id="zhang" class="bean.Student" scope="page"/>
    <jsp:setProperty name="zhang" property="name" value="张三"/>
    <br>名字是:<jsp:getProperty name="zhang" property="name"/>
    <jsp:setProperty name="zhang" property="number" value="19999001"/>
    <br>学号是:<jsp:getProperty name="zhang" property="number"/>
    <jsp:setProperty name="zhang" property="height" value="1.78"/>
    <br>身高是:<jsp:getProperty name="zhang" property="height"/>米
    <jsp:setProperty name="zhang" property="weight" value="90"/>
    <br>体重是:<jsp:getProperty name="zhang" property="weight"/>公斤

</font>




</body>
</html>
