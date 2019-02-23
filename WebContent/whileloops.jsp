<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%! int fontSize=0; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>菜鸟教程(runoob.com)</title>
</head>
<body>
	<h3>While 循环实例</h3>
	<%while ( fontSize <= 10){ %>
	<font color="green" size="<%= fontSize %>"> 菜鸟教程 </font>
	<br />
	<%fontSize++;%>
	<%}%>
</body>
</html>
