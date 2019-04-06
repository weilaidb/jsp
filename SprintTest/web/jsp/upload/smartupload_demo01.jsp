<%@ page import="com.jspsmart.upload.SmartUpload" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/6
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ page import="com.jspsmart.upload.*" %>
<html>
<head>
    <title>提交文件界面</title>
</head>
<body>

<%--<h1>参数一:<%=new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8")%></h1>--%>
<%--&lt;%&ndash;<h1>参数一:<%=request.getParameter("name")%></h1>&ndash;%&gt;--%>
<%--<h1>参数二:<%=request.getParameter("info")%></h1>--%>
<%--<h1>参数二:<%=request.getParameter("pic")%></h1>--%>


<%
    try {
        SmartUpload smart = new SmartUpload();
        smart.initialize(pageContext);
        smart.upload();
        smart.save("upload");
%>
<h1>文件上传成功<%=smart.getRequest().getParameter("pic").toString()%></h1>

<%

    } catch (Exception e) {
        e.printStackTrace();
//        out.println("err:" + e.getMessage());
    }
%>

</body>
</html>
