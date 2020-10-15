<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/14
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="inquire" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>newRecord</title>
</head>
<body bgcolor="yellow">
<font size="4">
    <%!
        String handleStr(String s) {
            try{
                byte bb[] = s.getBytes("GBK");
                return new String(bb);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return s;
        }
    %>
<%
    String nu = request.getParameter("number");
    String na = request.getParameter("name");
    String mT = request.getParameter("year");
    String pr = request.getParameter("price");
    byte bb[] = na.getBytes("GBK");
    na = new String(bb);
%>
    <inquire:PrepareInsert number="<%=nu%>" name="<%=na%>" year="<%=mT%>" price="<%=pr%>"/>
    <br>product表添加记录后的记录是:
    <inquire:PrepareTag dataBaseName="warehouse" tableName="product" user="root" password="Zzerp123"/>
    <br><%=queryResult%>
</font>


</body>
</html>
