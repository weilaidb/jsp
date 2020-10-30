<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="java.util.List" %>
<%@ tag import="java.util.ArrayList" %>
<%@ tag import="sql.CSqlitePub" %>
<%@ tag import="base.CStringPub" %>
<%@ attribute name="database" required="true" %>
<%@ attribute name="table" required="true" %>
<%@ attribute name="content" required="true" %>
<%@ variable name-given="result" scope="AT_END" %>

<%--
ID	content	lantype	keywords	note	vartype	aspect_field	CreatedTime	delflag	lowercase_keyworks
原始的all.db的内容
--%>
<%
//    CREATE TABLE c_table(
//        [ID] INTEGER PRIMARY KEY,
//    [content] varchar(100),
//    [note] varchar(100),
//    delflag integer DEFAULT 0,
//    CreatedTime TimeStamp NOT NULL DEFAULT (datetime('now',
//    'localtime'))
//    );
//
    StringBuffer resultInfo = new StringBuffer();
    if(CStringPub.isTrimEmpty(content))
    {
        resultInfo.append("请写入数据");
    }
    else
    {

        String execCondition  = CSqlitePub.expInsertTable(table,content);
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