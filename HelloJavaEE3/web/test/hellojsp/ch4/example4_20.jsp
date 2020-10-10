<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>session设置时间间隔</title>
</head>
<body>
<br>反复使用该页面提供的计算字符串长度功能的间隔时间必须大于5秒。
<br>输入一个字符串，页面将计算它的长度：
<form action="" method="get" name="form">
    <input type="text" name="boy">
    <input type="submit" value="送出" name="submit">
</form>
<%
    int time = 5;
    String str = null;
    str = request.getParameter("boy");
    if(str == null)
        str="";
    Date date = (Date)session.getAttribute("date");
    if(date == null)
    {
        date = new Date();
        session.setAttribute("date", date);
    }
    date = (Date)session.getAttribute("date");
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(date);
    long timeInSession = calendar.getTimeInMillis();
    long currentTime = 0;
    if(session.isNew() == false)
        currentTime = System.currentTimeMillis();
    session.setAttribute("date", new Date(currentTime));
    long intervalTime = (currentTime - timeInSession)/1000;
    if(intervalTime <= time && session.isNew() == false){
        out.println("请" + time + "秒后再访问本页");
    }
    else{
        out.println("你输入的字符串的长度:" + str.length());
    }
%>
</body>
</html>
