<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/6/11
  Time: 0:14
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

<p id="demo">点击按钮将数组作为字符串输出。</p>
<button onclick="myFunction()">点我</button>
<script>
    function myFunction(){
        var fruits = ["Banana", "Orange", "Apple", "Mango"];
        var x=document.getElementById("demo");
        x.innerHTML=fruits.join();
    }
</script>

</body>
</html>
