<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/6/10
  Time: 22:08
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

<script>
    var txt = "Hello World!";
    document.write("<p>字体变大: " + txt.big() + "</p>");
    document.write("<p>字体缩小: " + txt.small() + "</p>");
    document.write("<p>字体加粗: " + txt.bold() + "</p>");
    document.write("<p>斜体: " + txt.italics() + "</p>");
    document.write("<p>固定定位: " + txt.fixed() + "</p>");
    document.write("<p>加删除线: " + txt.strike() + "</p>");
    document.write("<p>字体颜色: " + txt.fontcolor("green") + "</p>");
    document.write("<p>字体大小: " + txt.fontsize(6) + "</p>");
    document.write("<p>下标: " + txt.sub() + "</p>");
    document.write("<p>上标: " + txt.sup() + "</p>");
    document.write("<p>链接: " + txt.link("http://www.w3cschool.cc") + "</p>");
    document.write("<p>闪动文本: " + txt.blink() + " (不能用于IE,Chrome,或者Safari)</p>");
</script>

</body>
</html>