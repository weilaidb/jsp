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
        function returnValue() {
            var city = document.myform.city.value;
            var doc = window.opener.document;
            doc.parentform.result.value = city;
            window.close();
        }
    </script>
</head>
<body>
<form name="myform">
    选择：<select name="city">
    <option value="北京">北京</option>
    <option value="上海">上海</option>
    <option value="深圳">深圳</option>
    <option value="广州">广州</option>
    <option value="天津">天津</option>
</select>
    <input type="button" value="返回" onclick="returnValue();">

</form>
</body>
</html>








































