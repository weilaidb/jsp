<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/9
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>response</title>
</head>
<body bgcolor="#00ffff">
<font size="1">
    <p>我正在学习response对象的
    <br>setContentType方法
    <p>将当前页面保存为word文档吗?
    <form action="" method="get" name="form">
    <input type="submit" value="yes" name="submit">
</form>

    <%
        String str = request.getParameter("submit");
        if(str == null)
        {
            str = "";
        }
        if(str.equals("yes"))
            response.setContentType("application/msword;charset=GB2312");
    %>

</font>

</body>
</html>
