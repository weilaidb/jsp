<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/29
  Time: 7:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    public static final String DBDRIVER = "org.git.mm.mysql.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/mldn";
    public static final String DBUSER = "root";
    public static final String DBPASS = "Zzerp123";
%>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
%>
<%
    try {
        Class.forName(DBDRIVER);
        conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
        String sql = "SELECT empno, ename, job,sal,hiredate FROM emp";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

%>
<center>
    <table border="1" width="80%">
        <tr>
            <td>雇员编号</td>
            <td>雇员姓名</td>
            <td>雇员工作</td>
            <td>雇员工资</td>
            <td>雇员日期</td>
        </tr>

        <%
            while (rs.next()) {
                int empno = rs.getInt(1);
                String ename = rs.getString(2);
                String job = rs.getString(3);
                float sal = rs.getFloat(4);
                java.util.Date date = rs.getDate(5);

        %>
        <tr>
            <td><%=empno%>
            </td>
            <td><%=ename%>
            </td>
            <td><%=job%>
            </td>
            <td><%=sal%>
            </td>
            <td><%=date%>
            </td>
        </tr>

        <%
            }
        %>
    </table>
</center>
<%
    } catch (Exception e) {
        System.out.println(e);
    } finally {
        rs.close();
        pstmt.close();
        conn.close();
    }
%>


</body>
</html>
