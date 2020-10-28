package sql;

import base.CStringPub;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.*;

public class CSqlitePub {
    static String firstpath = "mydb/";
    static String secondpath = "sqlite/";
    static String filename = "config.txt";

    static public String getSqlitePathFromFileSingle(String prefix)
    {
        StringBuffer str = new StringBuffer();
        try{
            File dir = new File(prefix + firstpath,secondpath);
            dir.mkdirs();
            File f = new File(dir,filename);
            FileReader in = new FileReader(f);
            BufferedReader bufferin = new BufferedReader(in);
            String temp;
            while ((temp = bufferin.readLine()) != null) {
                if(temp.toString().trim().isEmpty())
                {
                    continue;
                }
                str.append(temp);
                //只取第一行
                break;
            }
            bufferin.close();
            in.close();
            System.out.println("found sqlite db:" + str);
            return str.toString().trim();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("no found sqlite db:" + e);
            return e.toString();
        }
    }

    static public String getSqlitePathFromFile()
    {
        try{
            return getSqlitePathFromFileSingle("D:/");
        } catch (Exception e) {
            e.printStackTrace();
            return getSqlitePathFromFileSingle("C:/");
        }
    }

    static public String getSqliteWholePath()
    {
        return "jdbc:sqlite:" + getSqlitePathFromFile();
    }
    static public String getSqliteWholePath(String databaseProc)
    {
        databaseProc = CStringPub.ifNullSetEmpty(databaseProc);
        if(databaseProc.isEmpty())
        {
            return getSqliteWholePath();
        }
        else {
            return getSqlitePathWithDriver(databaseProc);
        }
    }

    static public String getSqlitePathWithDriver(String database)
    {
        return "jdbc:sqlite:" + database;
    }
    static public String getSqlitePathTrimDriver(String database)
    {
        return database.replaceAll("jdbc:sqlite:","");
    }

    //查询数据库表名(默认)
    static public String qrySqliteDefault(String tablename, String qryVal) {
        String result = "";
        String sql = "";  //查询语句
        Connection connection = null;
        try {
            Class.forName("org.sqlite.JDBC");
            String dbpath = CSqlitePub.getSqliteWholePath();
            connection = DriverManager.getConnection(dbpath);
            Statement statement = connection.createStatement();   //创建连接对象，是Java的一个操作数据库的重要接口

            if (tablename.trim().isEmpty()) {
                tablename = "c_table";
            }

            boolean isfull = false;
            if (qryVal.trim().isEmpty()) {
                sql = "SELECT * from " + tablename + " order by id desc limit 50;";  //查询语句
                isfull = true;
            } else {
                sql = "SELECT * from " + tablename + " order by id desc;";  //查询语句
            }

            ResultSet rSet = statement.executeQuery(sql);//搜索数据库，将搜索的放入数据集ResultSet中
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    CSqlitePub()
    {

    }
}
