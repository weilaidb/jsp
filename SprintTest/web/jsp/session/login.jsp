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
<form action="login.jsp" method="post">
    用户名:<input type="text" name="uname"><br>
    密码:<input type="password" name="upass"><br>
    <input type="submit" value="登录">
    <input type="reset" value="重置">
</form>

<%
    String name=request.getParameter("uname");
    String password = request.getParameter("upass");
    if(!(name == null || "".equals(name)
        || password == null || "".equals(password)))
    {
        if("weilai".equals(name) && "weilai".equals(password)) {
            response.setHeader("refresh", "2;URL=welcome.jsp");
            session.setAttribute("userid", name);
%>
            <h3>用户登录成功，两秒后跳转到欢迎页!</h3>
            <h3>如果没有跳转，请按<a href="welcome.jsp">这里</a> </h3>
<%
} else {
%>
            <h3>错误的用户名或密码!</h3>
<%
        }
    }
%>







</body>
</html>
