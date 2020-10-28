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
    String firsttable = "";
    int n_content_pos = -1;
    String colContent = "content";

    try{
        result.append("<table border=1>");
        String dbpath = CSqlitePub.getSqlitePathWithDriver(database);
        con = DriverManager.getConnection(dbpath);
        DatabaseMetaData metadata = con.getMetaData();
        String tableName = table;

        //如果表为空则选择一个
        if(tableName.trim().isEmpty() && firsttable.trim().length() > 0)
        {
            tableName = firsttable.trim();
        }

        //查询条件列表
        String m_columns = columns;
        int colnum = columns.split(",").length;
        if(m_columns.trim().isEmpty()) {
            m_columns = "*";
            colnum = 0;
        }
        else
            {
        String orderCondition  = "SELECT " + m_columns + " FROM " + tableName ;
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


        //查找表的列
        ResultSet rs1 = metadata.getColumns(null, null, tableName, null);
        int 字段个数 = 0;
        result.append("<tr>");
        while (rs1.next()) {
            字段个数++;
            String columnName = rs1.getString(4);
            result.append("<td>" + columnName + "</td>");

            //查找列Content的位置，查找内容时从此处查找
            if(!findwords.trim().isEmpty() && columnName.trim().equals(colContent.trim()))
            {
                n_content_pos = 字段个数-1;
            }

            if((字段个数>=colnum) && colnum > 0)
            {
                break;
            }
        }
        System.out.println("字段个数: " + 字段个数);
        if(n_content_pos != -1)
        {
            System.out.println("n_content_pos:" + n_content_pos);
        }

        result.append("</tr>");
        sql = con.createStatement();
        rs = sql.executeQuery(orderCondition);
        while (rs.next()) {
            //查找内容包含数据
            if(findwords.trim().isEmpty()) {
                result.append("<tr>");
                for (int i = 1; i <= 字段个数; i++) {
                    result.append("<td>" + rs.getString(i) + "</td>");
                }
                result.append("</tr>");
            }
            else{
            //先查找此段时否包含关键字
                if(rs.getString(n_content_pos).contains(findwords.trim()))
                {
                    result.append("<tr>");
                    for (int i = 1; i <= 字段个数; i++) {
                        result.append("<td>" + rs.getString(i) + "</td>");
                    }
                    result.append("</tr>");
                }
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