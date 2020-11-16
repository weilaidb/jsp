package regexp;

import string.CStringPub;

import java.util.regex.*;

import static java.util.regex.Matcher.quoteReplacement;

public class CRegExpPub {
    //处理特别字符串
    public static String procSpecialSignReplace(String str)
    {
        return str.replace("$NL", "\n")
                .replace("$TB", "    ");
    }

    //反处理特别字符串
    public static String procSpecialSignReplacerevert(String str)
    {
        return str.replace("\r\n", "$NL")
                .replace("\n", "$NL")
                .replace("    ", "$TB");
    }

    public static String procPatternInfo(String bf, String pattern, String af) {
        //正则表达式使用字符解析和从网页中获取的数据解析，发现不一样
        //原来从网页获取的长度多了1个字节，原来是换行
        //查看pattern后的长度是 pattern.length()
        af = CStringPub.trimString(af);
        pattern = CStringPub.trimString(pattern);
        System.out.println("bf:" + bf);
        System.out.println("pattern:" + pattern);
        System.out.println("af:" + af);
        //转换为普通字符
//        pattern = quoteReplacement(pattern);
//        pattern = "(\\w+)(\\d+)(.*)";

        System.out.println("pattern af:" + pattern);
        String result = CStringPub.emptyString();
        String[] list = bf.split("\n");
        System.out.println("list.length:" + list.length);
//        Pattern r = Pattern.compile(pattern);
        for (String line :
                list) {
            System.out.println("line:" + line);
            // 创建 Pattern 对象
            int reFlags = 0;
//            reFlags |= Pattern.UNIX_LINES;
//            reFlags |= Pattern.MULTILINE;
//            reFlags |= Pattern.CASE_INSENSITIVE;
//            reFlags |= Pattern.UNICODE_CASE;
//            reFlags |= Pattern.CANON_EQ;
//            reFlags |= Pattern.UNICODE_CHARACTER_CLASS;
            reFlags |= Pattern.DOTALL;
//            reFlags |= Pattern.COMMENTS;
//            reFlags |= Pattern.LITERAL;
            try {
                Pattern r = Pattern.compile(pattern, reFlags);
//                Pattern r = Pattern.compile(pattern);
                System.out.println("pattern.length():" + pattern.length());
//            line.f
//            boolean ret = Pattern.matches(pattern,line);
//            System.out.println("ret1 :" + ret);
//            ret = line.matches(pattern);
//            System.out.println("ret2 :" + ret);
                // 现在创建 matcher 对象
                Matcher m = r.matcher(line);
                //m.find()或m.matches()只能调用一次，再次调用就可能为false了。
                System.out.println("m.groupCount():" + m.groupCount());
                String replaceStr = CStringPub.emptyString();
                if (m.find()) {
//                System.out.println("seq:" + m.group());
                    System.out.println("Found value[" + 0 + "]: " + m.group(0));
                    replaceStr = af;
                    for (int i = 1; i <= m.groupCount(); i++) {
                        System.out.println("Found value[" + i + "]: " + m.group(i));
                        replaceStr = replaceStr.replace("\\" + i, m.group(i));
                        replaceStr = procSpecialSignReplace(replaceStr);
                    }
                }
                result += replaceStr + "\n";

            } catch (Exception e) {
                e.printStackTrace();
            }

            System.out.println("end~~");

        }
        return result;
    }

    public static void test1() {
        procPatternInfo("abc1234", "(\\w+)(\\d+)(.*)", "");
    }

    public static void main(String args[]) {

        // 按指定模式在字符串查找
//        String line = "This order was placed for QT3000! OK?";
        String line = "abc1234";
//        String pattern = "(\\D*)(\\d+)(.*)";
        String pattern = "(\\w)(\\d+)(.*)";

        // 创建 Pattern 对象
        Pattern r = Pattern.compile(pattern);

        // 现在创建 matcher 对象
        Matcher m = r.matcher(line);
        if (m.find()) {
            System.out.println("Found value: " + m.group(0));
            System.out.println("Found value: " + m.group(1));
            System.out.println("Found value: " + m.group(2));
            System.out.println("Found value: " + m.group(3));
        } else {
            System.out.println("NO MATCH");
        }

        test1();
    }

}
