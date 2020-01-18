package com.spring.di.t6Resource;

import javax.annotation.Resource;
public class TextEditor {
    private SpellChecker spellChecker;
    @Resource(name= "spellChecker")
    public void setSpellChecker( SpellChecker spellChecker ){
        this.spellChecker = spellChecker;
    }
    public SpellChecker getSpellChecker(){
        return spellChecker;
    }
    public void spellCheck(){
        spellChecker.checkSpelling();
    }
}