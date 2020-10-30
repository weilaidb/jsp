<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="sql.CSqlitePub" %>
<%@ tag import="base.CStringPub" %>
<%@ attribute name="database" required="true" %>
<%@ attribute name="table" required="true" %>
<%@ attribute name="id" required="true" %>
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
    if(CStringPub.isTrimEmpty(id))
    {
        resultInfo.append("请输入正常的id号");
    }
    else
    {
        String execCondition  = CSqlitePub.expDeleteCondition(table, Integer.parseInt(id));
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
                resultInfo.append("删除数据成功" + "[" + id + "]");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resultInfo.append(e);
        }

    }
    jspContext.setAttribute("result", new String(resultInfo.toString()));

%>