package file;

import codec.CCodecPub;
import string.CStringPub;

import java.io.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class CFilePub {
    public static String getM_errcode_filenoexist() {
        return m_errcode_filenoexist;
    }

    static private String m_errcode_filenoexist = "�ļ�������";

    static public List<String> getCOntentFromFile(String predir, String filename) {
        List<String> resultList = new ArrayList<String>();
        try {
            predir = CCodecPub.UTF8ToISO(predir);
            filename = CCodecPub.UTF8ToISO(filename);

            File dir = new File(predir);
            File f = new File(dir, filename);
            if (!f.exists()) {
                resultList.add(m_errcode_filenoexist + predir + filename);
                return resultList;
            }
            InputStreamReader read = null;// ���ǵ������ʽ
            String lineTxt = null;

            try {
                read = new InputStreamReader(new FileInputStream(f), "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
            BufferedReader bufferedReader = new BufferedReader(read);
            while ((lineTxt = bufferedReader.readLine()) != null) {
                if (CStringPub.isTrimEmpty(lineTxt)) {
                    continue;
                }
                resultList.add((lineTxt.trim()));
                System.out.println(lineTxt);
//                System.out.println("temp gbk1:" + (lineTxt));
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

    static public String getFileFirstContent(String predir, String filename) {
        List<String> lstCont = getCOntentFromFile(predir, filename);
        if (lstCont.size() > 0) {
            return lstCont.get(0);
        }
        return "";
    }

    /**
     * ��ȡ���ݣ����뼯����
     */
    public static void readtFile(File file) throws IOException, ParseException {
        InputStreamReader read = null;// ���ǵ������ʽ
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

    //create file if no exist
    public static String createFileNoExist(String filePathAll) {
        try {
            File f = new File(filePathAll);
            File d = new File(filePathAll + File.separator + "..");
            if (!f.exists()) {
                d.mkdirs();
                f.createNewFile();
            }
        } catch (IOException e) {
            e.printStackTrace();
            return e.toString();
        }

        return "";
    }

}
