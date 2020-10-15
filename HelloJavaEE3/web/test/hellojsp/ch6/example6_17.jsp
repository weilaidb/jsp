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
    <title>删除记录 Student</title>
</head>
<body>
<font size="2">
    <form action="deleteStudent.jsp" method="post" name="form">
        删除记录:
        <br>输入被删除的记录的学号:<input type="text" name="number" size="8">
        <br><input type="submit" value="提交" name="b">
    </form>
    <br>message表删除记录前的记录是:
    <inquire:NameCondition name=""/>
    <br><%=queryResultByName%>

</font>

</body>
</html>
