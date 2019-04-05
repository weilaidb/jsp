<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/5
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="simple" scope="page" class="com.javabean.demo.SimpleBean"/>
<jsp:setProperty name="simple" property="*"/>
<h3>姓名:<jsp:getProperty name="simple" property="name"/></h3>
<h3>年龄:<jsp:getProperty name="simple" property="age"/></h3>


</body>
</html>
