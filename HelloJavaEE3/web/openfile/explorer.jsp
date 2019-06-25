<%@ page import="com.clipboard.ProcClipboard" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/6/23
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ClipBoard</title>
</head>
<body>

<%--<%=ProcClipboard.getAll4Clipboard()%>--%>
<%--<%=ProcClipboard.getfragmentHtmlFlavor4Clipboard()%>--%>
<%--<%=ProcClipboard.getimageFlavor4Clipboard()%>--%>
<%=ProcClipboard.getselectionHtmlFlavor4Clipboard()%>
<%--<%=ProcClipboard.getstringFlavor4Clipboard()%>--%>

</body>
</html>
