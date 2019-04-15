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
<h3>相等判断:${num1 == num2}</h3>
<h3>相等判断:${num1 eq num2}</h3>
<h3>不等判断:${num1 != num2}</h3>
<h3>不等判断:${num1 ne num2}</h3>
<h3>小于判断:${num1 < num2}</h3>
<h3>小于判断:${num1 lt num2}</h3>
<h3>大于判断:${num1 > num2}</h3>
<h3>大于判断:${num1 gt num2}</h3>
<h3>大于等于判断:${num1 >= num2}</h3>
<h3>大于等于判断:${num1 ge num2}</h3>
<h3>小于等于判断:${num1 <= num2}</h3>
<h3>小于等于判断:${num1 le num2}</h3>
</body>
</html>
