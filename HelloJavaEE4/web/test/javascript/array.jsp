<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/6/10
  Time: 23:35
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
    var i;
    var mycars = new Array();
    mycars[0] = "Saab";
    mycars[1] = "Volvo";
    mycars[2] = "BMW";
    mycars[32] = "FOTUO";
    for (i=0;i<mycars.length;i++){
        document.write(mycars[i] + "<br />");
    }
</script>

</body>
</html>