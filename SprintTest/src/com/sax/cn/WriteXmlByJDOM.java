package com.sax.cn;

import java.io.File;
import java.io.FileOutputStream;

import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.XMLOutputter;

import com.cmd.RunCmd;


public class WriteXmlByJDOM {
    public static void main(String[] args) {
        Element addresslist = new Element("addresslist");
        Element linkman = new Element("linkman");
        Element name = new Element("name");
        Element email = new Element("email");
        Attribute id = new Attribute("id", "lxhx");
        Document doc = new Document(addresslist);
        name.setText("李李李李李李李");
        email.setText("wwwfda@erfdsf.com");
        name.setAttribute(id);
        linkman.addContent(name);
        linkman.addContent(email);
        addresslist.addContent(linkman);
        XMLOutputter out = new XMLOutputter();
        out.setFormat(out.getFormat().setEncoding("GBK"));
        try {
            out.output(doc, new FileOutputStream("D:" + File.separator
                    + "address2.xml"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        RunCmd.explorerdir("D:");

    }

}
