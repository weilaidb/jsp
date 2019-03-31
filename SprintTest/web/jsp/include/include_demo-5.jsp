<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 9:59
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
    int x = 100;
%>
<h1>include_demp05.jsp -- <%=x%></h1>
<jsp:include page="include.jsp"/>
</body>
</html>
