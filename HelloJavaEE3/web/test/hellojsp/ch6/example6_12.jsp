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
    <title>添加记录2</title>
</head>
<body bgcolor="orange">
<font size="2">
    <form action="insertRecord.jsp" method="post" name="form">
        添加新记录:
        <table border="1">
            <tr><td>产品:</td><td><input type="text" name="number"></td></tr>
            <tr><td>名称:</td><td><input type="text" name="name"></td></tr>
            <tr><td>日期:</td><td><input type="text" name="year"></td></tr>
            <tr><td>价格:</td><td><input type="text" name="price"></td></tr>
        </table>
        <br><input type="submit" value="提交" name="b">
        <br>product表更新前的数据记录是:
        <inquire:PrepareTag dataBaseName="warehouse" tableName="product" user="root" password="Zzerp123"/>
        <br><%=queryResult%>
    </form>
</font>

</body>
</html>
