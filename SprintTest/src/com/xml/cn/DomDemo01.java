package com.xml.cn;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;

public class DomDemo01 {
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
            doc = builder.parse("E:\\tarbao\\egjsp\\eclipse-workspace\\TomcatTest\\SprintTest\\web\\xml" + File.separator + "dom_demo_02.xml");
        }catch (SAXException e ){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }

        NodeList nl = ((Document) doc).getElementsByTagName("name");
        System.out.println("姓名:" + nl.item(0).getFirstChild().getNodeValue());

        nl = ((Document) doc).getElementsByTagName("sex");
        System.out.println("性别:" + nl.item(0).getFirstChild().getNodeValue());


    }
}




























