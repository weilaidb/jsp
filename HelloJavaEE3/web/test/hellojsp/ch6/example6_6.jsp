<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/13
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="inquire" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>模糊查询</title>
</head>
<body bgcolor="yellow">

<font size="3">
    <form action="" method="post" name="form">
        选择:
        <select name="ziduan">
            <option value="name">产品名称</option>
            <option value="number">产品号</option>
        </select>
        含有:<input type="text" name="keyWord">
        <input type="submit" value="提交" name="g">
    </form>

    <%
        String ziduan = request.getParameter("ziduan");
        String keyWord = request.getParameter("keyWord");
        if (ziduan == null || keyWord == null) {
            ziduan = "";
            keyWord = "";
        }
        byte bb[] = keyWord.getBytes("GBK");
        keyWord = new String(bb);
        out.println("关键字 " + keyWord);

    %>
    <inquire:KeyWord keyWord="<%=keyWord%>" ziduan="<%=ziduan%>"/>
    查询到的记录:
    <br><%=foundResult%>
</font>

</body>
</html>
