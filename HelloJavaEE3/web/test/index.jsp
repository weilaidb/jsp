<%@ page import="weilaidb.sql.JspAdapter" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/6/15
  Time: 6:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String showtitle = "test";
    %>
    <title><%=JspAdapter.getJspTitleByKey(showtitle)%></title>
</head>
<body>

<a href="javascript/resetform.jsp" target="_blank">重置form</a>

</body>
</html>
