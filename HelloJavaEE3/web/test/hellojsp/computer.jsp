<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/9/24
  Time: 8:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isThreadSafe="false" %>

<html>
<head>
    <title>Computer</title>
</head>
<body>

<%!
    int i = 1;
%>

<%
    for(int k = 1; k <=1000000;k++){
        out.println(i);
        i++;
//        Thread.sleep(1000);
    }
%>
</body>
</html>
