<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>session live time</title>
</head>
<body bgcolor="yellow">
<font size="4">

</font>
<%
    session.setMaxInactiveInterval(10);
    boolean boo = session.isNew();
    out.println("<br>如果你第一次访问当前Web服务目录，你的会话是最新的");
    out.print("<br>" + "如果你不是首次访问当前Web服务目录，你的会话不是新的");
    out.print("<br>" + "会话是新的吗？:" + boo);
    out.print("<br>" + "欢迎来到本页面，你的session允许的最长发呆时间为" +
            session.getMaxInactiveInterval() + "秒");

    out.print("<br>" + "你的session的创建时间是"+ new Date(session.getCreationTime()));
    out.print("<br>" + "你的session的Id是" + session.getId());
    Long lastTime = (Long)session.getAttribute("lastTime");
    if(lastTime == null)
    {
        long n = session.getLastAccessedTime();
        session.setAttribute("lastTime", new Long(n));
    }
    else{
        long m = session.getLastAccessedTime();
        long n = ((Long)session.getAttribute("lastTime")).longValue();
        out.print("<br>" + "你的发呆时间大约是" + (m-n) +"毫秒，大约" + (m - n)/1000 + "秒");
        session.setAttribute("lastTime", new Long(m));
    }



%>

</body>
</html>
