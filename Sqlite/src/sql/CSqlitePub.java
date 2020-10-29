package sql;

import base.CStringPub;

import java.io.*;
import java.sql.*;

public class CSqlitePub {
    static String firstpath = "mydb/";
    static String secondpath = "sqlite/";
    static String filename = "config.txt";
    static int showlen = 100;

    //加载驱动
    static public StringBuffer loadSqliteClass(StringBuffer result)
    {
        try {
            Class.forName("org.sqlite.JDBC");  //Sqlite3驱动程序名
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            result.append(e);
        } finally {
        }

        return result;
    }
    //deal  order
    static public String procOrder(String order, String orderCondition)
    {
        if(order.trim().equals("order"))
        {
            orderCondition += " ORDER BY ID desc ";
        }
        return orderCondition;
    }

    //deal  limit
    static public String procLimit(String limit, String orderCondition)
    {
        if(limit.trim().equals("limit"))
        {
            orderCondition += " limit 50";
        }
        else
        {
            orderCondition += "";
        }
        return orderCondition;
    }

    //is show little
    static public boolean isShowLittle(String showlittle)
    {
        if(CStringPub.ifNullSetEmpty(showlittle).equals("showlittle"))
        {
            return true;
        }
        return false;
    }

    //query all
    static public StringBuffer procSelectAll(Connection con
            ,String tableName
            ,StringBuffer result
            ,String orderCondition
            ,String showlittle
    )
    {
        ResultSet rs = null;
        Statement sql = null;
        try{
            //表的所有列
            int 字段个数 = 0;
            DatabaseMetaData metadata = con.getMetaData();
            ResultSet rs1 = metadata.getColumns(null, null, tableName, null);
            result.append("<tr>");
            while (rs1.next()) {
                字段个数++;
                String columnName = rs1.getString(4);
                result.append("<td>" + columnName + "</td>");
            }
            result.append("</tr>");
            System.out.println("字段个数: " + 字段个数);

            sql = con.createStatement();
            rs = sql.executeQuery(orderCondition);
            while (rs.next()) {
                result.append("<tr>");
                for (int i = 1; i <= 字段个数; i++) {
                    procShowLittle(showlittle, i, rs,result);
                }
                result.append("</tr>");
            }
            result.append("</table>");
        } catch (SQLException e) {
            e.printStackTrace();
            result.append(e);
        }

        return result;
    }

    //query with findwords
    static public StringBuffer procFindWord(Connection con
            ,String tableName
            ,StringBuffer result
            ,String findwords
            ,String strCols
            ,String order
            ,String showlittle
    )
    {
        String orderCondition = null;
        ResultSet rs = null;
        Statement sql = null;
        try{
            int 字段个数 = 0;
            result.append("<tr>");
            String[] listStrCol = strCols.trim().split(",");
            for (String m_item :
                    listStrCol) {
                字段个数++;
                String columnName = m_item;
                result.append("<td>" + columnName + "</td>");
            }
            result.append("</tr>");
            System.out.println("字段个数: " + 字段个数);

            try {
                System.out.println("bf findwords: " + findwords);
                byte aa[] = findwords.getBytes("ISO-8859-1");
                System.out.println("mid findwords: " + new String(findwords.getBytes("ISO-8859-1")));
//                System.out.println("mid findwords: " + new String(findwords.getBytes("GBK")));
//                System.out.println("mid findwords: " + new String(findwords.getBytes("UTF-8")));
//                System.out.println("mid findwords: " + new String(findwords.getBytes("unicode")));
                findwords = new String(aa);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            System.out.println("in findwords: " + findwords);

            orderCondition  = "SELECT " + strCols + " FROM " + tableName ;
            orderCondition = procOrder(order, orderCondition);

            sql = con.createStatement();
            rs = sql.executeQuery(orderCondition);
            while (rs.next()) {
                String m_ColContentVal = rs.getString(2);
                if(!m_ColContentVal.toLowerCase().contains(findwords.trim().toLowerCase())){
                    continue;
                }
                result.append("<tr>");
                for (int i = 1; i <= 字段个数; i++) {
                    procShowLittle(showlittle, i, rs,result);
                }
                result.append("</tr>");
            }
            result.append("</table>");
        } catch (SQLException e) {
            e.printStackTrace();
            result.append(e);
        }

        return result;
    }

    static public void procShowLittle(String showlittle, int i, ResultSet rs, StringBuffer result)
    {
        try {
            if (CSqlitePub.isShowLittle(showlittle)) {
                String tempStr = rs.getString(i);
                tempStr = CStringPub.ifNullSetEmpty(tempStr);
                int strlen = tempStr.length();
                int minlen = strlen > showlen ? showlen : strlen;
                result.append("<td>" + tempStr.substring(0, minlen) + "</td>");
            } else {
                result.append("<td>" + rs.getString(i) + "</td>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    static public String getStoreDbFileName()
    {
        return "" + firstpath + secondpath  + firstpath;
    }

    static public String getSqlitePathFromFileSingle(String prefix)
    {
        StringBuffer str = new StringBuffer();
        try{
            File dir = new File(prefix + firstpath,secondpath);
            dir.mkdirs();
            File f = new File(dir,filename);
            if(!f.exists())
            {
                try {
                    f.createNewFile(); //如果文件不存在则创建文件
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return "";
            }
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
        String dbPath = getSqlitePathFromFile();
        try {
//            byte bb[] = dbPath.getBytes("ISO-8859-1");
//        byte bb[] = dbPath.getBytes("GBK");
        byte bb[] = dbPath.getBytes("UTF-8");
//        byte bb[] = dbPath.getBytes("unicode");
            dbPath = new String(bb);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        
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
        String prefix = "jdbc:sqlite:";
        if(false == database.trim().contains(prefix))
        {
            return  prefix + database;
        }
        return database;
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
