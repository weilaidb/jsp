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
    request.setAttribute("name", "李李李");
    request.setAttribute("birthday", new Date());
%>

<%--通过超链接跳转后，地址栏改变，属于客户端跳转--%>
<a href="request_scope_02.jsp">通过超链接取得属性</a>
</body>
</html>
