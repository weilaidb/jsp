<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.sql.*" %>
<%@ tag import="java.util.*" %>
<%@ attribute name="databaseName" required="true" %>
<%@ attribute name="tableName" required="true" %>
<%@ attribute name="user" required="true" %>
<%@ attribute name="password" required="true" %>
<%@ attribute name="count" required="true" %>
<%@ variable name-given="biao" scope="AT_END" %>
<%@ variable name-given="queryResult" scope="AT_END" %>
<%@ variable name-given="randomCount" scope="AT_END" %>

<%
    Vector vector =  new Vector();
    StringBuffer result;
    result = new StringBuffer();
    try {
        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println(e.getMessage());
    } finally {

    }
    Connection con;
    Statement sql;
    ResultSet rs;
    int n = 0;
    try{
        result.append("<table border=1>");
        String uri = "jdbc:mysql://localhost:3306/" + databaseName + "?useUnicode=true&characterEncoding=utf-8"; //数据库名;
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





        sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        rs = sql.executeQuery("SELECT * FROM " + tableName);
        rs.last();
        int rowNumber = rs.getRow();
        int number = rowNumber;
        for (int i = 1; i <= number; i++) {
            vector.add(new Integer(i));
        }
        int m = Math.min(Integer.parseInt(count), number);
        n = m;
        while (m > 0) {
            int i = (int) (Math.random() * vector.size());
            //从vector中随机抽取一个元素:
            int index = ((Integer)vector.elementAt(i)).intValue();
            rs.absolute(index);
            result.append("<tr>");
            for (int j = 1; j <= 字段个数; j++) {
                result.append("<td>" + rs.getString(j) + "</td>");
            }
            result.append("</tr>");
            m--;
            vector.removeElementAt(i);
        }
        result.append("</table>");
        con.close();
    } catch (SQLException e) {
        e.printStackTrace();
        result.append("请输入正确的用户名和密码");
    }

    //返回queryResult对象
    jspContext.setAttribute("queryResult", new String(result));
    jspContext.setAttribute("biao", tableName);
    //返回randomCount对象
    jspContext.setAttribute("randomCount", String.valueOf(n));
%>
