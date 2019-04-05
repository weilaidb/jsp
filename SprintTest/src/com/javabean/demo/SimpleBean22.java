package com.javabean.demo;

public class SimpleBean22 {
    public void setName(String name) {
        this.name = name;
    }

    private String name;

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    private int age;

    public SimpleBean22() {
        System.out.println("======= 一个新的实例化对象产生 =========");
    }

    public String getName() {
        return name;
    }

    public int getChild() {
        return child;
    }

    public void setChild(int child) {
        this.child = child;
    }

    private int child;


}
