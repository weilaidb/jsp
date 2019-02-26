<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/2/26
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="utf-8" %>
<%@page import="java.sql.*" %>  <%--导入java.sql包--%>
<html>
<head>
    <title >当前记事本</title>
    <style>
        th, tr, td, table {
            border: 1px solid red;
        }
    </style>
</head>
<body>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
        String url = "jdbc:mysql://localhost:3306/alldb"; //数据库名
        String username = "root";  //数据库用户名
        String password = "Zzerp123";  //数据库用户密码
        Connection conn = DriverManager.getConnection(url, username, password);  //连接状态

        if(conn != null){
//            out.print("数据库连接成功！");
            out.print("<br />");
%>

<table border="1" width="100%">
    <tr>
        <th>ID</th>
        <th>站点名</th>
        <th>站点地址</th>
    </tr>
    <%
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * from abc order by id desc limit 50;";  //查询语句
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        out.print("查询结果：");
        out.print("<br/>");
        while (rs.next()) {%>
    <tr>
        <td ><%=rs.getString("id").replace("\n", "<br/>") %></td>
        <td ><%=rs.getString("name").replace("\n", "<br/>") %></td>
        <td ><%=rs.getString("content").replace("\n", "<br/>") %></td>
    </tr>
    <%
                }
            }else{
                out.print("连接失败！");
            }
        }catch (Exception e) {
            //e.printStackTrace();
            out.print("数据库连接异常！");
        }
    %>
</table>
</body>
</html>

