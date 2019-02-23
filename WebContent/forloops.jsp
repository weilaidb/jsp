<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%! int fontSize; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>菜鸟教程(runoob.com)</title>
</head>
<body>
	<h3>For 循环实例</h3>
	<%for ( fontSize = 1; fontSize <= 8; fontSize++){ %>
	<font color="green" size="<%= fontSize %>"> 菜鸟教程 </font>
	<br />
	<%}%>
</body>
</html>
