package codec;

import java.io.UnsupportedEncodingException;

public class CCodecPub {
    //源码是UTF-8，编码成GBK
    static public String UTF8ToGBK(String textContent)
    {
        try {
            return new String(textContent.getBytes("GBK"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return e.toString();
        }
    }


}
