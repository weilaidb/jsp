package bean;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

public class Test {
    String filename = "";
    String correctAnswer = "?????";
    String testContent = "";
    String selection = "";

    int score = 0;
    boolean ���ֽ��� = false;
    File f = null;
    FileReader in = null;
    BufferedReader buff = null;
    public String getFilename() {
        return filename;
    }

    public void setFilename(String name) {
        this.filename = name;
        //���
        score = 0;
        selection = "";
        ���ֽ��� = false;
        //��ȡ�����ļ���1��:��׼��
        try{
            f = new File(filename);
            in = new FileReader(f);
            buff = new BufferedReader(in);
            correctAnswer = (buff.readLine()).trim();//ȥ���ո�

        } catch (Exception e) {
            e.printStackTrace();
            testContent = "û��ѡ��" + f.getAbsolutePath() + "����";
            buff = null;
        }
    }


    public String getTestContent() {
        try{
            String s = null;
            StringBuffer temp = new StringBuffer();
            if (buff != null) {
                while ((s = buff.readLine()) != null) {
                    if (s.startsWith("**")) { //���������־
                        break;
                    }
                    temp.append(s);
                    if (s.startsWith("endend")) {//�����ļ�������־
                        in.close();//�رպ��ļ�������
                        buff.close();
                    }
                    testContent = new String(temp);
                }
            } else {
                testContent = new String("û��ѡ��" + f.getAbsolutePath() + "����");
            }
        } catch (Exception e) {
            e.printStackTrace();
            testContent = new String("���������ݣ����Խ�����!");
            try{
                in.close();
                buff.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return testContent;
    }

    public void setTestContent(String testContent) {
        this.testContent = testContent;
    }

    public String getSelection() {        return selection;
    }

    public void setSelection(String s) {
        this.selection += s;
    }

    public int getScore() {
        int length1 = selection.length();
        int length2 = correctAnswer.length();
        int i = length1 - 1;
        if ((i != -1) && (i < length2 - 1)) {
            if ((selection.charAt(i) == correctAnswer.charAt(i)) && (���ֽ��� == false)) {
                score++;
            }
            if (i == length2 - 1) {
                ���ֽ��� = true;
            }
        }
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

}
