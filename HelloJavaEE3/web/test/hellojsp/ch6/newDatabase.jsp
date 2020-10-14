<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/14
  Time: 8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="inquire" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>添加记录</title>
</head>
<body bgcolor="yellow">
<font size="4">
<%!
    String handleStr(String s) {
        try{
            byte b[] = s.getBytes("GBK");
            s = new String(b);
        }
        catch (Exception e){
        }
        return s;
    }
%>

    <%
        String nu = handleStr(request.getParameter("number"));
        String na = handleStr(request.getParameter("name"));
        String mT = handleStr(request.getParameter("year"));
        String pr = handleStr(request.getParameter("price"));
    %>

    <inquire:AddRecord number="<%=nu%>" name="<%=na%>" year="<%=mT%>" price="<%=pr%>"/>
    <br>product表添加新记录后的记录是:
    <inquire:QueryTab dataBaseName="warehouse" tableName="product" user="root" password="Zzerp123"/>
    <br>
    <%=queryResult%>
</font>


</body>
</html>
