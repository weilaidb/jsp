<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/9/30
  Time: 8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>param指令标记</title>
</head>
<body>
<p>加载文件的效果</p>
<jsp:include page="tom.jsp">
    <jsp:param name="computer" value="3000"/>
</jsp:include>

</body>
</html>
