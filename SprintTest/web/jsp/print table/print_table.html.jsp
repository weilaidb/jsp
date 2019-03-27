<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/27
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="print_table.jsp" method="post">
<table border="1" width="100%">
    <tr>
        <td>请输入要显示表格的行数:</td>
        <td><input type="text" name="row"> </td>
    </tr>
    <tr>
        <td>输入要显示表格的列数:</td>
        <td><input type="text" name="col"> </td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" value="显示">
            <input type="reset" value="重置">
        </td>
    </tr>
</table>
</form>
</body>
</html>

















