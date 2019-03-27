package com.sax.cn;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.File;

public class TestSAX {
    public static void main(String[] args) throws Exception {
        SAXParserFactory factory = SAXParserFactory.newInstance();
        SAXParser parser = factory.newSAXParser();
        parser.parse("E:\\tarbao\\egjsp\\eclipse-workspace\\TomcatTest\\SprintTest\\web\\xml"
                + File.separator + "sax_demo.xml", new MySax());

    }
}
