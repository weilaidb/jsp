<%@ page import="com.jstl.SimpleInfo" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/17
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    SimpleInfo sim = new SimpleInfo();
    request.setAttribute("simple", sim);
%>
<c:set value="Hello WORLD!!!" target="${simple}" property="content"/>
<h3>属性内容:${simple.content}</h3>

</body>
</html>
