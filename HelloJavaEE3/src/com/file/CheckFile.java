package com.file;

import java.io.*;
import java.net.URLDecoder;

public class CheckFile {
    public static String procSignAddYinhao(String path)
    {
        String resultpath = path;
        if(path.contains("\""))
        {
            resultpath = path.replaceAll("\"", "\"\"");
        }

        if(path.contains(" "))
        {
            resultpath = "\"" +  path + "\"";
        }
        return resultpath;
    }


    public static String addFileprefixIfNormal(String testFilePath)
    {
        String resultpath = "";
        String addnotepadprefix = "cmd notepd++ ";
        File testFile = new File(testFilePath);
        if(testFile.exists() && !testFile.isDirectory())
        {
            resultpath = /*addnotepadprefix + */ procSignAddYinhao(testFilePath);
        }
        else
        {
            resultpath = testFilePath;
        }
        return resultpath;
    }

    public static String GetFileAllContent2(String testFilePath)
    {
        String resultpath = "";
        File testFile = new File(testFilePath);
        if(testFile.isDirectory())
        {
            return resultpath;
        }

        if(!testFile.isFile())
        {
            return  resultpath;
        }

        return resultpath;
    }
    public static String GetFileAllContent(String fileName) {
        String encoding = "UTF-8";
        System.out.println("to open file:" + fileName);
        fileName = URLDecoder.decode(fileName);
        System.out.println("to open file:" + fileName);
        File file = new File(fileName);
        int appendlen = 1024;
        Long filelength = file.length() + appendlen;
        byte[] filecontent = new byte[filelength.intValue()];
        try {
            FileInputStream in = new FileInputStream(file);
            in.read(filecontent);
            in.close();
            System.out.println("read ok, len:" + filelength);
        } catch (FileNotFoundException e) {
            System.out.println("File Not found");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("IO Exception");
            e.printStackTrace();
        }
        try {
            System.out.println("string ok");
            return new String(filecontent, encoding)
                    .replace("\r\n", "<br/>")
                    .replace("\n", "<br/>")
//                    .replace("<", "\\<")
//                    .replace(">", "\\>")
                    ;
        } catch (UnsupportedEncodingException e) {
            System.err.println("The OS does not support " + encoding);
            e.printStackTrace();
            return null;
        }
    }

}
