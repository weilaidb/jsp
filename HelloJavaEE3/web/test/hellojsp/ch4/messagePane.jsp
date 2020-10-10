<%@ page import="java.util.Vector" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="javax.servlet.ServletContext" %>
<html>
<head>
    <title>messagePane</title>
</head>
<body>
<%!

    Vector<String> v = new Vector<String>();
    int i = 0;
    ServletContext application;
    synchronized void sendMessage(String s){
        application = getServletConfig().getServletContext();
        v.add(s);
        application.setAttribute("Mess", v);
    }
%>

<%
    String name = request.getParameter("peopleName");
    String title = request.getParameter("Title");
    String messages = request.getParameter("messages");
    if(name == null)
        name = "guest" + (int)(Math.random() * 10000);
    if(title == null)
        title = "无标题";
    if(messages == null)
        messages = "无信息";

    SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String time = matter.format(new Date());
    String s = name + "#" + title + "#" + time + "#" + messages;
    sendMessage(s);
    out.print("你的信息已经提交!");
%>
<a href="submit.jsp">返回留言板</a>
<a href="showMessage.jsp">查看留言板</a>

</body>
</html>
