<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/9
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>播放音乐或视频</title>
</head>
<body bgcolor="#00ffff">

<font size="3">
    <form action="show.jsp" method="post" name="form">
        <br>选择一幅图像:<select name="image">
        <option value="car.jpg">汽车</option>
        <option value="person.jpg">人物</option>
    </select>
        <br>选择视频或音乐:
        <select name="video">
            <option value="happy.wav">好汉歌</option>
            <option value="baba.mp3">小孩喊爸爸</option>
            <option value="clock.avi">表</option>
        </select>
        <input type="submit" value="提交你的选择" name="submit">
    </form>
</font>

</body>
</html>
