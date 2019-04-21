package com.commmon;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;


public class SqlInterface {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String name = null;
    Statement stmt = null;
    String sql = "";

    public static final String DBDRIVER = "com.mysql.jdbc.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/mldn?useUnicode=true&characterEncoding=utf-8"; //数据库名";
    public static final String DBUSER = "root";
    public static final String DBPASS = "Zzerp123";

    //我么要执行创建表的DDl语句
    public static String creatsql = "create table egtable (name varchar(4096))  ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8";


    public List<String> getAll(String dbName, String tableName, String colname) {
        List<String> reslist = new ArrayList<>();
        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName), DBUSER, DBPASS);
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

        Collections.sort(reslist,new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                if(o1 == null || o2 == null){
                    return -1;
                }
                if(o1.length() > o2.length()){
                    return 1;
                }
                if(o1.length() < o2.length()){
                    return -1;
                }
                if(o1.compareTo(o2) > 0){
                    return 1;
                }
                if(o1.compareTo(o2) < 0){
                    return -1;
                }
                if(o1.compareTo(o2) == 0){
                    return 0;
                }
                return 0;
            }
        });

        return reslist;
    }

    public int insertName(String dbName, String tableName, String files) {

        try {
            Class.forName(DBDRIVER);
            //            创建数据库,需要手动创建呢
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName), DBUSER, DBPASS);
//            创建数据库名称和表必须在首先创建出来。
            files = new String(files.getBytes("iso-8859-1"), "utf-8");
            String[] filelist = files.split("\n");
            for (String str :
                    filelist) {
                str = str.replace("\\", "\\\\")
                        .replace("\"", "\"\"");
                sql = "insert into egtable values('filexxx');";
                sql = sql.replace("egtable", tableName)
                        .replace("filexxx", str);
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
