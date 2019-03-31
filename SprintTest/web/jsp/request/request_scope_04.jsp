<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%   //    设置request属性范围，此属性只在服务器跳转中起作用
    pageContext.setAttribute("name","aaaaaaaaaaa",pageContext.REQUEST_SCOPE);
    pageContext.setAttribute("birthday", new Date(), pageContext.REQUEST_SCOPE);
%>
<jsp:forward page="request_scope_02.jsp"/>
</body>
</html>
