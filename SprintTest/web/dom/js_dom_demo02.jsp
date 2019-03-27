<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/27
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script language="JavaScript">
        function show() {
            document.getElementById("info").innerHTML =
                "<h2>www.MLDNJAVA.cn</h2>";
        }
    </script>
</head>
<body>
<form action="" method="post">
    <input type="button" onclick="show()" value="显示">
    <span id="info"></span>
</form>
</body>
</html>
