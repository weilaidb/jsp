package com.net;

import com.commmon.Byte24Long;
import com.commmon.testChinese;

import java.io.*;
import java.net.Socket;
import java.net.UnknownHostException;

public class ClientSendMsg2QtServer {
    private static final int HEAD_SIZE = 8 * 1;

    public static boolean checkiszimu(char c) {
        if (((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))) {
            return true;
        } else {
            return false;
        }
    }

    public static String sendStr2QtServer(String ipaddr, String towritestr) {
        String result = "nothing";
        String sendok = "send ok";
        String sendng = "send fail";
        try {
            result =  "execute cmd:" + sendok + "@" + ipaddr +  " " + towritestr;
            result+= "<br/>";
            String inip = "";
            ipaddr = ipaddr.trim();
            if(null == ipaddr || ipaddr.isEmpty() || ipaddr.equals("127.0.0.1")
                    || ipaddr.equals("null")|| ipaddr.equals("localhost"))
            {
                inip = "localhost";
            }
            else
            {
                inip = ipaddr;
                //为了与Qt客户端共同使用，需要添加4个空格
                towritestr = "    " + towritestr;
            }
            //1.创建客户端Socket，指定服务器地址和端口
            Socket socket = new Socket(inip, 9999);
            //2.获取输出流，向服务器端发送信息
            OutputStream os = socket.getOutputStream();//字节输出流
            PrintWriter pw = new PrintWriter(os);//将输出流包装为打印流
            long len = 0;
            /**
             * 发送长度为总长度，包含头和体。
             */
            char lastchar = towritestr.charAt(towritestr.length() - 1);
            if (testChinese.isContainChinese(towritestr)
                    && (true == checkiszimu(lastchar))) {
                len = towritestr.length() + 6;
            }else if (testChinese.isContainChinese(towritestr)
                    && (false == checkiszimu(lastchar))) {
                len = towritestr.length() + 4;
            } else {
                len = towritestr.length();
            }
//            len = towritestr.length();
            byte[] buffer = Byte24Long.LongToBytes(len);
            System.out.println("exec cmd:" + (towritestr));
//            System.out.println("size of len:" + (len));
//            System.out.println("buffer of len:" + (buffer.length));
            pw.write(Byte24Long.getChars(buffer));
            pw.write(towritestr);
            pw.flush();
//            socket.shutdownOutput();//关闭输出流
            //3.获取输入流，并读取服务器端的响应信息
            InputStream is = socket.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            String info = null;

            while ((info = br.readLine()) != null) {
                String gbkinfo = new String(info.getBytes("iso-8859-1"), "utf-8");
//                int length = gbkinfo.length();
//                int pos  = 6;
//                int showbegin = length >pos ? pos: 0;
                System.out.println("i am client, server say:" + gbkinfo);
                result+=gbkinfo+"<br/>";
//                out.write("\n");

            }
            //4.关闭资源
            br.close();
            is.close();
            pw.close();
            os.close();
            try {
                Thread.sleep(2000);
            } catch (Exception e) {
                e.printStackTrace();
            }
            socket.close();

        } catch (UnknownHostException e) {
            e.printStackTrace();
            result = e.getMessage();
            result =  "execute cmd:" + result + "@" + ipaddr +  " " + towritestr;
        } catch (IOException e) {
            e.printStackTrace();
            result = e.getMessage();
            result =  "execute cmd:" + result + "@" + ipaddr +  " " + towritestr;
        }

        return result;
    }

    public static void main(String[] args) {
        sendStr2QtServer("","D:");
//        sendStr2QtServer("cmd notepad++ D:\\Software\\opengrok\\gen_opengrok_project.bat");
    }
}
