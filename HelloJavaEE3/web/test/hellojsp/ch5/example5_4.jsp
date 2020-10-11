<%@ page import="java.io.FilenameFilter" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>列出指定类型的文件</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<%!
    class FileJsp implements FilenameFilter{
        String str = null;
        FileJsp(String s){
            str = "." + s;
        }
        public boolean accept(File dir, String name){
            return  name.endsWith(str);
        }
    }
%>
<%
    String tofile = "G:\\tarbao\\jsp\\HelloJavaEE3\\web\\test\\hellojsp\\ch5";
%>
    <br><%=tofile%>目录中的jsp文件:
    <%
        File dir = new File(tofile);
        FileJsp file_jsp = new FileJsp("jsp");
        String file_name[] = dir.list();
        for (int i = 0; i < file_name.length; i++) {
            if(file_jsp.accept(dir,file_name[i]))
                out.print("<br>" + file_name[i]);
        }
    %>
</font>


</body>
</html>
