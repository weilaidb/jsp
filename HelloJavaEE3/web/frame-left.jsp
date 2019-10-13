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
    <meta charset="UTF-8">
    <title>frame-left</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<h1>同一个世界，同一个梦想。(Version:3.4)</h1>

<div class="showui">
    <a href="login_bin/login.jsp" target="frame_right">记 事 本(mysql) bin</a></p>
    <a href="sql_bin/insertdb.jsp" target="frame_right">输入数据(mysql bin)</a></p>
    <a href="login/login.jsp" target="frame_right">记 事 本 (mysql)</a></p>
    <a href="sql/insertdb.jsp" target="frame_right">输入数据(mysql)</a></p>
    <a href="sql/notebookalldb.jsp" target="frame_right">记事本(sqlite)[all.db]</a></p>
    <%--<a href="sql/alteralldbcollate_cs.jsp">变更内容字段为utf8_general_cs,更改content类型为mediumtext</a></p>--%>
    <a href="openpath/explorer.jsp" target="frame_right">审视列表</a></p>
    <a href="openfile/explorer.jsp" target="frame_right">打开文件</a></p>
    <a href="timeclock/index.jsp" target="_blank">时钟时间</a></p>
    <a href="qt/explorer.jsp"  target="frame_right">Qt</a></p>
    <a href="java/explorer.jsp"  target="frame_right">java</a></p>
    <a href="ios/explorer.jsp"  target="frame_right">IOS</a></p>
    <a href="pubuse/explorer.jsp"  target="frame_right">公共使用</a></p>
    <a href="modules/python/explorer.jsp" target="frame_right">Python</a></p>
    <a href="modules/linux_driver/explorer.jsp" target="frame_right">Linux驱动</a></p>
    <a href="openfile/explorer.jsp" target="frame_right">ClipBoard</a></p>
    <a href="almperf/index.jsp"  target="_blank">性能告警</a></p>
    <a href="effect/eg1.jsp" target="frame_right">特效</a></p>
    <a href="loadfiles/doc.jsp" target="frame_right">加载文件内容</a></p>
    <%--没有思路时，写一些简单的例子。--%>
    <%--<a href="javascript/clipboard/demo1.jsp">clipboard demo1</a></p>--%>
</div>
<%--<%--%>
    <%--out.write("java版本号：" + System.getProperty("java.version")); // java版本号--%>
    <%--out.write("Java提供商名称：" + System.getProperty("java.vendor")); // Java提供商名称--%>
    <%--out.write("Java提供商网站：" + System.getProperty("java.vendor.url")); // Java提供商网站--%>
    <%--out.write("jre目录：" + System.getProperty("java.home")); // Java，哦，应该是jre目录--%>
<%--%>--%>

<%--<a href="tree/tree.jsp">树型</a></p>--%>
<%--<a href="openpath/iterlist/iterator.jsp" target="_blank">遍历文件列表</a></p>--%>

<%--<h5>备份数据库命令<br>--%>
<%--mysqldump -u root -pZzerp123 --all-databases > BackupName.sql<br>--%>
<%--mysqldump -u root -pZzerp123 --all-databases > BackupName%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sql--%>
<%--</h5>--%>
</body>
</html>
