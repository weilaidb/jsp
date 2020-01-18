package com.spring.di.t6autowired_nosetter_constructor;

public class SpellChecker {
    public SpellChecker(){
        System.out.println("Inside SpellChecker constructor." );
    }
    public void checkSpelling(){
        System.out.println("Inside checkSpelling." );
    }
}