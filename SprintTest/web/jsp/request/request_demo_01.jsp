<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%//接收表单提交的参数
    String content = request.getParameter("info");
%>
<h2><%=content%></h2>

</body>
</html>
