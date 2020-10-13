<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/13
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>条件查询</title>
</head>
<body bgcolor="yellow">

<font size="3">
    <form action="byNumber.jsp" method="post" name="form">
        根据产品号查询
        <br>输入产品号:<input type="text" name="number" size="8">
        <input type="submit" value="提交" name="g">
    </form>
    <form action="byPrice.jsp" method="post" name="form">
        根据价格号查询
        <br>价格在:<input type="text" name="priceMin" size="5">至
        <input type="text" name="priceMax" size="5">之间
        <input type="submit" value="提交">
    </form>
</font>

</body>
</html>
