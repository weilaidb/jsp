package string;

//import com.sun.deploy.net.HttpRequest;
import com.sun.org.apache.xerces.internal.xs.StringList;
import file.CFilePub;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

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
            //无内容（空），表示不区分大小写
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

    public static boolean stringLenOk(String buf)
    {
        return buf.trim().length() > 0;
    }

    public static void removeDuplicate(List<String> list) {
        HashSet<String> set = new HashSet<String>(list.size());
        List<String> result = new ArrayList<String>(list.size());
        for (String str : list) {
            if (set.add(str)) {
                result.add(str);
            }
        }
        list.clear();
        list.addAll(result);
    }

    public static String list2String(List<String> list, String sign)
    {
        String result = "";
        for (String str :
                list) {
            result = result.concat(str).concat(sign);
        }
        return result;
    }

    public static String list2StringEnter(List<String> list)
    {
        return list2String(list,"\n");
    }

    public static List<String> string2List(String str, String sign)
    {
        String[] arr = str.split(sign);
        return new ArrayList<String>(Arrays.asList(arr));
    }

    public static List<String> string2ListEnter(String str)
    {
        return string2List(str,"\n");
    }
    public static List<String> string2ListBr(String str)
    {
        return string2List(str,"<br>");
    }
    public static String procStringDoubleSign(String str)
    {
        return str.replaceAll("\"", "\\\"")
                .replaceAll("/", "\\/");
    }

    public static List<String> listSort(String[] array)
    {
        List<String> newListSets = new ArrayList<>(Arrays.asList(array));
        //集合默认按字符升序排序
        Collections.sort(newListSets);

        return newListSets;
    }

    public static List<String> listSortUniq(String[] array)
    {
        List<String> arrayList = new ArrayList<>(Arrays.asList(array));
        return listSortUniq(arrayList);
    }

    public static List<String> listSortUniq(List<String> inputList)
    {
        List<String> templist = new ArrayList<String>();
        for (String string : inputList) {
            String strim = string.trim();
            //如何templist中没有则添加
            if (!templist.contains(strim)) {
                templist.add(strim);
            }
        }

        //集合默认按字符升序排序
        Collections.sort(templist);

        return templist;
    }

    public static String stringSortUniqByEnter(String inputStr)
    {
        String result = "";
        List<String> tempList = string2ListEnter(inputStr);
        tempList = listSortUniq(tempList);
        result = list2StringEnter(tempList);

        return result;
    }

    public static String stringFilterSigns(String orgStr, String s1, String s2)
    {
        String result=  "";
        List<String> list = new ArrayList<>(Arrays.asList(orgStr.split("<br>")));
        if(list.size() == 1)
        {
            list = new ArrayList<>(Arrays.asList(orgStr.split("\n")));
        }

        for (String str :
                list) {
            str = str.trim();
            if(str.length() > 1
                    && (str.subSequence(0,1).equals(s1)
                    || str.subSequence(str.length() - 2, str.length() - 1) == s2))
            {
                continue;
            }
            result = result.concat(str);
            result = result.concat("\n");
        }

        return result;
    }

}