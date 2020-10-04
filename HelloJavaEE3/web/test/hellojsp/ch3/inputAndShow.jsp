<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/4 0004
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="computer" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>inputAndShow</title>
</head>
输入的三个数值a,b,c(代表三角形的三边或梯形的上底、下底和高):
<body bgcolor="#00ffff">
<form action="" method="get" name="form">
    <table>
        <tr>
            <td>输入数值a:</td>
            <td><input type="text" name="a"> </td>
        </tr>
        <tr>
            <td>输入数值b:</td>
            <td><input type="text" name="b"> </td>
        </tr>
        <tr>
            <td>输入数值c:</td>
            <td><input type="text" name="c"> </td>
        </tr>
    </table>
    <input type="radio" name="R" value="triangle">代表三角形
    <input type="radio" name="R" value="lader">代表梯形
    <br>
    <input type="submit" value="提交" name="submit">
</form>

<%
    String a = request.getParameter("a");
    String b = request.getParameter("b");
    String c = request.getParameter("c");
    String cd = request.getParameter("R");

    if(null == a || null == b || null == c|| null == cd){
        a = "0";
        b = "0";
        c = "0";
        cd = "0";
    }

    if(a.length() > 0 && b.length() > 0 && c.length() > 0 && cd.length() > 0){

%>
    <computer:GetArea numberA="<%=a%>" numberB="<%=b%>" numberC="<%=c%>" condition="<%=cd%>"/>


<%
        String messageout = request.getParameter("message");
        String areaout= request.getParameter("area");
        if(null == messageout || null == areaout){
            messageout = "";
            areaout    = "";
        }
%>
    <br><%=messageout%>
    <br><%=areaout%>
<%


    }


%>

</body>
</html>
