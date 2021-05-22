<%@ page import="string.CStringPub" %>
<%@ page import="file.CFilePub" %>
<%@ page import="regexp.CRegExpPub" %><%--
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
<Script Language="JavaScript">
    function convertInfo()
    {
        document.form1.action="";
        document.form1.submit();
    }
    function saveFileExt()
    {
        document.form1.action="savefile2.jsp";
        document.form1.target = "_blank";
        document.form1.submit();
    }
    function showFile()
    {
        document.form1.action="showfile.jsp";
        document.form1.submit();
    }
</Script>

<html>
<head>
    <title>文件内容</title>
</head>
<body>
<%
    String topdir     = CStringPub.requesParaIfNullSetEmpty(request, "topdir");
    String selectitem = CStringPub.requesParaIfNullSetEmpty(request, "selectitem");
    String lefttext   = CStringPub.requesParaIfNullSetEmpty(request, "lefttext");
    String righttext  = CStringPub.requesParaIfNullSetEmpty(request, "righttext");
    //保存点击项
    CFilePub.writeFileSortRemoveDuplicate(topdir,CFilePub.getFreqUseName(), selectitem);

//    读取文本内容
    String contentTips = CStringPub.emptyString();
    String contentBf = CStringPub.emptyString();
    String contentAf = CStringPub.emptyString();
    String readFileNameTips = CFilePub.getTipsName(selectitem);
    String readFileNameBf = CFilePub.getBeforeName(selectitem);
    String readFileNameAf = CFilePub.getAfterName(selectitem);
%>

<file:ReadTag dir="<%=topdir%>" fileName="<%=readFileNameTips%>"></file:ReadTag>
<%
    contentTips = result.toString();
    if(CStringPub.isTrimEmpty(lefttext))
    {
        lefttext = contentTips;
    }
%>
<file:ReadTag dir="<%=topdir%>" fileName="<%=readFileNameBf%>"></file:ReadTag>
<%
    contentBf = result.toString();
%>
<file:ReadTag dir="<%=topdir%>" fileName="<%=readFileNameAf%>"></file:ReadTag>
<%
    contentAf = result.toString();
    contentAf = CRegExpPub.procSpecialSignReplace(contentAf);
    //正则处理后的结果
    String regexpResult = CRegExpPub.procPatternInfo(lefttext, contentBf, contentAf);
%>

【<%=selectitem%>】:<br>

<form action="" method="post" name="form1">
    <input type="hidden" value="<%=topdir%>" name="topdir">
    <input type="hidden" value="<%=selectitem%>" name="selectitem">
    <input type="hidden" name="filebf" value="<%=contentBf%>"/>
    <input type="hidden" name="fileaf" value="<%=contentAf%>"/>
    <input type="button" value="保存" onclick="saveFileExt()"/>
    <input type="button" value="转换" onclick="convertInfo()"/>
    <input type="button" id="btn_refresh" onclick="Refresh()" value="刷新"/>
    <br>
    <textarea name="filetip" class="textarea_reg1" style="background-color:#cce8cf;color:black;"><%=lefttext%></textarea>
    <textarea name="righttext" class="textarea_reg1" style="background-color:#cce8cf;color:black;"><%=regexpResult%></textarea>
</form>

</body>
</html>
