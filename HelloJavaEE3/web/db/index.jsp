<%@ page import="weilaidb.sql.JspAdapter" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/2/25
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/basepath.jsp"%>
<%
    String tableName = request.getParameter("tableName");
%>
<head>
    <meta charset="UTF-8">
    <title><%=JspAdapter.getJspTitleByKey(tableName)%></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<frameset cols="30%,70%">
    <frame src="explorer.jsp?tableName=<%=tableName%>" name="frame_left" id="frame_left"/>
    <frame src="../blank.jsp" name="frame_right" id="frame_right"/>
</frameset>

</html>
