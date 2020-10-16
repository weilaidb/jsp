<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/15
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.StudentTwo" %>
<jsp:useBean id="zhang" class="bean.StudentTwo" scope="page"/>
<html>
<head>
    <title>Student Two</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<form action="" method="post" name="form">
        <p>输入姓名:<input type="text" name="xingming"></p>
        <p>输入学号:<input type="text" name="xuehao"></p>
        <p>输入身高:<input type="text" name="shengao"></p>
        <p>输入体重:<input type="text" name="tizhong"></p>
        <input type="submit" value="提交" name="submit">
</form>

<jsp:setProperty name="zhang" property="name" param="xingming"/>
<jsp:setProperty name="zhang" property="number" param="xuehao"/>
<jsp:setProperty name="zhang" property="height" param="shengao"/>
<jsp:setProperty name="zhang" property="weight" param="tizhong"/>

<br>名字是:<jsp:getProperty name="zhang" property="name"/>
<br>学号是:<jsp:getProperty name="zhang" property="number"/>
<br>身高是:<jsp:getProperty name="zhang" property="height"/>米
<br>体重是:<jsp:getProperty name="zhang" property="weight"/>公斤


</font>




</body>
</html>
