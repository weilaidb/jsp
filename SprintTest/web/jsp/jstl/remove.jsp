<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/17
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<%--%>
    <%--pageContext.setAttribute("info", "ab.fdsfd 一款数据存储小工具，使用mysql作为数据库，用户名root 密码ZZerp123，支持多个关键字查询，作为日常记录的小工具。增加生成头文件工具。增加大文本存储。支持文件批量生成和处理。");--%>
<%--%>--%>


<c:set var="info" value="Hello World!!!!" scope="request"/>
<c:remove var="info" scope="request"/>
<h3>属性内容:${info}</h3>
</body>
</html>
