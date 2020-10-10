<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Guess</title>
</head>
<body bgcolor="#00ffff">
<font size="4">

</font>
随机分给了你一个1到100之间的数，请猜!
<%
    int num = (int)(Math.random() * 100) + 1;
    session.setAttribute("count", new Integer(0));
    session.setAttribute("save", new Integer(num));
%>
<br><a href="guess.jsp">去猜测这个数</a>

</body>
</html>
