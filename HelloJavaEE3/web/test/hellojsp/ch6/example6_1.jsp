<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/13
  Time: 8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Mysql</title>
</head>
<body bgcolor="#00ffff">
<%
    Connection con;
    Statement sql;
    ResultSet rs;
    try {
        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println(e.getMessage());
    } finally {
    }

    String dbName = "warehouse";
    try{
        String uri = "jdbc:mysql://localhost:3306/" + dbName + "?useUnicode=true&characterEncoding=utf-8"; //数据库名;
        String user = "root";
        String password = "Zzerp123";
        con = DriverManager.getConnection(uri, user, password);
        sql = con.createStatement();
        rs = sql.executeQuery("select * from product");
        out.print("<table border=2>");
        out.print("<br>");
            out.print("<th width=100>" + "产品号");
        out.print("<th width=100>" + "名称");
        out.print("<th width=100>" + "生产日期");
        out.print("<th width=100>" + "价格");
        out.print("<br>");
        while (rs.next()) {
            out.print("<tr>");
            out.print("<td>" + rs.getString(1) + "</td>");
            out.print("<td>" + rs.getString(2) + "</td>");
            out.print("<td>" + rs.getDate("madeTime") + "</td>");
            out.print("<td>" + rs.getFloat("price") + "</td>");
            out.print("</tr>");
        }
        out.print("</table>");
        con.close();
    } catch (SQLException e) {
        e.printStackTrace();
        out.print(e);
    }



%>

</body>
</html>
