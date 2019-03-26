package com.xml.cn;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;

public class DomDemo02 {
    public static void main(String[] args){
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = null;
        try {
            builder = factory.newDocumentBuilder();
        } catch (ParserConfigurationException e){
            e.printStackTrace();
        }
        Document doc= null;
        try {
            doc = builder.parse("E:\\tarbao\\egjsp\\eclipse-workspace\\TomcatTest\\SprintTest\\web\\xml" + File.separator + "dom_demo_01.xml");
        }catch (SAXException e ){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }

        NodeList nl = ((Document) doc).getElementsByTagName("linkman");
        for(int x = 0; x < nl.getLength(); x++)
        {
            Element e = (Element)nl.item(x);
            System.out.println("姓名:"
                    + e.getElementsByTagName("name").item(0).getFirstChild().getNodeValue());
            System.out.println("邮箱:"
                    + e.getElementsByTagName("email").item(0).getFirstChild().getNodeValue());


        }
    }
}




























