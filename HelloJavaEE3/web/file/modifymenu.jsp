<%@ page import="string.CStringPub" %>
<%@ page import="weilaidb.sql.SqlProc" %>
<%@ page import="file.CFilePub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/11/11
  Time: 8:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="menu" tagdir="/WEB-INF/tags/file" %>
<link href="../css/file.css" rel="stylesheet"></head>
<script type="text/javascript" src="../js/file.js"></script>


<html>
<head>
    <title>修改菜单</title>
</head>
<body>
<%
    String topdir = CStringPub.requesParaIfNullSetEmpty(request, "topdir");
    if(CStringPub.isTrimEmpty(topdir))
    {
        topdir = SqlProc.getAutoCodeSetsPathFromFileDefault();
    }

    String menuStand = CFilePub.readMenuStandResStr(topdir, "enter");
    String menuUser = CFilePub.readMenuUserResStr(topdir, "enter");

%>

<font size="3">
    <form action="savemenu.jsp" method="post" name="form">
        <input type="hidden" value="<%=topdir%>" name="topdir">
        <input type="submit" value="保存" name="submit">
        <input type="button" id="btn_refresh" onclick="Refresh()" value="刷新"/>
        显示菜单内容:<br>
        <textarea name="menuStand" class="textarea_showmenu"><%=menuStand%></textarea>
        <textarea name="menuUser" class="textarea_showmenu"><%=menuUser%></textarea>
    </form>
</font>


</body>
</html>
