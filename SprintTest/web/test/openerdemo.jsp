<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/25
  Time: 7:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>script demo 01</title>
    <script language="JavaScript">
        function closeWin() {
            window.close();
        }
        window.opener.location.reload();

    </script>
</head>
<body>
<h3><a href="#" onclick="closeWin()">关闭窗口</a> </h3>
</body>
</html>








































