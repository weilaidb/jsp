<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/6/10
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>菜鸟教程(runoob.com)</title>
</head>
<body>

<p id="demo">点击按钮把 utc 日期和时间转换成字符串。</p>
<button onclick="myFunction()">点我</button>
<script>
    function myFunction(){
        var d = new Date();
        var x = document.getElementById("demo");
        x.innerHTML=d.toUTCString();
    }
</script>

</body>
</html>