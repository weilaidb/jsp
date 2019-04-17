<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/17
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="mytag" uri="attribute_tag_ext5"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>
    <%
        List<String> all = new ArrayList<String>();
        all.add("wwwwwwwwwww");
        all.add("wwwwwwwwwww");
        all.add("wwwwwwwwwww");
        all.add("wwwwwwwwwww");
        all.add("wwwwwwwwwww");
        request.setAttribute("all", all);
    %>
    <mytag:simpleiteratetag id="url" name="all" scope="request">
        <h2>网站:${url}</h2>
    </mytag:simpleiteratetag>
</h1>
</body>
</html>
