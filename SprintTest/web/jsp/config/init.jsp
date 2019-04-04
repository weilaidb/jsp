<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/4
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //从web.xml中取得初始化配置参数
    String dbDriver = config.getInitParameter("driver");
    String dbUrl = config.getInitParameter("url");
%>
<h3>驱动程序:<%=dbDriver%></h3>
<h3>连接地址:<%=dbUrl%></h3>
</body>
</html>
