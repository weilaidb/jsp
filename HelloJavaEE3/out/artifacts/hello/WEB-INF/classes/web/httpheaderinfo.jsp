<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/2/25
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>HTTP信息头示例</title>
</head>
<body>
<h2>HTTP 头部请求实例</h2>
<table width="100%" border="1" align="center">
    <tr bgcolor="#949494">
        <th>Header Name</th><th>Header Value(s)</th>
    </tr>
    <%
        Enumeration headerNames = request.getHeaderNames();
        while(headerNames.hasMoreElements()) {
            String paramName = (String)headerNames.nextElement();
            out.print("<tr><td>" + paramName + "</td>\n");
            String paramValue = request.getHeader(paramName);
            out.println("<td> " + paramValue + "</td></tr>\n");
        }

        String uri = request.getRequestURI();
        out.print("<tr><td>" + "uri" + "</td>\n");
        out.println("<td> " + uri + "</td></tr>\n");


        StringBuffer url = request.getRequestURL();
        out.print("<tr><td>" + "url" + "</td>\n");
        out.println("<td> " + url.toString() + "</td></tr>\n");


        String user = request.getRemoteUser();
        out.print("<tr><td>" + "user" + "</td>\n");
        out.println("<td> " + user + "</td></tr>\n");



        String path = request.getPathInfo();
        out.print("<tr><td>" + "path" + "</td>\n");
        out.println("<td> " + path + "</td></tr>\n");

        String protocol = request.getProtocol();
        out.print("<tr><td>" + "protocol" + "</td>\n");
        out.println("<td> " + protocol + "</td></tr>\n");

        String addr = request.getRemoteAddr();
        out.print("<tr><td>" + "addr" + "</td>\n");
        out.println("<td> " + addr + "</td></tr>\n");


        String getServletPath = request.getServletPath();
        out.print("<tr><td>" + "getServletPath" + "</td>\n");
        out.println("<td> " + getServletPath + "</td></tr>\n");


        int getContentLength = request.getContentLength();
        out.print("<tr><td>" + "getContentLength" + "</td>\n");
        out.println("<td> " + getContentLength + "</td></tr>\n");


        int getServerPort = request.getServerPort();
        out.print("<tr><td>" + "getServerPort" + "</td>\n");
        out.println("<td> " + getServerPort + "</td></tr>\n");






    %>
</table>
</body>
</html>
