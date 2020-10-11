<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>inputGuess</title>
</head>
<body bgcolor="#00ffff">
<font size="2">
<p>随机分给了你一个1到100之间的数，请猜!</p>
    <%
        int number = (int)(Math.random() * 100) + 1;
        session.setAttribute("count", new Integer(0));
        session.setAttribute("save", new Integer(number));
    %>
    <form action="result.jsp" method="post" name="form">
        输入你猜测:<input type="text" name="boy">
        <input type="submit" value="送出" name="submit">
    </form>
</font>


</body>
</html>
