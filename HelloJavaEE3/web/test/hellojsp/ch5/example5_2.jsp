<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Mkdir</title>
</head>
<body>
<font size="2">
<%
    File dir = new File("D:/test/webapps/ch5","Students");
%>
    <br>在ch5下创建一个新目录:Students，<br>成功创建了吗?
<%--    <%=dir.mkdir()%>--%>
    <%=dir.mkdirs()%>
    <br>Students是目录吗?<%=dir.isDirectory()%>
</font>


</body>
</html>
