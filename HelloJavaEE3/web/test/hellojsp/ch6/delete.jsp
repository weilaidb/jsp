<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/14
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="inquire" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>delete</title>
</head>
<body>
<font size="4">
<%
    String num = request.getParameter("number");
    if (num == null) {
        num="";
    }
    byte bb[] = num.getBytes("GBK");
    num = new String(bb);

%>
    <inquire:DelRecord number="<%=num%>"></inquire:DelRecord>
    <br>product表删除记录后的记录是:
    <inquire:QueryTab dataBaseName="warehouse" tableName="product" user="root" password="Zzerp123"/>
    <br><%=queryResult%>
</font>


</body>
</html>
