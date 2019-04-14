<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/14
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>在线用户列表</h2>
<%
    Set all = (Set)this.getServletConfig().getServletContext()
            .getAttribute("online");
//    if(all.isEmpty())
//    {
//        return;
//    }
    Iterator iter = all.iterator();
    while(iter.hasNext())
    {
%>
        <%=iter.next()%>、
<%
    }
%>

</body>
</html>
