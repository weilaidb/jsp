<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/2 0002
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>One</title>
    <jsp:include page="head.txt"/>
</head>
<body bgcolor="yellow">
<form action="" method="get" name="form">
    请输入1至100之间的整数:<input type="text" name="number">
    <br>
    <input type="submit" value="送出" name="submit">
</form>

<% String num = request.getParameter("number");
    if (null == num)
        num = "0";

    try {
        int n = Integer.parseInt(num);
        if (n >= 1 && n <= 50) {
%>
            <jsp:forward page="two.jsp">
                <jsp:param name="number" value="<%=n%>"/>
            </jsp:forward>

        <%
        } else if (n > 50 && n <= 100) {

        %>
        <jsp:forward page="three.jsp">
            <jsp:param name="number" value="<%=n%>"/>
        </jsp:forward>

        <%
        } else if (n > 100) {
        %>
        <jsp:forward page="error.jsp">
            <jsp:param name="mess" value="<%=n%>"/>
        </jsp:forward>
        <%
            }
    } catch (Exception e) {
    %>
    <jsp:forward page="error.jsp">
        <jsp:param name="mess" value="<%=e.toString()%>"/>
    </jsp:forward>
    <%
    }
    %>

</body>
</html>
