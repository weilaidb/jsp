package weilaidb.sql;

import com.commmon.SqlInterface;
import com.sun.org.apache.xerces.internal.xs.StringList;
import file.CFilePub;

import javax.swing.plaf.nimbus.State;
import java.io.File;
import java.sql.*;
import java.util.List;

public class SqlProc {
    static String username = "root";  //数据库用户名
    static String password = "Zzerp123";  //数据库用户密
    static String existdbname = "mysql"; //已经存在的数据库

    public static String getDbnameShowUi() {
        return dbnameShowUi;
    }

    static String dbnameShowUi = "showui"; //已经存在的数据库

    public static String getDbnameExecCmd() {
        return dbnameExecCmd;
    }

    static String dbnameExecCmd = "execcmd"; //已经存在的数据库

    public static String getDbnameAlldb() {
        return dbnameAlldb;
    }

    static String dbnameAlldb = "alldb"; //alldb

    public static String getTablenameAbc() {
        return tablenameAbc;
    }

    static String tablenameAbc = "abc"; //alldb

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
        return getDbPathDefaultWithDriver(existdbname); //数据库名
    }

    public static String getDbNameEps(String dbName) {
        return getDbPathDefaultWithDriver( dbName); //数据库名
    }

    public static void classForMysqlDriver() {
        try {
            Class.forName("org.sqlite.JDBC");  ////驱动程序名
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } finally {

        }
    }

    public static void createconn() {
        Connection con = null;
        String dbName = "abc";
        try{
            String uri = getDbPathDefaultWithDriver(dbName); //数据库名;
            String user = "root";
            String password = "99";
            con = DriverManager.getConnection(uri, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    //从文件中获取数据库的路径
    static public String getDbPathFromFile(String predir, String filename)
    {
        String[] prepath = {"D:/","E:/","C:/"};
        for (String pre:
                prepath) {
            try{
                return CFilePub.getFileFirstContent(pre + predir, filename);
            } catch (Exception e) {
                e.printStackTrace();
                continue;
            }
        }
        return "";
    }
    static String m_dbpath_pre = "mydb/sqlite/";
    static String m_dbpath_config = "config.txt";

    static public String getDbPathFromFileDefault()
    {
        return getDbPathFromFile(m_dbpath_pre,m_dbpath_config);
    }

    //带驱动路径的数据库存储目录，不带库名
    static public String getDbPathDefaultWithDriver(String dbName)
    {
        return "jdbc:sqlite:"+  getDbPathFromFileDefault() + File.separator + dbName;
    }



    static public void createDbIfNoExist(String dbName)
    {
        //从文件中获取数据库存储的路径，没有则创建一个。
        String dbDir = getDbPathFromFileDefault();
        try {
            String url = dbDir + File.separator + dbName;
            System.out.println("createDbIfNoExist url:" + url);
            CFilePub.createFileNoExist(url);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection opendb(String dbname) {
        int ret = -1;
        Connection conn = null;

        try {
            classForMysqlDriver();
//            String username = getUsername();  //数据库用户名
//            String password = getPassword();  //数据库用户密码
//            String url0 = getExistDbNameEps(); //数据库名
//            conn = DriverManager.getConnection(url0, username, password);  //连接状态
//            Statement stat = conn.createStatement();
//
//            创建数据库dbname如果不存在
//            stat.executeUpdate("create database if not exists " + dbname);
            createDbIfNoExist(dbname);

            String dbDir = getDbPathFromFileDefault();
            String url = getDbPathDefaultWithDriver(dbname); //数据库名
            conn = DriverManager.getConnection(url);  //连接状态
            System.out.println("url:" + url);

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


    public static void printException(Exception e) {
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
    public static int deleteDbname(String dbName) {
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

    public static String createTableEps(String tableName) {
        String sql = "CREATE TABLE  IF NOT EXISTS " + tableName + " (  [ID] INTEGER PRIMARY KEY,\n" +
                "name varchar(3000),\n" +
                "create_time TimeStamp DEFAULT CURRENT_TIMESTAMP,\n" +
                "update_time TimeStamp DEFAULT CURRENT_TIMESTAMP\n" +
                ")";
        return (sql);
    }

    public static String queryTableEps(String tableName) {
        String sql = "CREATE TABLE  IF NOT EXISTS " + tableName + " (  [ID] INTEGER PRIMARY KEY,\n" +
                "name varchar(3000),\n" +
                "create_time TimeStamp DEFAULT CURRENT_TIMESTAMP,\n" +
                "update_time TimeStamp DEFAULT CURRENT_TIMESTAMP\n" +
                ")";
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
            conn = DriverManager.getConnection(getDbNameEps(dbName));  //连接状态
            stat = conn.createStatement();
            //创建数据库表
//            stat.executeUpdate(createTableEps(dbName, tableName));
//            if (0 == stat.executeLargeUpdate(createTableEps(tableName))) {
            if (0 == stat.executeUpdate(createTableEps(tableName))) {
                System.out.println(("111 create table ok！"));
            } else {
                System.out.println(("222 create table ng！"));
            }
            System.out.println("create tableName success " + tableName);


            return 0;
        } catch (Exception e) {
            printException(e);
        } finally {
            if (stat != null) {
                stat.close();
            }
            if (conn != null) {
                conn.close();
            }
//            System.out.println("file.encoidng:" + System.getProperty("file.encoding"));
        }

        return ret;
    }

    //查找数据 + ID
    public static String queryDataId(String dbName, String tableName, String queryid,
                                   List<String> listContent) throws SQLException {
        int ret = -1;
        Connection conn = null;
        String dbname = dbName;
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "";  //查询语句
        String tablename = tableName;
        String qryiddata = "";
        qryiddata = queryid;

        if (null == qryiddata) {
            qryiddata = "";
        }

        try {
            conn = SqlProc.opendb(dbname);
            if (conn != null) {
                int whichid = 0;
                if (qryiddata.isEmpty()) {
                    SqlInterface inter = new SqlInterface();
                    whichid = inter.getMaxId(dbname, tablename);
                    qryiddata = Integer.toString(whichid);
                } else {
                    whichid = Integer.valueOf(qryiddata).intValue();
                }

                sql = "SELECT * from " + tablename + " WHERE id=" + whichid + ";";  //查询语句

                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                int rowCount = 0;
                while (rs.next()) {
                    rowCount++;
                    String toshowcontent = rs.getString("content");

                    int actualrows = toshowcontent.split("\n").length;
                    int maxrows = 100;
                    if (actualrows < maxrows) {
                        actualrows = maxrows;
                    }

                    listContent.add(toshowcontent);

                }
                System.out.println("query db:" + dbName + ", table:" + tableName);
                System.out.println("query data:" + queryid);
                System.out.println("rowCount:" + rowCount);

            }else{
                System.out.println("connect failed, dbName" +  dbName + ", table:" + tableName);
                return ("连接失败！");
            }
        }  catch(Exception e){
            System.out.println("请输入查询数据!!!, dbName" +  dbName + ", table:" + tableName);
            return ("请输入查询数据!!!" + e.getMessage());
        }

        return "";
    }


    //查找数据
    public static String queryData(String dbName, String tableName, String querydata,
                                     List<String> listContent) throws SQLException {
        int ret = -1;
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;

        String qryval = "";
        try {
            qryval = querydata;
        } catch (Exception e) {
            System.out.println("\n");
        }

        //判断查询的数据是否为无效
        if(null == qryval )
        {
            qryval = "";
        }

        try {
            String dbname = dbName;
            conn = SqlProc.opendb(dbname);
            if (conn != null) {
                stmt = null;
                rs = null;
                String sql = "";  //查询语句
                String tablename = tableName;
                System.out.println("qryval is:" + qryval);
                if (qryval.isEmpty() || qryval.trim().isEmpty()) {
                    sql = "SELECT * from " + tablename + " order by id desc limit 10;";  //查询语句
                } else {
                    String sqlhead = " SELECT * FROM " + tablename + " WHERE ";
                    String sqltail = " order by id desc;";
                    String sqlmid = " ";
                    String[] qrylst = qryval
                            .replace("\"", "\\\"")
                            .split(" ");
                    for (int lp = 0; lp < qrylst.length; lp++) {
                        sqlmid += "content like  \"%" + qrylst[lp] + "%\" ";
                        if (lp != qrylst.length - 1)
                            sqlmid += " and ";
                    }
                    sql = sqlhead + sqlmid + sqltail;
                }

                System.out.println("sql:" + sql);
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                int rowCount = 0;
                while (rs.next()) {
                    rowCount++;

                    String showcontent = rs.getString("content")
                            .replaceAll("<", "")
                            .replaceAll(">", "")
                            .replace("\n", "<br/>");

                    listContent.add(showcontent);

                    int showlen = 50;
                    long totallen = showcontent.length();
                    if (showcontent.length() > showlen) {
                        showcontent = showcontent.substring(0, showlen);
                    }
                    long curlen = showcontent.length();
                    if (totallen == 0) {
                        totallen = 100;
                    }
                    String appendstr = "ShowRate:" + (curlen * 100 / totallen) + "%";
                    if (totallen == 0 || ((curlen * 100 / totallen) == 100)) {
                        appendstr = "";
                    } else {
                        appendstr = appendstr;
                    }
                }
                rs.close();
                stmt.close();
                System.out.println("查询结果：" + rowCount + " 条[" + qryval + "]");
                return ("查询结果：" + rowCount + " 条[" + qryval + "]");

            } else {
                System.out.println("连接失败！");
                return("连接失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("请输入查询数据!!!");
            return ("请输入查询数据!!!");
        } finally {
            if (null != conn) {
                conn.close();
            }
        }

//        return "";
    }

    //正则查找数据
    public static String queryDataRegex(String dbName, String tableName, String querydata,
                                   List<String> listContent) throws SQLException {
        int ret = -1;
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;

        String qryval = "";
        try {
            qryval = querydata;
        } catch (Exception e) {
            System.out.println("\n");
        }

        //判断查询的数据是否为无效
        if(null == qryval )
        {
            qryval = "";
        }

        try {
            String dbname = dbName;
            conn = SqlProc.opendb(dbname);
            if (conn != null) {
                stmt = null;
                rs = null;
                String sql = "";  //查询语句
                String tablename = tableName;
                System.out.println("qryval is:" + qryval);
                if (qryval.isEmpty() || qryval.trim().isEmpty()) {
                    sql = "SELECT * from " + tablename + " order by id desc limit 10;";  //查询语句
                } else {
                    String sqlhead = " SELECT * FROM " + tablename + " WHERE ";
                    String sqltail = " order by id desc;";
                    String sqlmid = " ";
                    String[] qrylst = qryval
                            .replace("\"", "\\\"")
                            .split(" ");
                    for (int lp = 0; lp < qrylst.length; lp++) {
                        sqlmid += "content REGEXP \'" + qrylst[lp] + "\' ";
                        if (lp != qrylst.length - 1)
                            sqlmid += " and ";
                    }
                    sql = sqlhead + sqlmid + sqltail;
                }

                System.out.println("sql:" + sql);
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                int rowCount = 0;
                while (rs.next()) {
                    rowCount++;

                    String showcontent = rs.getString("content")
                            .replaceAll("<", "")
                            .replaceAll(">", "")
                            .replace("\n", "<br/>");

                    listContent.add(showcontent);

                    int showlen = 50;
                    long totallen = showcontent.length();
                    if (showcontent.length() > showlen) {
                        showcontent = showcontent.substring(0, showlen);
                    }
                    long curlen = showcontent.length();
                    if (totallen == 0) {
                        totallen = 100;
                    }
                    String appendstr = "ShowRate:" + (curlen * 100 / totallen) + "%";
                    if (totallen == 0 || ((curlen * 100 / totallen) == 100)) {
                        appendstr = "";
                    } else {
                        appendstr = appendstr;
                    }
                }
                rs.close();
                stmt.close();
                System.out.println("查询结果：" + rowCount + " 条[" + qryval + "]");
                return ("查询结果：" + rowCount + " 条[" + qryval + "]");

            } else {
                System.out.println("连接失败！");
                return("连接失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("请输入查询数据!!!");
            return ("请输入查询数据!!!");
        } finally {
            if (null != conn) {
                conn.close();
            }
        }

//        return "";
    }
}
