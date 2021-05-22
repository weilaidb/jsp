<%@ page import="file.CFilePub" %>
<%@ page import="string.CStringPub" %>
<%@ page import="regexp.CRegExpPub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2021/5/22
  Time: 23:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<SCRIPT language=javascript>
    setTimeout("go()", 1000);

</SCRIPT>
<script language="javascript">
    <!--
    function closewin(){
        self.opener=null;
        self.close();}
    function clock(){i=i-1
        document.title="本窗口将在"+i+"秒后自动关闭!";
        if(i>0)setTimeout("clock();",1000);
        else closewin();}
    var i=0
    clock();
    //-->
</script>
<html>

<head>
    <title>保存文件并返回</title>
</head>

<body>

<%
    String topdir  = CStringPub.requesParaIfNullSetEmpty(request, "topdir");
    String filetip  = CStringPub.requesParaIfNullSetEmpty(request, "filetip");
    String filebf = CStringPub.requesParaIfNullSetEmpty(request, "filebf");
    String fileaf  = CStringPub.requesParaIfNullSetEmpty(request, "fileaf");
    String selectitem  = CStringPub.requesParaIfNullSetEmpty(request, "selectitem");
    String result  = "";
    request.setAttribute("filetip","");

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
<%--<jsp:forward page="showfilecontent.jsp"></jsp:forward>--%>
</body>
</html>
