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

    public static String getRelPath() {
        return relPath;
    }

    public static void setRelPath(String relPath) {
        CFilePub.relPath = relPath;
    }

    public static String getRelPathuser() {
        return relPathuser;
    }

    public static void setRelPathuser(String relPathuser) {
        CFilePub.relPathuser = relPathuser;
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

    //read selfmenu.txt
    public static List<String> readMenuStand(String topdir)
    {

        List<String> listcontent = CFilePub.readAllNoEmpty(topdir, relPath,false);
        return listcontent;
    }

       //read selfmenu_user.txt
    public static List<String> readMenuUser(String topdir)
    {

        List<String> listcontentUser = CFilePub.readAllNoEmpty(topdir, relPathuser,false);
        return listcontentUser;
    }

    //read selfmenu.txt
    public static String readMenuStandResStr(String topdir, String enterFlag)
    {

        List<String> listcontent = CFilePub.readAllNoEmpty(topdir, relPath,false);
        return listToString(listcontent,enterFlag);
    }

       //read selfmenu_user.txt
    public static String readMenuUserResStr(String topdir, String enterFlag)
    {

        List<String> listcontentUser = CFilePub.readAllNoEmpty(topdir, relPathuser,false);
        return listToString(listcontentUser,enterFlag);
    }

//enterFlag ,空为"<br>"，非空为"\n"
    public static String listToString(List<String> list, String enterFlag)
    {
        String result = "";
        for (String item :
                list) {
            if(CStringPub.isTrimEmpty(enterFlag))
            {
                result += item + "<br>";
            }
            else
            {
                result += item + "\n";
            }
        }
        return result;
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

    public static String readContent(File f, boolean brflag) {
        StringBuffer str = new StringBuffer();
        try{
            if(!f.exists())
            {
                return "";
            }
            InputStreamReader in = new InputStreamReader(new FileInputStream(f), "UTF-8");
            BufferedReader bufferin = new BufferedReader(in);
            String temp;
            while ((temp = bufferin.readLine()) != null) {
                if(brflag) {
                    str.append(temp + "<br>");
                }
                else {
                    str.append(temp + "\n");
                }
            }
            bufferin.close();
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new String(str);
    }


    public static String writeContent(File f, String content) {
        StringBuffer str = new StringBuffer();
        try{
            if(!f.exists())
            {
                return "";
            }
            FileOutputStream out = new FileOutputStream(f);
            OutputStreamWriter bufferout = new OutputStreamWriter(out, "UTF-8");
            bufferout.write(content);
            bufferout.flush();
            bufferout.close();
            out.close();
            str.append("写入成功<br>");
        } catch (Exception e) {
            e.printStackTrace();
            str.append("写入失败:" + e.toString() + "<br>");
        }
        return new String(str);
    }

    //读取文件内容
    public static String readFile(String dir, String fileName, boolean brflag)
    {
        File f = new File(dir,fileName);
        String fileContent = readContent(f,brflag);
        return fileContent;
    }

    //写文件
    public static String writeFile(String dir, String fileName, String  content)
    {
        File f = new File(dir,fileName);
        String result = writeContent(f,content);
        return result;
    }

}
