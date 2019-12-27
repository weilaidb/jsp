package com.commmon;

import java.io.UnsupportedEncodingException;
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
    String dbName_alldb = "alldb";
    String tableName_abc = "abc";

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
                name = rs.getString(2);
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
        //排列方式
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

    public String getCombineFirstInterger(String item)
    {
        String[] splitlst = item.split("\\s+", 2);
        if(splitlst.length < 2)
        {
            return "";
        }
        return  splitlst[0].trim();
    }
    public String getGbkSign(String code)
    {
        try {
            return new String(code.getBytes("iso-8859-1"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }

    public String checkStringContainKeyList(String content, String key)
    {
        String result = "";
        String[] qrylst = key
                .replace("\"", "\\\"")
                .split(" ");
        int count = 0;
        for (int lp = 0; lp < qrylst.length; lp++) {
            try {
                //查找出来的数据编码已经是utf-8
                String itemkey = new String(qrylst[lp].getBytes("iso-8859-1"), "utf-8");
//                System.out.println("itemkey:"  + itemkey);
//                System.out.println("content:"  + content);
                if(!content.contains(itemkey))
                {
                    break;
                }
                count++;
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        if(count == qrylst.length)
        {
            result = "containall";
        }

        return result;
    }


    public List<String> getAllDescByKey(String dbName, String tableName, String key)
    {
        if(key.trim().isEmpty())
        {
            return getAllDesc(dbName, tableName, "");
        }
        List<String> reslist = new ArrayList<>();
        List<String> openlist = getAllDesc(dbName, tableName, "");
        String result = "";
        for (String openitem :
                openlist) {
            sql = "SELECT * FROM egtable where id = egid";
            sql = sql.replaceAll("egtable", tableName_abc);
            if(getCombineFirstInterger(openitem).trim().isEmpty())
            {
                continue;
            }
            sql = sql.replaceAll("egid", getCombineFirstInterger(openitem));
            //从alldb中查找数据
            result = getSqlResult(dbName_alldb, tableName_abc, sql, 3);
            if(checkStringContainKeyList(result, key).trim().isEmpty())
            {
                continue;
            }
            reslist.add(openitem);
        }

        return  reslist;
    }
    //获取sql执行结果
    public String getSqlResult(String dbName, String tableName, String sql, int columnindex)
    {
        String result = "";
        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName), DBUSER, DBPASS);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                name = rs.getString(columnindex);
                result += name;
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
        return result;
    }

    public List<String> getAllDesc(String dbName, String tableName, String colname)
    {
        List<String> reslist = new ArrayList<>();
        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName), DBUSER, DBPASS);
            sql = "SELECT * FROM egtable order by id";
            if (colname.trim().isEmpty()) {
                sql = "SELECT * FROM egtable order by id";
            } else {
                sql = "SELECT * FROM egtable order by id";
                sql = sql.replaceAll("\\*", colname);
            }
            sql = sql.replaceAll("egtable", tableName);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                name = rs.getString(2);
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
        //排列方式
        Collections.sort(reslist,new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                if(o1 == null || o2 == null){
                    return -1;
                }
//                if(o1.length() > o2.length()){
//                    return 1;
//                }
//                if(o1.length() < o2.length()){
//                    return -1;
//                }
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

    public List<String> getAllDescOrderByTime(String dbName, String tableName, String colname) {
        List<String> reslist = new ArrayList<>();
        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName), DBUSER, DBPASS);
            sql = "SELECT * FROM egtable order by id desc ";
            if (colname.trim().isEmpty()) {
                sql = "SELECT * FROM egtable order by id desc ";
            } else {
                sql = "SELECT * FROM egtable order by id desc ";
                sql = sql.replaceAll("\\*", colname);
            }
            sql = sql.replaceAll("egtable", tableName);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                name = rs.getString(2);
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
//        //排列方式
//        Collections.sort(reslist,new Comparator<String>() {
//            @Override
//            public int compare(String o1, String o2) {
//                if(o1 == null || o2 == null){
//                    return -1;
//                }
////                if(o1.length() > o2.length()){
////                    return 1;
////                }
////                if(o1.length() < o2.length()){
////                    return -1;
////                }
//                if(o1.compareTo(o2) > 0){
//                    return 1;
//                }
//                if(o1.compareTo(o2) < 0){
//                    return -1;
//                }
//                if(o1.compareTo(o2) == 0){
//                    return 0;
//                }
//                return 0;
//            }
//        });

        return reslist;
    }


    public String insertName(String dbName, String tableName, String files) {
        String resstr = "写入成功!";
        String resfail = "写入失败!";
        String resempty = "数据为空!";

        try {
            if(files.trim().isEmpty())
            {
                return resempty;
            }
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
                sql = "insert into egtable values(NULL, \"filexxx\");";
                sql = sql.replace("egtable", tableName)
                        .replace("filexxx", str);
//                System.out.println(sql);
                pstmt = conn.prepareStatement(sql);
                pstmt.execute();
            }
        } catch (Exception e) {
            System.out.print(e);
            resfail += e.getMessage();
            resstr = resfail;
        } finally {
            try {
                rs.close();
                pstmt.close();
                conn.close();
            } catch (Exception e) {

            }
        }

        return resstr;
    }

    public String deleteName(String dbName, String tableName, String file) {
        String resstr = "删除成功!";
        String resfail = "删除失败!";
        String resempty = "数据为空!";

        try {
            if(file.trim().isEmpty())
            {
                return resempty;
            }
            Class.forName(DBDRIVER);
            //            创建数据库,需要手动创建呢
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName), DBUSER, DBPASS);
//            创建数据库名称和表必须在首先创建出来。
//            file = new String(file.getBytes("iso-8859-1"), "utf-8");

            file = file.replace("\\", "\\\\")
                        .replace("\"", "\"\"");
            sql = "delete from egtable where name=\"filexxx\"";
            sql = sql.replace("egtable", tableName)
                    .replace("filexxx", file);
                System.out.println(sql);
            pstmt = conn.prepareStatement(sql);
            pstmt.execute();

        } catch (Exception e) {
            System.out.print(e);
            resfail += e.getMessage();
            resstr = resfail;
        } finally {
            try {
                rs.close();
                pstmt.close();
                conn.close();
            } catch (Exception e) {

            }
        }

        return resstr;
    }
}
