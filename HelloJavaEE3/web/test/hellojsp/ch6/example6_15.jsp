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
    <form action="byNumberStudent.jsp" method="post" name="form">
        根据学号查询:
        <br>输入学号:<input type="text" name="number">
        <br><input type="submit" value="提交" name="g">
    </form>
    <form action="byName.jsp" method="post" name="form">
        根据姓名（模糊）查询:
        <br>姓名含有:<input type="text" name="name" size="5">
        <br><input type="submit" value="提交" name="k">
    </form>

</font>

</body>
</html>
