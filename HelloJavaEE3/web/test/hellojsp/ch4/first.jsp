<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 8:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <title>First</title>
</head>
<body bgcolor="yellow">
我是first.jsp页面，输入你的姓名链接到second.jsp
<%
    String id = session.getId();
    out.println("<br>你的session对象的ID是:<br>" + id);
%>
<form action="second.jsp" method="post" name="form">
    <input type="text" name="boy">
    <input type="submit" value="送出" name="submit">
</form>

</body>
</html>
