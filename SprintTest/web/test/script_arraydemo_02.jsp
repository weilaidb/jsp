<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/25
  Time: 7:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>script demo 01</title>
    <script language="JavaScript">
        function fun(){
            var arr = new Array("aaaaa", "bbbbb", "cccccc");
            var str = "数组的内容：";
            for(i = 0; i < arr.length; i++)
            {
                str += arr[i] + "、";
            }
            return str;
        }
        alert(fun());
    </script>
</head>
<body>

</body>
</html>








































