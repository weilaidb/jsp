package com.runcmd;

import java.lang.Thread;
import java.util.List;
import java.util.*;

public class TestRunCmd {
    public static void main(String[] args) {
        {
            String str = "E:\\books\\java web\\Java项目开发案例全程实录（第2版）@www.java1234.com.pdf";
//            new RunCmd(str);
            RunCmd ins = new RunCmd(str,0);
            ins.openPath(str);
////内存耗费测试
//            List<char []> listmem = new ArrayList<>();;
////            listmem.clear();
//            for (int i = 0 ; i < 65535;i++)
//            {
////                new RunCmd(str);
////                System.out.println(i);
//                char[] test = new char[100 * 1024 ];
//                listmem.add(test);
//                System.out.println("listmem size:" + listmem.size());
//                try {
//                    Thread.sleep(10);
//                }
//                catch (Exception e)
//                {
//                    System.out.println(e);
//                }
//            }
        }

    }
}
