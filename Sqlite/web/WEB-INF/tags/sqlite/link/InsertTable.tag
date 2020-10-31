<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="sql.CSqlitePub" %>
<%@ tag import="base.CStringPub" %>
<%@ attribute name="database" required="true" %>
<%@ attribute name="table" required="true" %>
<%@ attribute name="content" required="true" %>
<%@ attribute name="note" required="true" %>
<%@ variable name-given="result" scope="AT_END" %>

<%
    StringBuffer resultInfo = new StringBuffer();
    if(CStringPub.isTrimEmpty(content) || CStringPub.isTrimEmpty(note))
    {
        resultInfo.append("请写入数据");
    }
    else
    {

        String execCondition  = CSqlitePub.expInsertTable(table,content,note);
        System.out.println("execCondition:" + execCondition);

        CSqlitePub.loadSqliteClass(resultInfo);

        Connection con = null;
        Statement sql;

        try {
            con = DriverManager.getConnection(database);
            sql = con.createStatement();
            sql.executeUpdate(execCondition);
            resultInfo.append("!!添加数据成功!!");
        } catch (SQLException e) {
            e.printStackTrace();
            resultInfo.append(e);
        }
    }
    jspContext.setAttribute("result", new String(resultInfo.toString()));

%>