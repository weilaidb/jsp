<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/9/23
  Time: 0:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>synchronized</title>
</head>
<body>

<%! int count  = 0;
synchronized void setCount() {
    count++;
}
    %>


<%
    setCount();
    out.println("你是第" + count + "个访问本站的用户");
%>
</body>
</html>
