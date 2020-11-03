package file;

import base.CStringPub;
import java.io.*;
import java.text.ParseException;
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
                resultList.add(m_errcode_filenoexist);
                return resultList;
            }
            InputStreamReader read = null;// 考虑到编码格式
            try {
                read = new InputStreamReader(new FileInputStream(f), "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
            BufferedReader bufferedReader = new BufferedReader(read);
            String lineTxt = null;
            while ((lineTxt = bufferedReader.readLine()) != null) {
                if(CStringPub.isTrimEmpty(lineTxt))
                {
                    continue;
                }
                resultList.add((lineTxt.trim()));
                System.out.println(lineTxt);
                System.out.println("temp gbk1:" + (lineTxt));
            }
            read.close();
            System.out.println("found ");

            return resultList;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("no found:" + e);
            resultList.add((e.toString()));
            return resultList;
        }
    }

    /** 读取数据，存入集合中 */
    public static void readtFile(File file) throws IOException, ParseException {
        InputStreamReader read = null;// 考虑到编码格式
        try {
            read = new InputStreamReader(new FileInputStream(file), "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        BufferedReader bufferedReader = new BufferedReader(read);
        String lineTxt = null;
        while ((lineTxt = bufferedReader.readLine()) != null) {
            System.out.println(lineTxt);
        }
        read.close();
    }

}
