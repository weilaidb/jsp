<%@ page import="string.CStringPub" %>
<%@ page import="weilaidb.sql.SqlProc" %>
<%@ page import="java.util.LinkedList" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/11/10
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%--<link href="../css/file.css" rel="stylesheet"></head>--%>
<%@taglib prefix="menu" tagdir="/WEB-INF/tags/file" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>

<html>
<script type="text/javascript">
    var certDlStatus=[];
    frm.find("input[name=certDlStatus]:checked").each(
        function (i) {
            certDlStatus.push($(this).val());
        }
    );
</script>

<head>
    <title>代码集</title>
</head>
<body>
<%--<a href="modifymenu.jsp" target="_blank">修改菜单</a>--%>

<%--//显示内容--%>
<font size="3">
    <form action="" method="post" name="form">
        文件位置:<input type="text" name="topdir" class="input"><br>
        查找内容:<input type="text" name="findtext" class="input"><br>
        <input type="checkbox" name="casesensitive">匹配大小写
        <input type="checkbox" name="findfileflag">查找文件内容
<%--        <input type="checkbox" name="casesensitive" value="0" <c:if test="${fn:contains(certDlStatusList, '0') }">checked="checked"</c:if>>匹配大小写--%>
<%--        <input type="checkbox" name="findfileflag" value="1" <c:if test="${fn:contains(certDlStatusList, '0') }">checked="checked"</c:if>>查找文件内容--%>
        <input type="submit" value="显示" name="submit" class="submitbtn_file">
    </form>
</font>

<%
    String topdir = CStringPub.requesParaIfNullSetEmpty(request, "topdir");
    String findtext = CStringPub.requesParaIfNullSetEmpty(request, "findtext");
    String casesensitive = CStringPub.requesParaIfNullSetEmpty(request, "casesensitive");
    String findfileflag = CStringPub.requesParaIfNullSetEmpty(request, "findfileflag");
    if(CStringPub.isTrimEmpty(topdir))
    {
        topdir = SqlProc.getAutoCodeSetsPathFromFileDefault();
    }
%>

<%--//修改菜单--%>
<font size="3">
    <form action="modifymenu.jsp" method="post" name="form" target="_blank">
        <input type="hidden" name="topdir" class="input" value="<%=topdir%>"><br>
        <input type="submit" value="修改菜单" name="submit" class="submitbtn_file"><br>
    </form>
</font>



源路径为:<%=topdir%> <br>
<font size="4" color="#d2691e">
查看内容[<%=findtext%>]列表:<br><br>
</font>

<menu:ShowSelfMenuUser topdir="<%=topdir%>" findtext="<%=findtext%>"
                       casesensitive="<%=casesensitive%>"
                       findfileflag="<%=findfileflag%>" enterflag=""></menu:ShowSelfMenuUser>
<%
    String[] listSets  = showresult.toString().split("<br>");
//    System.out.println("listSets.length:" + listSets.length);
//    listSets = CStringPub.filterListEmpty(listSets);
    for (String item :
            listSets) {
        if(CStringPub.isTrimEmpty(item))
        {
            continue;
        }
%>
<form name="form2" method="post"  target="frame_right" action="showfilecontent.jsp" onload="autosubmit()">
    <input type="hidden" name="topdir" value="<%=topdir%>">
    <input type="submit" name="selectitem" value="<%=item%>" class="submitbtn_file">
</form>
<%
    }
%>



</body>
</html>
