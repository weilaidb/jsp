<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="java.lang.*" %>
<%@ tag import="weilaidb.sql.SqlProc" %>
<%@ attribute name="number" required="true" %>
<%@ variable name-given="queryResultByNumber" scope="AT_END" %>

<%
    StringBuffer result = new StringBuffer();
    String databaseName = "Student";
    String tableName = "message";

    try {
        Class.forName("org.sqlite.JDBC");  ////驱动程序名
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
        result.append("<table border=1>");
        String uri = SqlProc.getDbPathDefaultWithDriver(databaseName); //数据库名;
        String user = "root";
        String password = "Zzerp123";
        con = DriverManager.getConnection(uri);
        DatabaseMetaData metadata = con.getMetaData();
        ResultSet rs1 = metadata.getColumns(null, null, tableName, null);
        int 字段个数 = 0;
        result.append("<tr>");
        while (rs1.next()) {
            字段个数++;
            String columnName = rs1.getString(4);
            result.append("<td>" + columnName + "</td>");
        }
        result.append("</tr>");
        sql = con.createStatement();
        String condition = "SELECT * FROM " + tableName + " WHERE number = '" + number + "'";
        rs = sql.executeQuery(condition);
        while (rs.next()) {
            result.append("<tr>");
            for (int i = 1; i <= 字段个数; i++) {
                result.append("<td>" + rs.getString(i) + "</td>");
            }
            result.append("</tr>");
        }
        result.append("</table>");
        con.close();
    } catch (SQLException e) {
//        out.println("" + e);
        result.append(e);
    }

    jspContext.setAttribute("queryResultByNumber", new String(result));
%>