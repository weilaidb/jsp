<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/13
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="inquire" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>条件查询</title>
</head>
<body bgcolor="yellow">

<font size="3">
    <form action="" method="post" name="form">
        排序记录:
        <input type="radio" name="orderType" value="price">按价格(price)
        <input type="radio" name="orderType" value="year">按生产日期(madeTime)
        <input type="submit" value="提交" name="g">
    </form>

    <%
        String orderType = request.getParameter("orderType");
        if (orderType == null) {
            orderType = "";
        }
    %>
    <inquire:SortTag orderType="<%=orderType%>"/>
    根据排序方式:<%=orderType%>，排序的记录:
    <br><%=orderResult%>
</font>

</body>
</html>
