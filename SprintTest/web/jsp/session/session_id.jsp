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
<%
    String id = session.getId();//取得 Session Id
%>
<h3>SESSION　ID:<%=id%></h3>
<h3>SESSION ID长度:<%=id.length()%></h3>







</body>
</html>
