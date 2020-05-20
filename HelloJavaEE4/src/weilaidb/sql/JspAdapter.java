package weilaidb.sql;

//import com.commmon.SqlInterface;
//import python.PythonCommand;

import python.PythonCommand;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JspAdapter {
//    static String dbNameShowUi = "showui";
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

}
