<%@ page import="string.CStringPub" %>
<%@ page import="file.CFilePub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/11/10
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="file" tagdir="/WEB-INF/tags/file" %>
<link href="../css/file.css" rel="stylesheet"></head>
<script type="text/javascript" src="../js/file.js"></script>

<html>
<head>
    <title>文件内容</title>
</head>
<body>
<%
    String topdir = CStringPub.requesParaIfNullSetEmpty(request, "topdir");
    String selectitem = CStringPub.requesParaIfNullSetEmpty(request, "selectitem");
    System.out.println("topdir:" + topdir);
    System.out.println("selectitem:" + selectitem);
%>



【<%=selectitem%>】的内容为:<br>
<%
String readFileNameTips = CFilePub.getTipsName(selectitem);
String readFileNameBf = CFilePub.getBeforeName(selectitem);
String readFileNameAf = CFilePub.getAfterName(selectitem);
%>

<font size="3">
    <form action="savefile.jsp" method="post" name="form">
        <input type="hidden" value="<%=topdir%>" name="topdir">
        <input type="hidden" value="<%=selectitem%>" name="selectitem">
        <input type="submit" value="保存" name="submit">
        <input type="button" id="btn_refresh" onclick="Refresh()" value="刷新"/><br>
        <file:ReadTag dir="<%=topdir%>" fileName="<%=readFileNameTips%>"></file:ReadTag>
        <textarea name="filetip" class="textarea_reg1"><%=result%></textarea>

        <file:ReadTag dir="<%=topdir%>" fileName="<%=readFileNameBf%>"></file:ReadTag>
        <textarea name="filebf" class="textarea_reg2"><%=result%></textarea>

        <file:ReadTag dir="<%=topdir%>" fileName="<%=readFileNameAf%>"></file:ReadTag>
        <textarea name="fileaf" class="textarea_reg3"><%=result%></textarea>
    </form>
</font>

</body>
</html>
