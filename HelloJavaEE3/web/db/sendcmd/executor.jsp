<%@ page import="java.net.Socket" %>
<%@ page import="com.commmon.testChinese" %>
<%@ page import="com.commmon.Byte24Long" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.UnknownHostException" %>
<%@ page import="static com.net.ClientSendMsg2QtServer.checkiszimu" %>
<%@ page import="com.commmon.SqlInterface" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<html>
<head>
    <title>执行器</title>
    <script>
        //定义函数myClose关闭当前窗口
        function myClose(){
            //将id为time的元素的内容转为整数，保存在变量n中
            var n=parseInt(time.innerHTML);
            n--;//将n-1
            //如果n==0,关闭页面
            //否则, 将n+秒钟后自动关闭，再保存回time的内容中
            if(n>0){
                time.innerHTML=n+"秒钟后自动关闭";
                timer=setTimeout(myClose,1000);
            }else{
                close();
            }
        }
        var timer=null;
        //当页面加载后，启动周期性定时器，每个1秒执行myClose
        window.onload=function(){
            timer=setTimeout(myClose,1000);
        }
    </script>
</head>
<body>
<span id="time">600秒钟后自动关闭</span>
<a href="javascript:close()">立即关闭</a>
<a href="javascript:clearTimeout(timer)">留在本页</a><br>
<%
    String ipaddr = request.getParameter("ipaddr");
    String cmddatatext = request.getParameter("cmddatatext");
    String towritestr = cmddatatext;
//    String towritestr = SqlInterface.getGbk2UTF8(cmddatatext);
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
         * 包含中文的长度需要计算，比较麻烦
         */
//        String str_gbk = SqlInterface.Unicode2GBK(towritestr);
        String str_gbk = new String(towritestr.getBytes("UTF-8"), "GBK");
        if (testChinese.isContainChinese(str_gbk)) {
            len = testChinese.getWordCountCode(str_gbk,"GBK");
        } else {
            len = str_gbk.length();
        }

        byte[] buffer = Byte24Long.LongToBytes(len);
        System.out.println("exec cmd ok:" + (towritestr) + ", orglen:" + towritestr.length() + ",wr len:" + len);
        System.out.println("exec cmd ok:" + (str_gbk) + ", orglen:" + str_gbk.length() + ",wr len:" + len);
        pw.write(Byte24Long.getChars(buffer));
//        pw.write(towritestr);
        pw.write(str_gbk);
        pw.flush();
//            socket.shutdownOutput();//关闭输出流
        //3.获取输入流，并读取服务器端的响应信息
        InputStream is = socket.getInputStream();
        BufferedReader br = new BufferedReader(new InputStreamReader(is));
        String info = null;

        String gbkinfo = "";
        while ((info = br.readLine()) != null) {
            gbkinfo = SqlInterface.getGbkSign(info) + entertip;
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
