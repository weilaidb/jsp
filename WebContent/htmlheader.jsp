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
	<h2>HTTP 头部请求实例</h2>
	<table width="100%" border="1" align="center">
		<tr bgcolor="#949494">
			<th>Header Name</th>
			<th>Header Value(s)</th>
			<th>desription</th>
		</tr>
		<%
			Enumeration headerNames = request.getHeaderNames();
			//out.print("" + headerNames.toString() + "\n");
			while (headerNames.hasMoreElements()) {
				String paramName = (String) headerNames.nextElement();
				//out.println("" + paramName + "\n");
				out.print("<tr><td>" + paramName + "</td>\n");
				String paramValue = request.getHeader(paramName);
				//out.println("<td> " + paramValue + "</td></tr>\n");
				
				out.println("<td> " + paramValue + "</td>\n");
				out.println("<td> " + "abc" + "</td></tr>\n");
				//out.println("paramName:" + paramName + "\n");
				//out.println("paramValue:" + paramValue + "\n");
			}
			
			for(int i = 0;i < 1000;i++)
			{
				out.println("<tr><td> " + i + "</td>");	
				out.println("<td> " + i * i + "</td>");	
				out.println("<td> " + i * i * i + "</td></tr>");	
				
			}
			
			
		%>
	</table>
</body>
</html>