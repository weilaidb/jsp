<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="upload" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>acceptFile</title>
</head>
<body bgcolor="#ffc0cb">
<upload:UpFile subdir="ch5/image"/>
<%=message%>
<br><%=fileName%>上传的效果:
<%--<br><img src="image/<%=fileName%>" width="160" height="100"/>--%>
<br><img src="image/<%=fileName%>" />

</body>
</html>
