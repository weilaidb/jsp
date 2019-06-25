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

<html>
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>我的超级记事本(sqlite3)</title>
</head>
<body>

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
        String dbpath = "jdbc:sqlite:D:/testforsqlite3.db";
        connection = DriverManager.getConnection(dbpath);

        Statement statement = connection.createStatement();   //创建连接对象，是Java的一个操作数据库的重要接口
        String sql = "create table tables(name varchar(20),pwd varchar(20))";
        statement.executeUpdate("drop table if exists tables");//判断是否有表tables的存在。有则删除
        statement.executeUpdate(sql);            //创建数据库
        statement.executeUpdate("insert into tables values('zhou','156546')");//向数据库中插入数据
        for (int i = 0; i < 10; i++) {
            statement.executeUpdate("insert into tables values('zhou22','1565463')");//向数据库中插入数据
        }
        ResultSet rSet = statement.executeQuery("select * from tables");//搜索数据库，将搜索的放入数据集ResultSet中
        while (rSet.next()) {            //遍历这个数据集
            out.println("姓名：" + rSet.getString(1));//依次输出 也可以这样写 rSet.getString(“name”)
            out.print("<br />");
            out.println("密码：" + rSet.getString("pwd"));
            out.print("<br />");
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


</body>
</html>
