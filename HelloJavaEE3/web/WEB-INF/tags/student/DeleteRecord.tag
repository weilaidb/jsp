<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="java.lang.*" %>
<%@ attribute name="number" required="true" %>


<%
    String condition = "DELETE FROM message WHERE number= '" + number + "'";

    String databaseName = "Student";
    String tableName = "message";

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
    int n = 0;
    try{
        String uri = "jdbc:mysql://localhost:3306/" + databaseName + "?useUnicode=true&characterEncoding=utf-8"; //数据库名;
        String user = "root";
        String password = "Zzerp123";
        con = DriverManager.getConnection(uri, user, password);
        sql = con.createStatement();
        sql.executeUpdate(condition);
        con.close();
    } catch (SQLException e) {
        out.println("" + e);
    }
%>