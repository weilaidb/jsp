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
    <meta charset="UTF-8">
    <title >查询事项</title>
    <style>
        th, tr, td, table {
            border: 1px solid red;
        }
    </style>
</head>
<body>
<h1>查询数据项</h1>
</p>
</p>
<form>
    <div style="text-align:center; vertical-align:middle;font-size:xx-large">
    <input type="text"   name="qry" size="100"  maxlength="200" value="" height="500" ><br>
    <%--<input type="text" name="only" size="30" maxlength="20" readonly value="你只能读不能修改">--%>
    </div>
</form>


<%
    String qryval = "";
    try {
        qryval = request.getParameter("qry");
//    out.print("查询数据项:" + qryval);
        if (!qryval.isEmpty()) {
            out.print("查询数据项:" + new String(qryval.getBytes("iso-8859-1"), "utf-8"));
            out.print("<br />");
        }
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

        if(conn != null){
//            out.print("数据库连接成功！");
            out.print("<br />");
%>

<table border="1" width="100%">
    <tr>
        <th>ID</th>
        <%--<th>名称</th>--%>
        <th>内容</th>
    </tr>
    <%
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "";  //查询语句
        String tablename = "abc";
        if(qryval.trim().isEmpty())
        {
            sql = "SELECT * from " + tablename + " order by id desc limit 30;";  //查询语句
        }
        else
        {
//            sql = "SELECT * from abc order by id desc limit 30;";  //查询语句
            String sqlhead = " SELECT * FROM "+ tablename  + " WHERE ";
            String sqltail = " order by id desc;";
            String sqlmid = " ";
            String []qrylst = qryval.split(" ");
            for (int i = 0; i < qrylst.length; i++) {
//                out.println("split str:" + qrylst[i]);
//                out.print("<br />");
//                sqlmid += "content like  \"%" + qrylst[i] + "%\" ";
                out.println("split str:" + new String(qrylst[i].getBytes("iso-8859-1"),"utf-8"));
                out.print("<br />");
                sqlmid += "content like  \"%" + new String(qrylst[i].getBytes("iso-8859-1"),"utf-8") + "%\" ";
                if(i != qrylst.length - 1)
                    sqlmid += " and ";

            }

            sql = sqlhead + sqlmid + sqltail;
//            out.println("split str:" + qrylst[i]);
            out.println("sql express:" + sql);
            out.print("<br />");


        }
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

        int rowCount = 0;
        while (rs.next()) {
            rowCount++;
    %>
    <tr>
        <td ><%=rs.getString("id").replace("\n", "<br/>") %></td>
        <%--<td ><%=rs.getString("name").replace("\n", "<br/>") %></td>--%>
        <td ><%=rs.getString("content").replace("\n", "<br/>") %></td>
    </tr>
    <%

                }
                out.print("查询结果：" + rowCount + " 条");
                out.print("<br/>");
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

