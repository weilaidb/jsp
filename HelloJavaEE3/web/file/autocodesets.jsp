<%@ page import="string.CStringPub" %>
<%@ page import="weilaidb.sql.SqlProc" %>
<%@ page import="file.CFilePub" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="menu" tagdir="/WEB-INF/tags/file" %>

<html>
<script type="text/javascript">
    // var certDlStatus=[];
    // frm.find("input[name=certDlStatus]:checked").each(
    //     function (i) {
    //         certDlStatus.push($(this).val());
    //     }
    // );
    function showFindResult()
    {
        document.form.action="";
        document.form.target = "";
        document.form.submit();
    }
    function historyResult()
    {
        document.form.action="historyResult.jsp";
        document.form.target = "_blank";
        document.form.submit();
    }
    function searchKeyResult()
    {
        document.form.action="searchKeyResult.jsp";
        document.form.target = "_blank";
        document.form.submit();
    }

</script>

<head>
    <title>代码集</title>
</head>
<body>
<%
    String topdir = CStringPub.requesParaIfNullSetEmpty(request, "topdir");
    String findtext = CStringPub.requesParaIfNullSetEmpty(request, "findtext");
    String casesensitive = CStringPub.requesParaIfNullSetEmpty(request, "casesensitive");
    String findfileflag = CStringPub.requesParaIfNullSetEmpty(request, "findfileflag");
    if(CStringPub.isTrimEmpty(topdir))
    {
        topdir = SqlProc.getAutoCodeSetsPathFromFileDefault();
    }

    String checkflag_case = casesensitive.isEmpty() ? "" : "checked";
    String checkflag_findfile = findfileflag.isEmpty() ? "" : "checked";

%>

<%--//显示内容--%>
<font size="3">
    <form action="" method="post" name="form">
        文件位置:<input type="text" name="topdir" class="input"><br>
        查找内容:<input type="text" name="findtext" class="input" value="<%=findtext%>"><br>
        <input type="checkbox" name="casesensitive">匹配大小写
        <input type="checkbox" name="findfileflag">查找文件内容

        <input type="submit" value="显示"  onclick="showFindResult()"/>
        <input type="button" value="历史记录"  formatarget="_blank" onclick="historyResult()"/>
        <input type="button" value="查询关键字"  formatarget="_blank" onclick="searchKeyResult()"/>
    </form>
</font>

<%
//    topdir = CStringPub.requesParaIfNullSetEmpty(request, "topdir");
    findtext = CStringPub.requesParaIfNullSetEmpty(request, "findtext");
    casesensitive = CStringPub.requesParaIfNullSetEmpty(request, "casesensitive");
    findfileflag = CStringPub.requesParaIfNullSetEmpty(request, "findfileflag");
//    if(CStringPub.isTrimEmpty(topdir))
//    {
//        topdir = SqlProc.getAutoCodeSetsPathFromFileDefault();
//    }
//    System.out.println("findtext: " + findtext);
//    System.out.println("casesensitive: " + casesensitive);
//    System.out.println("findfileflag: " + findfileflag);

%>

<%--//修改菜单--%>
<font size="3">
    <form action="modifymenu.jsp" method="post" name="form1" target="_blank">
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
    boolean haveKey = false;

    for (String item :
            listSets) {
        if(CStringPub.isTrimEmpty(item))
        {
            continue;
        }
        haveKey = true;
%>
<form name="form2" method="post"  target="frame_right" action="showfilecontent.jsp" onload="autosubmit()">
    <input type="hidden" name="topdir" value="<%=topdir%>">
    <input type="submit" name="selectitem" value="<%=item%>" class="submitbtn_file">
</form>
<%
    }

    if(haveKey)
    {
        //保存查询关键字
        CFilePub.writeFileSortRemoveDuplicate(topdir,CFilePub.getSearchKey(), findtext);
    }

%>



</body>
</html>
