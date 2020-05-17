package weilaidb.sql;

import com.commmon.SqlInterface;

import javax.servlet.http.HttpServletRequest;

public class JspAdapter {
    static String dbNameShowUi = "showui";

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
        String tableName = app_CurrentPath.toLowerCase().substring(1)
                .replaceAll("\\/.*", "");
        return jspInsertData(request, getDbShowUi(), tableName);
    }



    public static String jspInsertData(HttpServletRequest request, String dbName, String tableName)
    {
        String filenames = "";
        String result = "Êý¾ÝÎª¿Õ";
        System.out.println("tablename:" + tableName);
        try {
            filenames = request.getParameter("insertfilename").replace("\n", "").trim();
            if(!filenames.trim().isEmpty()) {
                SqlInterface inter = new SqlInterface();
                SqlProc.createTableName(dbName, tableName);
                result = inter.insertName(dbName, tableName, filenames);
                result = new String(result.getBytes("gbk"), "utf-8");
            }
        } catch (Exception e) {
//        out.print("\n");
        }
        return result;
    }
}
