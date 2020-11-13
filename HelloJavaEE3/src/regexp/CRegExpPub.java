package regexp;

import string.CStringPub;

import java.util.regex.*;

public class CRegExpPub {

    public static String procPatterInfo(String bf, String pattern, String af)
    {
        System.out.println("bf:" + bf);
        System.out.println("pattern:" + pattern);
        System.out.println("af:" + af);

        String result = CStringPub.emptyString();
        String[] list = bf.split("\\n");
        System.out.println("list.length:" + list.length);
        for (String line :
                list) {
            System.out.println("line:" + line);
            // 创建 Pattern 对象
            Pattern r = Pattern.compile(pattern);
            // 现在创建 matcher 对象
            Matcher m = r.matcher(line);
            System.out.println("groupCount: " + m.groupCount() );
            if(1 == m.groupCount())
            {
                result += line + "\n";
            }
            else {
                if (m.find()) {
                    for (int i = 0; i < m.groupCount(); i++) {
                        System.out.println("Found value[" + i + "]: " + m.group(i));
                    }
//                    System.out.println("Found value: " + m.group(1));
//                    System.out.println("Found value: " + m.group(2));
//                    System.out.println("Found value: " + m.group(3));
                } else {
                    System.out.println("NO MATCH");
                }
            }
        }
        return result;
    }


    public static void main( String args[] ){

        // 按指定模式在字符串查找
        String line = "This order was placed for QT3000! OK?";
        String pattern = "(\\D*)(\\d+)(.*)";

        // 创建 Pattern 对象
        Pattern r = Pattern.compile(pattern);

        // 现在创建 matcher 对象
        Matcher m = r.matcher(line);
        if (m.find( )) {
            System.out.println("Found value: " + m.group(0) );
            System.out.println("Found value: " + m.group(1) );
            System.out.println("Found value: " + m.group(2) );
            System.out.println("Found value: " + m.group(3) );
        } else {
            System.out.println("NO MATCH");
        }
    }

}
