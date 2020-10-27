<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="weilaidb.CSqlitePub" %>
<%@ attribute name="database" required="true" %>
<%@ attribute name="table" required="true" %>
<%@ attribute name="item" required="true" %>
<%@ attribute name="order" required="true" %>
<%@ variable name-given="orderResult" scope="AT_END" %>

<%--
ID	content	lantype	keywords	note	vartype	aspect_field	CreatedTime	delflag	lowercase_keyworks
原始的all.db的内容
--%>
<%
    String orderCondition  = "SELECT * FROM " + table ;
    if(order.trim().equals("order"))
    {
        orderCondition += " ORDER BY ID desc ";
    }

    if(item.trim().equals("limit"))
    {
        orderCondition += " limit 50";
    }
    else
    {
        orderCondition += "";
    }


//            "SELECT * FROM " + table;
//            "SELECT * FROM c_table";
//            "SELECT * FROM c_table ORDER BY " + orderType;

    StringBuffer result;
    result = new StringBuffer();
    try {
        Class.forName("org.sqlite.JDBC");  //Sqlite3驱动程序名
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println(e.getMessage());
        result.append(e);
    } finally {
    }

    Connection con = null;
    Statement sql;
    ResultSet rs;
    int n = 0;

    try{
        result.append("<table border=1>");
//        String uri = "jdbc:mysql://localhost:3306/" + "warehouse" + "?useUnicode=true&characterEncoding=utf-8"; //数据库名;
//        String user = "root";
//        String password = "Zzerp123";
//        String dbpath = CSqlitePub.getSqliteWholePath();
        String dbpath = database;
        System.out.println("dbpath: " + dbpath);


        con = DriverManager.getConnection(dbpath);
        DatabaseMetaData metadata = con.getMetaData();
        String tableName = table;
        ResultSet rs1 = metadata.getColumns(null, null, tableName, null);
        int 字段个数 = 0;
        result.append("<tr>");
        while (rs1.next()) {
            字段个数++;
            String columnName = rs1.getString(4);
            result.append("<td>" + columnName + "</td>");
        }
        System.out.println("字段个数: " + 字段个数);

        result.append("</tr>");
        sql = con.createStatement();
        rs = sql.executeQuery(orderCondition);
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
        e.printStackTrace();
        result.append(e);
    }

    jspContext.setAttribute("orderResult", new String(result));

%>