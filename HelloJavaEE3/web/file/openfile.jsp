<%@ page import="string.CStringPub" %>
<%@ page import="com.cmd.RunCmd" %>
<%@ page import="file.CFilePub" %>
<%@ page import="java.io.File" %>
<%@ page import="com.net.ClientSendMsg2QtServer" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2021/6/8
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script language="javascript">
    <!--
    function closewin(){
        self.opener=null;
        self.close();}
    function clock(){i=i-1
        document.title="本窗口将在"+i+"秒后自动关闭!";
        if(i>0)setTimeout("clock();",1000);
        else closewin();}
    var i=2
    clock();
    //-->
</script>

<head>
    <title>打开文件</title>
</head>
<body>

<%
    String topdir  = CStringPub.requesParaIfNullSetEmpty(request, "topdir");
    String filetip  = CStringPub.requesParaIfNullSetEmpty(request, "filetip");
    String filebf = CStringPub.requesParaIfNullSetEmpty(request, "filebf");
    String fileaf  = CStringPub.requesParaIfNullSetEmpty(request, "fileaf");
    String selectitem  = CStringPub.requesParaIfNullSetEmpty(request, "selectitem");

    //清空提示，使加载源内容
    request.setAttribute("filetip","refresh");

    System.out.println("-->this is open page");
    System.out.println("topdir: " + topdir);
    System.out.println("selectitem getTipsName: " + CFilePub.getTipsName(selectitem));
//    System.out.println("filebf: " + filebf);
//    System.out.println("fileaf: " + fileaf);
//    System.out.println("filetip: " + filetip);
    System.out.println("selectitem: " + selectitem);

    String openPath = topdir + File.separator + CFilePub.getTipsName(selectitem);
    System.out.println("openPath: " + openPath);
    RunCmd.explorerdir(openPath);
//    RunCmd.explorerdir(CFilePub.replaceSeparator(openPath));
//        ClientSendMsg2QtServer.sendStr2QtServer("", openPath);
%>


<%--<jsp:forward page="showfilecontent.jsp"></jsp:forward>--%>

</body>
</html>
