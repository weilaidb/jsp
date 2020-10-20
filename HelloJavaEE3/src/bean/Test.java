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
    boolean 批分结束 = false;
    File f = null;
    FileReader in = null;
    BufferedReader buff = null;
    public String getFilename() {
        return filename;
    }

    public void setFilename(String name) {
        this.filename = name;
        //清空
        score = 0;
        selection = "";
        批分结束 = false;
        //读取试题文件第1行:标准答案
        try{
            f = new File(filename);
            in = new FileReader(f);
            buff = new BufferedReader(in);
            correctAnswer = (buff.readLine()).trim();//去掉空格

        } catch (Exception e) {
            e.printStackTrace();
            testContent = "没有选择" + f.getAbsolutePath() + "试题";
            buff = null;
        }
    }


    public String getTestContent() {
        try{
            String s = null;
            StringBuffer temp = new StringBuffer();
            if (buff != null) {
                while ((s = buff.readLine()) != null) {
                    if (s.startsWith("**")) { //试题结束标志
                        break;
                    }
                    temp.append(s);
                    if (s.startsWith("endend")) {//试题文件结束标志
                        in.close();//关闭和文件的连接
                        buff.close();
                    }
                    testContent = new String(temp);
                }
            } else {
                testContent = new String("没有选择" + f.getAbsolutePath() + "试题");
            }
        } catch (Exception e) {
            e.printStackTrace();
            testContent = new String("试题无内容，考试结束了!");
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
            if ((selection.charAt(i) == correctAnswer.charAt(i)) && (批分结束 == false)) {
                score++;
            }
            if (i == length2 - 1) {
                批分结束 = true;
            }
        }
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

}
