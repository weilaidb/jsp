<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/18
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.QueryBean" %>
<jsp:useBean id="base" class="bean.QueryBean" scope="page"/>
<jsp:setProperty name="base" property="databaseName" value="warehouse"/>
<jsp:setProperty name="base" property="tableName" value="product"/>
<jsp:setProperty name="base" property="user" value="root"/>
<jsp:setProperty name="base" property="password" value="Zzerp123"/>

<html>
<head>
    <title>查询数据库</title>
</head>
<body bgcolor="#00ffff">
<font size="2">
    在<jsp:getProperty name="base" property="tableName"/>表查询到记录:
    <br><jsp:getProperty name="base" property="queryResult"/>
</font>

</body>
</html>
