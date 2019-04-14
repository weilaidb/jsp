<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/14
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>用户登陆程序</h2>
<form action="login.jsp" method="post">
    用户ID:<input type="text" name="userid">
    <input type="submit" value="登陆">
</form>

<%
    String userid = request.getParameter("userid");
    if (!(userid == null || "".equals(userid))) {
        session.setAttribute("userid", userid);
        response.sendRedirect("list.jsp");
    }
%>

</body>
</html>
