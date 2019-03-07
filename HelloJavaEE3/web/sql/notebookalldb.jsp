<%@ page import="java.sql.*" %>
<%-- Created by IntelliJ IDEA.
User: dell
Date: 2019/3/6
Time: 20:54
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>


<%--================获取路径和基础路径=========================--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<%--================css配置=========================--%>
<style type="text/css">
    .mytable3 th, tr, td, table {
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
</style>

<html>
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>我的超级记事本(sqlite3)</title>
</head>
<body>

<table border="1" width="100%" class='mytable3'>
    <tr>
        <th>序列</th>
        <%--<th>名称</th>--%>
        <th>数据1</th>
        <th>数据2</th>
        <th>数据3</th>
    </tr>
<%
    String qryval = "";
    try {
        qryval = request.getParameter("datapath");
//    out.print("查询数据项:" + qryval);
//        if (!qryval.isEmpty()) {
//            out.print("查询内容:" +
//                    new String(qryval.getBytes("iso-8859-1"), "utf-8"));
//            out.print("<br />");
//        }
    } catch (Exception e) {

    }

    Connection connection = null;
    try {
        Class.forName("org.sqlite.JDBC");
//        数据库地址写不正常，会报错。
        String dbpath = "jdbc:sqlite:D:/Dropbox/weidb/all.db";
        connection = DriverManager.getConnection(dbpath);

        Statement statement = connection.createStatement();   //创建连接对象，是Java的一个操作数据库的重要接口
//        String sql = "create table tables(name varchar(20),pwd varchar(20))";
//        statement.executeUpdate("drop table if exists tables");//判断是否有表tables的存在。有则删除
//        statement.executeUpdate(sql);            //创建数据库
//        statement.executeUpdate("insert into tables values('zhou','156546')");//向数据库中插入数据
//        for (int i = 0; i < 10; i++) {
//            statement.executeUpdate("insert into tables values('zhou22','1565463')");//向数据库中插入数据
//        }
//        ResultSet rSet = statement.executeQuery("select * from android_table");//搜索数据库，将搜索的放入数据集ResultSet中
        ResultSet rSet = statement.executeQuery("select * from c_table");//搜索数据库，将搜索的放入数据集ResultSet中
//        out.println("条数：" + rSet.getRow());
%>


<%

        while (rSet.next()) {            //遍历这个数据集

%>
    <tr>
            <%--out.print("========================================<br />");--%>
            <td>
                <%=rSet.getString(1).substring(0,rSet.getString(1).length() > 100? 100: rSet.getString(1).length())%>
            </td>
            <td><%=rSet.getString(2)%></td>
            <td><%=rSet.getString(3)%></td>
            <td><%=rSet.getString(4)%></td>
            <%--out.println("1：" + rSet.getString(1));//依次输出 也可以这样写 rSet.getString(“name”)--%>
            <%--out.print("<br />");--%>
            <%--out.println("2：" + rSet.getString(2));--%>
            <%--out.print("<br />");--%>
            <%--out.println("3：" + rSet.getString(3));--%>
            <%--out.print("<br />");--%>
            <%--out.println("4：" + rSet.getString(4));--%>
            <%--out.print("<br />");--%>
    </tr>
<%
        }
        rSet.close();//关闭数据集
        connection.close();//关闭数据库连接
    } catch (Exception e) {
        out.println("Opened database failed");
        out.print("<br />");
        out.println(e.getClass().getName() + ": " + e.getMessage());
        out.print("<br />");
    }
%>



    <%--<tr>--%>
        <%--<td>--%>
            <%--<%--%>
                <%--String orgshowid = rs.getString("id").replace("\n", "<br/>");--%>
            <%--%>--%>
            <%--<form name="form2" method="post" action="sql/queryid.jsp">--%>
                <%--<input type="text"--%>
                       <%--size="4"--%>
                       <%--class="text2"--%>
                       <%--name="iddata"--%>
                <%--&lt;%&ndash;readonly="readonly"&ndash;%&gt;--%>
                       <%--value="<%=orgshowid%>"/>--%>
                <%--<input type="submit" name="Submit" value="More"/>--%>
            <%--</form>--%>
        <%--</td>--%>
        <%--<%--%>
            <%--String showcontent = rs.getString("content")--%>
                    <%--.replaceAll("<[.[^<\n]]*>", "")--%>
                    <%--.replace("\n", "<br/>");--%>
            <%--int showlen = 500;--%>
            <%--long totallen = showcontent.length();--%>
            <%--if (showcontent.length() > showlen) {--%>
                <%--showcontent = showcontent.substring(0, showlen);--%>
            <%--}--%>
            <%--long curlen = showcontent.length();--%>
            <%--if(totallen == 0 )--%>
            <%--{--%>
                <%--totallen = 100;--%>
            <%--}--%>
            <%--String appendstr = "ShowRate:" + (curlen * 100 / totallen) + "%";--%>
            <%--if (totallen == 0 || ((curlen * 100 / totallen) == 100)) {--%>
                <%--appendstr = "";--%>
            <%--} else {--%>
                <%--appendstr = "<h3 color=red>" + appendstr + "</h3>";--%>
            <%--}--%>
        <%--%>--%>
        <%--<td><%=showcontent + "<br/><br/><br/>" + appendstr%>--%>
        <%--</td>--%>
    <%--</tr>--%>

</table>

<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font></h2>


</body>
</html>
