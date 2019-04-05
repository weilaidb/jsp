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
<jsp:setProperty name="reg" property="*"/>
<body>
<%
    if(reg.isValidate())
    {
%>
        <jsp:forward page="success.jsp"/>
<%
    }else{
%>
        <jsp:forward page="index.jsp"/>
<%
}
    %>

</body>
</html>
