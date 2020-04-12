package com.test;

import com.encoding.EncodeUtil;

public class TestEncoding {
    public static void main(String[] args) {
        printf("niahaoma");
        String str = "鶴込蒙。。。";
        printf(str);
        printf(EncodeUtil.utf8togbk(str));
        printf(EncodeUtil.gbk2utf8(str));

    }

    public static void printf(String s)
    {
        System.out.println(s);
    }
}
