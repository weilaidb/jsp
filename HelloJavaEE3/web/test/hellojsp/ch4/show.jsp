<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/9
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>显示视频或图片</title>
</head>
<body bgcolor="#00ffff">
<font size="3">
    <%
        String s1 = request.getParameter("image");
        String s2 = request.getParameter("video");
//        out.println(s1);
//        out.println(s2);
    %>
    <img src="picture/<%=s1%>" width="200" height="160">图像</img>
<%--    <embed src="avi/<%=s2%>" width=300 height=180>视频</embed>--%>
    <embed src="avi/<%=s2%>" width=300 height=180 type="application/x-mplayer2">视频</embed>
<%--    <embed src="avi/<%=s2%>" width="宽" height="高" quality="high" type="application/x-shockwave-flash" wmode="transparent">视频</embed>--%>
<%--    <embed src="avi/<%=s2%>" width="宽" height="高" quality="high" wmode="transparent">视频</embed>--%>
</font>
</body>
</html>
