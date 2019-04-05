<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/5
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.javabean.demo.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    SimpleBean simple =  new SimpleBean();
    simple.setName("李李李");
    simple.setAge(30);
%>
<h3>姓名:<%=simple.getName()%></h3>
<h3>年龄:<%=simple.getAge()%></h3>



</body>
</html>
