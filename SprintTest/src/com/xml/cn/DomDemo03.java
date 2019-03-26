package com.xml.cn;

//import org.springframework.cglib.core.Transformer;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.*;
import java.io.*;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.tools.*;
import java.net.InetAddress;
import java.net.Socket;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;



public class DomDemo03 {
    public static void runcmd(String command)
    {
//        ##上传之后的视频文件名为test.tmpmedia
//        String command = "mencoder test.tmpmedia -o test.flv -ofps 25 -of lavf -oac mp3lame -srate 22050 -ovc lavc -lavcopts "
//                + "vcodec=flv:keyint=59:vbitrate=6000:mbd=2:trell:v4mv:o=mpv_flagg=cbp_rd:last_pred=3 -vf harddup,scale=480:256";

        Process p = null;
        try {
            p = Runtime.getRuntime().exec(command);

        } catch (Exception e)
        {
            e.printStackTrace();
        }

//##读取命令的输出信息
        BufferedReader reader = null;
        try {
            InputStream is = p.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is));
            p.waitFor();
            if (p.exitValue() != 0) {
                //说明命令执行失败
                //可以进入到错误处理步骤中
            }
        } catch (Exception e){
            e.printStackTrace();
        }

//##打印输出信息
        try {
            String s = null;
            while ((s = reader.readLine()) != null) {
                System.out.println(s);
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }


    public static void main(String[] args){
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = null;
        try {
            builder = factory.newDocumentBuilder();
        } catch (ParserConfigurationException e){
            e.printStackTrace();
        }
        Document doc= null;
        doc = builder.newDocument();
        Element addresslist = doc.createElement("addresslist");
        Element linkman = doc.createElement("linkman");
        Element name = doc.createElement("name");
        Element email = doc.createElement("email");
        name.appendChild(doc.createTextNode("李李李"));
        email.appendChild(doc.createTextNode("aaa@126.com"));
        linkman.appendChild(name);
        linkman.appendChild(email);
        addresslist.appendChild(linkman);
        doc.appendChild(addresslist);


//        TransformerFactory tf = TransformerFactory.newInstance();
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer t = null;
        try{
            t = tf.newTransformer();
        } catch (TransformerConfigurationException e1){
            e1.printStackTrace();
        }
//        t.setOutputProperty(OutputKeys.ENCODING, "GBK");
        ((javax.xml.transform.Transformer) t).setOutputProperty(OutputKeys.ENCODING, "GBK");
        DOMSource source = new DOMSource(doc);
        StreamResult result = new StreamResult(new File("D:" + File.separator
        +"output.xml"));
        try{
            ((javax.xml.transform.Transformer) t).transform(source, result);
        }catch (TransformerException e){
            e.printStackTrace();
        }

        runcmd("explorer.exe D:");

    }
}




























