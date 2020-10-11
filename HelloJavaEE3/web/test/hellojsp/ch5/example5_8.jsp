<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>RandomAccessFile</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<%
    String str = response.encodeURL("continueWrite.jsp");
%>
    <p>选择你想继写的小说的名字:</p>
    <form action="<%=str%>" method="post" name="form">
        <input type="radio" name="R" value="spring.doc">美丽的故事
        <input type="radio" name="R" value="summer.doc">火热的夏天
        <input type="radio" name="R" value="autumn.doc">秋天的收获
        <input type="radio" name="R" value="winter.doc">冬天的大雪
        <input type="submit" value="提交" name="g">
    </form>

</font>



</body>
</html>
