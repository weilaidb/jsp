<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
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
    List all = new ArrayList();
    all.add("李李李");
    all.add("www.www.www");
    all.add("wlll@126.com");
    request.setAttribute("allinfo", all);
%>

<h3>第一个元素:${allinfo[0]}</h3>
<h3>第二个元素:${allinfo[1]}</h3>
<h3>第三个元素:${allinfo[2]}</h3>
<h3>第四个元素:${allinfo[3]}</h3>

</body>
</html>
