<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/20
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../../common/basepath.jsp" %>
<html>
<head>
    <title>正整数</title>
</head>
<body bgcolor="#00ffff">
<font size="2">
    <form action="<%=app_basePath2%>/getNumber" method="post" name="form">
        输入一个正整数:<input type="text" name="number">
        <input type="submit" value="提交" name="submit">
    </form>

</font>

</body>
</html>
