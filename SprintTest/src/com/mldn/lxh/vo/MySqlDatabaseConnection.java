package com.mldn.lxh.vo;

//import org.springframework.orm.jpa.vendor.Database;

import java.sql.Connection;
import java.sql.DriverManager;


public class MySqlDatabaseConnection implements DatabaseConnection {
    public static final String DBDRIVER = "com.mysql.jdbc.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/mldn?useUnicode=true&characterEncoding=utf-8"; //数据库名";
    public static final String DBUSER = "root";
    public static final String DBPASS = "Zzerp123";

    public Connection getConnection() {
        return this.conn;
    }

    public void setConnection(Connection conn) {
        this.conn = conn;
    }

    private Connection conn = null;

    public MySqlDatabaseConnection() throws Exception {
        try {
            Class.forName(DBDRIVER);
            this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
        } catch (Exception e) {
            throw e;
        }
    }

    public void close() {
        if (this.conn != null) {
            try {
                this.conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
