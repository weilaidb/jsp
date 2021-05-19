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
<script language="javascript">
    <!--
    function closewin(){
        self.opener=null;
        self.close();}
    function clock(){i=i-1
        document.title="本窗口将在"+i+"秒后自动关闭!";
        if(i>0)setTimeout("clock();",1000);
        else closewin();}
    var i=30
    clock();
    //-->
</script>


<Script Language="JavaScript">

    function convertInfo()
    {
        document.form1.action="";
        document.form1.submit();
    }

    function saveFile()
    {
        document.form2.action="savefile.jsp";
        document.form2.submit();
    }

    function showFile()
    {
        document.form2.action="showfile.jsp";
        document.form2.submit();
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
    System.out.println("topdir:" + topdir);
    System.out.println("selectitem:" + selectitem);
    System.out.println("lefttext:" + lefttext);
    System.out.println("righttext:" + righttext);
%>



<%
//    读取文本内容
    String contentTips = CStringPub.emptyString();
    String contentBf = CStringPub.emptyString();
    String contentAf = CStringPub.emptyString();
    String readFileNameTips = CFilePub.getTipsName(selectitem);
    String readFileNameBf = CFilePub.getBeforeName(selectitem);
    String readFileNameAf = CFilePub.getAfterName(selectitem);
    System.out.println("readFileNameTips:" + readFileNameTips);
    System.out.println("readFileNameBf:" + readFileNameBf);
    System.out.println("readFileNameAf:" + readFileNameAf);

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
%>

<%
//正则处理后的结果
    String regexpResult = CRegExpPub.procPatternInfo(lefttext, contentBf, contentAf);

%>

    <form action="" method="post" name="form2" target="">
        <input type="hidden" value="<%=topdir%>" name="topdir">
        <input type="hidden" value="<%=selectitem%>" name="selectitem">
        <input type="button" value="保存" type="submit" onclick="saveFile()"/>
        <input type="button" value="查看" type="submit" onclick="showFile()" />
        <%--        <input type="button" value="查看" type="submit" onclick="window.location.href='showfile.jsp'" />--%>
        <br>
        <textarea name="filetip" class="textarea_reg1"><%=contentTips%></textarea>
        <textarea name="filebf" class="textarea_reg2"><%=contentBf%></textarea>
        <textarea name="fileaf" class="textarea_reg3"><%=contentAf%></textarea>
    </form>
</font>

</body>
</html>
