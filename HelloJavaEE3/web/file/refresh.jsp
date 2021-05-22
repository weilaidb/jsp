<%@ page import="string.CStringPub" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2021/5/23
  Time: 0:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>refresh</title>
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

    System.out.println("-->this is refresh page");
    System.out.println("topdir: " + topdir);
    System.out.println("filetip: " + filetip);
    System.out.println("selectitem: " + selectitem);

%>

<jsp:forward page="showfilecontent.jsp"></jsp:forward>

</body>
</html>
