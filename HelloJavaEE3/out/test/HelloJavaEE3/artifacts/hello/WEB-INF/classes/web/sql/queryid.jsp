<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/2
  Time: 0:46
  To change this template use File | Settings | File Templates.
--%>
<%--================page定义=========================--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>

<%--================引入头文件=========================--%>
<%@page import="java.sql.*" %>  <%--导入java.sql包--%>

<%--================css配置=========================--%>
<style type="text/css">
    .mytable th, tr, td, table {
        /* for IE */
        text-overflow: ellipsis;
        /* for Firefox,mozilla */
        -moz-text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        text-align: left;

        border: 1px solid red;
        tab-interval: 10px;
        background-color: aliceblue;
        font-size: medium;
    }

    .text1 {
        height: 40px
    }

    .text2 {
        height: 20px;
    }

    .boxes{font-size:20px;}
</style>


<html>
<head>
    <title>显示ID数据</title>
</head>
<body>

<%--================获取查询数据================--%>
<%--================打开数据库================--%>
<%
    String qryiddata = "";
    try {
        qryiddata = request.getParameter("iddata");
//    out.print("查询数据项:" + qryiddata);
//        if (!qryiddata.isEmpty()) {
//            out.print("查询内容:" +
//                    new String(qryiddata.getBytes("iso-8859-1"), "utf-8"));
//            out.print("<br />");
//        }
    }catch (Exception e)
    {
    }
    try {
        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
        String url = "jdbc:mysql://localhost:3306/alldb?useUnicode=true&characterEncoding=utf-8"; //数据库名
//        String url = "jdbc:mysql://localhost:3306/alldb?useSSL=true"; //数据库名
//        String url = "jdbc:mysql://localhost:3306/alldb?useSSL=false"; //数据库名
        String username = "root";  //数据库用户名
        String password = "Zzerp123";  //数据库用户密码
        Connection conn = DriverManager.getConnection(url, username, password);  //连接状态

        if (conn != null) {
//            out.print("数据库连接成功！");
//            out.print("<br />");
    %>

<h1><%=qryiddata%></h1>


<table border="1" width="100%" class='mytable'>
    <tr>
        <%--<th>序列</th>--%>
        <%--<th>名称</th>--%>
        <th>数据</th>
    </tr>
    <%
        int whichid = Integer.valueOf(qryiddata).intValue();
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "";  //查询语句
        String tablename = "abc";
        sql = "SELECT * from " + tablename + " WHERE id=" + whichid + ";";  //查询语句

        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

        int rowCount = 0;
        while (rs.next()) {
            rowCount++;
    %>

    <%String toshowcontent  = rs.getString("content");%>

    <tr>
        <td>
            <textarea class="boxes"
                      rows="700"
            style="width: 100%;"><%=toshowcontent%></textarea>
        </td>
    </tr>

    <%
                }
                out.print("查询结果：" + rowCount + " 条[" + qryiddata + "]");
                out.print("<br/>");
            } else {
                out.print("连接失败！");
            }
        } catch (Exception e) {
            out.print("请输入查询数据!!!");
        }
    %>
</table>

<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font></h2>


</body>
</html>
