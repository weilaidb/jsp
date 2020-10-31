<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="sql.CSqlitePub" %>
<%@ attribute name="database" required="true" %>
<%@ attribute name="table" required="true" %>
<%@ variable name-given="orderResult" scope="AT_END" %>

<%
    StringBuffer result;
    Connection con = null;
    Statement sql;
    ResultSet rs;

    result = new StringBuffer();
    CSqlitePub.loadSqliteClass(result);

    try{
        result.append("<table border=1>");
        String tableName = table;
        con = DriverManager.getConnection(CSqlitePub.getSqlitePathWithDriver(database));

        String orderCondition  = CSqlitePub.expSelectIDConditionContentNote(tableName)  ;
//        System.out.println("orderCondition:" + orderCondition);
        CSqlitePub.procSelectLinkTable(con, tableName,result, orderCondition);
        con.close();
    } catch (SQLException e) {
        e.printStackTrace();
        result.append(e);
    }

    jspContext.setAttribute("orderResult", new String(result));
%>