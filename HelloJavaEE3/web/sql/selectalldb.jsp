<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>SELECT ALLDB操作</title>
</head>
<body>
<!--
JDBC 驱动名及数据库 URL
数据库的用户名与密码，需要根据自己的设置
useUnicode=true&characterEncoding=utf-8 防止中文乱码
 -->
<sql:setDataSource var="snapshot" driver="org.sqlite.JDBC"
                   url="jdbc:mysql://localhost:3306/alldb?useUnicode=true&characterEncoding=utf-8"
                   user="root"  password="Zzerp123"/>

<sql:query dataSource="${snapshot}" var="result">
    <%--SELECT * from abc order by id desc limit 20;--%>
    SELECT * from abc order by id desc;
</sql:query>
<h1>JSP 数据库实例 - ALLDB</h1>

<c:set var="string1" value="This is first String."/>
<c:set var="string2" value="This <abc>is second
                             String.</abc>"/>

<%--<p>使用 escapeXml() 函数:</p>--%>
<%--<p>string (1) : ${fn:escapeXml(string1)}</p>--%>
<%--<p>string (2) : ${fn:escapeXml(string2)}</p>--%>



<table border="1" width="100%">
    <tr>
        <th>ID</th>
        <th>站点名</th>
        <th>站点地址</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.id}"/></td>
            <td><c:out value="${row.name}"/></td>
            <td><c:out value="${row.content}"/></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>