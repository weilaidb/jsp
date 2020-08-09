package weilaidb.sql;

import com.commmon.SqlInterface;
//import python.PythonCommand;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JspAdapter {
    public static int lengthOfDelimiterPinYin() {
        return length_delimiter_pinyin;
    }

    static int length_delimiter_pinyin = 100;



    public static String getBasePath(javax.servlet.ServletContext application, HttpServletRequest request)
    {
        String app_basePath = application.getContextPath();
        String app_path = request.getContextPath();
        String app_docBase = application.getRealPath("/");
        String app_CurrentPath = request.getServletPath();
        String app_basePath2 = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + app_path + "/";
        System.out.println("app_path          :" + app_path);
        System.out.println("app_basePath      :" + app_basePath);
        System.out.println("app_basePath2     :" + app_basePath2);
        System.out.println("app_CurrentPath   :" + app_CurrentPath);
        System.out.println("getServletPath:" + request.getServletPath());
        return app_basePath;
    }


    static String dbNameShowUi = "showui";

    public static String getDbNameAllDb() {
        return dbNameAllDb;
    }

    static String dbNameAllDb = "alldb";
    static Map<String, String> mapTitle = new HashMap<String, String>();
    static int inittitleflag = 0;

    public static String getTableNameSingeItem() {
        return tableNameSingeItem;
    }

    static String tableNameSingeItem = "singleitem";

    public static String getTableNameAbc() {
        return tableNameAbc;
    }

    static String tableNameAbc = "abc";

    public static String getParaResult(HttpServletRequest request, String para)
    {
        String result = request.getParameter(para);
        if(null == result)
        {
            result="";
        }
        return  result;
    }

