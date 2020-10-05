<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/5 0005
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>request所有的内容</title>
</head>
<body bgcolor="white">

<font size="3">
    <br>用户使用的协议是:
    <%
        String protocol = request.getProtocol();
        out.print(protocol);
    %>
    <br>获取接收用户提交信息的页面:
    <%
        String path = request.getServletPath();
        out.print(path);
    %>
    <br>接受用户提交信息的长度:
    <%
        int length = request.getContentLength();
        out.print(length);
    %>
    <br>用户提交信息的方式:
    <%
        String method = request.getMethod();
        out.print(method);
    %>

    <br>获取HTTP头文件中User-Agent的值:
    <%
        String header1 = request.getHeader("User-Agent");
        out.print(header1);
    %>
    <br>获取HTTP头文件中accept的值:
    <%
        String header2 = request.getHeader("accept");
        out.print(header2);
    %>
    <br>获取HTTP头文件中Host的值:
    <%
        String header3 = request.getHeader("Host");
        out.print(header3);
    %>
    <br>获取HTTP头文件中accept-encoding的值:
    <%
        String header4 = request.getHeader("accept-encoding");
        out.print(header4);
    %>
    <br>获取用户的IP地址:
    <%
        String IP = request.getRemoteAddr();
        out.print(IP);
    %>

    <br>获取用户机的名称:
    <%
        String clientName = request.getRemoteHost();
        out.print(clientName);
    %>

    <br>获取服务器的名称：
    <%
        String serverName = request.getServerName();
        out.print(serverName);
    %>
    <br>获取服务器的端口号:
    <%
        int serverPort = request.getServerPort();
        out.print(serverPort);
    %>
    <br>获取用户端提交的所有参数的名字:
    <%
        Enumeration en = request.getParameterNames();
        while(en.hasMoreElements())
        {
            String s = (String)en.nextElement();
            out.print("<br>" + s);
        }
    %>
    <br>获取头名字的一个枚举:
    <%
        Enumeration enum_headed =request.getHeaderNames();
        while(enum_headed.hasMoreElements()){
            String s = (String)enum_headed.nextElement();
            out.print("<br>" + s);
        }
    %>
    <br>获取头文件中指定头名字的全部值的一个枚举:
    <%
        Enumeration enum_headedValues = request.getHeaders("cookie");
        while(enum_headedValues.hasMoreElements()){
            String s = (String)enum_headedValues.nextElement();
            out.print("<br>" + s);
        }
    %>
    <br>
    <p>
        文本框text提交的信息:

        <%
            String str = request.getParameter("boy");
            byte b[] = str.getBytes("GBK");
            str = new String(b);
        %>
        <%=str%>
        <br>按钮的名字:
        <%
            String buttonName = request.getParameter("submit");
            byte c[] = buttonName.getBytes("GBK");
            buttonName = new String(c);
        %>
        <%=buttonName%>
    </p>

</font>

</body>
</html>
