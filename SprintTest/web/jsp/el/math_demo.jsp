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
    pageContext.setAttribute("num1", 20);
    pageContext.setAttribute("num2", 33);
%>

<h3>num1:${num1}</h3>
<h3>num2:${num2}</h3>
<h3>加法操作:${num1 + num2}</h3>
<h3>减法操作:${num1 - num2}</h3>
<h3>乘法操作:${num1 * num2}</h3>
<h3>除法操作:${num1 / num2}</h3>
<h3>除法操作:${num1 div num2}</h3>
<h3>取模操作:${num1 % num2}</h3>
<h3>取模操作:${num1 mod num2}</h3>
</body>
</html>
