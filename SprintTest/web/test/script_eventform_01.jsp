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
        function show(){
            var value = document.myform.name.value;
            alert("输入的内容是: " + value);
        }
        function byebyte() {
            alert("are you ready go? see you next");
        }
    </script>
</head>
<body >
<form action="" method="post" name="myform">
    请输入内容:<input type="text" name="name">
    <input type="button" value="显示" onclick="show()">
</form>

</body>
</html>








































