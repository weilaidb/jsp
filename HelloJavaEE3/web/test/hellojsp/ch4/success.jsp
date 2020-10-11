<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Success</title>
</head>
<body bgcolor="#00ffff">

<font size="2">
<%
    int count = ((Integer)session.getAttribute("count")).intValue();
    int num = ((Integer)session.getAttribute("save")).intValue();
%>
    <p>恭喜你，猜对了</p>
    <br>你共猜了<%=count%>次，这个数字就是<%=num%>
    <br>单击超链接返回到inputGuess.jsp页面:
    <br><a href="inputGuess.jsp">inputGuess.jsp</a>
</font>

</body>
</html>
