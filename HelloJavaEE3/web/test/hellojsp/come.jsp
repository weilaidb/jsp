<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/9/30
  Time: 8:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Come</title>
</head>
<body bgcolor="#00ffff">
<font size="5">
    <%
        String str = request.getParameter("number");
        double n = Double.parseDouble(str);

    %>

    <p>你传过来的数值是:<br>
    <%=n%></p>
</font>

</body>
</html>
