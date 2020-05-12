package com.test;

import com.pinyin.PinYinUtil;
import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;
import org.apache.log4j.Logger;

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
    }
}
