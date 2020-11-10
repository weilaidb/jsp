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
<file:ReadTag dir="<%=topdir%>" fileName="<%=readFileNameTips%>"></file:ReadTag>
<%--<%=result%>--%>
<textarea name="messages" rows="50" cols="60"><%=result%></textarea>

<file:ReadTag dir="<%=topdir%>" fileName="<%=readFileNameBf%>"></file:ReadTag>
<%--<%=result%>--%>
<textarea name="messages" rows="50" cols="60"><%=result%></textarea>

<file:ReadTag dir="<%=topdir%>" fileName="<%=readFileNameAf%>"></file:ReadTag>
<%--<%=result%>--%>
<textarea name="messages" rows="50" cols="60"><%=result%></textarea>


</body>
</html>
