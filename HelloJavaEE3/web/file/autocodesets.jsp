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
    function clearSearchEdit()
    {
        document.getElementById("id_findtext").value = "";
    }
    function historyResult()
    {
        document.form.action="historyResult.jsp";
        document.form.target = "";
        // document.form.target = "_blank";
        document.form.submit();
    }
    function searchKeyResult()
    {
        document.form.action="searchKeyResult.jsp";
        document.form.target = "";
        // document.form.target = "_blank";
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
    String historyitem = CStringPub.requesParaIfNullSetEmpty(request, "historyitem");
    String keyitem = CStringPub.requesParaIfNullSetEmpty(request, "keyitem");
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
        <%
            if(historyitem.trim().length() > 0 )
            {
        %>
        查找内容:<input type="text" name="findtext" class="input" value="<%=historyitem%>" id="id_findtext"><br>
        <%
        }
        else if(keyitem.trim().length() > 0)
        {
        %>
        查找内容:<input type="text" name="findtext" class="input" value="<%=keyitem%>" id="id_findtext"><br>
        <%
        }
        else
        {
        %>
        查找内容:<input type="text" name="findtext" class="input" value="<%=findtext%>" id="id_findtext"><br>
        <%
            }
        %>

        <input type="checkbox" name="casesensitive">大小写
        <input type="checkbox" name="findfileflag" style="margin-bottom: 20px">查找文件

        <input type="submit" value="显示"  onclick="showFindResult()" style="margin-right: 10px;margin-bottom:10px;width: 60px"/>
        <input type="submit" value="清空"  onclick="clearSearchEdit()" style="margin-right: 10px;width: 60px"/>
        <input type="button" value="历史"  formatarget="_blank" onclick="historyResult()" style="margin-right: 10px;width: 60px"/>
        <input type="button" value="关键字"  formatarget="_blank" onclick="searchKeyResult()" style="margin-right: 10px;width: 60px"/>
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
        <input type="submit" value="修改菜单" name="submit" class="submitbtn_file" style="margin-bottom: 0px><br>
        <input type="hidden" name="topdir" class="input" value="<%=topdir%>" style="margin-bottom: 0px"><br>
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
    <input type="submit" name="selectitem" value="<%=item%>" class="submitbtn_file">
    <input type="hidden" name="topdir" value="<%=topdir%>">
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
