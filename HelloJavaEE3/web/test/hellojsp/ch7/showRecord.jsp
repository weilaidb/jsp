<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/18
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="bean.ShowRecordByPage" %>
<jsp:useBean id="look" class="bean.ShowRecordByPage" scope="session"/>
<jsp:setProperty name="look" property="databaseName" value="alldb"/>
<jsp:setProperty name="look" property="tableName" value="abc"/>
<jsp:setProperty name="look" property="user" value="root"/>
<jsp:setProperty name="look" property="password" value="Zzerp123"/>
<jsp:setProperty name="look" property="pageSize" value="30"/>
<html>
<head>
    <title>显示记录</title>
</head>
<body bgcolor="#00ffff">
数据库
<jsp:getProperty name="look" property="databaseName"/>中
<jsp:getProperty name="look" property="tableName"/>表的记录将被分页显示。
<br>共有<jsp:getProperty name="look" property="pageAllCount"/>页，
<jsp:setProperty name="look" property="showPage"/>
 每页最多显示<jsp:getProperty name="look" property="pageSize"/>条记录。
<br>单击"前一页"或"后一页"按钮查看记录（当前显示第<jsp:getProperty name="look" property="showPage"/>页）。
<table>
    <tr>
        <td>
            <form action="">
                <input type="hidden" name="showPage" value="<%=look.getShowPage() - 1%>">
                <input type="submit" name="g" value="前一页">
            </form>
        </td>
        <td>
            <form action="">
                <input type="hidden" name="showPage" value="<%=look.getShowPage() + 1%>">
                <input type="submit" name="g" value="后一页">
            </form>
        </td>
        <td>
            <form action="">
                输入页码:<input type="text" name="showPage" size="5">
                <input type="submit" name="g" value="提交">
            </form>
        </td>
    </tr>
</table>


<jsp:getProperty name="look" property="presentPageResult"/>

</body>
</html>
