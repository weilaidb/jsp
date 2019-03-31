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
    String id = request.getParameter("id");
    String name = request.getParameter("uname");
    String inst[] = request.getParameterValues("inst");
%>

<h3><%=id%></h3>
<h3><%=name%></h3>

<%
    if(inst != null) {
%>
<h3>兴趣:</h3>
<%
    for(int x = 0; x < inst.length; x++){
%>
<%=inst[x]%>、
<%
    }
%>
</h3>
<%
    }
%>

</body>
</html>
