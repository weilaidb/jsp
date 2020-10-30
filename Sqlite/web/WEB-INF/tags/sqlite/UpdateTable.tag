<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="sql.CSqlitePub" %>
<%@ tag import="base.CStringPub" %>
<%@ attribute name="database" required="true" %>
<%@ attribute name="table" required="true" %>
<%@ attribute name="id" required="true" %>
<%@ attribute name="content" required="true" %>
<%@ variable name-given="result" scope="AT_END" %>
<%@ variable name-given="showtext" scope="AT_END" %>

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
    //显示结果
    StringBuffer resultInfo = new StringBuffer();
    //要显示的信息，textarea
    StringBuffer showtextInfo = new StringBuffer();
    String inputtips = "请输入内容";
    if(CStringPub.isTrimEmpty(id))
    {
        resultInfo.append("请输入正常的id号或内容");
    }
//    else if(CStringPub.isTrimEmpty(id) && CStringPub.isTrimEmpty(content) || CStringPub.ifNullSetEmpty(inputtips).equals(inputtips))
//    {
//        resultInfo.append("请输入内容");
//    }
    else if(!CStringPub.isTrimEmpty(id) && CStringPub.isTrimEmpty(content))
    {
        String execCondition  = CSqlitePub.expSelectCondition(table, "content" , Integer.parseInt(id));
        System.out.println("execCondition:" + execCondition);

        CSqlitePub.loadSqliteClass(resultInfo);
        Connection con = null;
        Statement sql;
        ResultSet rs;
        int ret;

        try {
            database = CSqlitePub.getSqlitePathWithDriver(database);
            con = DriverManager.getConnection(database);
            sql = con.createStatement();
            rs = sql.executeQuery(execCondition);
            while (rs.next()) {
                showtextInfo.append(rs.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resultInfo.append(e);
        }
    }
    else
    {
        String execCondition  = CSqlitePub.expUpdateCondition(table, "content" , content,  Integer.parseInt(id));
        System.out.println("execCondition:" + execCondition);

        CSqlitePub.loadSqliteClass(resultInfo);
        Connection con = null;
        Statement sql;
        ResultSet rs;
        int ret;

        try {
            database = CSqlitePub.getSqlitePathWithDriver(database);
            con = DriverManager.getConnection(database);
            sql = con.createStatement();
            ret = sql.executeUpdate(execCondition);
            resultInfo.append("更新数据成功!!");
            showtextInfo.append(new String(content.getBytes("ISO-8859-1")));
        } catch (SQLException e) {
            e.printStackTrace();
            resultInfo.append(e);
        }
    }
    jspContext.setAttribute("result", new String(resultInfo.toString()));
    jspContext.setAttribute("showtext", new String(showtextInfo.toString()));

%>