<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="sql.CSqlitePub" %>
<%@ attribute name="database" required="true" %>
<%@ attribute name="table" required="true" %>
<%@ attribute name="item" required="true" %>
<%@ attribute name="order" required="true" %>
<%@ attribute name="columns" required="true"%>
<%@ attribute name="findwords" required="true"%>
<%@ variable name-given="orderResult" scope="AT_END" %>

<%--
ID	content	lantype	keywords	note	vartype	aspect_field	CreatedTime	delflag	lowercase_keyworks
原始的all.db的内容
--%>
<%
    System.out.println("findwords:" + findwords);

%>
<%
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
    int n_content_pos = -1;
    String colContent = "content";

    try{
        result.append("<table border=1>");
        String dbpath = CSqlitePub.getSqlitePathWithDriver(database);
        con = DriverManager.getConnection(dbpath);
        String tableName = table;

        //查询列-自定义
        String m_StrCols = columns;
        int m_ColsNum = -1;
        if(m_StrCols.trim().isEmpty()) {
            m_StrCols = "*";
            m_ColsNum = 0;
        }else {
            m_ColsNum = columns.split(",").length;
        }

        String orderCondition  = "SELECT " + m_StrCols + " FROM " + tableName ;
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

        System.out.println("orderCondition:" + orderCondition);


        //表的所有列
        int 字段个数 = 0;
//        DatabaseMetaData metadata = con.getMetaData();
//        ResultSet rs1 = metadata.getColumns(null, null, tableName, null);
//        result.append("<tr>");
//        while (rs1.next()) {
//            字段个数++;
//            String columnName = rs1.getString(4);
//            result.append("<td>" + columnName + "</td>");
//        }
//        result.append("</tr>");

        result.append("<tr>");
        String[] listStrCol = m_StrCols.trim().split(",");
        for (String m_item :
                listStrCol) {
            字段个数++;
            String columnName = m_item;
            result.append("<td>" + columnName + "</td>");
        }
        result.append("</tr>");

        System.out.println("字段个数: " + 字段个数);

        sql = con.createStatement();
        if (findwords.trim().isEmpty())
        {
            rs = sql.executeQuery(orderCondition);
            while (rs.next()) {
                result.append("<tr>");
                for (int i = 1; i <= 字段个数; i++) {
                    result.append("<td>" + rs.getString(i) + "</td>");
                }
                result.append("</tr>");
            }
        }
        else
        {
            orderCondition  = "SELECT " + m_StrCols + " FROM " + tableName ;
            if(order.trim().equals("order"))
            {
                orderCondition += " ORDER BY ID desc ";
            }

            rs = sql.executeQuery(orderCondition);
            while (rs.next()) {
                String m_ColContentVal = rs.getString(2);
                if(!m_ColContentVal.toLowerCase().contains(findwords.trim().toLowerCase())){
                    continue;
                }
                result.append("<tr>");
                for (int i = 1; i <= 字段个数; i++) {
                    result.append("<td>" + rs.getString(i) + "</td>");
                }
                result.append("</tr>");
            }
        }

        result.append("</table>");
        con.close();
    } catch (SQLException e) {
        e.printStackTrace();
        result.append(e);
    }

    jspContext.setAttribute("orderResult", new String(result));
%>