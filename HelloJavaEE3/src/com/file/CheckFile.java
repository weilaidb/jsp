package com.file;

import java.io.File;

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
}
