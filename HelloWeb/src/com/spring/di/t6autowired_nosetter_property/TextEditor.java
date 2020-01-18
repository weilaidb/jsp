package com.spring.di.t6autowired_nosetter_property;

import org.springframework.beans.factory.annotation.Autowired;

public class TextEditor {
//    属性中的 @Autowired
    @Autowired
    private SpellChecker spellChecker;
    public SpellChecker getSpellChecker( ) {
        return spellChecker;
    }
    public void spellCheck() {
        spellChecker.checkSpelling();
    }
}