<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%
	// 获取session创建时间
	Date createTime = new Date(session.getCreationTime());
	// 获取最后访问页面的时间
	Date lastAccessTime = new Date(session.getLastAccessedTime());

	String title = "再次访问菜鸟教程实例";
	Integer visitCount = new Integer(0);
	String visitCountKey = new String("visitCount");
	String userIDKey = new String("userID");
	String userID = new String("ABCD");

	// 检测网页是否有新的访问用户
	if (session.isNew()) {
		title = "访问菜鸟教程实例";
		session.setAttribute(userIDKey, userID);
		session.setAttribute(visitCountKey, visitCount);
	} else {
		visitCount = (Integer) session.getAttribute(visitCountKey);
		visitCount++;
		userID = (String) session.getAttribute(userIDKey);
		session.setAttribute(visitCountKey, visitCount);
	}
%>
<html>
<head>
<title>Session 跟踪</title>
</head>
<body>

	<h1>Session 跟踪</h1>

	<table border="1" align="center">
		<tr bgcolor="#949494">
			<th>Session 信息</th>
			<th>值</th>
			<th>注释</th>
		</tr>
		<tr>
			<td>id</td>
			<td>
				<%
					out.print(session.getId());
				%>
			</td>
			<td>第1行 </td>
		</tr>
		<tr>
			<td>创建时间</td>
			<td>
				<%
					out.print(createTime);
				%>
			</td>
			<td>第2行 </td>
		</tr>
		<tr>
			<td>最后访问时间</td>
			<td>
				<%
					out.print(lastAccessTime);
				%>
			</td>
			<td>第3行 </td>
		</tr>
		<tr>
			<td>用户 ID</td>
			<td>
				<%
					out.print(userID);
				%>
			</td>
			<td>第4行 </td>
		</tr>
		<tr>
			<td>访问次数</td>
			<td>
				<%
					out.print(visitCount);
				%>
			</td>
			<td>第5行 </td>
		</tr>
	</table>
</body>
</html>