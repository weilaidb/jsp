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

<p id="demo">单击按钮显示今天周几</p>
<button onclick="myFunction()">点我</button>
<script>
    function myFunction(){
        var d = new Date();
        var weekday=new Array(7);
        weekday[0]="周日";
        weekday[1]="周一";
        weekday[2]="周二";
        weekday[3]="周三";
        weekday[4]="周四";
        weekday[5]="周五";
        weekday[6]="周六";
        var x = document.getElementById("demo");
        x.innerHTML=weekday[d.getDay()];
    }
</script>

</body>
</html>
