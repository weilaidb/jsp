<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>菜鸟教程(runoob.com)</title>
</head>
<body>
	<%-- 该部分注释在网页中不会被显示--%>
	<p>
		今天的日期是:
		<%=(new java.util.Date()).toLocaleString()%>
	</p>
</body>
</html>
