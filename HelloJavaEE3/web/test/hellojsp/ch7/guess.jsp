<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/16
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.GuessNumber" %>
<jsp:useBean id="guess" class="bean.GuessNumber" scope="session"/>
<%
    String strGuess = response.encodeRedirectURL("guess.jsp");
    String strGetNumber = response.encodeRedirectURL("getNumber.jsp");
%>
<html>
<head>
    <title>猜测</title>
</head>
<body>
<jsp:setProperty name="guess" property="guessNumber" param="guessNumber"/>
这是第<jsp:getProperty name="guess" property="guessCount"/>猜，
<jsp:getProperty name="guess" property="result"/>。
你给出的数是<jsp:getProperty name="guess" property="guessNumber"/>。
<%
    if (guess.isRight() == false) {
%>
<form action="<%=strGuess%>" method="post">
    再输入你的猜测:<input type="text" name="guessNumber">
    <input type="submit" value="提交">
</form>
<%
    }
%>
<br><a href="<%=strGetNumber%>">链接到getNumber.jsp重新玩猜数。</a>
</body>
</html>
