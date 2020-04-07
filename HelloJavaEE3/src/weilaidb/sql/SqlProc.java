package weilaidb.sql;

import com.commmon.SqlInterface;

import javax.swing.plaf.nimbus.State;
import java.sql.*;

public class SqlProc {
    static String username = "root";  //数据库用户名
    static String password = "Zzerp123";  //数据库用户密
    static String existdbname = "mysql"; //已经存在的数据库

    public static String getDbnameShowUi() {
        return dbnameShowUi;
    }

    static String dbnameShowUi = "showui"; //已经存在的数据库

    public static String getDbnameCodeSets() {
        return dbnameCodeSets;
    }

    static String dbnameCodeSets = "codesets";

    public static void main(String args[]) {
        opendb("alldb");

        System.out.println("Opened database successfully");

    }

    public static String getUsername() {
        return username;
    }

    public static String getPassword() {
        return password;
    }

    public static String getExistdbname() {
        return existdbname;
    }

    public static String getExistDbNameEps() {
        return "jdbc:mysql://localhost:3306/" + existdbname + "?useUnicode=true&characterEncoding=utf-8"; //数据库名
    }
    public static String getDbNameEps(String dbName) {
        return "jdbc:mysql://localhost:3306/" + dbName + "?useUnicode=true&characterEncoding=utf-8"; //数据库名
    }

    public static void classForMysqlDriver() {
        try {
            Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } finally {

        }
    }


    public static Connection opendb(String dbname) {
        int ret = -1;
        Connection conn = null;

        try {
            classForMysqlDriver();
            String username = getUsername();  //数据库用户名
            String password = getPassword();  //数据库用户密码
            String url0 = getExistDbNameEps(); //数据库名
            conn = DriverManager.getConnection(url0, username, password);  //连接状态
            Statement stat = conn.createStatement();

            //创建数据库dbname如果不存在
            stat.executeUpdate("create database if not exists " + dbname);


            String url = "jdbc:mysql://localhost:3306/" + dbname + "?useUnicode=true&characterEncoding=utf-8"; //数据库名
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

    public static String createDbEps(String dbname) {
        return "create database if not exists " + dbname;
    }

    public static String deleteDbEps(String dbname) {
        return "drop database if exists " + dbname;
    }


    public static void printException(Exception e)
    {
        e.printStackTrace();
        System.out.println(e.getMessage());
    }

    //创建数据库名称
    public static int createDbName(String dbName) {
        int ret = -1;
        Connection conn = null;
        Statement stat = null;

        try {
            classForMysqlDriver();
            //一开始必须填一个已经存在的数据库
            conn = DriverManager.getConnection(getExistDbNameEps(), getUsername(), getPassword());  //连接状态
            stat = conn.createStatement();
            //创建数据库hello
            stat.executeUpdate(createDbEps(dbName));
            System.out.println("create dbname success " + dbName);
            conn.close();
            return 0;
        } catch (Exception e) {
            printException(e);
        } finally {

        }
        return ret;
    }

    //删除数据库
    public static int deleteDbname(String dbName)
    {
        int ret = -1;
        Connection conn = null;
        Statement stat = null;

        try {
            classForMysqlDriver();
            //一开始必须填一个已经存在的数据库
            conn = DriverManager.getConnection(getExistDbNameEps(), getUsername(), getPassword());  //连接状态
            stat = conn.createStatement();
            //创建数据库hello
            stat.executeUpdate(deleteDbEps(dbName));
            System.out.println("delete dbname success " + dbName);
            conn.close();
            return 0;
        } catch (Exception e) {
            printException(e);
        } finally {

        }
        return ret;
    }

    public static String createTableEps(String tableName)
    {
        String sql =  "CREATE TABLE  IF NOT EXISTS " + tableName + " (  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,\n" +
                "name varchar(3000),\n" +
                "PRIMARY KEY (`id`),\n" +
                "create_time datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',\n" +
                "update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',\n" +
                "UNIQUE KEY `name_UNIQUE` (`id`)\n" +
                ")  ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4;";
        return (sql);
    }

    //创建表
    public static int createTableName(String dbName, String tableName) throws SQLException {
        int ret = -1;
        Connection conn = null;
        Statement stat = null;

        try {
            classForMysqlDriver();
            //一开始必须填一个已经存在的数据库
            conn = DriverManager.getConnection(getDbNameEps(dbName), getUsername(), getPassword());  //连接状态
            stat = conn.createStatement();
            //创建数据库表
//            stat.executeUpdate(createTableEps(dbName, tableName));
            if(0 == stat.executeLargeUpdate(createTableEps(tableName)))
            {
                System.out.println(("111 create table ok！"));
            }else
            {
                System.out.println(("222 create table ng！"));
            }
            System.out.println("create tableName success " + tableName);


            return 0;
        } catch (Exception e) {
            printException(e);
        } finally {
            if(stat != null) {
                stat.close();
            }
            if(conn != null) {
                conn.close();
            }
            System.out.print("file.encoidng:" + System.getProperty("file.encoding"));
        }

        return ret;
    }

}
