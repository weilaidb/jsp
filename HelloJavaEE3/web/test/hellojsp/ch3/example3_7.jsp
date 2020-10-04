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
<%
    Long valColor=Math.round(Math.random()*0x1000000);
    String strColor = "".concat(Long.toString(valColor, 16));
    out.println("valColor:" + valColor);
    out.println("strColor:" + strColor);
    strColor = "#" + strColor.substring(strColor.length() - 6, 6);
    out.println("strColor:" + strColor);
%>
<p>
    <font size="2">Tag标记嵌套显示学生名单：</font>
    <table border="1">
    <ok:Biaoge color="#a9f002" name="姓名" sex="性别">
        <ok:Biaoge color="cyan" name="张三" sex="男"/>
        <ok:Biaoge color="#afc0ff" name="李小花" sex="女"/>
        <ok:Biaoge color="pink" name="孙六" sex="男"/>
        <ok:Biaoge color="#ffaaef" name="赵扬" sex="女"/>
<%--        <ok:Biaoge color="<%=strColor%>" name="赵扬" sex="女"/>--%>

    </ok:Biaoge>
    <tr bgcolor="<%=strColor%>">
        <td width="60">赵扬</td>
        <td width="60">女</td>
    </tr>
</table>
</p>

</body>
</html>
