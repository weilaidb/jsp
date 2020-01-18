package com.spring.di2;

public class TextEditor {
    private SpellChecker spellChecker;
    private SpellChecker spellChecker2;
    // a setter method to inject the dependency.
    public void setSpellChecker(SpellChecker spellChecker2) {
        System.out.println("Inside setSpellChecker." );
        this.spellChecker = spellChecker2;
    }
    // a getter method to return spellChecker
    public SpellChecker getSpellChecker() {
        return spellChecker;
    }
    public void spellCheck() {
        spellChecker.checkSpelling();
    }
    public void setSpellChecker2(SpellChecker spellChecker2) {
        System.out.println("Inside setSpellChecker2." );
        this.spellChecker2 = spellChecker2;
    }
}