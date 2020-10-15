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
    <title>数据源</title>
</head>
<body bgcolor="#00ffff">
<%
    Connection con;
    Statement sql;
    ResultSet rs;
    try {
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    } catch (ClassNotFoundException e) {
        out.println(e);
    }

    try{
        con = DriverManager.getConnection("jdbc:odbc:myData", "", "");
        sql = con.createStatement();
        rs = sql.executeQuery("SELECT * FROM goods ");
        out.print("<table border = 2>");
        out.print("<tr>");
        out.print("<td width=100>" + "产品号");
        out.print("<td width=100>" + "名称");
        out.print("<td width=100>" + "价格");
        out.print("<td width=100>" + "生产日期");
        out.print("</tr>");
        while (rs.next()) {
            out.print("<tr>");
            out.print("<td>" + rs.getString(1) + "</td>");
            out.print("<td>" + rs.getString(2) + "</td>");
            out.print("<td>" + rs.getString(3) + "</td>");
            out.print("<td>" + rs.getString(4) + "</td>");
            out.print("</tr>");
        }
        out.print("</table>");
        con.close();

    } catch (Exception e) {
//        e.printStackTrace();
        out.print(e);
    }
%>

</body>
</html>
