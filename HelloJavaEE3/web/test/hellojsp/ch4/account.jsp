<%@ page import="java.io.UnsupportedEncodingException" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/10
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%!//处理字符串的方法
    public String getString(String s)
    {
        if(s == null)
            s = "";
        try{
            byte b[] = s.getBytes("GBK");
            s = new String(b);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return s;
    }
%>

<html>
<head>
    <title>account</title>
</head>
<body bgcolor="#00ffff">
<font size="4">
<%
    String s = request.getParameter("buy");
    session.setAttribute("goods", s);
%>
    <br>
    <%
        String 顾客=(String)session.getAttribute("customer");
        String 姓名=(String)session.getAttribute("name");
        String 商品=(String)session.getAttribute("goods");
        顾客=getString(顾客);
        商品=getString(商品);
        姓名=getString(姓名);
    %>

    这里是结账处,<%=顾客%>的姓名是:<%=姓名%>
    <br>你选择购买的商品是:<%=商品%>
</font>


</body>
</html>
