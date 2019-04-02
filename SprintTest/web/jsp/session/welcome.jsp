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
    if(session.getAttribute("userid")!=null) {
%>
        <h3>欢迎<%=session.getAttribute("userid")%>光临本系统，<a href="logout.jsp">注销</a> !</h3>
<%
    } else {
%>
        <h3>请先进行系统的<a href="login.jsp">登录</a>! </h3>
<%
    }
%>







</body>
</html>
