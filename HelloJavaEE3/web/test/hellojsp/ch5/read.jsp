<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/12
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="file" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Read</title>
</head>
<body bgcolor="#00ffff">
<font size="3">
    <form action="" method="post" name="form">
        读取文件:
        <input type="radio" name="R" value="secret">读取加密的文件
        <input type="radio" name="R" value="unsecret">读取解密的文件
        <input type="submit" value="提交" name="submit">
    </form>
</font>

<%
    String condition = request.getParameter("R");
    if (condition != null) {
        %>
        <file:SecretRead method="<%=condition%>"/>
        <textarea rows="6" cols="20"><%=content%></textarea>
        <%
    }
%>
<br><a href="inputContent.jsp">返回inputContent.jsp</a>

</body>
</html>
