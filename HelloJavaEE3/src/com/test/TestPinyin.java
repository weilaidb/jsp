package com.test;

import com.pinyin.PinYinUtil;

/**
 * ººÓï×ª»»³ÉÆ´ÒôÀà
 */
public class TestPinyin {
    /**
     * ²âÊÔ³ÌĞòÈë¿Ú
     * @param args
     */
    public static void main(String[] args) {
        PinYinUtil hanyuPinyinUtil = new PinYinUtil();
        System.out.println(hanyuPinyinUtil.toHanyuPinyin("²âÊÔººÓï×Ö·û´®,it's so nice"));
        System.out.println(hanyuPinyinUtil.toHanyuPinyin("µ÷ÊÔÄØ"));
    }
}
