package weilaidb;

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
                //ֻȡ��һ��
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

    //��ѯ���ݿ����(Ĭ��)
    static public String qrySqliteDefault(String tablename, String qryVal) {
        String result = "";
        String sql = "";  //��ѯ���
        Connection connection = null;
        try {
            Class.forName("org.sqlite.JDBC");
            String dbpath = CSqlitePub.getSqliteWholePath();
            connection = DriverManager.getConnection(dbpath);
            Statement statement = connection.createStatement();   //�������Ӷ�����Java��һ���������ݿ����Ҫ�ӿ�

            if (tablename.trim().isEmpty()) {
                tablename = "c_table";
            }

            boolean isfull = false;
            if (qryVal.trim().isEmpty()) {
                sql = "SELECT * from " + tablename + " order by id desc limit 50;";  //��ѯ���
                isfull = true;
            } else {
                sql = "SELECT * from " + tablename + " order by id desc;";  //��ѯ���
            }

            ResultSet rSet = statement.executeQuery(sql);//�������ݿ⣬�������ķ������ݼ�ResultSet��
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
