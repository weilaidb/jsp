<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="sql.CSqlitePub" %>
<%@ attribute name="database" required="true" %>
<%@ variable name-given="tablelist" scope="AT_END" %>

<%
    String showTableCondition  = "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;";

    StringBuffer resultTables = new StringBuffer();
    CSqlitePub.loadSqliteClass(resultTables);
    Connection con = null;
    Statement sql;
    ResultSet rs;

    try {
        database = CSqlitePub.getSqlitePathWithDriver(database);
        con = DriverManager.getConnection(database);
        sql = con.createStatement();
        rs = sql.executeQuery(showTableCondition);
        while (rs.next()) {
            resultTables.append(rs.getString(1) + ",");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        resultTables.append(e);
    }

    jspContext.setAttribute("tablelist", new String(resultTables.toString()));

%>