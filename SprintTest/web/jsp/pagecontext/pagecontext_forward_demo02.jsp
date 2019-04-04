<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/4
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    //从session属性范围中取出属性，并执行向下转型操作
    String info = pageContext.getRequest().getParameter("info");
%>
<h3>info=<%=info%></h3>
<h3>realpath=<%=pageContext.getServletContext().getRealPath("/")%></h3>

</body>
</html>
