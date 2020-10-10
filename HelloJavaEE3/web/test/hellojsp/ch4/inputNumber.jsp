<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="computer" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>InputNumber</title>
</head>
<body bgcolor="yellow">
<font size="5">
<form action="" method="post" name="form">
    输入运算数、选择运算符号:<br>
    <input type="text" name="numberOne" size="6">
    <select name="operator">
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="*">*</option>
        <option value="/">/</option>
    </select>
    <input type="text" name="numberTwo" size="6">
    <br>
    <input type="submit" value="提交你的选择" name="submit">
</form>

    <%
        String a = request.getParameter("numberOne");
        String b = request.getParameter("numberTwo");
        String operator = request.getParameter("operator");
        if (a == null || b == null) {
            a = "";
            b = "";
        }
        if (a.length() > 0 && b.length() > 0) {
            %>
            <computer:Computer numberA="<%=a%>" numberB="<%=b%>" operator="<%=operator%>"/>
            计算结果:<%=a%><%=operator%><%=b%>=<%=result%>
    <%
        }
    %>
</font>


</body>
</html>
