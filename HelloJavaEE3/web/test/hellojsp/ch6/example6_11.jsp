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
    <title>预处理减小压力</title>
</head>
<body bgcolor="white">
<font size="2">
    <inquire:PrepareTag dataBaseName="warehouse" tableName="product" user="root" password="Zzerp123"/>
    在<%=biao%>表查询到记录:
    <br><%=queryResult%>
    </form>
</font>

</body>
</html>
