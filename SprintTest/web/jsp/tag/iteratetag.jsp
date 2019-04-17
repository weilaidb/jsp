<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/15
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="atag" uri="attribute_tag_ext"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    List<String> all = new ArrayList<String>();
    all.add("aaaaaaaaaaaaaa");
    all.add("bbbbbbbbbb");
    all.add("ccccccccc");
    all.add("dddddddddd");
    all.add("eeeeeeeeeee");
    request.setAttribute("all", all);
%>

<atag:present name="all" scope="request"></atag:present>
<atag:iterate id="url" name="all" scope="request">
    <h3>网站:${url}</h3>
</atag:iterate>

<%--<atag:bodyiterate id="url" name="all" scope="request">--%>
    <%--<h3>网站:<%=url%></h3>--%>
<%--</atag:bodyiterate>--%>
</body>
</html>
