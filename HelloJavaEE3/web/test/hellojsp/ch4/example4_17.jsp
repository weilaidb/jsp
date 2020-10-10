<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>session</title>
</head>
<body bgcolor="#00ffff">
<font size="2">
<%
    session.setAttribute("customer", "顾客");
%>
    <p>输入你的姓名链接到第一百货:shop.jsp</p>
    <font size="3">
        <form action="shop.jsp" method="post" name="form">
            <input type="text" name="boy">
            <input type="submit" value="送出" name="submit">
        </form>
    </font>
</font>


</body>
</html>
