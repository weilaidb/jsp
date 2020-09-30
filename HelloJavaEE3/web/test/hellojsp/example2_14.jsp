<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/9/30
  Time: 8:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>plugin指令标记</title>
</head>
<body>

<jsp:plugin type="applet" code="B.class" jreversion="1.2" width="200" height="260">
    <jsp:fallback>
        Plugin tag OBJECT or EMBED not supported by browser.
    </jsp:fallback>
</jsp:plugin>

</body>
</html>
