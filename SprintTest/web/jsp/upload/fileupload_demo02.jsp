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
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="com.mldn.lxh.util.IPTimeStamp" %>
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
    factory.setRepository(new File(application.getRealPath("/") + "uploadtemp"));
    ServletFileUpload upload = new ServletFileUpload(factory);
    upload.setFileSizeMax(30 * 1024 * 1024); //设置最大上传大小
    List<FileItem> items = upload.parseRequest(request);
    IPTimeStamp its = new IPTimeStamp(request.getRemoteAddr());
    Iterator<FileItem> iter = items.iterator();
    while (iter.hasNext()) {
        FileItem item = iter.next();
        String fieldName = item.getFieldName();
%>
<ul><h4>表单控件名称:<%=fieldName%> --> <%=item.isFormField()%>
</h4></ul>
<%
    if (!item.isFormField()) {
        File saveFile = null;
        InputStream input = null;
        OutputStream output = null;
        input = item.getInputStream();
        output = new FileOutputStream(new File(application.getRealPath("/")
                + "upload" + File.separator + its.getIPTimeRandFormat()
                + "." + item.getName().split("\\.")[0]));
//        out.println("output:" + output);
        System.out.println("output" + output);
        byte data[] = new byte[512];
        int temp = 0;
        while ((temp = input.read(data, 0, 512)) != -1) {
            output.write(data);
        }
        input.close();
        output.close();

    } else {
        String value = item.getString();
%>
<li>普通参数:<%=value%>
</li>
<%
    }
%>
</ul>
<%
    }
%>

</body>
</html>
