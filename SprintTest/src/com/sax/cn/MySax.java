package com.sax.cn;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class MySax extends DefaultHandler {
    @Override
    public void startDocument() throws SAXException {
        System.out.println("<?xml version=\"1.0\" encoding=\"GBK\" ?>");
    }

    @Override
    public void endDocument() throws SAXException {
        System.out.println("\n文档读取结束。。。");
    }

    @Override
    public void startElement(String uri, String localName, String name,
                             Attributes attributes) throws SAXException {
        System.out.print("<");
        System.out.print(name);
        if (attributes != null) {
            for (int x = 0; x < attributes.getLength(); x++) {
                System.out.print(" " + attributes.getQName(x) + "=\""
                        + attributes.getValue(x) + "\" ");
            }
        }
        System.out.print(">");
    }

    @Override
    public void characters(char[] ch, int start, int length)
            throws SAXException {
        System.out.print(new String(ch, start, length));
    }

    @Override
    public void endElement(String uri, String localName, String name)
            throws SAXException
    {
        System.out.print("</");
        System.out.print(name);
        System.out.print(">");
    }


}
