<%@ page import="string.CStringPub" %>
<%@ page import="file.CFilePub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/11/11
  Time: 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>保存菜单</title>
</head>
<body>

<%
    String topdir  = CStringPub.requesParaIfNullSetEmpty(request, "topdir");
    String menuStand = CStringPub.requesParaIfNullSetEmpty(request, "menuStand");
    String menuUser  = CStringPub.requesParaIfNullSetEmpty(request, "menuUser");
    String result  = "";
    System.out.println("menuStand:" + menuStand);
    System.out.println("menuUser:" + menuUser);
    if(CStringPub.isTrimEmpty(menuStand))
    {
        out.println("内容为空，请输入内容<br>");
    }
    else
    {
        result += CFilePub.writeFile(topdir,CFilePub.getRelPath(), menuStand);
        result += CFilePub.writeFile(topdir,CFilePub.getRelPathuser(), menuUser);
    }
%>

<%=result%>

</body>
</html>
