<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 6:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>verify</title>
</head>
<body>
<%
    String str = null;
    str = request.getParameter("boy");
    if (str == null) {
        str = "";
    }
//    byte b[] = str.getBytes("ISO-8859-1");
    byte b[] = str.getBytes("GB2312");
    str = new String(b);
    if(str.equals(""))
    {
        response.sendRedirect("example4_13.jsp");
    }
    else
    {
        out.print("欢迎你来到本网页!");
        out.print(str);
    }
%>

</body>
</html>
