package weilaidb.login;

import weilaidb.sql.SqlProc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    public static final String DBDRIVER = "org.sqlite.JDBC";
    public static final String DBURL = SqlProc.getDbPathDefaultWithDriver("mldn"); //数据库名";
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
