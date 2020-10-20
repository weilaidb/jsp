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
    <title>字符串提交方式</title>
</head>
<body bgcolor="#00ffff">
<font size="2">
    <form action="<%=app_basePath2%>/show" method="post" name="form">
        输入字符串，提交给servlet(Post方式):
        <input type="text" name="str">
        <input type="submit" value="提交" name="submit">
    </form>
    <form action="<%=app_basePath2%>/show" method="get" name="form">
        输入字符串，提交给servlet(Get方式):
        <input type="text" name="str">
        <input type="submit" value="提交" name="submit">
    </form>

</font>

</body>
</html>
