package com.commmon;

import java.util.HashMap;
import java.util.Map;

public class ConverFromGBKToUTF8 {
    public static void main(String[] args) {
        try {
            ConverFromGBKToUTF8 convert = new ConverFromGBKToUTF8();
            String fullStr = convert.gbk2utf8("半角变拳脚,quanjiao ");

            System.out.println(fullStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private StringUtil chinese(String chinese) {
        StringUtil util = new StringUtil();
        char[] chars = chinese.toCharArray();
        int index = 0;
        StringBuffer buffer = new StringBuffer();
        for (char c : chars) {
            String temp = String.valueOf(c);
            if (temp.getBytes().length == 1) {
                util.map.put(index, temp);
            } else {
                buffer.append(temp);
            }
            index++;
        }
        util.chinese = buffer.toString();
        return util;
    }

    public String gbk2utf8(String chenese) {
        StringUtil strUtil = chinese(chenese);
        char c[] = strUtil.chinese.toCharArray();
        byte[] fullByte = new byte[3 * c.length];
        for (int i = 0; i < c.length; i++) {
            int m = (int) c[i];
            String word = Integer.toBinaryString(m);

            StringBuffer sb = new StringBuffer();
            int len = 16 - word.length();
            for (int j = 0; j < len; j++) {
                sb.append("0");
            }
            sb.append(word);
            sb.insert(0, "1110");
            sb.insert(8, "10");
            sb.insert(16, "10");

            String s1 = sb.substring(0, 8);
            String s2 = sb.substring(8, 16);
            String s3 = sb.substring(16);

            byte b0 = Integer.valueOf(s1, 2).byteValue();
            byte b1 = Integer.valueOf(s2, 2).byteValue();
            byte b2 = Integer.valueOf(s3, 2).byteValue();
            byte[] bf = new byte[3];
            bf[0] = b0;
            fullByte[i * 3] = bf[0];
            bf[1] = b1;
            fullByte[i * 3 + 1] = bf[1];
            bf[2] = b2;
            fullByte[i * 3 + 2] = bf[2];
        }
        String reutrnStr = null;
        try {
            reutrnStr = new String(fullByte, "UTF-8");
        } catch (Exception e) {
        }
        StringBuffer returnBuffer = new StringBuffer(reutrnStr);
        for (Map.Entry<Integer, String> entry : strUtil.map.entrySet()) {
            returnBuffer.insert(entry.getKey(), entry.getValue());
        }

        return returnBuffer.toString();
    }
}

class StringUtil {
    public String chinese;

    public Map<Integer, String> map = new HashMap<Integer, String>();
}
