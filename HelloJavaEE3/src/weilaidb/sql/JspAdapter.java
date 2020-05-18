package weilaidb.sql;

import com.commmon.SqlInterface;
import python.PythonCommand;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JspAdapter {
    static String dbNameShowUi = "showui";
    static Map<String, String> mapTitle = new HashMap<String, String>();
    static int inittitleflag = 0;

    public static String getParaResult(HttpServletRequest request, String para)
    {
        String result = request.getParameter(para);
        if(null == result)
        {
            result="";
        }
        return  result;
    }

    public static String getPythoncalcResult(String express)
    {
        String result = "";
        try{
            if(express != null && !express.trim().isEmpty())
            {
                result = PythonCommand.calcResult(express);
            }
        }catch (Exception e)
        {
            result = e.getMessage();
        }

        return  result;
    }



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
}
