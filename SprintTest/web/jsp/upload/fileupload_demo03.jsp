<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/8
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="com.mldn.lxh.util.FileUploadTools" %>
<%@ page import="java.io.File" %>
<html>
<head>
    <title>Title</title>
    <%
        request.setCharacterEncoding("utf-8");
    %>
</head>
<body>
<%
    FileUploadTools fut = new FileUploadTools(request, 30 * 1024 * 1024,
            application.getRealPath("/") + "uploadtemp");
    String name = fut.getParameter("uname");
    String inst[] = fut.getParameterValues("inst");
    List<String> all = fut.saveAll(application.getRealPath("/")
            + "upload" + File.separator);
%>

<h3>姓名:<%=name%></h3>
<h3>兴趣:
<%
    for(int x = 0; x < inst.length; x++)
    {
%>
        <%=inst[x]%>
<%
    }
%>
</h3>
<%
    Iterator<String> iter = all.iterator();
    while(iter.hasNext())
    {
%>
        <img src="../upload/<%=iter.next()%>">
<%
    }
%>


</body>
</html>
