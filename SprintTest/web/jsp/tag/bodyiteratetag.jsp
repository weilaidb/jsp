<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/17
  Time: 7:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="mytag" uri="attribute_tag_ext3"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    List<String> all = new ArrayList<String>();
    all.add("aaaaaaa");
    all.add("aaaaaaa");
    all.add("aaaaaaa");
    all.add("aaaaaaa");
    request.setAttribute("all",all);
%>

<mytag:present name="all" scope="request">
    <mytag:bodyiterate id="url" name="all" scope="request">
        <h3>网站:<%=url%></h3>
    </mytag:bodyiterate>
</mytag:present>


</body>
</html>
