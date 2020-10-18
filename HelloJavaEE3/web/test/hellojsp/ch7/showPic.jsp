<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/18
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.seepicture.*" %>
<jsp:useBean id="play" class="bean.seepicture.Play" scope="session"/>
<jsp:setProperty name="play" property="imageNumber" param="imageNumber"/>
<jsp:getProperty name="play" property="playImage"/>
<html>
<head>
    <title>显示图片</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<table>
    <form action="" method="post">
        <tr>
            <td><input type="submit" name="ok" value="上一张"></td>
            <input type="hidden" name="imageNumber" value="<%=play.getImageNumber() - 1%>"
        </tr>
    </form>
    <form action="" method="post">
        <tr>
            <td><input type="submit" name="ok" value="下一张"></td>
            <input type="hidden" name="imageNumber" value="<%=play.getImageNumber() + 1%>"
        </tr>
    </form>
</table>
</font>


</body>
</html>
