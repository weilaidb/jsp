<%@ page import="java.io.File" %>
<%@ page import="java.io.PrintStream" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="java.io.FileInputStream" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/3
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    //写文件
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("filename");
    String content = request.getParameter("filecontent");
    String fileName = application.getRealPath("/")
            + "note" + File.separator + name;
    File file = new File(fileName);
    if (!file.getParentFile().exists()) {
        file.getParentFile().mkdir();
    }
    PrintStream ps = null;
    ps = new PrintStream(new FileOutputStream(file));
    ps.println(content);
    ps.close();
%>

<%
    //读取出来 读文件
    Scanner scan = new Scanner(new FileInputStream(file));
    scan.useDelimiter("\n");
    StringBuffer buf = new StringBuffer();
    while (scan.hasNext()) {
        buf.append(scan.next()).append("<br>");
    }
    scan.close();
%>
<%=buf%>
</body>

</html>
