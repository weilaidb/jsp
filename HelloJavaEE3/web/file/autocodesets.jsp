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

<html>
<head>
    <title>代码集</title>
</head>
<body>
<font size="3">
    <form action="" method="post" name="form">
        文件位置:<input type="text" name="topdir" class="input"><br>
        查找内容:<input type="text" name="findtext" class="input"><br>
        <input type="checkbox" name="casesensitive" value="">匹配大小写
        <input type="checkbox" name="findfilecontent" value="">查找文件内容<br>
        <input type="submit" value="显示" name="submit" class="submitbtn_file"><br>
    </form>
</font>


<%
    String topdir = CStringPub.requesParaIfNullSetEmpty(request, "topdir");
    String findtext = CStringPub.requesParaIfNullSetEmpty(request, "findtext");
    String casesensitive = CStringPub.requesParaIfNullSetEmpty(request, "casesensitive");
    if(CStringPub.isTrimEmpty(topdir))
    {
        topdir = SqlProc.getAutoCodeSetsPathFromFileDefault();
    }
%>
源路径为:<%=topdir%> <br>
<font size="4" color="#d2691e">
查看内容[<%=findtext%>]列表:<br><br>
</font>

<menu:ShowSelfMenuUser topdir="<%=topdir%>" findtext="<%=findtext%>" casesensitive="<%=casesensitive%>"></menu:ShowSelfMenuUser>
<%
    String[] listSets  = showresult.toString().split("<br>");
    System.out.println("listSets.length:" + listSets.length);

    for (String item :
            listSets) {
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
