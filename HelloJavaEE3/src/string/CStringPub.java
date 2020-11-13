package string;

import com.sun.deploy.net.HttpRequest;
import file.CFilePub;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class CStringPub {
    public static boolean isTrimEmpty(String string)
    {
        if(null == string)
        {
            string = "";
            return true;
        }
        return string.trim().isEmpty();
    }

    public static boolean isFull(String string)
    {
        return !isTrimEmpty(string);
    }
    //�Ƿ����
    public static boolean isContain(String org, String text, String casesensitive)
    {
        if(CStringPub.isTrimEmpty(casesensitive))
        {
            return org.trim().toLowerCase().contains(text.trim().toLowerCase());
        }
        return org.trim().contains(text.trim());
    }

    //�Ƿ���������ֶ��б����б���text�ո�����
    public static boolean isContainList(String org, String text, String casesensitive)
    {
        int num = 0;
        String [] findlist = text.split(" ");
        for (String item :
                findlist) {
            //�����ݣ��գ�����ʾ�����ִ�Сд
            if(CStringPub.isTrimEmpty(casesensitive))
            {
                if(org.trim().toLowerCase().contains(item.trim().toLowerCase()))
                {
                    num++;
                }
            }
            else
            {
                if(org.trim().contains(item.trim()))
                {
                    num++;
                }
            }
        }
        if(num == findlist.length)
        {
            return true;
        }
        return false;
    }



    public static String ifNullSetEmpty(String string)
    {
        if(null == string)
        {
            string = "";
        }
        return string.trim();
    }

    public static boolean isBufferTrimEmpty(StringBuffer buffer)
    {
        return buffer.toString().trim().isEmpty();
    }
    public static int splitBySignSize(String buffer, String sign)
    {
        return buffer.split(sign).length;
    }
    public static int splitByDouSize(String buffer)
    {
        return splitBySignSize(buffer,",");
    }

    public static String requesParaIfNullSetEmpty(HttpServletRequest request, String key)
    {
        return ifNullSetEmpty(request.getParameter(key));
    }

    public static String emptyString()
    {
        return "";
    }

    public static List<String> filterListEmpty(String[] list)
    {
        List<String> lResult = new ArrayList<String>();
        for (String item :
                list) {
            if(isTrimEmpty(item))
            {
                continue;
            }
            lResult.add(item);

        }
        return lResult;
    }


    public static String trimString(String buf)
    {
        return buf.trim();
    }
}