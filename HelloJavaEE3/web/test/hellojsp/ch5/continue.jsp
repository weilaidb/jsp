<%@ page import="java.io.File" %>
<%@ page import="java.io.RandomAccessFile" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isThreadSafe="true" %>
<%@ page info="story" %>
<html>
<head>
    <title>continue</title>
</head>
<body>

<%!
    String writeContent(File f, String s) {
        try{
            RandomAccessFile out = new RandomAccessFile(f,"rw");
            out.seek(out.length());
            out.writeUTF(s);
            out.close();
            return "内容已成功写入到文件";
        } catch (Exception e) {
            e.printStackTrace();
            return "不能写入到文件" + e;
        }
    }
%>
<%--获取用户提交的小说的名字--%>
<%
    String name = (String)session.getAttribute("name");
    byte c[] = name.getBytes("GBK");
    name = new String(c);
    //获取用户续写的内容
    String content = (String)request.getParameter("messages");
    if (content == null) {
        content = "";
    }
    String dir = getServletInfo();
//    out.print(dir);
    File storyFileDir = new File(dir);
    storyFileDir.mkdirs();
    File f = new File(storyFileDir, name);
    String message = writeContent(f, content);
    out.print(message);
%>
</body>
</html>
