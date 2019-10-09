package weilaidb.sql;

import javax.swing.plaf.nimbus.State;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class SqlProc {
    public static void main(String args[]) {
        opendb("alldb");

        System.out.println("Opened database successfully");

    }

    public static Connection opendb(String dbname) {
        int ret = -1;
        Connection conn = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名

            String username = "root";  //数据库用户名
            String password = "Zzerp123";  //数据库用户密码
            String existdbname = "mysql";
            String url0 = "jdbc:mysql://localhost:3306/" + existdbname + "?useUnicode=true&characterEncoding=utf-8"; //数据库名
            conn = DriverManager.getConnection(url0, username, password);  //连接状态
            Statement stat = conn.createStatement();

            //创建数据库dbname如果不存在
            stat.executeUpdate("create database if not exists " + dbname);


            String url = "jdbc:mysql://localhost:3306/"+ dbname + "?useUnicode=true&characterEncoding=utf-8"; //数据库名
            conn = DriverManager.getConnection(url, username, password);  //连接状态

            if (conn != null) {
                return conn;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("请输入查询数据!!!");
        } finally {
//            try {
//                if (null != conn) {
//                    conn.close();
//                }
//            }catch (Exception e) {
//
//            }
        }

        return conn;
    }
}
