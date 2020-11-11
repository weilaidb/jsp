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
文件内容是:<br>
<textarea name="messages1" rows="50" cols="90"><%=menuStand%></textarea>
<textarea name="messages2" rows="50" cols="90"><%=menuUser%></textarea>


</body>
</html>
