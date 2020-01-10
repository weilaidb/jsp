package com.file;

import java.io.*;
import java.net.URLDecoder;
import java.util.ArrayList;

public class CheckFile {
    private static ArrayList<String> filelist = new ArrayList<String>();
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

    public static void deleteBeyondComparefiles()
    {
        dealBeyondDir("C:\\Users\\dell\\AppData\\Roaming\\Scooter Software\\Beyond Compare 4");
        dealBeyondDir("C:\\Users\\Administrator\\AppData\\Roaming\\Scooter Software\\Beyond Compare 4");
    }

    public static void dealBeyondDir(String needDeleteAllFileDir)
    {
        delDirPathAllFile(needDeleteAllFileDir);
    }

    public static void delDirPathAllFile(String dirname)
    {
        filelist.clear();
        getFiles(dirname);
        System.out.println("filelist size:" + filelist.size());
        for (String item :
                filelist) {
            System.out.println("item:" + item);
            File file = new File(item);
            file.delete();
        }

    }
    /*
     * 通过递归得到某一路径下所有的目录及其文件
     */
    public static void getFiles(String filePath){
        File root = new File(filePath);
        File[] files = root.listFiles();
        if(null== files)
        {
            return;
        }
        for(File file:files){
            if(file.isDirectory()){
                /*
                 * 递归调用
                 */
                getFiles(file.getAbsolutePath());
//                filelist.add(file.getAbsolutePath());
//                System.out.println("显示"+filePath+"下所有子目录及其文件"+file.getAbsolutePath());
            }else{
//                System.out.println("显示"+filePath+"下所有子目录"+file.getAbsolutePath());
                filelist.add(file.getAbsolutePath());
            }
        }
    }
}
