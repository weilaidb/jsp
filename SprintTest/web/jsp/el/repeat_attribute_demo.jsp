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
<body>

<%
    application.setAttribute("info", "applicatin属性范围");
    pageContext.setAttribute("info", "page 属性范围");
    request.setAttribute("info", "request属性范围");
    session.setAttribute("info", "session 属性范围");
%>
<h3>${info}</h3>

</body>
</html>
