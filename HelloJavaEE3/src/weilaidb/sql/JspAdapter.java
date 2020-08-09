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
        mapTitle.put("almperf", "���ܸ澯");
        mapTitle.put("codesets", "���뼯(codesets)");
        mapTitle.put("csharp", "C#");
        mapTitle.put("dirinfo", "�ļ����б�");
        mapTitle.put("ios", "IOS");
        mapTitle.put("java", "JAVA");
        mapTitle.put("linux_driver", "Linux����");
        mapTitle.put("pubuse", "����ʹ��");
        mapTitle.put("pupils", "��ͯר��");
        mapTitle.put("python", "Python");
        mapTitle.put("qt", "QT");
        mapTitle.put("sendcmd", "��������");
        mapTitle.put("supertest", "��������");
        mapTitle.put("timeclock", "ʱ��ʱ��");
        mapTitle.put("calc", "������");
        mapTitle.put("test", "������");
        mapTitle.put("language", "�����");
        mapTitle.put("optmonitor", "����");

        /**
         * ֧�ֲ鵥����ļ�������
         * �ļ����� singleitem
         */
        mapTitle.put("singleitem_abc", "�鵥��");

        inittitleflag = 1;
    }

    public static String getJspTitleByKey(String key) {
        String tipsnotiltle = "û���ҵ�";
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
        //    ����ʹ��ģ����
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
        String result = "����Ϊ��";
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

    //����id�Ų��������д�searkey����
    public static String findLineTextByIdAndKey(String dbName, String tableName,String searchkey, String numname)
    {
        String result = "";
        System.out.println("tablename:" + tableName);
        System.out.println("numname:" + numname);

        //��������Ϊ��ʱ��������
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
                        //�����ִ�Сд����
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
