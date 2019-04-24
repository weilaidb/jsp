package com.net;

import com.commmon.Byte24Long;
import com.commmon.testChinese;

import java.io.*;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;

public class ClientSendMsg2QtServer {
    private static final int HEAD_SIZE = 8 * 1;

    public static void sendStr2QtServer(String towritestr) {
        try {
            //1.创建客户端Socket，指定服务器地址和端口
            Socket socket = new Socket("localhost", 9999);
            //2.获取输出流，向服务器端发送信息
            OutputStream os = socket.getOutputStream();//字节输出流
            PrintWriter pw = new PrintWriter(os);//将输出流包装为打印流
            long len = 0;
            /**
             * 发送长度为总长度，包含头和体。
             */
            byte[] byteArray = towritestr.getBytes();

            Charset charset = Charset.forName("UTF-8");
            byte[] orgstr = towritestr.getBytes("iso-8859-1");
            String last = new String(orgstr, "GB2312");
//            String last = new String(orgstr, "GB2312");

            String newstr = new String(towritestr.getBytes("GB2312")
                    , "UTF-8");
            ByteBuffer byteBuffer = charset.encode(newstr);//why string?
            byte[] ba = byteBuffer.array();//转化成byte[]
            CharBuffer charBuffer = charset.decode(byteBuffer);
            char[] ca = charBuffer.array();//转化成char[]

            if (testChinese.isContainChinese(towritestr)) {
                len = towritestr.length();
            } else {
                len = last.length();
            }
//            len = towritestr.length();
            byte[] buffer = Byte24Long.LongToBytes(len);
            System.out.println("size of len:" + (len));
            pw.write(Byte24Long.getChars(buffer));
//            pw.write(towritestr);
            pw.write(last);
//            pw.write(byteArray);
//            pw.write(ca);
//            pw.write(towritestr,len);
            pw.flush();
//            socket.shutdownOutput();//关闭输出流
            //3.获取输入流，并读取服务器端的响应信息
            InputStream is = socket.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            String info = null;
            while ((info = br.readLine()) != null) {
                System.out.println("我是客户端，服务器说：" + info);
            }
            //4.关闭资源
            br.close();
            is.close();
            pw.close();
            os.close();
            try {
                Thread.sleep(5000);
            } catch (Exception e) {
                e.printStackTrace();
            }
            socket.close();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        sendStr2QtServer("D:");
    }
}
