<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%//设置application属性范围，此属性保存在服务器上
    application.setAttribute("name", "李李李");
    application.setAttribute("birthday", new Date());
%>
通过超链接跳转后，地址栏改变，属于客户端跳转
<a href="application_scope_02.jsp">通过超链接取得属性</a>
</body>
</html>
