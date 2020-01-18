package com.spring.di.t8eventself;

import org.springframework.context.ApplicationEvent;
public class CustomEvent extends ApplicationEvent{
    public CustomEvent(Object source) {
        super(source);
    }
    public String toString(){
        return "My Custom Event";
    }

    public String test(){
        return "test";
    }
}