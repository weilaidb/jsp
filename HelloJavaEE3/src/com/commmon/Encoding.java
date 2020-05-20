package com.commmon;

import javax.swing.*;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

public class Encoding {
    public static String getEncoding(String str) {
        String encode = "";
        encode = "UTF-8";
        try {
            if (str.equals(new String(str.getBytes(encode), encode))) {
                String s2 = encode;
                return s2;
            }
        } catch (Exception exception2) {
        }
        encode = "GB2312";
        try {
            if (str.equals(new String(str.getBytes(encode), encode))) {
                String s = encode;
                return s;
            }
        } catch (Exception exception) {
        }
        encode = "ISO-8859-1";
        try {
            if (str.equals(new String(str.getBytes(encode), encode))) {
                String s1 = encode;
                return s1;
            }
        } catch (Exception exception1) {
        }

        encode = "GBK";
        try {
            if (str.equals(new String(str.getBytes(encode), encode))) {
                String s3 = encode;
                return s3;
            }
        } catch (Exception exception3) {
        }
        return "未识别编码格式";
    }

    public static String testStrUtf8()
    {
        return "您好，在吗？";
    }

    public static void gbk2utf8test() throws UnsupportedEncodingException {
        String t = "this is 中文";
        String gbk = new String(t.getBytes("gbk"), "gbk");
        System.out.println(gbk);

        String unicode = new String(gbk.getBytes("utf-8"), "utf-8");
        System.out.println(unicode);

        String utf8 = new String(gbk.getBytes("gbk"), "utf-8");
        System.out.println(utf8);

        String utf8t = new String(gbk.getBytes("utf-8"), "gbk");
        System.out.println(utf8t);

        String utf8s = new String(utf8t.getBytes("gbk"), "utf-8");
        System.out.println(utf8s);



    }

    public static void main(String[] args) throws UnsupportedEncodingException {
        //获取系统默认编码
        System.out.println("系统默认编码：" + System.getProperty("file.encoding")); //查询结果GBK
        //系统默认字符编码
        System.out.println("系统默认字符编码：" + Charset.defaultCharset()); //查询结果GBK
        //操作系统用户使用的语言
        System.out.println("系统默认语言：" + System.getProperty("user.language")); //查询结果zh

        System.out.println();

        String s1 = "hi, nice to meet you!";
        String s2 = "hi, 我来了！";

        System.out.println(getEncoding(s1));
        System.out.println(getEncoding(s2));

        gbk2utf8test();
    }


}
