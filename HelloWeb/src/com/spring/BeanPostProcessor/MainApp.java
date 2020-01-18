package com.spring.BeanPostProcessor;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {
    public static void main(String[] args) {
        AbstractApplicationContext context = new ClassPathXmlApplicationContext("Beans6.xml");
        HelloWorld2 obj = (HelloWorld2) context.getBean("helloWorld");
        obj.getMessage();
        context.registerShutdownHook();
    }
}
