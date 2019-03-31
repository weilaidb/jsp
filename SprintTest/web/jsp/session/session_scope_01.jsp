<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 17:17
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
<%//设置session属性范围，此属性在一个浏览器中始终有效
    session.setAttribute("name", "LLLLLL");
    session.setAttribute("birthday", new Date());
%>
<%--通过超链接跳转后，地址栏改变，属性客户端跳转--%>
<a href="session_scope_02.jsp">通过超链接取得属性</a>
</body>
</html>
