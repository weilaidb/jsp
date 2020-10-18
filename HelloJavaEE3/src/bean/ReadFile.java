package bean;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class ReadFile {
    public String getFileDir() {
        return fileDir;
    }

    public void setFileDir(String fileDir) {
        this.fileDir = fileDir;
    }

    String fileDir = "D:/";

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getListFile() {
        File dir = new File(fileDir);
        File file_name[] = dir.listFiles();
        StringBuffer list = new StringBuffer();
        for (int i = 0; i < file_name.length; i++) {
            if ((file_name[i] != null) && (file_name[i].isFile())) {
                String temp = file_name[i].toString();
                int n = temp.lastIndexOf("\\");
                temp = temp.substring(n + 1);
                list.append("" + temp);
            }
        }
        listFile = new String(list);
        return listFile;
    }

    public void setListFile(String listFile) {
        this.listFile = listFile;
    }

    public String getReadContent() {
        try{
            File file = new File(fileDir, filename);
            FileReader in = new FileReader(file);
            BufferedReader inTwo = new BufferedReader(in);
            StringBuffer stringBuffer = new StringBuffer();
            String s = null;
            while ((s = inTwo.readLine()) != null) {
                byte bb[] = s.getBytes();
                s = new String(bb);
                stringBuffer.append("\n" + s);
            }
            String temp = new String(stringBuffer);
            readContent = "<TextArea rows=10 cols=62>" + temp + "</TextArea>";

        } catch (IOException e) {
            readContent = "<TextArea rows=10 cols=62></TextArea>";
            e.printStackTrace();
        }
        return readContent;
    }

    public void setReadContent(String readContent) {
        this.readContent = readContent;
    }

    String filename="";
    String listFile, readContent;

}
