<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/6/10
  Time: 22:13
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

<p id="demo">单击按钮来定位指定文本首次出现的位置。</p>
<button onclick="myFunction()">点我</button>
<script>
    function myFunction(){
        var str="Hello world, welcome to the universe.";
        var n=str.indexOf("welcome");
        document.getElementById("demo").innerHTML=n;
    }
</script>

</body>
</html>