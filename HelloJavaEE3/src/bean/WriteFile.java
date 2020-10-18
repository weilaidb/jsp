package bean;

import java.io.File;
import java.io.FileOutputStream;

public class WriteFile {
    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    boolean success;
    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String s) {
        this.filePath = s;
        try{
            File path = new File(filePath);
            path.mkdirs();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileContent() {
        return fileContent;
    }

    public void setFileContent(String s) {
        this.fileContent = s;
        byte content[] = fileContent.getBytes();
        try{
            File file = new File(filePath, fileName);
            FileOutputStream in = new FileOutputStream(file);
            in.write(content, 0, content.length);
            in.close();
            success = true;
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
        }
    }

    String filePath = null,
    fileName = null,
    fileContent = null;

}
