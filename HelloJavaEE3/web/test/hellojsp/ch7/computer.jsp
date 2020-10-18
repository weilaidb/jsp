<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/18
  Time: 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.ComputeBean" %>
<jsp:useBean id="computer" class="bean.ComputeBean" scope="session"/>
<html>
<head>
    <title>正则运算</title>
</head>
<body bgcolor="yellow">
<font size="3">
    <jsp:setProperty name="computer" property="*"/>
    <form action="" method="post" name="form">
        <input type="text" name="numberOne" value="<jsp:getProperty name="computer" property="numberOne"/>" size="5"/>
        <select name="operator">
            <option value="+">+</option>
            <option value="-">-</option>
            <option value="*">*</option>
            <option value="/">/</option>
        </select>
        <input type="text" name="numberTwo" value="<jsp:getProperty name="computer" property="numberTwo"/>" size="5"/>
        = <jsp:getProperty name="computer" property="result"/><br>
        <input type="submit" value="提交你的选择" name="submit">
    </form>
</font>


</body>
</html>
