<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/14
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    request.setCharacterEncoding("utf-8");
%>
<body>

<h3>通过内置对象接收输入参数:<%=request.getParameter("ref")%></h3>
<h3>通过表达式语言接收输入参数:${param['ref']}</h3>

</body>
</html>
