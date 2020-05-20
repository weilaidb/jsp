<%@ page import="weilaidb.sql.JspAdapter" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/2/24
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<html>
<head>
    <title>同一个世界，同一个梦想。</title>
    <meta charset="UTF-8">
    <title>frame-left</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>



<div class="showui">
    <a href="login/login.jsp"       target="frame_right">记 事 本 (mysql)</a></p>
    <a href="sql/insertdb.jsp"      target="frame_right">输入数据(mysql)</a></p>
<%--    <a href="sql_bin/insertdb.jsp"  target="frame_right">输入数据(mysql bin)</a></p>--%>
<%--    <a href="login_bin/login.jsp"   target="frame_right">记 事 本(mysql) bin</a></p>--%>
    <a href="sql/notebookalldb.jsp" target="frame_right">记事本(sqlite)[all.db]</a></p>
    <a href="diary"  target="_blank">日记本</a></p>
    <a href="db/sendcmd/explorer.jsp"  target="_blank">发送命令</a></p>
    <a href="python/calculator.jsp" target="_blank">计算器</a></p>

    <%
        String[] tablelist ={
        "codesets",
        "timeclock",
        "supertest",
        "pubuse",
        "almperf",
        "csharp",
        "qt",
        "java",
        "ios",
        "python",
        "linux_driver",
        "pupils",
        };
    %>

    <%
        for (String tablename :
        tablelist) {
    %>
    <a href="db/index.jsp?tableName=<%=tablename%>"  target="_blank"><%=JspAdapter.getJspTitleByKey(tablename)%></a></p>
    <%
        }

    %>
<%--    <a href="test/createdbname.jsp"  target="_blank">创建数据库</a></p>--%>
</div>

<h3>版本(V5.8)</h3>

</body>
</html>
