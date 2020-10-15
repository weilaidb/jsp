<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/15
  Time: 8:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%@ taglib prefix="look" tagdir="/WEB-INF/tags/student" %>
<html>
<head>
    <title>byName</title>
</head>
<body bgcolor="#ffc0cb">
<font size="4">
<%
    String name = request.getParameter("name");
    byte bb[] = name.getBytes("GBK");
    name = new String(bb);
%>
    <look:NameCondition name="<%=name%>"></look:NameCondition>
    姓名含有<%=name%>的记录:
    <br><%=queryResultByName%>
</font>


</body>
</html>
