package com.spring.di.t7Configuration_Bean;

import org.springframework.context.annotation.*;
@Configuration
public class HelloWorldConfig {
    @Bean
    public HelloWorld2 helloWorld(){
        return new HelloWorld2();
    }
}