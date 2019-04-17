<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/15
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="atag" uri="attribute_tag"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String scope = "session";
    session.setAttribute("username", "要要林");
%>
<atag:present name="username" scope="<%=scope%>">
    <h2><%=scope%>范围存在属性，内容是:"${sessionScope.username}"</h2>
</atag:present>
<atag:present name="allusers" scope="request">
    <h2>request范围存在属性，内容是:"${requestScope.allusers}"</h2>
</atag:present>
</body>
</html>
