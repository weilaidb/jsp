<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/9
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>计算和</title>
</head>
<body bgcolor="#00ffff">
<font size="2">
    <%
        long sum = 0;
        String s1 = request.getParameter("sum");
        String s2 = request.getParameter("n");
        if(s2.equals(""))
            s2 = "0";
        if(s1.equals("1")) {
            int n = Integer.parseInt(s2);
            for (int i = 1; i <= n; i++) {
                sum = sum + i;

            }
        }
        else if(s1.equals("2"))
        {
            int n = Integer.parseInt(s2);
            for (int i = 1; i <= n ; i++) {
                sum = sum + i * i;
            }
        }
        else if(s1.equals("3"))
        {
            int n = Integer.parseInt(s2);
            for (int i = 1; i <= n ; i++) {
                sum = sum + i * i * i;
            }
        }
    %>
    <p>你的求和结果是:<%=sum%></p>
</font>

</body>
</html>
