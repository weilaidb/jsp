<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/4
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //取得缓冲区信息
    int buffer = out.getBufferSize();
    int available = out.getRemaining();
    int use = buffer - available;
%>
<h3>缓冲区大小:<%=buffer%></h3>
<h3>可用的缓冲区大小:<%=available%></h3>
<h3>使用中的缓冲区大小:<%=use%></h3>

</body>
</html>
