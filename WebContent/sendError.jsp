<html>
<head>
<title>Setting HTTP Status Code</title>
</head>
<body>
	<%
		// 设置错误代码，并说明原因
		//response.sendError(407, "Need authentication!!!");
		//response.sendError(404, "Not Found!!!");
		response.sendError(405, "Method Not Allowed!!!");
	%>
</body>
</html>

