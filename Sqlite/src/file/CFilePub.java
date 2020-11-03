package file;

import base.CStringPub;
import codec.CCodecPub;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CFilePub {
    static private String m_errcode_filenoexist = "文件不存在";
    static public List<String> getCOntentFromFile(String predir, String filename)
    {
        List<String> resultList  = new ArrayList<String>();
        try{
            File dir = new File(predir);
            File f = new File(dir,filename);
            if(!f.exists())
            {
                resultList.add(CCodecPub.UTF8ToGBK(m_errcode_filenoexist));
                return resultList;
            }
            FileReader in = new FileReader(f);
            BufferedReader bufferin = new BufferedReader(in);
            String temp;
            while ((temp = bufferin.readLine()) != null) {
                if(CStringPub.isTrimEmpty(temp))
                {
                    continue;
                }
                resultList.add(CCodecPub.UTF8ToGBK(temp.trim()));

                System.out.println("temp gbk:" + new String(temp.getBytes("GBK"), "UTF-8"));
            }
            bufferin.close();
            in.close();
            System.out.println("found ");

            return resultList;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("no found:" + e);
            resultList.add(CCodecPub.UTF8ToGBK(e.toString()));
            return resultList;
        }
    }
}
