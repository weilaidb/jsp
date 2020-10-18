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
            //������ʱ�ļ�f1
            File f1 = new File(dir, tempFileName);
            FileOutputStream o = new FileOutputStream(f1);
            //���ͻ��ϴ���ȫ����Ϣ����f1
            InputStream in = request.getInputStream();
            byte b[] = new byte[10000];
            int n;
            while ((n = in.read(b)) != -1) {
                o.write(b,0,n);
            }
            o.close();
            in.close();
            //��ȡ��ʱ�ļ�f1,���л�ȡ�ϴ��ļ������ֺ��ϴ��ļ�������
            RandomAccessFile randomRead = new RandomAccessFile(f1, "r");
            //����f1�ĵ�2�У���ȡ���ϴ��ļ�������
            int second = 1;
            String secondLine = null;
            while (second <= 2) {
                secondLine = randomRead.readLine();
                second++;

            }
            //��ȡf1�е�2����"filename"֮��"="���ֵ�λ��:
            int postion = secondLine.lastIndexOf("=");
            //�ͻ��ϴ����ļ���������
            fileName = secondLine.substring(postion + 2, secondLine.length() - 1);
            randomRead.seek(0);//�ٶ�λ���ļ�f1�Ŀ�ͷ
            //��ȡ��4�лس����ŵ�λ��
            long forthEndPostion = 0;
            int forth = 1;
            while ((n = randomRead.readByte()) != -1 && (forth <= 4)) {
                if (n == '\n') {
                    forthEndPostion = randomRead.getFilePointer();
                    forth++;
                }
            }
            //���ݿͻ��ϴ��ļ������֣������ļ��������
            byte cc[] = fileName.getBytes("UTF-8");
//            fileName = new String(cc);
//            byte cc[] = fileName.getBytes("ISO-8859-1");
//            byte cc[] = fileName.getBytes("GBK");
            fileName = new String(cc);
            File f2 = new File(dir, fileName);
            RandomAccessFile randomWrite = new RandomAccessFile(f2, "rw");
            //ȷ�����ļ�f1�а����ͻ��ϴ����ļ������ݵ����λ�ã���������6��
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

            //��randomRead��ָ���ļ�f1�ĵ�4�н�����λ��
            randomRead.seek(forthEndPostion);
            long startPoint = randomRead.getFilePointer();
            //��f1�����ͻ��ϴ����ļ�����f2(��ȡ��4�н���λ�ú͵�����6��֮������ݣ�
            while (startPoint < endPostion - 1) {
                n = randomRead.readByte();
                randomWrite.write(n);
                startPoint = randomRead.getFilePointer();
            }
            randomWrite.close();
            randomRead.close();

            f1.delete();//ɾ����ʱ�ļ�

            upFileMessage = fileName + "�ϴ��ɹ�(Successfully UpLoad)";
            showImage = fileName;
            return upFileMessage;

        } catch (Exception e) {
            e.printStackTrace();
            if (fileName != null) {
                upFileMessage = fileName + "�ϴ�ʧ��(Fail to UpLoad)";
                return upFileMessage;
            } else {
                upFileMessage = "";
                return upFileMessage;
            }
        }
    }


}
