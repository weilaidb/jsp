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
<%//从request属性范围中取出属性，并执行向下转型操作
    String username = (String)application.getAttribute("name");
    Date userbirthday = (Date)application.getAttribute("birthday");
%>
<h2>姓名：<%=username%></h2>
<h2>生日：<%=userbirthday%></h2>
</body>
</html>
