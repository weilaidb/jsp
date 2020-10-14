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
    <title>添加记录</title>
</head>
<body bgcolor="#ffc0cb">

<font size="2">
    <form action="delete.jsp" method="post" name="form">
        删除记录:<br>输入被删除的记录的产品号:
        <br><input type="text" name="number" size="8">
        <br><input type="submit" value="提交" name="b">
        <br>product表更新前的数据记录是:
        <inquire:QueryTab dataBaseName="warehouse" tableName="product" user="root" password="Zzerp123"/>
        <br><%=queryResult%>
    </form>
</font>

</body>
</html>
