<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/15
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Map map = new HashMap();
    map.put("lll", "李李李");
    map.put("mdn", "www.www.www");
    map.put("email", "wll@126.com");
    request.setAttribute("info", map);
%>

<h3>KEY为lll的内容:${info["lll"]}</h3>
<h3>KEY为mdn的内容:${info["mdn"]}</h3>
<h3>KEY为email的内容:${info["email"]}</h3>


</body>
</html>
