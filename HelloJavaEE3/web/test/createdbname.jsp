<%@ page import="weilaidb.sql.SqlProc" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/7 0007
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Dbname hello test</title>
</head>
<body>
<%
    String dbName = "hello";
    int ret = SqlProc.createDbName(dbName);
    if (ret == 0 )
    {
        out.write("创建数据库成功 + " + dbName);
    }
    else
    {
        out.write("创建数据库失败 + " + dbName);
    }
%>
<%
    String dbName2 = "hello2";
    int ret2 = SqlProc.deleteDbname(dbName2);
    if (ret2 == 0 )
    {
        out.write("删除数据库成功 + " + dbName2);
    }
    else
    {
        out.write("删除数据库失败 + " + dbName2);
    }

    SqlProc.createTableName(SqlProc.getDbnameShowUi(),"test1");
%>

</body>
</html>