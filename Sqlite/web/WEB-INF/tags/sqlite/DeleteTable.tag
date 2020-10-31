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
    System.out.println("id:" + id);


    StringBuffer resultInfo = new StringBuffer();
    if(CStringPub.isTrimEmpty(id))
    {
        resultInfo.append("请输入正常的id号");
    }
    else
    {
        try{
            int iId = Integer.parseInt(id);
            String execCondition  = CSqlitePub.expDeleteCondition(table, iId);
            CSqlitePub.loadSqliteClass(resultInfo);
            Connection con = null;
            Statement sql;
            int ret =-1;

            System.out.println("execCondition:" + execCondition);

            try {
                database = CSqlitePub.getSqlitePathWithDriver(database);
                con = DriverManager.getConnection(database);
                sql = con.createStatement();
                ret = sql.executeUpdate(execCondition);
                resultInfo.append("删除数据成功" + "[" + id + "]");
                System.out.println("ret:" + ret);

            } catch (SQLException e) {
                e.printStackTrace();
                resultInfo.append("ID号不存在[" + id + "]");
//                resultInfo.append(e);
//                System.out.println("ret:" + ret);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            resultInfo.append("请输入正常的id号");
        }
    }
    jspContext.setAttribute("result", new String(resultInfo.toString()));

%>