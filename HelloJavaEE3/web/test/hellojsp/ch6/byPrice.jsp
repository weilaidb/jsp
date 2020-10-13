<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/13
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="inquire" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>根据价格查询</title>
</head>
<body>
<font size="4">
<%
    String min = request.getParameter("priceMin");
    String max = request.getParameter("priceMax");
%>

<inquire:PriceCondition priceMin="<%=min%>" priceMax="<%=max%>"/>
    价格在<%=min%>至<%=max%>之间的记录:
    <br><%=queryResultByPrice%>

</font>

</body>
</html>
