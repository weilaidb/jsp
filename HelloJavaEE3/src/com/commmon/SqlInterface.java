package com.commmon;

import com.pinyin.PinYinUtil;
import weilaidb.CSqlitePub;
import weilaidb.sql.JspAdapter;
import weilaidb.sql.SqlProc;

import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.*;


public class SqlInterface {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String name = null;
    Statement stmt = null;
    String sql = "";
    String dbName_alldb = "alldb";
    String tableName_abc = "abc";

    public static final String DBDRIVER = "org.sqlite.JDBC";
    public static final String DBURL = SqlProc.getDbPathDefaultWithDriver("mldn") ; //数据库名";
//    public static final String DBUSER = "root";
//    public static final String DBPASS = "Zzerp123";

    //我么要执行创建表的DDl语句
    public static String creatsql = "create table egtable (name varchar(4096))  ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8";

    //获取最新索引号
    public Integer getMaxId(String dbName, String tableName) {
        Integer maxid = 0;
        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName));
            sql = "SELECT max(id) FROM egtable";
            sql = sql.replaceAll("egtable", tableName);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                maxid = rs.getInt(1);
                break;
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
        return maxid;
    }


    public List<String> getAll(String dbName, String tableName, String colname) {
        List<String> reslist = new ArrayList<>();
        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName));
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
        Collections.sort(reslist, new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                if (o1 == null || o2 == null) {
                    return -1;
                }
                if (o1.length() > o2.length()) {
                    return 1;
                }
                if (o1.length() < o2.length()) {
                    return -1;
                }
                if (o1.compareTo(o2) > 0) {
                    return 1;
                }
                if (o1.compareTo(o2) < 0) {
                    return -1;
                }
                if (o1.compareTo(o2) == 0) {
                    return 0;
                }
                return 0;
            }
        });

        return reslist;
    }

    public String getCombineFirstInterger(String item) {
        String[] splitlst = item.split("\\s+", 2);
        if (splitlst.length < 2) {
            return "";
        }
        return splitlst[0].trim();
    }

    public static String getGbkSign(String code) {
        try {
            return new String(code.getBytes("iso-8859-1"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }

    public static String getUtf8Sign(String code) {
        try {
            return new String(code.getBytes("iso-8859-1"), "GBK");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }

    public static String getUtf8toGbkSign(String code) {
        try {
            return new String(code.getBytes("utf-8"), "GBK");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }

    public static String getUtf8to8859Sign(String code) {
        try {
            return new String(code.getBytes("utf-8"), "iso-8859-1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }


    public static String getGbk2UTF8(String code) {
        try {
            return new String(code.getBytes("GBK"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     *      * unicode转中文
     *      * @param  str
     *      * @return 中文
     *     
     */
    public static String Unicode2GBK(String dataStr) {
        int index = 0;
        StringBuffer buffer = new StringBuffer();
        while (index < dataStr.length()) {
            if (!"//u".equals(dataStr.substring(index, index + 2))) {
                buffer.append(dataStr.charAt(index));
                index++;
                continue;
            }
            String charStr = "";
            charStr = dataStr.substring(index + 2, index + 6);
            char letter = (char) Integer.parseInt(charStr, 16);
            buffer.append(letter);
            index += 6;
        }
        return buffer.toString();
    }

    public String checkStringContainKeyList(String content, String key) {
        String result = "";
        String[] qrylst = key
                .replace("\"", "\\\"")
                .split(" ");
        int count = 0;
        for (int lp = 0; lp < qrylst.length; lp++) {
            //查找出来的数据编码已经是utf-8
//                String itemkey = new String(qrylst[lp].getBytes("iso-8859-1"), "utf-8");
            String itemkey = qrylst[lp];
//                System.out.println("itemkey:"  + itemkey);
//                System.out.println("content:"  + content);
            if (!content.toLowerCase().contains(itemkey.toLowerCase())) {
                break;
            }
            count++;
        }

        if (count == qrylst.length) {
            result = "containall";
        }

        return result;
    }


    public List<String> getAllDescByKey(String dbName, String tableName, String key) {
        if (key.trim().isEmpty()) {
            return getAllDesc(dbName, tableName, "");
        }
        List<String> reslist = new ArrayList<>();
        List<String> openlist = getAllDesc(dbName, tableName, "");
        String result = "";
        for (String openitem :
                openlist) {
            sql = "SELECT * FROM egtable where id = egid";
            sql = sql.replaceAll("egtable", tableName_abc);
            if (getCombineFirstInterger(openitem).trim().isEmpty()) {
                continue;
            }
            sql = sql.replaceAll("egid", getCombineFirstInterger(openitem));
            if (!checkStringContainKeyList(openitem, key).trim().isEmpty()) {

            } else {
                //从alldb中查找数据
                result = getSqlResult(dbName_alldb, tableName_abc, sql, 3);
                if (checkStringContainKeyList(result, key).trim().isEmpty()) {
                    continue;
                }
            }
            reslist.add(openitem);
        }

        return reslist;
    }

    //获取sql执行结果
    public String getSqlResult(String dbName, String tableName, String sql, int columnindex) {
        String result = "";
        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName));
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

    public List<String> getAllDesc(String dbName, String tableName, String colname) {
        List<String> reslist = new ArrayList<>();
        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName));
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
        Collections.sort(reslist, new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                if (o1 == null || o2 == null) {
                    return -1;
                }
//                if(o1.length() > o2.length()){
//                    return 1;
//                }
//                if(o1.length() < o2.length()){
//                    return -1;
//                }
                if (o1.compareTo(o2) > 0) {
                    return 1;
                }
                if (o1.compareTo(o2) < 0) {
                    return -1;
                }
                if (o1.compareTo(o2) == 0) {
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
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName));
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



    public String execsqlcmd(String dbName, String tableName, String sql,String resstr, String resfail) {
        try {
            Class.forName(DBDRIVER);
            //            创建数据库,需要手动创建呢
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName));
//            创建数据库名称和表必须在首先创建出来。替换通用表名
            sql = sql.replace("egtable", tableName);
            System.out.println("sql:" + sql);
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


    public String insertName(String dbName, String tableName, String files, String pinyin) {
        String resstr = "写入成功!";
        String resfail = "写入失败!";
        String resempty = "数据为空!";

        char[] ch = new char[JspAdapter.lengthOfDelimiterPinYin()];
        Arrays.fill(ch, ' ');
        String spacechs = new String(ch);

        try {
            if (files.trim().isEmpty()) {
                return resempty;
            }
            Class.forName(DBDRIVER);
            //            创建数据库,需要手动创建呢
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName));
//            创建数据库名称和表必须在首先创建出来。
//            files = new String(files.getBytes("iso-8859-1"), "utf-8");
            String[] filelist = files.split("\n");
            for (String str :
                    filelist) {
//                str = str.replace("\\", "\\\\")
//                        .replace("\"", "\"\"");
                str = str.replace("\"", "\"\"");

                //关键字为空时，null, 或"null" ，不需要带拼音
                if ((null == pinyin) || pinyin.equals("null") || pinyin.trim().isEmpty()) {
                    PinYinUtil hanyuPinyinUtil = new PinYinUtil();
                    str += spacechs;
                    str += hanyuPinyinUtil.toHanyuPinyin(str);
                }
                //此处数据库表增加两列（创建时间，更新时间）
//                sql = "insert into egtable values(NULL, \"filexxx\");";
//                sql = "insert into egtable values(NULL, \"filexxx\", NULL, NULL);";
                sql = "insert into egtable values(NULL, \"filexxx\", NULL, NULL);";
                sql = sql.replace("egtable", tableName)
                        .replace("filexxx", str);
                System.out.println("sql:" + sql);
                pstmt = conn.prepareStatement(sql);
                pstmt.execute();
            }
        } catch (Exception e) {
            String resstr_addcolumn = "表添加列写入成功!";
            String resfail_addcolumn = "表添加列写入失败!";
            System.out.print(e);
            resfail += e.getMessage();
//            String addcolumncreatetimesql = "alter table egtable add COLUMN `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create time';";
//            String addcolumnupdatetimesql = "alter table egtable add COLUMN `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time';";
//            resfail +=  execsqlcmd(dbName, tableName,addcolumncreatetimesql, resstr_addcolumn, resfail_addcolumn);;
//            resfail +=  execsqlcmd(dbName, tableName,addcolumnupdatetimesql, resstr_addcolumn, resfail_addcolumn);;
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
            if (file.trim().isEmpty()) {
                return resempty;
            }
            Class.forName(DBDRIVER);
            //            创建数据库,需要手动创建呢
            conn = DriverManager.getConnection(DBURL.replaceAll("mldn", dbName));
//            创建数据库名称和表必须在首先创建出来。
//            file = new String(file.getBytes("iso-8859-1"), "utf-8");

//            file = file.replace("\\", "\\\\")
//                    .replace("\"", "\"\"");
            file = file.replace("\"", "\"\"");
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
