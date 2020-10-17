<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/17
  Time: 7:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="bean.CalendarBean" %>
<jsp:useBean id="rili" class="bean.CalendarBean" scope="request"/>
<html>
<head>
    <title>日历</title>
</head>
<body bgcolor="#00ffff">
<font size="3">
    <form action="" method="post" name="form">
        选择日历的年份:
        <select name="year">
            <option value="2020">2020年</option>
            <option value="2021">2021年</option>
            <option value="2022">2022年</option>
            <option value="2023">2023年</option>
            <option value="2024">2024年</option>
            <option value="2025">2025年</option>
            <option value="2026">2026年</option>
            <option value="2027">2027年</option>
            <option value="2028">2028年</option>
            <option value="2029">2029年</option>
            <option value="2030">2030年</option>
        </select>
        选择日历的月份:
        <select name="month">
            <option value="1">1月</option>
            <option value="2">2月</option>
            <option value="3">3月</option>
            <option value="4">4月</option>
            <option value="5">5月</option>
            <option value="6">6月</option>
            <option value="7">7月</option>
            <option value="8">8月</option>
            <option value="9">9月</option>
            <option value="10">10月</option>
            <option value="11">11月</option>
            <option value="12">12月</option>
        </select>
        <input type="submit" value="提交你的选择" name="submit">
    </form>
    <jsp:setProperty name="rili" property="*"/>
    <font color="red"><jsp:getProperty name="rili" property="year"/></font>年
    <font color="blue"><jsp:getProperty name="rili" property="month"/></font>月
    的日历:
    <jsp:getProperty name="rili" property="caldendar"/>
</font>


</body>
</html>
