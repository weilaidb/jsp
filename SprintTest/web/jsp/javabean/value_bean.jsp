<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/5
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    request.setCharacterEncoding("utf-8");
%>
<body>
<%
    int age = 10;
%>
<jsp:useBean id="simple" scope="page" class="com.javabean.demo.SimpleBean"/>
<jsp:setProperty name="simple" property="name" value="李李李"/>
<jsp:setProperty name="simple" property="age" value="<%=age%>"/>

<h3>姓名:<%=simple.getName()%></h3>
<h3>年龄:<%=simple.getAge()%>
</h3>


</body>
</html>
