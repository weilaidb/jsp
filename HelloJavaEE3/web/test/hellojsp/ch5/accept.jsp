<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileOutputStream" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>accept</title>
</head>
<body>
<%
    try{
        InputStream in = request.getInputStream();
        File dir = new File("D:/1000");
        dir.mkdirs();
        File f = new File(dir, "B.txt");
        FileOutputStream o = new FileOutputStream(f);
        byte b[] = new byte[1000];
        int n;
        while ((n = in.read(b)) != -1) {
            o.write(b,0,n);
        }
        o.close();
        in.close();
        out.print("文件已上传");
    } catch (Exception e) {
        e.printStackTrace();
        out.print("上传失败" + e);
    }
%>
</body>
</html>
