<%@ page import="static java.lang.Math.*" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/9/23
  Time: 7:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>tri angle calc</title>
</head>
<body>
<p>请输入三角形的三条边a,b,c的长度:
    <form action="" method="post" name="form">
    <p>请输入三角形边a的长度:<input type="text" name="a"></p>
    <p>请输入三角形边b的长度:<input type="text" name="b"></p>
    <p>请输入三角形边c的长度:<input type="text" name="c"></p>
    <input type="submit" value="送出" name="submit">
</form>
<%--    获取用户提交的数据--%>
    <%
        String string_a = request.getParameter("a"),
                string_b = request.getParameter("b"),
                string_c = request.getParameter("c");
        double a = 0,b = 0,c = 0;
    %>
<%--判断客串是否是空对象，如果是空对象就初始化--%>
    <% if(string_a == null){
        string_a = "0";
        string_b = "0";
        string_c = "0";
    }
    %>

<%--求出边长，并计算面积--%>
<%
    try{
        a = Double.valueOf(string_a).doubleValue();
        b = Double.valueOf(string_b).doubleValue();
        c = Double.valueOf(string_c).doubleValue();
        if(a+b>c && a + c > b && b + c > a){
            double p = (a + b + c)/2.0;
            double mianji = sqrt(p *(p -a) * (p - b ) * (p - c));
            out.println("<br>" + "三角形面积:" + mianji);
        }
        else
        {
            out.println("<br>" + "你输入的三边不能构成一个三角形");
        }
    }catch (NumberFormatException e){
        out.println("<br>" + "请输入数字字符");
    }

%>







</p>
</body>
</html>
