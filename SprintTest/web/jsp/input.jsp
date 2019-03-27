<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/27
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
//    response.setCharacterEncoding("GBK");
//    request.setCharacterEncoding("GBK");
    request.setCharacterEncoding("UTF-8");
    String str = request.getParameter("textinfo");
    out.println("<h1>" + str + "</h1>");

%>
</body>
</html>
