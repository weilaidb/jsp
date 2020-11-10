package string;

import com.sun.deploy.net.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    //是否包含
    public static boolean isContain(String org, String text, String casesensitive)
    {
        if(CStringPub.isTrimEmpty(casesensitive))
        {
            return org.trim().toLowerCase().contains(text.trim().toLowerCase());
        }
        return org.trim().contains(text.trim());
    }

    //是否包含查找字段列表，列表由text空格来分
    public static boolean isContainList(String org, String text, String casesensitive)
    {
        int num = 0;
        String [] findlist = text.split(" ");
        for (String item :
                findlist) {
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

}