package com.commmon;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class SqlInterface {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String name = null;

    public static final String DBDRIVER = "com.mysql.jdbc.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/mldn?useUnicode=true&characterEncoding=utf-8"; //数据库名";
    public static final String DBUSER = "root";
    public static final String DBPASS = "Zzerp123";


    public List<String> getAll(String dbName, String tableName ,String colname)
    {
        List<String> reslist=new ArrayList<>();

        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName), DBUSER, DBPASS);
            String sql = "";
            sql = "SELECT * FROM egtable";
            if (colname.trim().isEmpty()) {
                sql = "SELECT * FROM egtable";
            } else {
                sql = "SELECT * FROM egtable";
                sql = sql.replaceAll("\\*", colname);
            }
            sql = sql.replaceAll("egtable", tableName);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                name = rs.getString(1);
                reslist.add(name);
            }
        } catch (Exception e) {
            System.out.print(e);
        } finally {
            try {
                rs.close();
                pstmt.close();
                conn.close();
            } catch (Exception e) {

            }
        }

        return reslist;
    }

    public int insertName(String dbName, String tableName ,String files)
    {
        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName), DBUSER, DBPASS);
            String sql = "";
            files = new String(files.getBytes("iso-8859-1"), "utf-8");
            String[] filelist = files.split("\n");
            for (String str :
                    filelist) {
                str = str.replace("\\", "\\\\");
                str = str.replace("\"", "\"\"");
                sql = "insert into egtable values('filexxx');";
                sql = sql.replace("egtable", tableName);
                sql = sql.replace("filexxx", str);
//                System.out.println(sql);
                pstmt = conn.prepareStatement(sql);
                pstmt.execute();
            }
        } catch (Exception e) {
            System.out.print(e);
        } finally {
            try {
                rs.close();
                pstmt.close();
                conn.close();
            } catch (Exception e) {

            }
        }

        return 0;
    }
}
