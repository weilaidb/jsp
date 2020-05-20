package com.timedate;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;

public class DateTimePub {
    public static String getTimestr() {
        return timestr;
    }

    static String timestr = "time ";
    public static String getCurrentDateTime()
    {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
        return (df.format(new Date()));// new Date()为获取当前系统时间
    }

    public static String getCurrentDateTimeOneLine()
    {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
        return mulLine(1) + (df.format(new Date()));// new Date()为获取当前系统时间
    }

    public static String getCurrentDateTimeMultiLine()
        {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
        return mulLine(3) + (df.format(new Date()));// new Date()为获取当前系统时间
    }

    public static String getCurrentDateTimeMultiLine(int linenum)
    {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
        return mulLine(linenum) + (df.format(new Date()));// new Date()为获取当前系统时间
    }


    public static String mulLine(int num)
    {
        return String.join("\n", Collections.nCopies(num,"\n"));
    }

    public static String mulLineTitleNum(int num)
    {
        String result = "\n";
        for(int i = 1;i <= num; i++)
        {
            result+= Integer.toString(i) + " : " + "\n";
        }
        return result;
    }
}
