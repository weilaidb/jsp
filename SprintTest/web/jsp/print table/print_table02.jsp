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
<table border="1" width="100%">
    <%
        int rows = 10;
        int cols = 10;
        out.println("<table border=\"1\" width=\"100%\">");
        for (int x = 0; x < rows; x++) {
    %>
    <tr>
        <%
            for (int j = 0; j < cols; j++) {
        %>
        <td><%=(x * j)%>
        </td>
        <%
            }
        %>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
