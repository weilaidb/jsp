<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/15
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.StudentTwo" %>
<jsp:useBean id="file" class="bean.ListFile" scope="page"/>
<html>
<head>
    <title>Student Two</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<form action="" method="post" name="form">
        <p>输入文件的扩展名:<input type="text" name="extendsName"></p>
        <input type="submit" value="提交" name="submit">
</form>

<jsp:setProperty name="file" property="*"/>
        当前JSP页面所在目录中，扩展名是:
    <jsp:setProperty name="file" property="extendsName"/>
    的文件有:
    <br><jsp:getProperty name="file" property="allFileName"/>

</font>




</body>
</html>
