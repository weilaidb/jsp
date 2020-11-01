<%@ page import="sql.CSqlitePub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/31
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/sqlite/link" %>
<link href="../../../css/csspub.css" rel="stylesheet" type="text/css">

<html>
<head>
    <title>常见链接</title>
    <Script Language="JavaScript">
        function addTable()
        {
            document.form1.action="addLinkTable.jsp";
            document.form1.submit();
        }

        function deleteTable()
        {
            document.form1.action="../deleteTable.jsp";
            document.form1.submit();
        }
    </Script>
</head>
<body bgcolor="#c6ecd3">
<%--添加数据--%><%--删除数据--%>
<form action="" method="post" name="form1" accept-charset="gbk" target="_blank" class="form">
    <input type="hidden" name="database" value="<%=CSqlitePub.getSqliteWholePath()%>">
    <input type="hidden" name="table" value="<%=CSqlitePub.getLinktable()%>">
    <a href="../index.jsp">首页</a><br>
    <input type="button" value="添加链接" type="submit" onclick="addTable()"/>
    <input type="button" value="删除链接" type="submit" onclick="deleteTable()"/>
</form>

<link:QueryLink database="<%=CSqlitePub.getSqliteWholePath()%>"
                table="<%=CSqlitePub.getLinktable()%>" />
<%=orderResult%>

</body>
</html>
