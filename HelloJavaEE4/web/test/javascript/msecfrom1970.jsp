<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/6/10
  Time: 22:42
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

<p id="text">单击按钮显示1970年1月1号至今的毫秒数。</p>
<p id="demo">""</p>
<button onclick="myFunction()">点我</button>
<script>
    function myFunction(){
        var d = new Date();
        var x = document.getElementById("demo");
        x.innerHTML=d.getTime();
    }
</script>

</body>
</html>