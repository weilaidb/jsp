<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Out</title>
</head>
<body bgcolor="yellow">
<%
    int a = 100;
    long b = 300;
    boolean c = true;
    out.println("<h1>这里标题1字体的大小</h1>");
    out.println("<h2>这里标题1字体的大小</h2>");
    out.print("<br>");
    out.println(a);
    out.println(b);
    out.println(c);
%>
<center>
    <p>
        <font size="20" face="隶书">
        以下是一个表格
        </font>
        <%
            out.print("<font face=隶书 size=2>");
            out.println("<table border>");
            out.println("<tr>");
            out.println("<th width=80>" + "姓名" +"</th>");
            out.println("<th width=60>" + "性别" +"</th>");
            out.println("<th width=200>" + "出生日期" +"</th>");
            out.println("</tr>");

            out.println("<tr>");
            out.println("<td>" + "刘一一" +"</td>");
            out.println("<td>" + "男" +"</td>");
            out.println("<td>" + "1978年5月" +"</td>");
            out.println("</tr>");

            out.println("<tr>");
            out.println("<td>" + "林青" +"</td>");
            out.println("<td>" + "女" +"</td>");
            out.println("<td>" + "1988年5月" +"</td>");
            out.println("</tr>");
            out.println("</table>");
            out.println("</font>");
        %>

    </p>
</center>

</body>
</html>
