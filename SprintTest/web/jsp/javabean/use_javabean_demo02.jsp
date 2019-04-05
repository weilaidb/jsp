<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/5
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="simpleext" scope="page" class="com.javabean.demo.SimpleBean"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    simpleext.setName("赵钱孙李周吴郑王");
    simpleext.setAge(20);
%>
<h3>姓名:<%=simpleext.getName()%></h3>
<h3>年龄:<%=simpleext.getAge()%></h3>



</body>
</html>
