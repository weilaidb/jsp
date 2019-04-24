<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/2/24
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>第一个Web项目</title>
</head>
<body>
<h1>同一个世界，同一个梦想。</h1>

<h1><a href="login/login.jsp">我的记事本(mysql)</a></h1>
<h1><a href="sql/notebookalldb.jsp">我的记事本(sqlite)[all.db]</a></h1>
<h1><a href="sql/alteralldbcollate_cs.jsp">变更内容字段为utf8_general_cs,更改content类型为mediumtext</a></h1>
<h1><a href="openpath/explorer.jsp" target="_blank">打开文件</a></h1>
<%--<h1><a href="openpath/iterlist/iterator.jsp" target="_blank">遍历文件列表</a></h1>--%>

<%--<h5>备份数据库命令<br>--%>
    <%--mysqldump -u root -pZzerp123 --all-databases > BackupName.sql<br>--%>
    <%--mysqldump -u root -pZzerp123 --all-databases > BackupName%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sql--%>
<%--</h5>--%>
</body>
</html>
