<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/27
  Time: 22:45
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
        int rows = 0;
        int cols = 0;
        try {
            rows = Integer.parseInt(request.getParameter("row"));
            cols = Integer.parseInt(request.getParameter("col"));
        } catch (Exception e) {

        }

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
