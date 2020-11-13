package regexp;

import string.CStringPub;

import java.util.regex.*;

import static java.util.regex.Matcher.quoteReplacement;

public class CRegExpPub {

    public static String procPatternInfo(String bf, String pattern, String af)
    {
        //������ʽʹ���ַ������ʹ���ҳ�л�ȡ�����ݽ��������ֲ�һ��
        //ԭ������ҳ��ȡ�ĳ��ȶ���1���ֽڣ�ԭ���ǻ���
        //�鿴pattern��ĳ����� pattern.length()
        af = CStringPub.trimString(af);
        pattern = CStringPub.trimString(pattern);
        System.out.println("bf:" + bf);
        System.out.println("pattern:" + pattern);
        System.out.println("af:" + af);
        //ת��Ϊ��ͨ�ַ�
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
            // ���� Pattern ����
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
            try{
                Pattern r = Pattern.compile(pattern, reFlags);
//                Pattern r = Pattern.compile(pattern);
                System.out.println("pattern.length():" + pattern.length());
//            line.f
//            boolean ret = Pattern.matches(pattern,line);
//            System.out.println("ret1 :" + ret);
//            ret = line.matches(pattern);
//            System.out.println("ret2 :" + ret);
                // ���ڴ��� matcher ����
                Matcher m = r.matcher(line);
                //m.find()��m.matches()ֻ�ܵ���һ�Σ��ٴε��þͿ���Ϊfalse�ˡ�
            while (m.find()) {
                System.out.println("seq:" + m.group());
                for (int i = 0; i < m.groupCount(); i++) {
                    System.out.println("Found value[" + i + "]: " + m.group(i));
                }
            }

            } catch (Exception e) {
                e.printStackTrace();
            }

            System.out.println("end~~");

        }
        return result;
    }

    public static void test1()
    {
        procPatternInfo("abc1234", "(\\w+)(\\d+)(.*)", "");
    }

    public static void main( String args[] ){

        // ��ָ��ģʽ���ַ�������
//        String line = "This order was placed for QT3000! OK?";
        String line = "abc1234";
//        String pattern = "(\\D*)(\\d+)(.*)";
        String pattern = "(\\w)(\\d+)(.*)";

        // ���� Pattern ����
        Pattern r = Pattern.compile(pattern);

        // ���ڴ��� matcher ����
        Matcher m = r.matcher(line);
        if (m.find( )) {
            System.out.println("Found value: " + m.group(0) );
            System.out.println("Found value: " + m.group(1) );
            System.out.println("Found value: " + m.group(2) );
            System.out.println("Found value: " + m.group(3) );
        } else {
            System.out.println("NO MATCH");
        }

        test1();
    }

}
