<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
    String str = response.encodeURL("jerry.jsp");
%>


<html>
<head>
    <title>tom.jsp</title>
</head>
<body bgcolor="#00ffff">
我是tom.jsp页面
<%
    String id = session.getId();
    out.println("<br>你的session对象的ID是:<br>" + id);
%>
<br>单击超链接，链接到jerry.jsp的页面。
<br><a href="<%=str%>">欢迎去jerry.jsp页面!</a>

</body>
</html>
