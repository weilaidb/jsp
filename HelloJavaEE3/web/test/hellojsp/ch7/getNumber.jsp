<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/16
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.GuessNumber" %>
<jsp:useBean id="guess" class="bean.GuessNumber" scope="session"/>
<html>
<head>
    <title>猜数字</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<%
    int n = (int)(Math.random() * 100) + 1;
    String str = response.encodeRedirectURL("guess.jsp");
%>
    <jsp:setProperty name="guess" property="anawer" value="<%=n%>"/>
    随机给你一个1至100之间的数，请猜测这个数是多少？
    <form action="<%=str%>" method="post">
        输入你的猜测:<input type="text" name="guessNumber">
        <input type="submit" value="提交">
    </form>
</font>


</body>
</html>
