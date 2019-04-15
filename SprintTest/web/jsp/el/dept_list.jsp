<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/15
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    List all = (List) request.getAttribute("alldept");
    if (all != null) {
%>
<table border="1" width="90%">
    <tr>
        <td>部门编号</td>
        <td>部门名称</td>
        <td>部门位置</td>
    </tr>

    <%
        Iterator iter = all.iterator();
        while (iter.hasNext()) {
            pageContext.setAttribute("dept", iter.next());
    %>
            <tr>
                <td>${dept.deptno}</td>
                <td>${dept.dname}</td>
                <td>${dept.loc}</td>
            </tr>

    <%
        }
    %>

</table>


<%
    }
%>


</body>
</html>
