<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/2/25
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Setting Http Status Code</title>
</head>
<body>
<%
    // 设置错误代码，并说明原因
    response.sendError(407, "Need authentication!!!" );
%>
</body>
</html>
