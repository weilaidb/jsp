<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>File UP</title>
</head>
<body>
<p>选择要上传的文件：</p>
<form action="accept.jsp" method="post" ENCTYPE="multipart/form-data">
    <input type="file" name="boy" size="38">
    <br><input type="submit" value="提交" name="submit">
</form>


</body>
</html>
