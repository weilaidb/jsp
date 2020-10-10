<%@ page import="java.util.Vector" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>showMessage</title>
</head>
<body bgcolor="yellow">
<%
    Vector<String> v = (Vector)application.getAttribute("Mess");
    out.print("<table border=2>");
    out.print("<tr>");
    out.print("<td bagcolor=cyan>" + "留言者姓名" + "</td>");
    out.print("<td bagcolor=cyan>" + "留言者标题" + "</td>");
    out.print("<td bagcolor=cyan>" + "留言者时间" + "</td>");
    out.print("<td bagcolor=cyan>" + "留言者内容" + "</td>");
    for (int i = 0; i < v.size(); i++) {
        out.print("<tr>");
        String message = v.elementAt(i);
        byte bb[] = message.getBytes("GBK");
        message = new String(bb);
        String a[] = message.split("#");
        out.print("<tr>");
        int number = a.length - 1;
        for (int j = 0; j <= number; j++) {
            if(j < number)
                out.print("<td bgcolor = cyan>" + a[j] + "</td>");
            else
                out.print("<td><TextArea rows=3 cols=12>" +a[j] +  "</TextArea></td>");
        }
        out.print("</tr>");
    }
    out.print("</table>");
%>

<a href="submit.jsp">返回留言板</a>

</body>
</html>
