<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>菜鸟教程(runoob.com)</title>
</head>
<body>
	<h2>自动刷新实例</h2>
	<%
		// 设置每隔5秒自动刷新
		//response.setIntHeader("Refresh", 5);
		// 设置每隔1秒自动刷新
		response.setIntHeader("Refresh", 1);
		// 获取当前时间
		Calendar calendar = new GregorianCalendar();
		String am_pm;
		int year = calendar.get(Calendar.YEAR);
		int mon  = calendar.get(Calendar.MONTH);
		int day  = calendar.get(Calendar.DAY_OF_MONTH);
		//int hour = calendar.get(Calendar.HOUR);
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		int minute = calendar.get(Calendar.MINUTE);
		int second = calendar.get(Calendar.SECOND);
		if (calendar.get(Calendar.AM_PM) == 0)
			am_pm = "AM";
		else
			am_pm = "PM";
		String CT = year + "-" + mon + "-" + day + " " +  
				hour + ":" + minute + ":" + second + " " + am_pm;
		out.println("当前时间: " + CT + "\n");
	%>
</body>
</html>