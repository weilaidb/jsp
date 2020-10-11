<%@ page import="java.io.*" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/10/11
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BufferedInputStream</title>
</head>
<body bgcolor="#00ffff">
<font size="2">
<%
    File dir = new File("D:/test/webapps/ch5","Students");
    dir.mkdirs();
    File f = new File(dir,"hello.txt");

    try{
        FileOutputStream outfile = new FileOutputStream(f);
        BufferedOutputStream bufferout = new BufferedOutputStream(outfile);
        byte b[] = "你们好，很高兴认识你们呀!<br>nice to meet you".getBytes();
        bufferout.write(b);
        bufferout.flush();
        bufferout.close();
        outfile.close();

        try{
            FileInputStream in = new FileInputStream(f);
            BufferedInputStream bufferin = new BufferedInputStream(in);
            byte c[] = new byte[90];
            int n = 0;
            while ((n = bufferin.read(c)) != -1) {
                String temp = new String(c,0,n);
                out.print(temp);
            }
            bufferin.close();
            in.close();
        }
        catch (IOException e){
            System.out.println("File read error:" + e);
            //out.print("<br>" + "错误信息：" + e.toString());
        }
    }
    catch (IOException e){
        System.out.println("File read error:" + e);
        //out.print("<br>" + "错误信息：" + e.toString());
    }




%>
</font>


</body>
</html>
