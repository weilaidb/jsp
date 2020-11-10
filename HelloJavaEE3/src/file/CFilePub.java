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

    static private String m_errcode_filenoexist = "文件不存在";

    static public List<String> getCOntentFromFile(String predir, String filename) {
        List<String> resultList = new ArrayList<String>();
        try {
            predir = CCodecPub.UTF8ToISO(predir);
            filename = CCodecPub.UTF8ToISO(filename);

            File dir = new File(predir);
            if (!dir.exists())
            {
                dir.mkdirs();
            }
            File f = new File(dir, filename);
            if (!f.exists()) {
                f.createNewFile();
//                resultList.add(m_errcode_filenoexist + predir + filename);
//                return resultList;
            }
            InputStreamReader read = null;// 考虑到编码格式
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


    static public List<String> readAllNoEmpty(String predir, String filename, boolean utf8isoflag) {
        List<String> resultList = new ArrayList<String>();
        try {
            if(utf8isoflag) {
                predir = CCodecPub.UTF8ToISO(predir);
                filename = CCodecPub.UTF8ToISO(filename);
            }

            File dir = new File(predir);
            if (!dir.exists())
            {
                dir.mkdirs();
            }
            File f = new File(dir, filename);
            if (!f.exists()) {
                f.createNewFile();
            }
            InputStreamReader read = null;// 考虑到编码格式
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
//                System.out.println(lineTxt);
//                System.out.println("temp gbk1:" + (lineTxt));
            }
            read.close();
            System.out.println("found ");

            return resultList;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("no found:" + e + ",predir:" + predir +",filename:" + filename);
//            resultList.add((e.toString()));
            return resultList;
        }
    }


    /**
     * 读取数据，存入集合中
     */
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
    public static String readtFileContent(File file) throws IOException, ParseException {
        StringBuffer result = new StringBuffer();
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
            result.append(lineTxt + "<br>");
        }
        read.close();
        return new String(result);
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


    //append string
    public static String getJoinPath(String prefix, String path)
    {
        return prefix + File.separator + path;
    }

    private static String relPath  = "selfmenu.txt";
    private static String relPathuser = "selfmenu_user.txt";
    //read selfmenu.txt and selfmenu_user.txt
    public static List<String> readMenuAndUser(String topdir)
    {

        List<String> listcontent = CFilePub.readAllNoEmpty(topdir, relPath,false);
        List<String> listcontentUser = CFilePub.readAllNoEmpty(topdir, relPathuser,false);
        listcontent.addAll(listcontentUser);
        return listcontent;
    }

    //get tips name
    public static String getTipsName(String filename)
    {
        return "tips\\" + filename + ".tip";
    }
    //get before name
    public static String getBeforeName(String filename)
    {
        return "before\\" + filename + "";
    }
    //get after name
    public static String getAfterName(String filename)
    {
        return "after\\" + filename + "";
    }
}
