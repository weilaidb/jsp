<%@ page import="java.net.Socket" %>
<%@ page import="com.commmon.testChinese" %>
<%@ page import="com.commmon.Byte24Long" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.UnknownHostException" %>
<%@ page import="static com.net.ClientSendMsg2QtServer.checkiszimu" %>
<%--�˴�����ָ���ļ�����Ϊgb2312,���ҽ���Ҳ��gb2312--%>
<%--ʹ�ô�����utf-8�����ݷ���� gbk new String(info.getBytes("gbk"), "utf-8") + entertip;--%>
<%@ page language="java" pageEncoding="gb2312"%>
<%@ page contentType="text/html;charset=gb2312"%>

<%--�˴�ʹ��utf-8��Ϊ�ļ��ͽ���ı��룬Ҳ��ʹ��--%>
<%--ʹ�ô�����utf-8�����ݷ���� gbk new String(info.getBytes("gbk"), "utf-8") + entertip;--%>
<%--<%@ page language="java" pageEncoding="utf-8"%>--%>
<%--<%@ page contentType="text/html;charset=utf-8"%>--%>



<html>
<head>
    <title>ִ����</title>
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
            //Ϊ����Qt�ͻ��˹�ͬʹ�ã���Ҫ���4���ո�
            towritestr = "    " + towritestr;
        }
        //1.�����ͻ���Socket��ָ����������ַ�Ͷ˿�
        Socket socket = new Socket(inip, 9999);
        //2.��ȡ���������������˷�����Ϣ
        OutputStream os = socket.getOutputStream();//�ֽ������
        PrintWriter pw = new PrintWriter(os);//���������װΪ��ӡ��
        long len = 0;
        /**
         * ���ͳ���Ϊ�ܳ��ȣ�����ͷ���塣
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
//            socket.shutdownOutput();//�ر������
        //3.��ȡ������������ȡ�������˵���Ӧ��Ϣ
        InputStream is = socket.getInputStream();
        BufferedReader br = new BufferedReader(new InputStreamReader(is));
        String info = null;

        String gbkinfo = "";
        while ((info = br.readLine()) != null) {
            //ȫ����ӡ����
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
        //4.�ر���Դ
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
