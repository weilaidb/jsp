<%--
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
    <title>第一个Web项目</title>
</head>
<body>
<h1>同一个世界，同一个梦想。(Version:2.1)</h1>

<div class="showui"> <a href="login/login.jsp">我的记事本(mysql)</a></p>
<a href="sql/notebookalldb.jsp">我的记事本(sqlite)[all.db]</a></p>
<%--<a href="sql/alteralldbcollate_cs.jsp">变更内容字段为utf8_general_cs,更改content类型为mediumtext</a></p>--%>
<a href="openpath/explorer.jsp">审视列表</a></p>
<a href="almperf/explorer.jsp" >性能告警</a></p>
<a href="timeclock/explorer.jsp">时钟时间</a></p>
<a href="pubuse/explorer.jsp" >公共使用</a></p>
<a href="modules/python/explorer.jsp">Python</a></p>
<a href="modules/linux_driver/explorer.jsp">Linux驱动</a></p>
</div>
<%--<a href="tree/tree.jsp">树型</a></p>--%>
<%--<a href="openpath/iterlist/iterator.jsp" target="_blank">遍历文件列表</a></p>--%>

<%--<h5>备份数据库命令<br>--%>
    <%--mysqldump -u root -pZzerp123 --all-databases > BackupName.sql<br>--%>
    <%--mysqldump -u root -pZzerp123 --all-databases > BackupName%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sql--%>
<%--</h5>--%>
</body>
</html>
