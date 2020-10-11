<%@ page import="java.io.File" %>
<%@ page import="java.io.RandomAccessFile" %>
<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page info="story" %>
<html>
<head>
    <title>continueWrite</title>
</head>
<body bgcolor="#00ffff">
<p>小说已有内容:</p>
<font size="4" color="navy">
    <%
        String str = response.encodeURL("continue.jsp");
    %>
<%--    获取用户提交的小说的名字--%>
<%
    String name = (String)request.getParameter("R");
    if (name == null) {
        name = "";
    }
    byte c[] = name.getBytes("GBK");
    name = new String(c);
    session.setAttribute("name", name);
    String dir = getServletInfo();
    File storyFileDir = new File(dir);
    storyFileDir.mkdirs();
    File f = new File(storyFileDir,name);
    //列出小说的内容
    try{
        RandomAccessFile file = new RandomAccessFile(f,"r");
        String temp = null;
        while ((temp = file.readUTF()) != null) {
            byte d[] = temp.getBytes("GBK");
            temp = new String(d);
            out.print("<br>" + temp);
        }
        file.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</font>
<p>请输入续写的内容</p>
<form action="<%=str%>" method="post" name="form">
    <textarea name="messages" rows="12" cols="40" WRAP="physcial"></textarea>
    <br>
    <input type="submit" value="提交信息" name="submit">
</form>


</body>
</html>
