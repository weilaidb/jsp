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
        function fun(){
            if(window.confirm("确认删除？"))
            {
                alert("您选择的\"是\"!");
            }
            else
            {
                alert("您选择的\"否\"!");

            }
        }

    </script>
</head>
<body>
<a href="#" onclick="fun()">删除邮件</a>

</body>
</html>








































