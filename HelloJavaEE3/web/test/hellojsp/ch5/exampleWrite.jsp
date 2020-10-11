<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="file" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Write</title>
</head>
<body bgcolor="yellow">
<font size="4">
    <form action="" method="post" name="form">
        输入文件的内容:
        <br>
        <textarea name="write" rows="6" cols="20"></textarea>
        <input type="submit" value="提交" name="submit">
    </form>
    <%
        String str = request.getParameter("write");
        if (str == null) {
            str = "";
        }
        byte b[] = str.getBytes("GBK");
        str = new String(b);
    %>
    <file:WriteTag dir="D:/" fileName="hello.txt" content="<%=str%>"/>
    <a href="exampleRead.jsp">查看写入的内容</a>
</font>


</body>
</html>