//    public static String getPythoncalcResult(String express)
//    {
//        String result = "";
//        try{
//            if(express != null && !express.trim().isEmpty())
//            {
//                result = PythonCommand.calcResult(express);
//            }
//        }catch (Exception e)
//        {
//            result = e.getMessage();
//        }
//
//        return  result;
//    }



    public static void initMapTitle() {
        if(inittitleflag == 1)
            return;
        mapTitle.put("almperf", "性能告警");
        mapTitle.put("codesets", "代码集(codesets)");
        mapTitle.put("csharp", "C#");
        mapTitle.put("dirinfo", "文件夹列表");
        mapTitle.put("ios", "IOS");
        mapTitle.put("java", "JAVA");
        mapTitle.put("linux_driver", "Linux驱动");
        mapTitle.put("pubuse", "公共使用");
        mapTitle.put("pupils", "儿童专用");
        mapTitle.put("python", "Python");
        mapTitle.put("qt", "QT");
        mapTitle.put("sendcmd", "发送命令");
        mapTitle.put("supertest", "超级测试");
        mapTitle.put("timeclock", "时钟时间");
        mapTitle.put("calc", "计算器");
        mapTitle.put("test", "测试项");
        mapTitle.put("language", "代码库");
        mapTitle.put("optmonitor", "光监控");

        /**
         * 支持查单项，从文件名来看
         * 文件名带 singleitem
         */
        mapTitle.put("singleitem_abc", "查单项");

        inittitleflag = 1;
    }

    public static String getJspTitleByKey(String key) {
        String tipsnotiltle = "没有找到";
        initMapTitle();
        String result = mapTitle.get(key);
        if(null == result)
        {
            result = tipsnotiltle;
        }
        return result;
    }

    public static String getDbShowUi()
    {
        return dbNameShowUi;
    }

    public static String jspInsertDataForDbShowUi(HttpServletRequest request, String tableName)
    {
        return jspInsertData(request, getDbShowUi(), tableName);
    }

    public static String jspInsertDataForDbShowUiWithPath(HttpServletRequest request, String app_CurrentPath)
    {
        String tableName = request.getParameter("tableName");
        if(tableName.trim().isEmpty()) {
            if(app_CurrentPath.contains("tableName="))
            {
                String[] inlist = app_CurrentPath.split("tableName=");
                if(inlist.length > 1)
                {
                    tableName = inlist[1].split("&")[0];
                }
                else
                {
                    tableName = jspGetTableNameByAppPath(app_CurrentPath);
                }
            }
            else {
                tableName = jspGetTableNameByAppPath(app_CurrentPath);
            }
        }
        else
        {
            tableName = jspGetTableNameByAppPath(app_CurrentPath);
        }
        return jspInsertData(request, getDbShowUi(), tableName);
    }

    public static String jspInsertDataForDbShowUiWithTablName(HttpServletRequest request, String tableName)
    {
        return jspInsertData(request, getDbShowUi(), tableName);
    }

    public static String jspGetTableNameByAppPath(String app_CurrentPath)
    {
        //    表名使用模块名
        String tableName = "";
        String[] list = app_CurrentPath.split("\\/");
        for (String str :
                list) {
//            System.out.println("-->" + str);
        }
        tableName = list[list.length > 1 ? list.length - 2:list.length].toLowerCase().replaceAll("\\/.*", "");
        System.out.println("tableName:" + tableName);

        return tableName;
    }

    public static String jspInsertData(HttpServletRequest request, String dbName, String tableName)
    {
        String filenames = "";
        String pinyin = "";
        String result = "数据为空";
        System.out.println("tablename:" + tableName);
        try {
            filenames = request.getParameter("insertfilename").replace("\n", "").trim();
            pinyin = request.getParameter("pinyin").replace("\n", "").trim();
            System.out.println("filenames:" +  filenames);
            System.out.println("pinyin   :" +  pinyin);

            if(!filenames.trim().isEmpty()) {
                SqlInterface inter = new SqlInterface();
                SqlProc.createTableName(dbName, tableName);
                result = inter.insertName(dbName, tableName, filenames, pinyin);
                result = new String(result.getBytes("gbk"), "utf-8");
            }
        } catch (Exception e) {
//        out.print("\n");
            result = e.getMessage();
        }
        return result;
    }

    //根据id号查找内容中带searkey的行
    public static String findLineTextByIdAndKey(String dbName, String tableName,String searchkey, String numname)
    {
        String result = "";
        System.out.println("tablename:" + tableName);
        System.out.println("numname:" + numname);

        //查找内容为空时，不处理
        if(searchkey.trim().isEmpty())
        {
            return result;
        }

        List<String> listContent = new ArrayList<>();
        listContent.clear();
        try {
//            searchkey = new String(searchkey.getBytes("gbk"), "utf-8");
//            searchkey = new String(searchkey.getBytes("utf-8"), "gbk");
//            System.out.println("searchkey1:" + new String(searchkey.getBytes("gbk"), "utf-8"));
//            System.out.println("searchkey2:" + new String(searchkey.getBytes("gbk"), "gbk"));
//            System.out.println("searchkey3:" + new String(searchkey.getBytes("utf-8"), "utf-8"));
//            System.out.println("searchkey4:" + new String(searchkey.getBytes("utf-8"), "gbk"));
            SqlInterface inter = new SqlInterface();
            SqlProc.queryDataId(dbName, tableName, numname,listContent);
            System.out.println("listContent size:" + listContent.size());
            if(listContent.size() > 0)
            {
                System.out.print("searchkey:" + searchkey);
                for (String item :
                        listContent) {
                    String[] listitem = item.split("\n");
                    System.out.println("listitem size:" + listitem.length);
                    for (String initem :
                            listitem) {
                        System.out.print("initem:" + initem);
                        //不区分大小写都查
                        if(initem.toLowerCase().contains(searchkey.toLowerCase()))
                        {
                            result += initem + "<br/>";
                        }
                    }
                }
            }
//            result = new String(result.getBytes("gbk"), "utf-8");
        } catch (Exception e) {
//        out.print("\n");
            result = e.getMessage();
        }
        return result;
    }
}
