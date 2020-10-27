<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="java.util.List" %>
<%@ tag import="java.util.ArrayList" %>
<%@ tag import="org.sqlite.util.StringUtils" %>
<%@ attribute name="database" required="true" %>
<%@ variable name-given="tablelist" scope="AT_END" %>

<%--
ID	content	lantype	keywords	note	vartype	aspect_field	CreatedTime	delflag	lowercase_keyworks
原始的all.db的内容
--%>
<%
    String showTableCondition  = "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;";

    List<String> resultTables  = new ArrayList<>();
    try {
        Class.forName("org.sqlite.JDBC");  //Sqlite3驱动程序名
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println(e.getMessage());
        resultTables.add(e.toString());
    } finally {
    }

    Connection con = null;
    Statement sql;
    ResultSet rs;

    try {
        con = DriverManager.getConnection(database);
        sql = con.createStatement();
        rs = sql.executeQuery(showTableCondition);
        while (rs.next()) {
            resultTables.add(rs.getString(1));
        }
    } catch (SQLException e) {
        e.printStackTrace();
        resultTables.add(e.toString());
    }

    jspContext.setAttribute("tablelist", new String(resultTables.toString()));

%>