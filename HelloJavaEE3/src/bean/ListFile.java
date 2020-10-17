package bean;
import java.io.*;

class FileName implements FilenameFilter {
    String str = null;
    FileName(String s) {
        str = "." + s;
    }

    @Override
    public boolean accept(File dir, String name) {
        return name.endsWith(str);
    }
};



public class ListFile{
    public String getExtendsName() {
        return extendsName;
    }

    String extendsName = null;

    public void setAllFileName(String allFileName) {
        this.allFileName = allFileName;
    }

    String allFileName = null;

    public void setExtendsName(String s) {
        extendsName = s;
    }

    public String getAllFileName() {
        StringBuffer str = new StringBuffer();
        File dir = new File("D:/");
        FileName help = new FileName(extendsName);
        String file_name[] = dir.list(help);
        for (int i = 0; i < file_name.length; i++) {
            str.append(file_name[i] + " ");
        }
        allFileName = new String(str);
        return allFileName;
    }
}
