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
	<h1>从复选框中读取数据</h1>
	<ul>
		<li><p>
				<b>Google 是否选中:</b>
				<%=request.getParameter("google")%>
			</p></li>
		<li><p>
				<b>菜鸟教程是否选中:</b>
				<%=request.getParameter("runoob")%>
			</p></li>
		<li><p>
				<b>淘宝是否选中:</b>
				<%=request.getParameter("taobao")%>
			</p></li>

		<li><p>
				<b>度度是否选中:</b>
				<%=request.getParameter("dudu")%>
			</p></li>

		<li><p>
				<b>哈哈是否选中:</b>
				<%=request.getParameter("haha")%>
			</p></li>



	</ul>
</body>
</html>