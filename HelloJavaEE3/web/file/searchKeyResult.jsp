<%@ page import="string.CStringPub" %>
<%@ page import="weilaidb.sql.SqlProc" %>
<%@ page import="file.CFilePub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2021/5/7
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>关键字</title>
</head>
<body>
<%
    String topdir = CStringPub.requesParaIfNullSetEmpty(request, "topdir");
//    String findtext = CStringPub.requesParaIfNullSetEmpty(request, "findtext");
//    String casesensitive = CStringPub.requesParaIfNullSetEmpty(request, "casesensitive");
//    String findfileflag = CStringPub.requesParaIfNullSetEmpty(request, "findfileflag");
    if(CStringPub.isTrimEmpty(topdir))
    {
        topdir = SqlProc.getAutoCodeSetsPathFromFileDefault();
    }
    String freqUse = "recentopen.txt";

    String listcontent = CFilePub.readFileSelf(topdir, freqUse,"");
    System.out.println("listcontent: " + listcontent);

%>

<%=listcontent%>
</body>
</html>
