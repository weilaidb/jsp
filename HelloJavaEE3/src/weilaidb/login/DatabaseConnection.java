package weilaidb.login;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    public static final String DBDRIVER = "com.mysql.jdbc.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/mldn?useUnicode=true&characterEncoding=utf-8"; //数据库名";
    public static final String DBUSER = "root";
    public static final String DBPASS = "Zzerp123";

    public Connection getConnection() {
        return conn;
    }

    private Connection conn = null;

    public DatabaseConnection() throws Exception {
        try {
            Class.forName(DBDRIVER);
            this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
        } catch (Exception e) {
            throw e;
        }
    }

    public void close() throws Exception {
        if (this.conn != null) {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw e;
            }
        }
    }


}
