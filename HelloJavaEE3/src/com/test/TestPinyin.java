package com.test;

import com.pinyin.PinYinUtil;

/**
 * ����ת����ƴ����
 */
public class TestPinyin {
    /**
     * ���Գ������
     * @param args
     */
    public static void main(String[] args) {
        PinYinUtil hanyuPinyinUtil = new PinYinUtil();
        System.out.println(hanyuPinyinUtil.toHanyuPinyin("���Ժ����ַ���,it's so nice"));
        System.out.println(hanyuPinyinUtil.toHanyuPinyin("������"));
    }
}
