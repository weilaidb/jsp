package bean;

import com.sun.rowset.CachedRowSetImpl;

import java.sql.*;

public class ShowRecordByPage {
    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    int pageSize = 10;

    public int getPageAllCount() {
        return pageAllCount;
    }

    public void setPageAllCount(int pageAllCount) {
        this.pageAllCount = pageAllCount;
    }

    public StringBuffer getPresentPageResult() {
        if (showPage > pageAllCount) {
            showPage = 1;
        }
        if (showPage <= 0) {
            showPage = pageAllCount;
        }
        presentPageResult = show(showPage);
        return presentPageResult;
    }

    public StringBuffer show(int page) {
        StringBuffer str = new StringBuffer();
        str.append("<table border=1>");
        str.append("<tr>");
        for (int i = 0; i < 字段个数; i++) {
            str.append("<th>" + 字段[i] + "</th>");
        }
        str.append("</tr>");
        try{
            rowSet.absolute((page - 1) * pageSize + 1);
            boolean boo = true;
            for (int i = 1; i <= pageSize && boo ; i++) {
                str.append("<tr>");
                for (int j = 1; j < 字段个数; j++) {
                    str.append("<td>" + rowSet.getString(j) + "</td>");
                }
                str.append("</tr>");
                boo = rowSet.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        str.append("</table>");
        return str;
    }


    public void setPresentPageResult(StringBuffer presentPageResult) {
        this.presentPageResult = presentPageResult;
    }

    public CachedRowSetImpl getRowSet() {
        return rowSet;
    }

    public void setRowSet(CachedRowSetImpl rowSet) {
        this.rowSet = rowSet;
    }

    int pageAllCount = 0;

    public int getShowPage() {
        return showPage;
    }

    public void setShowPage(int size) {
        this.showPage = size;
        字段个数 = 0;

        String uri = "jdbc:mysql://localhost:3306/" + databaseName + "?useUnicode=true&characterEncoding=utf-8"; //数据库名;
        try {
            Connection con = DriverManager.getConnection(uri, user, password);
            DatabaseMetaData metadata = con.getMetaData();
            ResultSet rs1 = metadata.getColumns(null, null, tableName, null);
            int k = 0;
            while (rs1.next()) {
                字段个数++;
                字段[k] = rs1.getString(4);
                k++;
            }
            Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            String condition = "SELECT * FROM " + tableName;
            ResultSet rs = sql.executeQuery(condition);//创建行集对象
            rowSet = new CachedRowSetImpl();
            rowSet.populate(rs);
            con.close();
            rowSet.last();
            int m = rowSet.getRow();
            int n = pageSize;
            pageAllCount = ((m%n) == 0) ?(m/n):(m/n+1);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    int showPage = 1;
    StringBuffer presentPageResult;
    CachedRowSetImpl rowSet;

    public String getDatabaseName() {
        return databaseName;
    }

    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName.trim();
    }

    String databaseName = "";

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName.trim();
    }

    String tableName = "";

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user.trim();
    }

    String user = "";

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password.trim();
    }

    String password = "";
    String 字段[] = new String[100];
    int 字段个数 = 0;
    public ShowRecordByPage(){
        presentPageResult = new StringBuffer();
        try {
            Class.forName("org.sqlite.JDBC");  ////驱动程序名
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } finally {

        }
    }
}
