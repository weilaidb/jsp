package com.spring.di.t6Qualifier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
public class Profile {
//    可能会有这样一种情况，当你创建多个具有相同类型的 bean 时，并且想要用一个属性只为它们其中的一个进行装配，在这种情况下，你可以使用 @Qualifier 注释和 @Autowired 注释通过指定哪一个真正的 bean 将会被装配来消除混乱。
    @Autowired
    @Qualifier("student2")
    private Student student;
    public Profile(){
        System.out.println("Inside Profile constructor." );
    }
    public void printAge() {
        System.out.println("Age : " + student.getAge() );
    }
    public void printName() {
        System.out.println("Name : " + student.getName() );
    }
}