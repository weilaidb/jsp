<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/25
  Time: 7:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>script demo 02</title>
    <script language="JavaScript" >
        var rows = 10;
        var cols = 10;
        document.write("<table border=\"1\" width=\"80%\">");
        for(i = 1; i < rows; i++)
        {
            document.write("<tr>");
            for(j = 1; j < cols; j++)
            {
                document.write("<td>" + i * j + "</td>");
            }
            document.write("</tr>");
        }
        document.write("</table>");
    </script>
</head>
<body>
<table width="80%">

</table>
</body>
</html>








































