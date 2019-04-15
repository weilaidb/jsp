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
    pageContext.setAttribute("num1", 10);
    pageContext.setAttribute("num2", 20);
    pageContext.setAttribute("num3", 30);
%>

<h3>empty操作:${empty info}</h3>
<h3>三目操作:${num1 > num2 ?"大于":"小于"}</h3>
<h3>括号操作:${num1 * (num2 + num3)}</h3>

</body>
</html>
