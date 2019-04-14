<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/11
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    request.setCharacterEncoding("utf-8");
%>
<body>
<h2>sessio属性:<%=session.getAttribute("name")%></h2>
<h2>request属性:<%=request.getAttribute("info")%></h2>

</body>
</html>
