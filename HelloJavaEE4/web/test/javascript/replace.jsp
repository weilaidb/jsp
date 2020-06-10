<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/6/10
  Time: 22:16
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

<p>单击按钮将段落中的第一个 Microsoft 替换成 Runoob：</p>
<p id="demo">Visit Microsoft!Visit Microsoft!</p>
<button onclick="myFunction()">点我</button>
<script>
    function myFunction(){
        var str=document.getElementById("demo").innerHTML;
        var n=str.replace("Microsoft","Runoob");
        document.getElementById("demo").innerHTML=n;
    }
</script>

</body>
</html>
