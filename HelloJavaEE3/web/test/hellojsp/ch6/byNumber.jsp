<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/13
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="inquire" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>根据产品号查询</title>
</head>
<body>
<font size="4">
<%
    String number = request.getParameter("number");
    if (number == null) {
        number = "";
    }
    byte bb[] = number.getBytes("GBK");
    number = new String(bb);
%>
<inquire:NumberCondition number="<%=number%>"></inquire:NumberCondition>
根据产品号<%=number%>查询到的记录:
    <br><%=queryResultByNumber%>
    
</font>


</body>
</html>
