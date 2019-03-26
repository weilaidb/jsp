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
        function fun(thisurl){
            window.location = thisurl;
        }

    </script>
</head>
<body>
网站： <select name="url" onchange="fun(this.value)">
<option value="#">==请选择要浏览的站点</option>
<option value="http://www.mldn.cn">MLDN</option>
<option value="http://bbs.mldn.cn">社区</option>
<option value="E:\\">E:</option>
<option value="D:\\">D:</option>
<option value="C:\">C:\</option>

</select>
</body>
</html>








































