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
    <title>更新记录</title>
</head>
<body bgcolor="yellow">

<font size="3">
    <form action="newResult.jsp" method="post" name="form">
        <table border="1">
            <tr><td>输入要更新的产品的产品号:</td><td><input type="text" name="number"></td></tr>
            <tr><td>输入新的名称:</td><td><input type="text" name="name"></td></tr>
            <tr><td>输入新的生产日期:</td><td><input type="text" name="year"></td></tr>
            <tr><td>输入新的价格:</td><td><input type="text" name="price"></td></tr>
        </table>
        <br><input type="submit" value="提交更新" name="b">
        <br>product表更新前的数据记录是:
        <inquire:QueryTab dataBaseName="warehouse" tableName="product" user="root" password="Zzerp123"/>
        <br><%=queryResult%>
    </form>
</font>

</body>
</html>
