<%@ page import="java.util.*" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/3
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //得到全部的属性名称
    Enumeration enu = application.getAttributeNames();
    while (enu.hasMoreElements()) {
        String name = (String) enu.nextElement();
%>
        <h4><%=name%>  -->  <%=application.getAttribute(name)%>
        </h4>
<%

    }
%>


</body>

</html>
