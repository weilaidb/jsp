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
        function show(val) {
            document.myform.result.value = val;
        }
    </script>
</head>
<body >
<form action="" method="post" name="myform">
 部门:<select name="dept" onchange="show(this.value)">
    <option value="技术部">技术部</option>
    <option value="销售部">销售部</option>
    <option value="财务部">财务部</option>
结果：<input type="text" name="result" value="">
</select>
</form>

</body>
</html>








































