<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%//接收表单提交的参数
    request.setCharacterEncoding("UTF-8");
    String param1 = request.getParameter("name");
    String param2 = request.getParameter("password");
%>

<h3>姓名:<%=param1%></h3>
<h3>密码:<%=param2%></h3>

网址输入为:
request_demo_03.jsp?name=xxxx&password=12323232


</body>
</html>
