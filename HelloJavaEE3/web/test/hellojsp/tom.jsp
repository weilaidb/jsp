<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/9/30
  Time: 8:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String str = request.getParameter("computer");
    int  n = Integer.parseInt(str);
    int sum = 0;
    for(int i = 1; i <=n; i++)
    {
        sum = sum + i;
    }
%>
<p>从1到<%=n%>的连续和是:<%=sum%></p>


</body>
</html>
