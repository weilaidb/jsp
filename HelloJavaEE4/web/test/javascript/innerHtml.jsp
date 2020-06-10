<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/6/10
  Time: 21:44
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

<h1>我的第一个 Web 页面</h1>
<p id="demo">我的第一个段落。</p>
<p id="demo2">我的第二个段落。</p>
<script>
    document.getElementById("demo").innerHTML="段落已修改。";
    document.getElementById("demo2").innerHTML="段落2已修改。";
</script>

</body>
</html>


