<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/5
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="reg" scope="request" class="com.javabean.demo.Register"/>

<body>
<form action="check.jsp" method="post"/>
用户名:<input type="text" name="name" value="<jsp:getProperty name="reg" property="name"/>">
<%=reg.getErrorMsg("errname")%><br>
年龄:<input type="text" name="age" value="<jsp:getProperty name="reg" property="age"/>">
<%=reg.getErrorMsg("errage")%><br>
E-Mail:<input type="text" name="email" value="<jsp:getProperty name="reg" property="email"/>">
<%=reg.getErrorMsg("erremail")%><br>
<input type="submit" value="注册"><input type="reset" value="重置">

</body>
</html>
