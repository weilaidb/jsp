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
        function fun(thisurl){
            // window.location = thisurl;
            window.open(thisurl, "弹出页面", "width=470,height=150,scrollbars=yes,resizable=no");
        }

    </script>
</head>
<body>
<input type="button" value="打开" onclick="fun('openerdemo.jsp')">
</body>
</html>








































