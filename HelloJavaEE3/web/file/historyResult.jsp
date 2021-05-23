<%@ page import="file.CFilePub" %>
<%@ page import="java.util.List" %>
<%@ page import="string.CStringPub" %>
<%@ page import="weilaidb.sql.SqlProc" %>
<%@ page import="com.sun.org.apache.xerces.internal.xs.StringList" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2021/5/7
  Time: 23:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>历史记录</title>
</head>
<body>


<%
    String topdir = CStringPub.requesParaIfNullSetEmpty(request, "topdir");
    if(CStringPub.isTrimEmpty(topdir))
    {
        topdir = SqlProc.getAutoCodeSetsPathFromFileDefault();
    }

    String listcontent = CFilePub.readFileSelf(topdir, CFilePub.getFreqUseName(),"");
//    System.out.println("listcontent: " + listcontent);

%>

<%--<%=listcontent%>--%>
<%
    List<String> list = CStringPub.string2ListBr(listcontent);
    System.out.println("list size: " + list.size());

    for (String item:
            list) {
%>
<form action="autocodesets.jsp" method="post" name="form">
    <input type="submit" name="historyitem" value="<%=item%>" >
</form>
<%--<%=item%><br>--%>
<%
    }
%>

</body>
</html>
