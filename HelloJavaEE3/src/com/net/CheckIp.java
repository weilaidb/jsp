package com.net;

public class CheckIp {
    static public int ipMatches(String text) {
        if (text != null && !text.isEmpty()) {
            // ����������ʽ
            String regex = "^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])\\."
                    + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
                    + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
                    + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)$";
            // �ж�ip��ַ�Ƿ���������ʽƥ��
            if (text.matches(regex)) {
                // �����ж���Ϣ
                System.out.println("��һ���Ϸ���IP��ַ��");
                return 0;
            } else {
                // �����ж���Ϣ
                System.out.println("����һ���Ϸ���IP��ַ��");
                return -1;
            }
        }
        return  -1;
    }
}
