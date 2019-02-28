package com.runoob.main;

public class TestBean {
    private String message = "TestBean实例";
    private int type = 10;
    public String getMessage() {
        return(message);
    }
    public void setMessage(String message) {
        this.message = message;
    }


    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}