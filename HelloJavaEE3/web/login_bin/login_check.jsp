<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/31
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="weilaidb.sql.SqlProc" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    public static final String DBDRIVER = "org.sqlite.JDBC";
    public static final String DBURL = SqlProc.getDbPathDefaultWithDriver("mldn"); //数据库名";
    public static final String DBUSER = "root";
    public static final String DBPASS = "Zzerp123";
%>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean flag = false;
    String name = null;
%>
<%
    try {
        Class.forName(DBDRIVER);
        conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
        String sql = "SELECT name FROM user WHERE userid=? AND password=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, request.getParameter("id"));
        pstmt.setString(2, request.getParameter("password"));
        rs = pstmt.executeQuery();
        if (rs.next()) {
            name = rs.getString(1);
            flag = true;
        }
    } catch (Exception e) {
        System.out.print(e);
    } finally {
        try {
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {

        }
    }

%>
<%
    if (flag) {
%>
<jsp:forward page="../sql_bin/bselectdb.jsp">
    <jsp:param name="uname" value="<%=name%>"/>
</jsp:forward>

<%
} else {
%>
<jsp:forward page="login_failure.jsp"/>
<%
    }
%>


</body>
</html>
