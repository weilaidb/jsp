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
<h3>第一个参数:${paramValues.inst[0]}</h3>
<h3>第二个参数:${paramValues.inst[1]}</h3>
<h3>第三个参数:${paramValues.inst[2]}</h3>
</body>
</html>
