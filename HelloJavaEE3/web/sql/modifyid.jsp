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
<%--<%@ include file="../css/bdata.css"%>--%>
<link href="../css/bdata.css" rel="stylesheet" type="text/css" />



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
        qryiddata = (String) request.getParameter("iddataext");
    out.print("查询IDxx:" + qryiddata);
//        if (!qryiddata.isEmpty()) {
//            out.print("查询内容:" +
//                    new String(qryiddata.getBytes("iso-8859-1"), "utf-8"));
//            out.print("<br />");
//        }
    } catch (Exception e) {
    }
%>

<%
    String modifydata = "";
    try {
        modifydata = request.getParameter("modifythings");
//    out.print("查询数据项:" + modifydata);
//        if (!modifydata.isEmpty()) {
//            out.print("查询内容:" +
//                    new String(modifydata.getBytes("iso-8859-1"), "utf-8"));
//            out.print("<br />");
//        }
    } catch (Exception e) {
    }

%>

<h1>修改的内容为:</h1>
<%--<h1><%=modifydata%>--%>


<%
    Connection conn = null;
    ResultSet rs = null;
    Statement stmt = null;
    String insertval = "";
    String sql = "";  //查询语句
    String tablename = "abc";
%>


<%
    try {
        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
        String url = "jdbc:mysql://localhost:3306/alldb?useUnicode=true&characterEncoding=utf-8"; //数据库名
//        String url = "jdbc:mysql://localhost:3306/alldb?useSSL=true"; //数据库名
//        String url = "jdbc:mysql://localhost:3306/alldb?useSSL=false"; //数据库名
        String username = "root";  //数据库用户名
        String password = "Zzerp123";  //数据库用户密码
        conn = DriverManager.getConnection(url, username, password);  //连接状态

        if (conn != null) {
//            out.print("数据库连接成功！");
//            out.print("<br />");
        }
    } catch (Exception e) {
        out.println("数据库连接失败<br/>");
        return;
    }

%>

<%
    try {
        insertval = new String(modifydata.getBytes("iso-8859-1"), "utf-8");
        insertval = insertval.replace("\"", "\"\"");
        insertval = insertval.replace("\\", "\\\\");
        String nameval = insertval.substring(0, insertval.length() > 100 ? 100 : insertval.length())
                + System.currentTimeMillis();
        if (!insertval.isEmpty()) {
            sql = "UPDATE " + tablename + " SET " +
                    "`name` = "
                    + "\""
                    + nameval
                    + "\""
                    +", `content` = "
                    + "\""
                    + insertval
                    + "\""
                    + "WHERE (`id` = "
                    + "\""
                    + qryiddata
                    + "\""
                    +
                    ")";  //执行语句
        } else {
            out.println("数据为空!!<br />");
            return;
        }
//        out.println("sql express:" + sql);
//        out.print("<br />");

        stmt = conn.createStatement();
        stmt.execute(sql);
        rs.close();
        stmt.close();
        conn.close();
        out.println("修改成功!!<br />");
        return;

    } catch (Exception e) {
        if (insertval != null && !insertval.isEmpty()) {
            if (null == e.getMessage()) {
                out.println("修改成功!!<br />");
            } else {
                out.println("sql: " + sql);
                out.println("修改异常!! " + e.getMessage());
            }
        } else {
            out.println("数据为空!!<br />");
        }
//        out.println(e.getLocalizedMessage());
    }
%>






<h2 align="center"><font size="12" color="red">~~不能再底部了~~~</font></h2>

</body>
</html>
