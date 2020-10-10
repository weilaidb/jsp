<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 8:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <title>second</title>
</head>
<body>
我是second.jsp页面
<%
    String id = session.getId();
    out.println("<br>你的session对象的ID是:<br>" + id);
%>
<br>单击超链接，链接到third.jsp的页面。
<br><a href="third.jsp">欢迎去third.jsp页面!</a>

</body>
</html>
