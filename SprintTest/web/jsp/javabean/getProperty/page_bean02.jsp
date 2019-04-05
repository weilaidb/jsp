<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/5
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<jsp:useBean id="cou" scope="page" class="com.javabean.demo.Count"/>
<body>
<h3>第<jsp:getProperty name="cou" property="count"/>次访问！</h3>


</body>
</html>
