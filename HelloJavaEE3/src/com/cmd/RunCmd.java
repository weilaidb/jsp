package com.cmd;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class RunCmd {
    public static void explorerdir(String dir) {
        try {
            runcmd("explorer.exe " + dir);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static void explorerdirDencodingUtil(String dir) {
        try {
            dir = EncodingUtil.decodeURIComponent(dir);
            runcmd("explorer.exe " + dir);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static void runcmd(String command) {
        Process p = null;
        try {
//            p = Runtime.getRuntime().exec(command);
            Process proc = Runtime.getRuntime().exec(command);
            StreamGobbler errorGobbler = new StreamGobbler(proc.getErrorStream(), "Error");
            StreamGobbler outputGobbler = new StreamGobbler(proc.getInputStream(), "Output");
            errorGobbler.start();
            outputGobbler.start();
            proc.waitFor();

        } catch (Exception e) {
            e.printStackTrace();
        }

//##读取命令的输出信息
        BufferedReader reader = null;
        try {
            InputStream is = p.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is));
            p.waitFor();
            if (p.exitValue() != 0) {
                //说明命令执行失败
                //可以进入到错误处理步骤中
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

//##打印输出信息
        try {
            String s = null;
            while ((s = reader.readLine()) != null) {
                System.out.println(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
