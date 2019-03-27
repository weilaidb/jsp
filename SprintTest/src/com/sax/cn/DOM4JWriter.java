package com.sax.cn;


import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import com.cmd.RunCmd;

public class DOM4JWriter {
    public static void main(String[] args) {
        Document doc = DocumentHelper.createDocument();
        Element addresslist = doc.addElement("addresslist");
        Element linkman = addresslist.addElement("linkman");
        Element name = linkman.addElement("name");
        Element email = linkman.addElement("email");
        name.setText("李李李李要李李李");
        email.setText("www.w.w.w.w.w..");

        OutputFormat format = OutputFormat.createPrettyPrint();
        format.setEncoding("GBK");
        try {
            XMLWriter writer = new XMLWriter(new FileOutputStream(new File("D:"
                    + File.separator + "outputbydom4j.xml")), format);
            writer.write(doc);
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        RunCmd.explorerdir("D:");
    }
}
