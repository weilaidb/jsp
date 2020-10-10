<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>shop</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<%
    String s = request.getParameter("boy");
    session.setAttribute("name", s);
%>
    这里是第一百货。<br>输出你想购买的商品链接到结账:account.jsp
    <font size="3">
        <form action="account.jsp" method="post" name="form">
            <input type="text" name="buy">
            <input type="submit" value="送出" name="submit">
        </form>
    </font>

</font>


</body>
</html>
