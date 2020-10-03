<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/3 0003
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.*" %>
<%@ taglib prefix="showTime" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>lookTime</title>
</head>
<body bgcolor="#00ffff">
<showTime:GiveDate/> <%--Tag标记 --%>
<h3>当前时间:</h3>
<%=time%>
</body>
</html>
