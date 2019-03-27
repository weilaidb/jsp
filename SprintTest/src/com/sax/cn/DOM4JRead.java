package com.sax.cn;


import com.cmd.RunCmd;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;

public class DOM4JRead {
    public static void main(String[] args) {
        File file = new File("D:" + File.separator
                + "outputbydom4j.xml");
        SAXReader reader = new SAXReader();
        Document doc = null;
        try {
            doc = reader.read(file);
        } catch (DocumentException e) {
            e.printStackTrace();
        }

        Element root = doc.getRootElement();
        Iterator iter = root.elementIterator();
        while (iter.hasNext()) {

            Element linkman = (Element)iter.next();
            System.out.println("姓名:" +
                    linkman.elementText("name"));
            System.out.println("邮件:" +
                    linkman.elementText("email"));
        }

//        RunCmd.explorerdir("D:");
    }
}
