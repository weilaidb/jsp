<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="sql.CSqlitePub" %>
<%@ tag import="base.CStringPub" %>
<%@ attribute name="database" required="true" %>
<%@ attribute name="table" required="true" %>
<%@ attribute name="item" required="true" %>
<%@ attribute name="order" required="true" %>
<%@ attribute name="columns" required="true"%>
<%@ attribute name="findwords" required="true"%>
<%@ attribute name="showlittle" required="true"%>
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
    Connection con = null;
    Statement sql;
    ResultSet rs;

    result = new StringBuffer();
    CSqlitePub.loadSqliteClass(result);

    try{
        result.append("<table border=1>");
        String tableName = table;
        con = DriverManager.getConnection(CSqlitePub.getSqlitePathWithDriver(database));

        //查询列-自定义
        String m_StrCols = columns;
        if(findwords.trim().isEmpty())
        {
            m_StrCols = "*";
        }

        String orderCondition  = "SELECT " + m_StrCols + " FROM " + tableName ;
        orderCondition = CSqlitePub.procOrder(order, orderCondition);
        orderCondition = CSqlitePub.procLimit(order, orderCondition);
        System.out.println("orderCondition:" + orderCondition);

        if (CStringPub.isTrimEmpty(findwords))
        {
            CSqlitePub.procSelectAll(con, tableName,result, orderCondition, showlittle);
        }
        else
        {
            CSqlitePub.procFindWord(con, tableName, result,findwords,m_StrCols, order, showlittle);
        }

        con.close();
    } catch (SQLException e) {
        e.printStackTrace();
        result.append(e);
    }

    jspContext.setAttribute("orderResult", new String(result));
%>