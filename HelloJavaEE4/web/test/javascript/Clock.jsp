<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/6/10
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>菜鸟教程(runoob.com)</title>
    <script>
        function startTime(){
            var today=new Date();
            var y=today.getFullYear();
            var month = today.getMonth();
            var t = today.getDay();
            var h=today.getHours();
            var m=today.getMinutes();
            var s=today.getSeconds();// 在小于10的数字前加一个‘0’
            m=checkTime(m);
            s=checkTime(s);
            // month=checkTime(month);
            document.getElementById('txt').innerHTML= y + "-" + month + "-" +  t + "  " + h+":"+m+":"+s;
            t=setTimeout(function(){startTime()},500);
        }
        function checkTime(i){
            if (i<10){
                i="0" + i;
            }
            return i;
        }
    </script>
</head>
<body onload="startTime()">

<div id="txt"></div>

</body>
</html>
