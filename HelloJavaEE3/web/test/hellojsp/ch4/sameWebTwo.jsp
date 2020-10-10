<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 7:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>sameWebTwo</title>
</head>
<body bgcolor="#00ffff">
<font size="2">
    <%
        String mess = request.getHeader("referer");
        if(mess == null){
            mess = "";
            response.setStatus(404);
        }
//        out.print(mess);
//        out.print(mess.startsWith("http://localhost:8089"));
        if((mess.startsWith("http://localhost:8089"))) {
//            out.print("come here");
            response.setStatus(404);
        }
    %>
    <p>欢迎访问本页面!</p>
    你来自：<%=mess%>
</font>

</body>
</html>
