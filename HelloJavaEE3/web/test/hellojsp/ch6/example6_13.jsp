<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/13
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="inquire" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>事务</title>
</head>
<body bgcolor="yellow">
<font size="2">
    <br>转账前user表的记录是:
    <inquire:PrepareTag dataBaseName="bank" tableName="user" user="root" password="Zzerp123"/>
    <br><%=queryResult%>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println(e.getMessage());
    } finally {
    }

    Connection con = null;
    Statement sql;
    ResultSet rs;
    int n = (int)(Math.random() * 10);


    try{
        String uri = "jdbc:mysql://localhost:3306/" + "bank" + "?useUnicode=true&characterEncoding=utf-8"; //数据库名;
        String user = "root";
        String password = "Zzerp123";
        con = DriverManager.getConnection(uri, user, password);
        con.setAutoCommit(false);
        sql = con.createStatement();
        rs = sql.executeQuery("SELECT * FROM user WHERE name='geng'");
        rs.next();
        double gengMoney = rs.getDouble("userMoney");
        gengMoney = gengMoney - n;
        if (gengMoney >= 0) {
            rs = sql.executeQuery("SELECT * FROM user WHERE name='zhang'");
            rs.next();
            double zhangMoney = rs.getDouble("userMoney");
            zhangMoney = zhangMoney + n;
            sql.executeUpdate("UPDATE user SET userMoney = " + gengMoney + " WHERE name='geng'");
            sql.executeUpdate("UPDATE user SET userMoney = " + zhangMoney + " WHERE name='zhang'");
            con.commit();
        }
        con.close();
    } catch (SQLException e) {
        try{
            if (null != con) {
                con.rollback();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        out.println("" + e);
    }
%>
    <br>转账后user表的记录是:
    <inquire:PrepareTag dataBaseName="bank" tableName="user" user="root" password="Zzerp123"/>
    <br><%=queryResult%>

</font>

</body>
</html>
