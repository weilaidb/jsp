<%@ page import="string.CStringPub" %>
<%@ page import="file.CFilePub" %>
<%@ page import="regexp.CRegExpPub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/11/11
  Time: 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<script type="text/javascript" src="../js/file.js"></script>

<SCRIPT language=javascript>
    setTimeout("go()", 1000);
</SCRIPT>
<html>
<head>
    <title>保存菜单</title>
</head>
<body>

<%
    String topdir  = CStringPub.requesParaIfNullSetEmpty(request, "topdir");
    String filetip  = CStringPub.requesParaIfNullSetEmpty(request, "filetip");
    String filebf = CStringPub.requesParaIfNullSetEmpty(request, "filebf");
    String fileaf  = CStringPub.requesParaIfNullSetEmpty(request, "fileaf");
    String selectitem  = CStringPub.requesParaIfNullSetEmpty(request, "selectitem");
    String result  = "";

    fileaf = CRegExpPub.procSpecialSignReplacerevert(fileaf);
    System.out.println("fileaf w: " + fileaf);

    //内容为空特殊处理一下
    if(CStringPub.isTrimEmpty(filebf))
    {
        filebf = "(.*)";
    }
    if(CStringPub.isTrimEmpty(fileaf))
    {
        fileaf = "\\1";
    }

    result += CFilePub.writeFile(topdir,CFilePub.getTipsName(selectitem), filetip);
    result += CFilePub.writeFile(topdir,CFilePub.getBeforeName(selectitem), filebf);
    result += CFilePub.writeFile(topdir,CFilePub.getAfterName(selectitem), fileaf);
%>

<%=result%>

//保存数据并返回刷新
<jsp:forward page="showfilecontent.jsp"/>返回

</body>
</html>
