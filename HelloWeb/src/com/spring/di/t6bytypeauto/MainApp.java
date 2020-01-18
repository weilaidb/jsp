package com.spring.di.t6bytypeauto;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {
    public static void main(String[] args) {
        ApplicationContext context =
                new ClassPathXmlApplicationContext("Beans16.xml");
        TextEditor te = (TextEditor) context.getBean("textEditor");
        te.spellCheck();
        System.out.println("name:" + te.getName());
    }
}