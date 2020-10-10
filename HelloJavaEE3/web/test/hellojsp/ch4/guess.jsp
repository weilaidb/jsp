<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="guessNumber" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Guess number</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<%
    String str = request.getParameter("guessNumber");
    if(str == null)
        str = " * ";
    if(str.length() == 0)
        str =" * ";

%>
<guessNumber:GuessTag number="<%=str%>"/>
    当前猜测结果:<%=message%>
    <%
        if(message.startsWith("你猜对了")){
%><br><a href="example4_18.jsp">重新获得随机数</a>
    <%
        }
        else{
            %>
    <br>输入你的猜测:
    <form action="" method="post" name="form">
        <input type="text" name="guessNumber">
        <input type="submit" value="送出" name="submit">
    </form>
    <%
        }
    %>

</font>
</body>
</html>
