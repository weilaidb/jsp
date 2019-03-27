<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/27
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int rows = 10;
    int cols = 10;
    out.println("<table border=\"1\" width=\"100%\">");
    for(int x = 0; x < rows; x++){
        out.println("<tr>");
        for(int j = 0; j < cols; j++)
        {
            out.println("<td>" + (x*j) +"</td>");
        }
        out.println("</tr>");
    }
    out.println("</table>");
%>
</body>
</html>
