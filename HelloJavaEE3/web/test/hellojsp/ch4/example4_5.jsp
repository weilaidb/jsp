<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/8
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>输入三条边</title>
</head>
<body>
<font size="3">
    <form action="get.jsp" method="post" name="form">
        <p>输入三角形三边:</p>
        <br>边A:<input type="text" name="sideA" value="10" size="5">
        边B:<input type="text" name="sideB" value="10" size="5">
        边C:<input type="text" name="sideC" value="10" size="5">
        <input type="submit" value="提交" name="submit">
    </form>
</font>

</body>
</html>
