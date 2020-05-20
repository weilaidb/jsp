<%@ page import="com.cmd.RunCmd" %>
<%@ page import="com.net.ClientSendMsg2QtServer" %>
<%@ page import="java.net.Socket" %>
<%@ page import="com.commmon.testChinese" %>
<%@ page import="com.commmon.Byte24Long" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.UnknownHostException" %>
<%@ page import="static com.net.ClientSendMsg2QtServer.checkiszimu" %>
<%@ page import="com.commmon.Encoding" %>
<%@ page import="com.commmon.ChangeCharset" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/5/17
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="gb2312"%>
<%@ page contentType="text/html;charset=gb2312"%>

<%--<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>--%>
<%--<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>--%>
<html>
<head>
    <%--    <SCRIPT language=javascript>--%>
    <%--        function go() {--%>
    <%--            window.history.go(-1);--%>
    <%--        }--%>

    <%--        setTimeout("go()", 2000);--%>
    <%--    </SCRIPT>--%>
    <title>执行器</title>
        <meta http-equiv="Content-Type" content="text/html charset=gb2312">
</head>
<body>
<%
    String ipaddr = request.getParameter("ipaddr");
    String cmddatatext = request.getParameter("cmddatatext");
//    String result = ClientSendMsg2QtServer.sendStr2QtServer(ipaddr, cmddatatext);
    String towritestr = cmddatatext;
    String result = "";
    String entertip = "<br/>";
//    String result = "nothing";
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
//        ChangeCharset test = new ChangeCharset();
//        String str = "This is a 中文的 String!";
//        System.out.println("str：" + str);
//
//        String gbk = test.toGBK(str);
//        System.out.println("转换成GBK码：" + gbk);
//        System.out.println();
        String gbkinfo = "";
        while ((info = br.readLine()) != null) {
//            String gbkinfo = new String(info.getBytes("iso-8859-1"), "utf-8");
//            String gbkinfo = new String(info.getBytes("iso-8859-1"), "gbk");
//            String gbkinfo = new String(info.getBytes("utf-8"), "gbk");
//            String gbkinfo = new String(info.getBytes("utf-8"), "gb2312");

            //全部打印出来
//            out.println(new String(info.getBytes("gbk"), "utf-8") + entertip);
//            out.println(new String(info.getBytes("gbk"), "gbk") + entertip);
//            out.println(new String(info.getBytes("utf-8"), "utf-8") + entertip);
//            out.println(new String(info.getBytes("utf-8"), "gbk") + entertip);

            gbkinfo = new String(info.getBytes("gbk"), "utf-8") + entertip;
            out.println(gbkinfo);

//            String gbkinfo = test.toGBK(info);

//            String gbkinfo = new String(info.getBytes("utf-8"), "utf-8");
//            String gbkinfo = new String(info.getBytes("ISO-8859-1"), "gbk");
//            String gbkinfo = new String(info.getBytes("ISO-8859-1"), "gb2312");
//            String gbkinfo = new String(info.getBytes("utf-8"), "iso-8859-1");
//            String gbkinfo = info;
//                int length = gbkinfo.length();
//                int pos  = 6;
//                int showbegin = length >pos ? pos: 0;
//            System.out.println("i am client, server say:" + info);
//            result+=gbkinfo+"<br/>";
//                out.write("\n");
//            out.write(gbkinfo + entertip);
//            out.write("last string encoding:" + Encoding.getEncoding(info)+entertip);
//            out.write("last gbk string encoding:" + Encoding.getEncoding(gbkinfo) + entertip);
//            out.println(gbkinfo + entertip);
//            out.println("last string encoding:" + Encoding.getEncoding(info)+entertip);
//            out.println("last gbk string encoding:" + Encoding.getEncoding(gbkinfo) + entertip);
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
