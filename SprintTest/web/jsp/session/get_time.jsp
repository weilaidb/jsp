<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/3
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    long start = session.getCreationTime();
    long end   = session.getLastAccessedTime();
    long time = (end - start)/10000;
%>
<h3>您已经停留了<%=time%>秒!</h3>

</body>
</html>
