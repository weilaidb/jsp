package com.sax.cn;

import com.cmd.RunCmd;
import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.XMLOutputter;

import java.awt.*;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;


public class ReadXmlByJDOM {
    public static void main(String[] args) throws Exception {
        Element addresslist = new Element("addresslist");
        SAXBuilder builder = new SAXBuilder();
        Document read_doc = builder.build("D:" + File.separator +
                "address.xml");
        Element stu = read_doc.getRootElement();
        List list = stu.getChildren("linkman");
        for(int i=0; i < list.size(); i++)
        {
            Element e = (Element)list.get(i);
            String name = e.getChildText("name");
            String id = e.getChild("name").getAttribute("id").getValue();
            String email = e.getChildText("email");
            System.out.println("--------------- 联系人 ---------------");
            System.out.println("姓名:" + name + ",编号: " + id);
            System.out.println("EMAIL:" + email);
            System.out.println("--------------------------------------");
            System.out.println();

        }
        RunCmd.explorerdir("D:");

    }

}
