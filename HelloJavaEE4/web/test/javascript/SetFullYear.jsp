<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/6/10
  Time: 22:50
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

<p id="demo">单击按钮显示修改后的年月日。</p>
<button onclick="myFunction()">点我</button>
<script>
    function myFunction(){
        var d = new Date();
        d.setFullYear(2020,10,3);
        var x = document.getElementById("demo");
        x.innerHTML=d;
    }
</script>
<p>记住 JavaScript 月数是从0至11。10是11月。</p>
</body>
</html>