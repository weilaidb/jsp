package bean;

import java.sql.*;

public class QueryBean {
    public String getDatabaseName() {
        return databaseName;
    }

    public void setDatabaseName(String s) {
        this.databaseName = s.trim();
        queryResult = new StringBuffer();
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String s) {
        this.tableName = s.trim();
        queryResult = new StringBuffer();
    }

    public String getUser() {
        return user;
    }

    public void setUser(String s) {
        this.user = s.trim();
        queryResult = new StringBuffer();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String s) {
        this.password = s.trim();
        queryResult = new StringBuffer();
    }

    public void setQueryResult(StringBuffer queryResult) {
        this.queryResult = queryResult;
    }

    String databaseName = "";
    String tableName = "";
    String user = "";
    String password = "";
    StringBuffer queryResult;

    public QueryBean() {
        queryResult = new StringBuffer();
        try {
            Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } finally {

        }
    }

    public StringBuffer getQueryResult()
    {
        Connection con;
        Statement sql;
        ResultSet rs;
        try {
            queryResult.append("<table border=1>");
            String uri = "jdbc:mysql://localhost:3306/" + databaseName + "?useUnicode=true&characterEncoding=utf-8"; //数据库名;
            con = DriverManager.getConnection(uri, user, password);
            DatabaseMetaData metadata = con.getMetaData();
            ResultSet rs1 = metadata.getColumns(null, null, tableName, null);
            int 字段个数 = 0;
            queryResult.append("<tr>");
            while (rs1.next()) {
                字段个数++;
                String columnName = rs1.getString(4);
                queryResult.append("<td>" + columnName + "</td>");
            }
            queryResult.append("</tr>");

            sql = con.createStatement();
            String condition = "SELECT * FROM " + tableName;
            rs = sql.executeQuery(condition);
            while (rs.next()) {
                queryResult.append("<tr>");
                for (int i = 1; i <= 字段个数; i++) {
                    queryResult.append("<td>" + rs.getString(i) + "</td>");
                }
                queryResult.append("</tr>");
            }
            queryResult.append("</table>");
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            queryResult.append("请输入正确的用户名和密码" + e);
        }
        return queryResult;
    }
}

