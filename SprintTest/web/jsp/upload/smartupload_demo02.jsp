<%@ page import="com.jspsmart.upload.SmartUpload" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/6
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ page import="com.mldn.lxh.util.IPTimeStamp" %>
<%@ page import="java.io.File" %>
<html>
<head>
    <title>提交2文件界面</title>
</head>
<body>

<%
        SmartUpload smart = new SmartUpload();
        smart.initialize(pageContext);
        smart.upload();
//        smart.save("upload");
        String name = smart.getRequest().getParameter("uname");
        IPTimeStamp its = new IPTimeStamp(request.getRemoteAddr());
        String ext = smart.getFiles().getFile(0).getFileExt();
        String fileName = its.getIPTimeRand() + "." + ext;
        fileName = fileName.replace(":","-");
        String fullName = application.getRealPath("/") +
                "upload" + File.separator + fileName;
        out.println("fullname:" + fullName);
        smart.getFiles().getFile(0).saveAs(fullName);
%>
<h1>姓名:<%=name%></h1>
<img src="../upload/<%=fileName%>">

<%--<h2>request无法取得:<%=request.getParameter("uname")%></h2>--%>
<%

//    } catch (Exception e) {
//        e.printStackTrace();
////        out.println("err:" + e.getMessage());
//    }
%>

</body>
</html>
