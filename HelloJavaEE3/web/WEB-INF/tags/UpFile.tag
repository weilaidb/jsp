<%@ tag pageEncoding="utf-8" %>
<%@ tag import="java.io.File" %>
<%@ tag import="java.io.FileOutputStream" %>
<%@ tag import="jdk.internal.util.xml.impl.Input" %>
<%@ tag import="java.io.InputStream" %>
<%@ tag import="java.io.RandomAccessFile" %>
<%@ attribute name="subdir" required="true" %>
<%@ variable name-given="message" scope="AT_END" %>
<%@ variable name-given="fileName" scope="AT_END" %>
<%
    jspContext.setAttribute("message","");
    String fileName = null;
    try{
        //用客户的session对象的Id建立一个临时文件
        String tempFileName = (String)session.getId();
        File file = new File("");
        String parentDir = file.getAbsolutePath();
        parentDir = parentDir.substring(0, parentDir.lastIndexOf("bin") - 1);
        String saveDir = parentDir + "/webapps/" + subdir;
        File dir = new File(saveDir);
        dir.mkdirs();
        //建立临时文件f1
        File f1 = new File(dir,tempFileName);
        FileOutputStream o = new FileOutputStream(f1);
        //将客户上传的全部信息存入f1
        InputStream in = request.getInputStream();
        byte b[] = new byte[10000];
        int n;
        while ((n = in.read(b)) != -1) {
            o.write(b, 0, n);
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
        //获取f1中第2行中"filename"之后"="出现的位置
        int postion = secondLine.lastIndexOf("=");
        //客户上传的文件的名字是
        fileName = secondLine.substring(postion + 2, secondLine.length() - 1);
        randomRead.seek(0);//再定位到文件f1的开头
        //获取第4行Enter符号的位置
        long forthEndPosition = 0;
        int forth = 1;
        while ((n = randomRead.readByte()) != -1 && (forth <= 4)) {
            if (n == '\n') {
                forthEndPosition = randomRead.getFilePointer();
                forth++;
            }
        }
        //根据客户上传的名字，将该文件存盘
        byte cc[] = fileName.getBytes("GBK");
        fileName = new String(cc);
        File f2 = new File(dir, fileName);
        RandomAccessFile randomWrite = new RandomAccessFile(f2, "rw");
        //确定出文件f1中包含客户上传的文件的内容的最后位置，即倒数第6行
        randomRead.seek(randomRead.length());
        long endPostion = randomRead.getFilePointer();
        long mark = endPostion;
        int j =1 ;
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
        randomRead.seek(forthEndPosition);
        long startPoint = randomRead.getFilePointer();
        //从f1中读出客户上传的文件存入f2(读取第4行结束位置和倒数第6行之间的内容）
        while (startPoint < endPostion - 1) {
            n = randomRead.readByte();
            randomWrite.write(n);
            startPoint = randomRead.getFilePointer();
        }
        randomWrite.close();
        randomRead.close();
        jspContext.setAttribute("message","上传成功");
        jspContext.setAttribute("fileName",fileName);
        f1.delete();//删除临时文件


    } catch (Exception e) {
        e.printStackTrace();
        jspContext.setAttribute("message", "没有选择文件或上传失败");
    }
%>