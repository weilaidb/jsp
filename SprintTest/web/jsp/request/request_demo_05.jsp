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
<%
    request.setCharacterEncoding("UTF-8");
    Enumeration enu = request.getHeaderNames(); //取得全部头信息
    while(enu.hasMoreElements()){
        String headerName = (String)enu.nextElement();
        String headerValue = (String)request.getHeader(headerName);
%>
        <h5><%=headerName%> --> <%=headerValue%></h5>
<%
    }
%>

</body>
</html>
