package com.commmon;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 处理字符串过滤
 * judgecontainleastitembyspace:被空格分隔的内容至少有的项数
 */
public class CharacterFilter {
    public static List<String> gotHeaderSameList(List<String> openlist
            , String containkey
            ,int judgecontainleastitembyspace
            ,boolean bhttpresultflag
    )
    {
        List<String> httpreslist = new ArrayList<>();
        httpreslist.clear();
        List<String> otherreslist = new ArrayList<>();
        otherreslist.clear();
        if((null == openlist) && (0 == openlist.size()))
        {
            return httpreslist;
        }

        for (String str :
                openlist) {
            /**
             * 特殊判断,被符号分隔的数量
             */
            if(strBySpaceNum(str, judgecontainleastitembyspace + 1)
                    < judgecontainleastitembyspace)
            {
                continue;
            }
            if(strBySpaceIndex(str,judgecontainleastitembyspace + 1
                    ,1).startsWith(containkey))
            {
                httpreslist.add(str);
            }
            else
            {
                otherreslist.add(str);
                System.out.println("no found, str:"+str +",key:" + containkey);
            }
        }

        if(bhttpresultflag)
        {
            return httpreslist;
        }
        else
        {
            return otherreslist;
        }
    }

    public static int strBySpaceNum(String orgstr,int limitnum)
    {
        int num = 0;
        String[] splitlst = orgstr.split("\\s+", limitnum);
        num = splitlst.length;
        System.out.println("strBySpaceNum:" + num + ", orgstr:" + orgstr);
        return num;
    }

    public static String strBySpaceIndex(String orgstr,int limitnum, int index)
    {
        String resstr = "";
        String[] splitlst = orgstr.split("\\s+", limitnum);
        if(index >= splitlst.length)
        {
            return resstr;
        }
        return splitlst[index];
    }

    public static String sameCharNums(String chr,int num)
    {
        return new String(new char[num]).replace("\0", chr);
    }


}
