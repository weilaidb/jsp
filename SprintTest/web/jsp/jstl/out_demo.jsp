<%--
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
    pageContext.setAttribute("info", "wwwwwwwwwww");
%>


<h3><c:out value="wwwwwwwwwww"/></h3>
<h3>属性存在:<c:out value="${info}"/></h3>
<h3>属性不存在:<c:out value="${ref}" default="没有此内容!"/></h3>
<h3>属性不存在:<c:out value="${ref}">没有此内容!</c:out></h3>
<h3>属性不存在:<c:out value="${info}" default="没有此内容!"/></h3>
<h3>属性不存在:<c:out value="${info}">没有此内容!</c:out></h3>

</body>
</html>
