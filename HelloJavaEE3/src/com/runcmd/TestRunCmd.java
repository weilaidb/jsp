package com.runcmd;

public class TestRunCmd {
    public static void main(String[] args) {
        {
            String str = "E:\\books\\java web\\Java项目开发案例全程实录（第2版）@www.java1234.com.pdf";
//            new RunCmd(str);
            RunCmd ins = new RunCmd(str,0);
            ins.OpenPath(str);
        }

    }
}
