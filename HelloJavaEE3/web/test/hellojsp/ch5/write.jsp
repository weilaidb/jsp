<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/12
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="file" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Write</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
    <%
        String str = request.getParameter("ok");
        if (str.length() > 0) {
            byte bb[] = str.getBytes("GBK");
            str = new String(bb);
    %>
        <file:SecretWrite content="<%=str%>"></file:SecretWrite>
    <%
            out.println("<br>" + message);
        }
    %>
    <a href="read.jsp">读取文件</a>

</font>


</body>
</html>
