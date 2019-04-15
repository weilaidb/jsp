<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/15
  Time: 22:07
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
    pageContext.setAttribute("flagA", true);
    pageContext.setAttribute("flagB", false);
%>

<h3>flagA:${flagA}</h3>
<h3>flagB:${flagB}</h3>
<h3>与操作:${flagA && flagB}</h3>
<h3>与操作:${flagA and flagB}</h3>
<h3>或操作:${flagA || flagB}</h3>
<h3>或操作:${flagA or flagB}</h3>
<h3>非操作:${!flagA}</h3>
<h3>非操作:${not flagA}</h3>
</body>
</html>
