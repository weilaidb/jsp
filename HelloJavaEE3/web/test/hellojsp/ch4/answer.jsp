<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/9
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>Answer</title>
</head>
<body bgcolor="#00ffff">
<font size="2">
    <%
        int scope = 0;
        String countryName = request.getParameter("R");
        String itemNames[] = request.getParameterValues("item");
        String secretMess = request.getParameter("secret");
        if(countryName.equals("巴西"))
            scope++;
        if(itemNames == null)
            out.print("没有选择球队<br>");
        else if (itemNames.length >=2 )
        {
            if(itemNames[0].equals("法国国家队") && itemNames[1].equals("巴西国家队"))
                scope++;
        }
        out.print("你的得分:" + scope);
        out.print("<br>你提交的答案一:" + countryName);
        out.print("<br>你提交的答案二:" );
        if(itemNames != null)
            for (int i = 0; i < itemNames.length; i++) {
                out.println(" " + itemNames[i]);
            }
        out.println("<br>你提交的隐藏信息:" + secretMess);
    %>
</font>

</body>
</html>
