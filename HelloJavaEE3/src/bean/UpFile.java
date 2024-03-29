package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.RandomAccessFile;

public class UpFile {
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    HttpServletRequest request;

    public void setSession(HttpSession session) {
        this.session = session;
    }

    HttpSession session;
    String upFileMessage = "";

    public String getShowImage() {
        return showImage;
    }

    String showImage;

    public String getUpFileMessage(){
        String fileName = null;
        try{
            String tempFileName = (String)session.getId();
            String webDir = request.getContextPath();
            webDir = webDir.substring(1);
            File f = new File("");
            String path = f.getAbsolutePath();
            int index = path.indexOf("bin");
            String tomcatDir = path.substring(0, index);
            File dir = new File(tomcatDir + "/webapps/" + webDir + "/image");
            dir.mkdirs();
            //建立临时文件f1
            File f1 = new File(dir, tempFileName);
            FileOutputStream o = new FileOutputStream(f1);
            //将客户上传的全部信息存入f1
            InputStream in = request.getInputStream();
            byte b[] = new byte[10000];
            int n;
            while ((n = in.read(b)) != -1) {
                o.write(b,0,n);
            }
            o.close();
            in.close();
            //读取临时文件f1,从中获取上传文件的名字和上传文件的内容
            RandomAccessFile randomRead = new RandomAccessFile(f1, "r");
            //读出f1的第2行，析取出上传文件的名字
            int second = 1;
            String secondLine = null;
            while (second <= 2) {
                secondLine = randomRead.readLine();
                second++;

            }
            //获取f1中第2行中"filename"之后"="出现的位置:
            int postion = secondLine.lastIndexOf("=");
            //客户上传的文件的名字是
            fileName = secondLine.substring(postion + 2, secondLine.length() - 1);
            randomRead.seek(0);//再定位到文件f1的开头
            //获取第4行回车符号的位置
            long forthEndPostion = 0;
            int forth = 1;
            while ((n = randomRead.readByte()) != -1 && (forth <= 4)) {
                if (n == '\n') {
                    forthEndPostion = randomRead.getFilePointer();
                    forth++;
                }
            }
            //根据客户上传文件的名字，将该文件存入磁盘
            byte cc[] = fileName.getBytes("UTF-8");
//            fileName = new String(cc);
//            byte cc[] = fileName.getBytes("ISO-8859-1");
//            byte cc[] = fileName.getBytes("GBK");
            fileName = new String(cc);
            File f2 = new File(dir, fileName);
            RandomAccessFile randomWrite = new RandomAccessFile(f2, "rw");
            //确定出文件f1中包含客户上传的文件的内容的最后位置，即倒数第6行
            randomRead.seek(randomRead.length());
            long endPostion = randomRead.getFilePointer();
            long mark = endPostion;
            int j = 1;
            while ((mark >= 0) && (j <= 6)) {
                mark--;
                randomRead.seek(mark);
                n = randomRead.readByte();
                if (n == '\n') {
                    endPostion = randomRead.getFilePointer();
                    j++;
                }
            }

            //将randomRead流指向文件f1的第4行结束的位置
            randomRead.seek(forthEndPostion);
            long startPoint = randomRead.getFilePointer();
            //从f1读出客户上传的文件存入f2(读取第4行结束位置和倒数第6行之间的内容）
            while (startPoint < endPostion - 1) {
                n = randomRead.readByte();
                randomWrite.write(n);
                startPoint = randomRead.getFilePointer();
            }
            randomWrite.close();
            randomRead.close();

            f1.delete();//删除临时文件

            upFileMessage = fileName + "上传成功(Successfully UpLoad)";
            showImage = fileName;
            return upFileMessage;

        } catch (Exception e) {
            e.printStackTrace();
            if (fileName != null) {
                upFileMessage = fileName + "上传失败(Fail to UpLoad)";
                return upFileMessage;
            } else {
                upFileMessage = "";
                return upFileMessage;
            }
        }
    }


}
