package com.weilaidb.sql;



public class selectalldb {
    private String mydbname = "alldb";
    private String mytable = "abc";
    private int type = 10;
    private String message;
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
