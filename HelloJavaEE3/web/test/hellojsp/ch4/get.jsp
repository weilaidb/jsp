<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/8
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="computer" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Get</title>
</head>
<body>
<%
    String a = request.getParameter("sideA");
    String b = request.getParameter("sideB");
    String c = request.getParameter("sideC");
%>
<computer:TriangleExt a="<%=a%>" b="<%=b%>" c="<%=c%>"/>
<table border="1">
<tr>
    <td width="30">边A</td>
    <td width="30">边B</td>
    <td width="30">边C</td>
    <td>面积</td>
</tr>

<tr>
    <td><%=a%></td>
    <td><%=b%></td>
    <td><%=c%></td>
    <td><%=result%></td>
</tr>

</table>

</body>
</html>
