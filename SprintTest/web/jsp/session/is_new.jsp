<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/3
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if(session.isNew()){

        %>
        <h3>欢迎新用户光临!</h3>
<%
    } else{
        %>
        <h3>您已经是老用户了!</h3>
<%

    }
%>
</body>
</html>
