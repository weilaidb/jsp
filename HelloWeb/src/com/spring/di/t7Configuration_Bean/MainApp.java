package com.spring.di.t7Configuration_Bean;

import com.spring.di.t6Resource.HelloWorld;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class MainApp {
    public static void main(String[] args) {
        ApplicationContext ctx =
                new AnnotationConfigApplicationContext(HelloWorldConfig.class);
        HelloWorld2 helloWorld2 = ctx.getBean(HelloWorld2.class);
        helloWorld2.setMessage("hello world!!!!test for using code!!");
        helloWorld2.getMessage();
    }
}