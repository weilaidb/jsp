<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/18
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.UpFile" %>
<jsp:useBean id="upFile" class="bean.UpFile" scope="session"/>
<html>
<head>
    <title>UpFile</title>
</head>
<body bgcolor="yellow">
<font size="3">
    <br>请选择要上传的文件：<br />
    <form action="" method="post" name="form" enctype="multipart/form-data">
        <input type="file" name="boy" size="30">
        <input type="submit" value="提交" name="g">
    </form>
    <%
        upFile.setRequest(request);
        upFile.setSession(session);
    %>
    <jsp:getProperty name="upFile" property="upFileMessage"/>
    <br><img src="image/<jsp:getProperty name="upFile" property="showImage"/>" width="80" height="80"/>


</font>

</body>
</html>
