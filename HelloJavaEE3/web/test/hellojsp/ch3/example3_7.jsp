<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/4 0004
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@taglib prefix="ok" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Biaoge</title>
</head>
<body>
<p>
    <font size="2">Tag标记嵌套显示学生名单：</font>
    <table border="1">
    <ok:Biaoge color="#a9f002" name="姓名" sex="性别">
        <ok:Biaoge color="cyan" name="张三" sex="男"/>
        <ok:Biaoge color="#afc0ff" name="李小花" sex="女"/>
        <ok:Biaoge color="pink" name="孙六" sex="男"/>
        <ok:Biaoge color="#ffaaef" name="赵扬" sex="女"/>
    </ok:Biaoge>
</table>
</p>

</body>
</html>
