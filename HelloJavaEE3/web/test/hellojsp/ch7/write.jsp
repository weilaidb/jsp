<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/18
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.WriteFile" %>
<jsp:useBean id="ok" class="bean.WriteFile" scope="page"/>
<jsp:setProperty name="ok" property="filePath" param="filePath"/>
<jsp:setProperty name="ok" property="fileName" param="fileName"/>
<jsp:setProperty name="ok" property="fileContent" param="fileContent"/>
<html>
<head>
    <title>写文件</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
    <form action="" method="post" name="form">
        <br>请选择一个目录:<br>
        <select name="filePath">
            <option value="D:/1000/a">D:/1000/a</option>
            <option value="C:">C:</option>
            <option value="E:">E:</option>
            <option value="G:">G:</option>
        </select>
        <br>输入保存的文件的名字<input type="text" name="fileName">
        <br>输入保存的文件的内容<br>
        <textarea name="fileContent" rows="10" cols="40"></textarea>
        <input type="submit" value="提交" name="submit">
    </form>
    <%
        if (ok.isSuccess() == true) {
    %>
    你写的文件成功，文件所在目录:
    <jsp:getProperty name="ok" property="filePath"/>
    <br>文件名字:
    <jsp:getProperty name="ok" property="fileName"/>
    <%
        }
    %>

</font>



</body>
</html>
