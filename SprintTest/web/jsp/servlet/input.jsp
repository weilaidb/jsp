<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/21
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="content-type" charset="UTF-8" content="text/html"/>
    <title>Title</title>
</head>
<body>
<%
    String basePath = application.getContextPath();
    String basePathext = request.getContextPath();
    String baseRealPath = application.getRealPath("/");
%>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
%>

<form action="<%=basePathext%>/InputServlet" method="post">
    输入内容:<input type="text" name="info">
    <input type="submit" value="提交">
</form>
</body>
</html>
