<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="java.util.List" %>
<%@ tag import="java.util.ArrayList" %>
<%@ tag import="sql.CSqlitePub" %>
<%@ attribute name="database" required="true" %>
<%@ attribute name="table" required="true" %>
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

    String execCondition  = CSqlitePub.expCreateTable(table);
    System.out.println("execCondition:" + execCondition);

    StringBuffer resultInfo = new StringBuffer();
    CSqlitePub.loadSqliteClass(resultInfo);

    Connection con = null;
    Statement sql;
    int ret;

    try {
        database = CSqlitePub.getSqlitePathWithDriver(database);
        con = DriverManager.getConnection(database);
        sql = con.createStatement();
        ret = sql.executeUpdate(execCondition);
        if(0 == ret){
            resultInfo.append("数据表创建成功");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        resultInfo.append(e);
    }

    jspContext.setAttribute("result", new String(resultInfo.toString()));

%>