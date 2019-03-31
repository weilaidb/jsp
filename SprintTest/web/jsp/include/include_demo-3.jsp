<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String username="LLXYX";
//    username=new String(username.getBytes("iso-8859-1"), "utf-8");
%>
<h1>动态包含并传递参数</h1>
<jsp:include page="receive_param.jsp">
    <jsp:param name="name" value="<%=username%>"/>
    <jsp:param name="info" value="www.mldnjava.cn"/>
</jsp:include>

</body>
</html>
