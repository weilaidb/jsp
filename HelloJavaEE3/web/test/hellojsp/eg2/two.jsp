<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/2 0002
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>two</title>
    <jsp:include page="head.txt"/>
</head>
<body bgcolor="yellow">
<p>
    <font size="3" color="blue">This is two.jsp
        <%
            String s = request.getParameter("number");
            out.println("<br>传递过来的值是" + s);
        %>
        <br>
        <img src="a.jpg" width="<%=s%>" height="<%=s%>"/>
    </font>
</p>

</body>
</html>
