<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="sql.CSqlitePub" %>
<%@ tag import="base.CStringPub" %>
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

        String orderCondition  = "SELECT * FROM " + tableName ;
        orderCondition = CSqlitePub.procOrder(orderCondition, orderCondition);
        orderCondition = CSqlitePub.procLimit(orderCondition, orderCondition);
//        System.out.println("orderCondition:" + orderCondition);
        CSqlitePub.procSelectAll(con, database, tableName,result, orderCondition, "",-1);
        con.close();
    } catch (SQLException e) {
        e.printStackTrace();
        result.append(e);
    }

    jspContext.setAttribute("orderResult", new String(result));
%>