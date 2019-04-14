<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/14
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h3>IP地址: ${pageContext.request.remoteAddr}</h3>
<h3>SESSION ID: ${pageContext.session.id}</h3>
<h3>是否是新session: ${pageContext.session['new']}</h3>

</body>
</html>
