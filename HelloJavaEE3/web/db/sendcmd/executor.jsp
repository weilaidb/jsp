<%@ page import="java.net.Socket" %>
<%@ page import="com.commmon.testChinese" %>
<%@ page import="com.commmon.Byte24Long" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.UnknownHostException" %>
<%@ page import="static com.net.ClientSendMsg2QtServer.checkiszimu" %>
<%--此处必须指定文件编码为gb2312,而且解码也是gb2312--%>
<%--使用此来将utf-8的数据翻译成 gbk new String(info.getBytes("gbk"), "utf-8") + entertip;--%>
<%@ page language="java" pageEncoding="gb2312"%>
<%@ page contentType="text/html;charset=gb2312"%>

<%--此处使用utf-8作为文件和解码的编码，也是使用--%>
<%--使用此来将utf-8的数据翻译成 gbk new String(info.getBytes("gbk"), "utf-8") + entertip;--%>
<%--<%@ page language="java" pageEncoding="utf-8"%>--%>
<%--<%@ page contentType="text/html;charset=utf-8"%>--%>



<html>
<head>
    <title>执行器</title>
<%--        <meta http-equiv="Content-Type" content="text/html charset=gb2312">--%>
</head>
<body>
<%
    String ipaddr = request.getParameter("ipaddr");
    String cmddatatext = request.getParameter("cmddatatext");
    String towritestr = cmddatatext;
    String result = "";
    String entertip = "<br/>";
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

        String gbkinfo = "";
        while ((info = br.readLine()) != null) {
            //全部打印出来
//            out.println(new String(info.getBytes("gbk"), "utf-8") + entertip);
//            out.println(new String(info.getBytes("gbk"), "gbk") + entertip);
//            out.println(new String(info.getBytes("utf-8"), "utf-8") + entertip);
//            out.println(new String(info.getBytes("utf-8"), "gbk") + entertip);

            gbkinfo = new String(info.getBytes("gbk"), "utf-8") + entertip;
            out.println(gbkinfo);

            try {
                Thread.sleep(10);
            } catch (Exception e) {
                e.printStackTrace();
            }

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

%>

<%=result%>
<%
    out.println("=====END======");
%>

</body>
</html>
