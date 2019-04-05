<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/5
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ page import="com.javabean.demo.*" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    request.setCharacterEncoding("utf-8");
%>
<body>
<%
    SimpleBean22 simpleBean22 = new SimpleBean22();
    simpleBean22.setName(request.getParameter("name"));
    simpleBean22.setAge(Integer.parseInt(request.getParameter("age")));
%>
<h3>姓名:<%=simpleBean22.getName()%>
</h3>
<h3>年龄:<%=simpleBean22.getAge()%>
</h3>


</body>
</html>
