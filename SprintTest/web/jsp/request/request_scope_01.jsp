<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<%   //    设置request属性范围，此属性只在服务器跳转中起作用
    request.setAttribute("name", "李李李");
    request.setAttribute("birthday", new Date());
%>
<jsp:forward page="request_scope_02.jsp"/>

</body>
</html>
