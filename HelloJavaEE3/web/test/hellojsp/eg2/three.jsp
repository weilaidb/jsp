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
    <title>three</title>
    <jsp:include page="head.txt"/>
</head>
<body bgcolor="yellow">
<p>
    <font size="2" color="red">This is three.jsp</font>
    <font size="3">
        <%
            String s = request.getParameter("number");
            out.println("<br>传递过来的值是" + s);
        %>
        <br><img src="b.jpg" width="<%=s%>" height="<%=s%>"/>
    </font>
</p>

</body>
</html>
