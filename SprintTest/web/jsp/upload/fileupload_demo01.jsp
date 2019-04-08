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
<html>
<head>
    <title>Title</title>
    <%
        request.setCharacterEncoding("utf-8");
    %>
</head>
<body>
<%
    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    upload.setFileSizeMax(30 * 1024 * 1024); //设置最大上传大小
    List<FileItem> items = upload.parseRequest(request);
    Iterator<FileItem> iter = items.iterator();
    while(iter.hasNext())
    {
        FileItem item = iter.next();
        String fieldName = item.getFieldName();
%>
        <ul><h4>表单控件名称:<%=fieldName%> --> <%=item.isFormField()%></h4></ul>
<%
        if(!item.isFormField())
        {
            String fileName = item.getName();
            String contentType = item.getContentType();
            long sizeInBytes = item.getSize();
%>
            <li>上传文件名称:<%=fileName%></li>
            <li>上传文件类型:<%=contentType%></li>
            <li>上传文件大小:<%=sizeInBytes%></li>
<%
        } else {
            String value = item.getString();
%>
            <li>普通参数:<%=value%></li>
<%
        }
%>
        </ul>
<%
    }
%>

</body>
</html>
