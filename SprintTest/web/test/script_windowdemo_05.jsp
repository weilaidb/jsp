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
        function shownewpage(thisurl){
            // window.location = thisurl;
            window.open(thisurl, "弹出页面", "width=200,height=60,scrollbars=yes,resizable=no");
        }

    </script>
</head>
<body>
<form name="parentform">
    <input type="button" value="选择信息" onclick="shownewpage('content.jsp');"><br>
    选择的结果:<input type="text" name="result">
</form>
</body>
</html>








































