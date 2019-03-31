<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/1
  Time: 7:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if(request.isUserInRole("admin")){ //验证admin角色
%>
        <h2>欢迎光临!! admin</h2>
<%
    }
%>

<%
    if(request.isUserInRole("weilaidb")){ //验证admin角色
%>
<h2>欢迎光临!! xiaopihai</h2>
<%
    }
%>

</body>
</html>
