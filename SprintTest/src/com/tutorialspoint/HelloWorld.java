package com.tutorialspoint;

public class HelloWorld {
    private String message;

    public String getKey() {
        System.out.println("Your key : " + key);
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    private String key;
    public void setMessage(String message){
        this.message  = message;
    }
    public void getMessage(){

        System.out.println("Your Message : " + message);
    }
}
