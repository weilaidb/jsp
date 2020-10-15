<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="java.util.Calendar" %>
<%@ attribute name="dataBaseName" required="true" %>
<%@ attribute name="tableName" required="true" %>
<%@ attribute name="user" required="true" %>
<%@ attribute name="password" required="true" %>
<%@ variable name-given="biao" scope="AT_END" %>
<%@ variable name-given="queryResult" scope="AT_END" %>

<%
    StringBuffer result;
    result = new StringBuffer();

    try {
        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println(e.getMessage());
    } finally {
    }

    Connection con = null;
    PreparedStatement pre;
    ResultSet rs;

    try{
        result.append("<table border=1>");
        String uri = "jdbc:mysql://localhost:3306/" + "bank" + "?useUnicode=true&characterEncoding=utf-8"; //数据库名;
        con = DriverManager.getConnection(uri, user, password);
        DatabaseMetaData metadata = con.getMetaData();
        ResultSet rs1 = metadata.getColumns(null, null, tableName, null);
        int 字段个数 = 0;
        result.append("<tr>");
        while (rs1.next()) {
            字段个数++;
            String columnName = rs1.getString(4);
            result.append("<td>" + columnName + "</td>");
        }
        result.append("</tr>");
        pre = con.prepareStatement("SELECT * FROM " + tableName);//预处理语句pre
        rs = pre.executeQuery();
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
//        out.println("" + e);
        result.append("用户名或密码错误");
    }
    jspContext.setAttribute("queryResult", new String(result));
    jspContext.setAttribute("biao", tableName);
%>