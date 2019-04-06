package com.mldn.lxh.vo;

import com.mldn.lxh.vo.MySqlDatabaseConnection;

public class DatabaseConnectionFactory {
    public static DatabaseConnection getDatabaseConnection() throws Exception {
        return new MySqlDatabaseConnection();
    }
}
