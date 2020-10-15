<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/13
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="inquire" tagdir="/WEB-INF/tags/student" %>
<html>
<head>
    <title>添加记录2</title>
</head>
<body bgcolor="orange">
<font size="2">
    <form action="newResultStudent.jsp" method="post" name="form">
        <table border="1">
            <tr><td>输入要更新的学生的学号:</td><td><input type="text" name="number"></td></tr>
            <tr><td>输入新的姓名:</td><td><input type="text" name="name"></td></tr>
            <tr><td>输入新的出生日期:</td><td><input type="text" name="birthday"></td></tr>
            <tr><td>输入新的email:</td><td><input type="text" name="email"></td></tr>
        </table>
        <br><input type="submit" value="提交更新" name="b">
        <br>message表更新前的数据记录是:
        <inquire:NameCondition name=""/>
        <br><%=queryResultByName%>
    </form>

</font>

</body>
</html>
