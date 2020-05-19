<%@ page import="com.cmd.RunCmd" %>
<%@ page import="com.net.ClientSendMsg2QtServer" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/5/17
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    <SCRIPT language=javascript>--%>
<%--        function go() {--%>
<%--            window.history.go(-1);--%>
<%--        }--%>

<%--        setTimeout("go()", 2000);--%>
<%--    </SCRIPT>--%>
    <title>执行器</title>
</head>
<body>
<%
    String ipaddr = request.getParameter("ipaddr");
    String cmddatatext = request.getParameter("cmddatatext");
    String result = ClientSendMsg2QtServer.sendStr2QtServer(ipaddr, cmddatatext);

%>

<%=result%>
<%
    out.println("=====END======");
%>

</body>
</html>
