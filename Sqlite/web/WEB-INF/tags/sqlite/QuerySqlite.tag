<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="sql.CSqlitePub" %>
<%@ attribute name="database" required="true" %>
<%@ attribute name="table" required="true" %>
<%@ attribute name="item" required="true" %>
<%@ attribute name="order" required="true" %>
<%@ variable name-given="orderResult" scope="AT_END" %>
<%@ variable name-given="tablelist" scope="AT_END" %>

<%--
ID	content	lantype	keywords	note	vartype	aspect_field	CreatedTime	delflag	lowercase_keyworks
原始的all.db的内容
--%>
<%
    String showTableCondition  = "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;";

    StringBuffer result;
    StringBuffer resultTables;
    result = new StringBuffer();
    resultTables = new StringBuffer();
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
    String firsttable = "";

    try{

        result.append("<table border=1 class=mytable>");
        String dbpath = database;
        dbpath = CSqlitePub.getSqlitePathWithDriver(dbpath);
        con = DriverManager.getConnection(dbpath);
        DatabaseMetaData metadata = con.getMetaData();
        String tableName = table;

        //查找所有表名
        sql = con.createStatement();
        rs = sql.executeQuery(showTableCondition);
        resultTables.append("<br>" );
        while (rs.next()) {
            resultTables.append(" " );
//            resultTables.append("<br>" );
            resultTables.append(rs.getString(1));
            if(0 == n)
            {
                firsttable = rs.getString(1);
                n++;
            }
        }
        resultTables.append("<br>" );

        //如果表为空则选择一个
        if(tableName.trim().isEmpty() && firsttable.trim().length() > 0)
        {
            tableName = firsttable.trim();
        }

        //查询条件列表
        String orderCondition  = "SELECT * FROM " + tableName ;
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

        //查找表的列
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
    jspContext.setAttribute("tablelist", new String(resultTables));

%>