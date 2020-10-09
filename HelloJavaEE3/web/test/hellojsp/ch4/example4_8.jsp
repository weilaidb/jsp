<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/9
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Table</title>
</head>
<body bgcolor="#00ffff">
<%--<textarea name="ilovethisgame" rows="4" cols="20"></textarea>--%>
<font size="3">
    <form action="answer.jsp" method="post" name="form">
        <table border="1">
            <tr>
                <th>"贝利"是哪个国家的人</th>
                <th>曾获得过世界杯冠军的球队</th>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="R" value="巴西">巴西
                    <input type="radio" name="R" value="德国">德国
                    <input type="radio" name="R" value="美国">美国
                    <input type="radio" name="R" value="法国" checked="ok">法国
                </td>
                <td>
                    <input type="checkbox" name="item" value="法国国家队">法国国家队
                    <input type="checkbox" name="item" value="中国国家队">中国国家队
                    <input type="checkbox" name="item" value="巴西国家队">巴西国家队
                    <input type="checkbox" name="item" value="美国国家队">美国国家队
                    <input type="hidden" value="喜欢世界杯!" name="secret">
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="提交" name="submit"></td>
                <td><input type="reset" value="重置"></td>
            </tr>
        </table>
    </form>
</font>
</body>
</html>
