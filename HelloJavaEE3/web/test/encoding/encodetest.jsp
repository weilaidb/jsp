<%@ page import="com.commmon.Encoding" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/5/20
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="gb2312"%>
<%@ page contentType="text/html;charset=gb2312"%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>--%>
<%--<%@ page contentType="text/html; charset=gb2312" language="java" %>--%>

<html>
<head>
    <title>EncodingTest</title>
<%--    <meta http-equiv="Content-Type" content="text/html charset=gb2312">--%>
    <meta http-equiv="Content-Type" content="text/html charset=gb2312">
</head>
<body>
<%=Encoding.testStrUtf8()%>
<%out.print("JSP的中文处理");%>

</body>
</html>
