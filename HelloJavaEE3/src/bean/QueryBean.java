package bean;

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

    public StringBuffer getQueryResult() {
        return queryResult;
    }

    public void setQueryResult(StringBuffer queryResult) {
        this.queryResult = queryResult;
    }

    String databaseName = "";
    String tableName = "";
    String user = "";
    String password = "";
    StringBuffer queryResult;
    public QueryBean()
    {
        queryResult = new StringBuffer();
        try {
            Class.forName("com.mysql.jdbc.Driver");  ////Çý¶¯³ÌÐòÃû
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } finally {

        }
    }
}
