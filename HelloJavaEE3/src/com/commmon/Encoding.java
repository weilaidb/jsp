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
        return "δʶ������ʽ";
    }

    public static String testStrUtf8()
    {
        return "���ã�����";
    }

    public static void gbk2utf8test() throws UnsupportedEncodingException {
        String t = "this is ����";
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
        //��ȡϵͳĬ�ϱ���
        System.out.println("ϵͳĬ�ϱ��룺" + System.getProperty("file.encoding")); //��ѯ���GBK
        //ϵͳĬ���ַ�����
        System.out.println("ϵͳĬ���ַ����룺" + Charset.defaultCharset()); //��ѯ���GBK
        //����ϵͳ�û�ʹ�õ�����
        System.out.println("ϵͳĬ�����ԣ�" + System.getProperty("user.language")); //��ѯ���zh

        System.out.println();

        String s1 = "hi, nice to meet you!";
        String s2 = "hi, �����ˣ�";

        System.out.println(getEncoding(s1));
        System.out.println(getEncoding(s2));

        gbk2utf8test();
    }


}
